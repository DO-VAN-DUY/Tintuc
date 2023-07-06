using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public partial class CategoryBusiness : ICategoryBusiness
    {
        private ICategoryRepository _res;
        public CategoryBusiness(ICategoryRepository CategoryGroupRes)
        {
            _res = CategoryGroupRes;
        }
        public bool Create(CategoryModel model)
        {
            return _res.Create(model);
        }
        //public CategoryModel GetDatabyID(string id)
        //{
        //    return _res.GetDatabyID(id);
        //}
        public List<CategoryModel> GetDataAll()
        {
            return _res.GetDataAll();
        }

        public bool Update(CategoryModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(string id)
        {
            return _res.Delete(id);
        }
        public List<Small_CategoryModel> GetSmallCategory(string id)
        {
            return _res.GetSmallCategory(id);
        }
    }

}
