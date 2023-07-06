using System;
using System.Collections.Generic;
using System.Text;
using Model;
using DAL;

namespace BLL.Interfaces
{
    public interface ISmall_CategoryBusiness
    {
        List<Small_CategoryModel> GetDataAll();
        //Small_CategoryModel GetDatabyID(string id);
        bool Create(Small_CategoryModel model);
        bool Update(Small_CategoryModel model);
        bool Delete(string id);

    }
}
