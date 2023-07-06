using System;
using System.Collections.Generic;
using System.Text;
using Model;
using DAL;

namespace BLL.Interfaces
{
    public interface IFeedBusiness
    {
        List<FeedModel> GetDataAll();
       // FeedModel GetDatabyID(string id);
        bool Create(FeedModel model);
        //bool Update(FeedModel model);
        //bool Delete(string id);
        
    }
}
