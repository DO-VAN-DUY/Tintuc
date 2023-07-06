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
    public partial class PostBusiness : IPostBusiness
    {
        private IPostRepository _res;
        public PostBusiness(IPostRepository PostGroupRes)
        {
            _res = PostGroupRes;
        }
        public bool Create(PostModel model)
        {
            return _res.Create(model);
        }
        public PostModel GetDatabyMeta(string meta)
        {
            return _res.GetDatabyMeta(meta);
        }
        public List<PostModel> GetDataAll(int pageIndex, int pageSize, out long total)
        {
            return _res.GetDataAll(pageIndex, pageSize, out total);
        }
        public List<PostModel> GetMyPosts(int pageIndex, int pageSize, out long total, string id)
        {
            return _res.GetMyPosts(pageIndex, pageSize, out total, id);
        }
        public List<PostModel> Search(int pageIndex, int pageSize, out long total, string post_name)
        {
            return _res.Search(pageIndex, pageSize, out total, post_name);
        }
        public List<PostModel> GetPendingPosts(int pageIndex, int pageSize, out long total)
        {
            return _res.GetPendingPosts(pageIndex, pageSize, out total);
        }
        public bool Update(PostModel model)
        {
            return _res.Update(model);
        }
        public bool UpdateManager(PostModel model)
        {
            return _res.UpdateManager(model);
        }
        public bool Delete(string id)
        {
            return _res.Delete(id);
        }
        public bool AcceptPost(string id)
        {
            return _res.AcceptPost(id);
        }
        public bool DeclinePost(string id, FeedModel feed)
        {
            return _res.DeclinePost(id, feed);
        }
        public List<PostModel> GetHomePosts(int pageIndex, int pageSize, out long total)
        {
            return _res.GetHomePosts(pageIndex, pageSize, out total);
        }
        public List<PostModel> GetLastWeekPosts(int pageIndex, int pageSize, out long total)
        {
            return _res.GetLastWeekPosts(pageIndex, pageSize, out total);
        }
        public List<PostModel> GetThisWeekPosts(int pageIndex, int pageSize, out long total)
        {
            return _res.GetThisWeekPosts(pageIndex, pageSize, out total);
        }
        public List<PostModel> GetSamePosts(int pageIndex, int pageSize, string small_category, out long total)
        {
            return _res.GetSamePosts(pageIndex, pageSize, small_category, out total);
        }
        public List<PostModel> GetBannerPosts(int pageIndex, int pageSize, out long total)
        {
            return _res.GetBannerPosts(pageIndex, pageSize, out total);
        }
        public List<PostModel> GetCategoryPosts(int pageIndex, int pageSize, string category, out long total)
        {
            return _res.GetCategoryPosts(pageIndex, pageSize, category, out total);
        }
    }

}
