using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public interface ICategoryRepository
    {
        List<CategoryModel> GetDataAll();
        //CategoryModel GetDatabyID(string id);
        bool Create(CategoryModel model);
        bool Update(CategoryModel model);
        bool Delete(string id);
        List<Small_CategoryModel> GetSmallCategory(string id);


    }
}
