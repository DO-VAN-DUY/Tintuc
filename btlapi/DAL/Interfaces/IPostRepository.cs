using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public interface IPostRepository
    {
        PostModel GetDatabyMeta(string meta);
        bool Create(PostModel model);
        bool Update(PostModel model);
        bool UpdateManager(PostModel model);
        bool Delete(string id);
        List<PostModel> Search(int pageIndex, int pageSize, out long total, string title);
        bool DeclinePost(string id, FeedModel feed);
        bool AcceptPost(string id);
        List<PostModel> GetMyPosts(int pageIndex, int pageSize, out long total, string id);
        List<PostModel> GetPendingPosts(int pageIndex, int pageSize, out long total);
        List<PostModel> GetDataAll(int pageIndex, int pageSize, out long total);
        List<PostModel> GetHomePosts(int pageIndex, int pageSize, out long total);
        List<PostModel> GetLastWeekPosts(int pageIndex, int pageSize, out long total);
        List<PostModel> GetThisWeekPosts(int pageIndex, int pageSize, out long total);
        List<PostModel> GetSamePosts(int pageIndex, int pageSize, string small_category, out long total);
        List<PostModel> GetBannerPosts(int pageIndex, int pageSize, out long total);
        List<PostModel> GetCategoryPosts(int pageIndex, int pageSize, string category, out long total);
    }
}
