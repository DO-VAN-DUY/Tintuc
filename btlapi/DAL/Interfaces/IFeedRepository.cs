using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public interface IFeedRepository
    {
        List<FeedModel> GetDataAll();
        //FeedModel GetDatabyID(string id);
        bool Create(FeedModel model);
        //bool Update(FeedModel model);
        //bool Delete(string id);

    }
}
