using System;
using System.Collections.Generic;
using System.Text;
using Model;
using DAL;

namespace BLL.Interfaces
{
    public interface ICategoryBusiness
    {
        List<CategoryModel> GetDataAll();
        //CategoryModel GetDatabyID(string id);
        bool Create(CategoryModel model);
        bool Update(CategoryModel model);
        bool Delete(string id);
        List<Small_CategoryModel> GetSmallCategory(string id);
    }
}
