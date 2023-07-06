﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Model;

namespace API.Controllers
{
    //[Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private IUserBusiness _userBusiness;
        private string _path;
        public UsersController(IUserBusiness userBusiness, IConfiguration configuration)
        {
            _userBusiness = userBusiness;
            _path = configuration["AppSettings:PATH"];
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public IActionResult Login([FromBody] AuthenticateModel model)
        {
            var user = _userBusiness.Authenticate(model.Username, model.Password);

            if (user == null)
                return BadRequest(new { message = "Username or password is incorrect" });
            return Ok(new { id = user.id, hoten = user.hoten, taikhoan = user.taikhoan, token = user.token, role = user.role });
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
        //        string fullPathFolder = System.IO.Path.GetDirectoryName(fullPathFile);
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



        //[Route("upload")]
        //[HttpPost, DisableRequestSizeLimit]
        //public async Task<IActionResult> Upload(IFormFile file)
        //{
        //    try
        //    {
        //        if (file.Length > 0)
        //        {
        //            string filePath = $"{file.FileName}";
        //            var fullPath = CreatePathFile(filePath);
        //            using (var fileStream = new FileStream(fullPath, FileMode.Create))
        //            {
        //                await file.CopyToAsync(fileStream);
        //            }
        //            return Ok(new { filePath });
        //        }
        //        else
        //        {
        //            return BadRequest();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return StatusCode(500, "Không tìm thây");
        //    }
        //}

        //[NonAction]
        //private string CreatePathFile(string RelativePathFileName)
        //{
        //    try
        //    {
        //        string serverRootPathFolder = _path;
        //        string fullPathFile = $@"{serverRootPathFolder}\{RelativePathFileName}";
        //        string fullPathFolder = System.IO.Path.GetDirectoryName(fullPathFile);
        //        if (!Directory.Exists(fullPathFolder))
        //            Directory.CreateDirectory(fullPathFolder);
        //        return fullPathFile;
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.Message;
        //    }
        //}

        [Route("create-user")]
        [HttpPost]
        public UserModel CreateUser([FromBody] UserModel model)
        {
            model.id = Guid.NewGuid().ToString();
            _userBusiness.Create(model);
            return model;
        }
        //[Route("delete-user")]
        //[HttpPost]
        //public IActionResult DeleteUser([FromBody] Dictionary<string, object> formData)
        //{
        //    string id = "";
        //    if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"]))) { id = Convert.ToString(formData["id"]); }
        //    _userBusiness.Delete(id);
        //    return Ok();
        //}
        [Route("update-user")]
        [HttpPost]
        public UserModel UpdateUser([FromBody] UserModel model)
        {
            //if (model.image != null)
            //{
            //    var arrData = model.image.Split(';');
            //    if (arrData.Length == 3)
            //    {
            //        var savePath = $@"assets/images/{arrData[0]}";
            //        model.image = $"{savePath}";
            //        SaveFileFromBase64String(savePath, arrData[2]);
            //    }
            //}
            _userBusiness.Update(model);
            return model;
        }

        [Route("get-by-id/{id}")]
        [HttpGet]
        public UserModel GetDatabyID(string id)
        {
            return _userBusiness.GetDatabyID(id);
        }

        //[Route("search")]
        //[HttpPost]
        //public ResponseModel Search([FromBody] Dictionary<string, object> formData)
        //{
        //    var response = new ResponseModel();
        //    try
        //    {
        //        var page = int.Parse(formData["page"].ToString());
        //        var pageSize = int.Parse(formData["pageSize"].ToString());
        //        string hoten = "";
        //        if (formData.Keys.Contains("hoten") && !string.IsNullOrEmpty(Convert.ToString(formData["hoten"]))) { hoten = Convert.ToString(formData["hoten"]); }
        //        string taikhoan = "";
        //        if (formData.Keys.Contains("taikhoan") && !string.IsNullOrEmpty(Convert.ToString(formData["taikhoan"]))) { taikhoan = Convert.ToString(formData["taikhoan"]); }
        //        long total = 0;
        //        var data = _userBusiness.Search(page, pageSize, out total, hoten, taikhoan);
        //        response.TotalItems = total;
        //        response.Data = data;
        //        response.Page = page;
        //        response.PageSize = pageSize;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //    return response;
        //}
        [Route("get-staff-list")]
        [HttpPost]
        public ResponseModel GetStaffList([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                //string hoten = "";
                //if (formData.Keys.Contains("hoten") && !string.IsNullOrEmpty(Convert.ToString(formData["hoten"]))) { hoten = Convert.ToString(formData["hoten"]); }
                //string taikhoan = "";
                //if (formData.Keys.Contains("taikhoan") && !string.IsNullOrEmpty(Convert.ToString(formData["taikhoan"]))) { taikhoan = Convert.ToString(formData["taikhoan"]); }
                long total = 0;
                var data = _userBusiness.GetStaffList(page, pageSize, out total);
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
