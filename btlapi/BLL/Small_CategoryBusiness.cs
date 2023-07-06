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
    public partial class Small_CategoryBusiness : ISmall_CategoryBusiness
    {
        private ISmall_CategoryRepository _res;
        public Small_CategoryBusiness(ISmall_CategoryRepository Small_CategoryGroupRes)
        {
            _res = Small_CategoryGroupRes;
        }
        public bool Create(Small_CategoryModel model)
        {
            return _res.Create(model);
        }
        //public Small_CategoryModel GetDatabyID(string id)
        //{
        //    return _res.GetDatabyID(id);
        //}
        public List<Small_CategoryModel> GetDataAll()
        {
            return _res.GetDataAll();
        }

        public bool Update(Small_CategoryModel model)
        {
            return _res.Update(model);
        }
        public bool Delete(string id)
        {
            return _res.Delete(id);
        }
    }

}
