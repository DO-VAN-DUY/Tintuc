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
    public partial class FeedBusiness : IFeedBusiness
    {
        private IFeedRepository _res;
        public FeedBusiness(IFeedRepository FeedGroupRes)
        {
            _res = FeedGroupRes;
        }
        public bool Create(FeedModel model)
        {
            return _res.Create(model);
        }
        //public FeedModel GetDatabyID(string id)
        //{
        //    return _res.GetDatabyID(id);
        //}
        public List<FeedModel> GetDataAll()
        {
            return _res.GetDataAll();
        }

        //public bool Update(FeedModel model)
        //{
        //    return _res.Update(model);
        //}
        //public bool Delete(string id)
        //{
        //    return _res.Delete(id);
        //}
    }

}
