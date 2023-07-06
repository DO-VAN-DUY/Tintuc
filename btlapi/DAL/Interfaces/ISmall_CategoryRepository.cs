using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public interface ISmall_CategoryRepository
    {
        List<Small_CategoryModel> GetDataAll();
        //Small_CategoryModel GetDatabyID(string id);
        bool Create(Small_CategoryModel model);
        bool Update(Small_CategoryModel model);
        bool Delete(string id);

    }
}
