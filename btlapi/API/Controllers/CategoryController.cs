using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BLL;
using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace API.Controllers
{
    [Authorize(Roles ="Manager,Staff")]
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private ICategoryBusiness _CategoryBusiness;
        public CategoryController(ICategoryBusiness CategoryBusiness)
        {
            _CategoryBusiness = CategoryBusiness;
        }

        [Route("create-category")]
        [HttpPost]
        public CategoryModel CreateCategory([FromBody] CategoryModel model)
        {
            //Jobject
            //var apiObject = JsonConvert.DeserializeObject<CategoryModel>(jsonResult);
            //var category = model["category"].ToObject<CategoryModel>();
            //var small = model["small_category"].ToObject<Small_CategoryModel>();
            model.id = Guid.NewGuid().ToString();        
            _CategoryBusiness.Create(model);
            return model;
        }

        [Route("get-by-id/{id}/{abc}")]
        [HttpGet]
        //public CategoryModel GetDatabyID(string id, string abc)
        //{
        //    var ten = abc;
        //    return _CategoryBusiness.GetDatabyID(id);
        //}
        [AllowAnonymous]
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<CategoryModel> GetDatabAll()
        {
            return _CategoryBusiness.GetDataAll();
        }

       
        [Route("update-category")]
        [HttpPost]
        public CategoryModel UpdateCategory([FromBody] CategoryModel model)
        {

            _CategoryBusiness.Update(model);
            return model;
        }
        [Route("delete-category")]
        [HttpPost]
        public IActionResult DeleteCategory([FromBody] Dictionary<string, object> formData)
        {
            string id = "";
            if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"]))) { id = Convert.ToString(formData["id"]); }
            _CategoryBusiness.Delete(id);
            return Ok();
        }
        [Route("get-smallcategory")]
        [HttpPost]
        public List<Small_CategoryModel> GetSmallCategory([FromBody] Dictionary<string, object> formData)
        {
            string id = "";
            if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"]))) { id = Convert.ToString(formData["id"]); }
           return _CategoryBusiness.GetSmallCategory(id);
           
        }
    }
}
