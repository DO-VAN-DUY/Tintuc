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

namespace API.Controllers
{
    [Authorize(Roles ="Manager")]
    [Route("api/[controller]")]
    [ApiController]
    public class Small_CategoryController : ControllerBase
    {
        private ISmall_CategoryBusiness _Small_CategoryBusiness;
        public Small_CategoryController(ISmall_CategoryBusiness Small_CategoryBusiness)
        {
            _Small_CategoryBusiness = Small_CategoryBusiness;
        }

        [Route("create-small_category")]
        [HttpPost]
        public Small_CategoryModel CreateSmall_Category([FromBody] Small_CategoryModel model)
        {
            model.id = Guid.NewGuid().ToString();
            _Small_CategoryBusiness.Create(model);
            return model;
        }

        //[Route("get-by-id/{id}/{abc}")]
        //[HttpGet]
        //public Small_CategoryModel GetDatabyID(string id, string abc)
        //{
        //    var ten = abc;
        //    return _Small_CategoryBusiness.GetDatabyID(id);
        //}
        [AllowAnonymous]
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<Small_CategoryModel> GetDatabAll()
        {
            return _Small_CategoryBusiness.GetDataAll();
        }


        [Route("update-small_category")]
        [HttpPost]
        public Small_CategoryModel UpdateSmall_Category([FromBody] Small_CategoryModel model)
        {

            _Small_CategoryBusiness.Update(model);
            return model;
        }
        [Route("delete-small_category")]
        [HttpPost]
        public IActionResult DeleteSmall_Category([FromBody] Dictionary<string, object> formData)
        {
            string id = "";
            if (formData.Keys.Contains("id") && !string.IsNullOrEmpty(Convert.ToString(formData["id"]))) { id = Convert.ToString(formData["id"]); }
            _Small_CategoryBusiness.Delete(id);
            return Ok();
        }
    }
}
