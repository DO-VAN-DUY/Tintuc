using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using BLL;
using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Model;

namespace API.Controllers
{
    [Authorize(Roles = "Manager,Staff")]
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        private IPostBusiness _PostBusiness;
        private string _path;
        public PostController(IPostBusiness PostBusiness, IConfiguration configuration)
        {
            _PostBusiness = PostBusiness;
            _path = configuration["AppSettings:PATH"];
        }

        [Route("create-post")]
        [HttpPost]
        public PostModel CreatePost([FromBody] PostModel model)
        {
            model.id = Guid.NewGuid().ToString();
            _PostBusiness.Create(model);
            return model;
        }
        [AllowAnonymous]
        [Route("get-by-meta")]
        [HttpGet]
        public PostModel GetDatabyMeta([FromQuery(Name ="meta")] string meta)
        {

            return _PostBusiness.GetDatabyMeta(meta);
        }

        [Route("get-all")]
        [HttpPost]
        public ResponseModel GetDatabAll([FromBody] Dictionary<string,object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _PostBusiness.GetDataAll(page, pageSize, out total);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }

        [Route("search")]
        [HttpPost]
        public ResponseModel Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string post_name = "";
                if (formData.Keys.Contains("post_name") && !string.IsNullOrEmpty(Convert.ToString(formData["post_name"]))) { post_name = Convert.ToString(formData["post_name"]); }
                long total = 0;
                var data = _PostBusiness.Search(page, pageSize, out total, post_name);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
        [Route("update-post")]
        [HttpPost]
        public PostModel UpdatePost([FromBody] PostModel model)
        {

            _PostBusiness.Update(model);
            return model;
        }
        [Route("update-post-manager")]
        [HttpPost]
        public PostModel UpdatePostManager([FromBody] PostModel model)
        {
            _PostBusiness.UpdateManager(model);
            return model;
        }
        [Route("delete-post")]
        [HttpPost]
        public IActionResult DeletePost([FromBody] Dictionary<string, object> formData)
        {
            string id = "";
            if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"]))) { id = Convert.ToString(formData["id"]); }
            _PostBusiness.Delete(id);
            return Ok();
        }
        [Route("accept-post")]
        [HttpPost]
        public IActionResult AcceptPost([FromBody] Dictionary<string, object> formData)
        {
            string id = "";
            if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"]))) { id = Convert.ToString(formData["id"]); }
            _PostBusiness.AcceptPost(id);
            return Ok();
        }
        [Route("decline-post")]
        [HttpPost]
        public IActionResult DeclinePost([FromBody] Dictionary<string, object> formData)
        {
            string id = "";
            FeedModel feed = new FeedModel();
            feed.id = Guid.NewGuid().ToString();
            if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"])))
            {
                id = Convert.ToString(formData["id"]);
                feed.post_id = id;
                feed.user_id = formData["user_id"].ToString();
                feed.content = formData["content"].ToString();
            }
            _PostBusiness.DeclinePost(id, feed);
            return Ok();
        }
        //public string SaveFileFromBase64String(string RelativePathFileName, string dataFromBase64String)
        //{
        //    if (dataFromBase64String.Contains("base64,"))
        //    {
        //        dataFromBase64String = dataFromBase64String.Substring(dataFromBase64String.IndexOf("base64,", 0) + 7);
        //    }
        //    return WriteFileToAuthAccessFolder(RelativePathFileName, dataFromBase64String);
        //}
        //public string WriteFileToAuthAccessFolder(string RelativePathFileName, string base64StringData)
        //{
        //    try
        //    {
        //        string result = "";
        //        string serverRootPathFolder = _path;
        //        string fullPathFile = $@"{serverRootPathFolder}\{RelativePathFileName}";
        //        string fullPathFolder = Path.GetDirectoryName(fullPathFile);
        //        if (!Directory.Exists(fullPathFolder))
        //            Directory.CreateDirectory(fullPathFolder);
        //        System.IO.File.WriteAllBytes(fullPathFile, Convert.FromBase64String(base64StringData));
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.Message;
        //    }
        //}
        [Route("upload")]
        [HttpPost, DisableRequestSizeLimit]
        public async Task<IActionResult> Upload(IFormFile file)
        {
            try
            {
                if (file.Length > 0)
                {
                    string filePath = $"/posts/{file.FileName}";
                    var fullPath = CreatePathFile(filePath);
                    using (var fileStream = new FileStream(fullPath, FileMode.Create))
                    {
                        await file.CopyToAsync(fileStream);
                    }
                    return Ok(new { filePath });
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Không tìm thây");
            }
        }

        [NonAction]
        private string CreatePathFile(string RelativePathFileName)
        {
            try
            {
                string serverRootPathFolder = _path;
                string fullPathFile = $@"{serverRootPathFolder}\{RelativePathFileName}";
                string fullPathFolder = Path.GetDirectoryName(fullPathFile);
                if (!Directory.Exists(fullPathFolder))
                    Directory.CreateDirectory(fullPathFolder);
                return fullPathFile;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        [Route("get-my-posts")]
        [HttpPost]
        public ResponseModel GetMyPosts([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string id = "";
                if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"]))) { id = Convert.ToString(formData["id"]); }
                long total = 0;
                var data = _PostBusiness.GetMyPosts(page, pageSize, out total, id);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
        [Route("get-pending-posts")]
        [HttpPost]
        public ResponseModel GetPendingPosts([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _PostBusiness.GetPendingPosts(page, pageSize, out total);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
        [AllowAnonymous]
        [Route("get-post-home")]
        [HttpPost]
        public ResponseModel GetHomePosts([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _PostBusiness.GetHomePosts(page, pageSize, out total);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
        [AllowAnonymous]
        [Route("get-post-lastweek")]
        [HttpPost]
        public ResponseModel GetLastWeekPosts([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _PostBusiness.GetLastWeekPosts(page, pageSize, out total);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
        [AllowAnonymous]
        [Route("get-post-thisweek")]
        [HttpPost]
        public ResponseModel GetThisWeekPosts([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _PostBusiness.GetThisWeekPosts(page, pageSize, out total);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
        [AllowAnonymous]
        [Route("get-post-same")]
        [HttpPost]
        public ResponseModel GetSamePosts([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                var small_category = formData["small_category"].ToString();
                long total = 0;
                var data = _PostBusiness.GetSamePosts(page, pageSize, small_category, out total);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
        [AllowAnonymous]
        [Route("get-post-banners")]
        [HttpPost]
        public Dictionary<string,object> GetBannerPosts([FromBody] Dictionary<string, object> formData)
        {
            var response = new Dictionary<string,object>();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _PostBusiness.GetBannerPosts(page, pageSize, out total);
                response.Add("data",data);
                response.Add("page", page);
                response.Add("pageSize", pageSize);
                //response.TotalItems = total;
                //response.Data = data;
                //response.Page = page;
                //response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
        [AllowAnonymous]
        [Route("get-post-category")]
        [HttpPost]
        public ResponseModel GetCategoryPosts([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                var category = formData["category"].ToString();
                long total = 0;
                var data = _PostBusiness.GetCategoryPosts(page, pageSize, category, out total);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
    }
}
