using DAL.Helper;
using Model;
using Helper;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System;
using DAL.Interfaces;
using DAL.Helper.Interfaces;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;
using System.Data;

namespace DAL
{
    public partial class PostRepository : IPostRepository
    {
        private IDataconnect _dbHelper;
        private string connect;
        public PostRepository(IDataconnect dbHelper, IConfiguration config)
        {
            _dbHelper = dbHelper;
            connect = config["ConnectionStrings:DefaultConnection"];
        }

        public bool Create(PostModel model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_create";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", model.id);
            cmd.Parameters.AddWithValue("@title", model.title);
            cmd.Parameters.AddWithValue("@description", model.description);
            cmd.Parameters.AddWithValue("@metatitle", model.metatitle);
            cmd.Parameters.AddWithValue("@small_category_id", model.small_category_id);
            cmd.Parameters.AddWithValue("@author", model.author);
            cmd.Parameters.AddWithValue("@image", model.image);
            cmd.Parameters.AddWithValue("@content", model.content);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_post_create",
            //    "@id", model.id,
            //    "@title", model.title,
            //    "@small_category_id", model.small_category_id,
            //    "@metatitle", model.metatitle,
            //    "@description", model.description,
            //    "@content", model.content,
            //    "@author", model.author,
            //    "@image", model.image);
            //    if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
            //    {
            //        throw new Exception(Convert.ToString(result) + msgError);
            //    }
            //    return true;
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }

        public bool Delete(string id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_delete";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_post_delete",
            //    "@id", id);
            //    if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
            //    {
            //        throw new Exception(Convert.ToString(result) + msgError);
            //    }
            //    return true;
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public bool Update(PostModel model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_update";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", model.id);
            cmd.Parameters.AddWithValue("@title", model.title);
            cmd.Parameters.AddWithValue("@description", model.description);
            cmd.Parameters.AddWithValue("@content", model.content);
            cmd.Parameters.AddWithValue("@metatitle", model.metatitle);
            cmd.Parameters.AddWithValue("@small_category_id", model.small_category_id);
            cmd.Parameters.AddWithValue("@image", model.image);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_post_update",
            //     "@id", model.id,
            //    "@title", model.title,
            //    "@small_category_id", model.small_category_id,
            //    "@metatitle", model.metatitle,
            //    "@description", model.description,
            //    "@content", model.content,              
            //    "@status", model.status,
            //    "@image", model.image);
            //    if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
            //    {
            //        throw new Exception(Convert.ToString(result) + msgError);
            //    }
            //    return true;
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public bool UpdateManager(PostModel model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_update_manager";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", model.id);
            cmd.Parameters.AddWithValue("@title", model.title);
            cmd.Parameters.AddWithValue("@description", model.description);
            cmd.Parameters.AddWithValue("@content", model.content);
            cmd.Parameters.AddWithValue("@metatitle", model.metatitle);
            cmd.Parameters.AddWithValue("@small_category_id", model.small_category_id);
            cmd.Parameters.AddWithValue("@image", model.image);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_post_update",
            //     "@id", model.id,
            //    "@title", model.title,
            //    "@small_category_id", model.small_category_id,
            //    "@metatitle", model.metatitle,
            //    "@description", model.description,
            //    "@content", model.content,              
            //    "@status", model.status,
            //    "@image", model.image);
            //    if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
            //    {
            //        throw new Exception(Convert.ToString(result) + msgError);
            //    }
            //    return true;
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }

        public PostModel GetDatabyMeta(string meta)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_meta";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@meta", meta);
            DataTable dt = _dbHelper.WriteData(cmd);
            return dt.ConvertTo<PostModel>().FirstOrDefault();
            //string msgError = "";
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_get_by_id",
            //         "@id", id);
            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    return dt.ConvertTo<PostModel>().FirstOrDefault();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<PostModel> Search(int pageIndex, int pageSize, out long total, string title)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_search";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@title", title);
            DataTable dt = _dbHelper.WriteData(cmd);
            total = (long)dt.Rows[0]["RecordCount"];
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //total = 0;
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_Post_search",
            //        "@page_index", pageIndex,
            //        "@page_size", pageSize,
            //        "@title", title);

            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<PostModel> GetDataAll(int pageIndex, int pageSize, out long total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_all";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_size",pageSize);
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            DataTable dt = _dbHelper.WriteData(cmd);
            if (dt.Rows.Count > 0)
                total = (long)dt.Rows[0]["RecordCount"];
            else total = 0;
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_all");
            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public bool DeclinePost(string id, FeedModel feed)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_decline";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "sp_feed_create";
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@id", feed.id);
            cmd2.Parameters.AddWithValue("@user_id", feed.user_id);
            cmd2.Parameters.AddWithValue("@post_id", feed.post_id);
            cmd2.Parameters.AddWithValue("@content", feed.content);
            DataTable dt = _dbHelper.WriteData(cmd);
            _dbHelper.WriteData(cmd);
            _dbHelper.WriteData(cmd2);
            return true;
            //string msgError = "";
            //string msgError2 = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_post_decline",
            //     "@id", id);
            //    var result2 = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_feed_create",
            //     "@id", feed.id,
            //     "@user_id", feed.user_id,
            //     "@post_id", feed.post_id,
            //     "@content", feed.content,
            //     "@created_at",feed.created_at);
            //    if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
            //    {
            //        throw new Exception(Convert.ToString(result) + msgError);
            //    }
            //    if ((result2 != null && !string.IsNullOrEmpty(result2.ToString())) || !string.IsNullOrEmpty(msgError2))
            //    {
            //        throw new Exception(Convert.ToString(result2) + msgError2);
            //    }
            //    return true;
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public bool AcceptPost(string id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_accept";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            _dbHelper.WriteData(cmd);
            return true;
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_post_accept",
            //     "@id", id);
            //    if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
            //    {
            //        throw new Exception(Convert.ToString(result) + msgError);
            //    }
            //    return true;
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<PostModel> GetMyPosts(int pageIndex, int pageSize, out long total, string id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_myposts";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            cmd.Parameters.AddWithValue("@id", id);
            DataTable dt = _dbHelper.WriteData(cmd);
            total = (long)dt.Rows[0]["RecordCount"];
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //total = 0;
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_myposts",
            //        "@page_index", pageIndex,
            //        "@page_size", pageSize,
            //        "@id", id);

            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
         public List<PostModel> GetPendingPosts(int pageIndex, int pageSize, out long total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_pendingposts";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            DataTable dt = _dbHelper.WriteData(cmd);
            if (dt.Rows.Count > 0)
                total = (long)dt.Rows[0]["RecordCount"];
            else total = 0;
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //total = 0;
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_pendingposts",
            //        "@page_index", pageIndex,
            //        "@page_size", pageSize);

            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<PostModel> GetHomePosts(int pageIndex, int pageSize, out long total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_home";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            DataTable dt = _dbHelper.WriteData(cmd);
            if (dt.Rows.Count > 0)
                total = (long)dt.Rows[0]["RecordCount"];
            else total = 0;
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //total = 0;
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_pendingposts",
            //        "@page_index", pageIndex,
            //        "@page_size", pageSize);

            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<PostModel> GetLastWeekPosts(int pageIndex, int pageSize, out long total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_lastweek";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            DataTable dt = _dbHelper.WriteData(cmd);
            if (dt.Rows.Count > 0)
                total = (long)dt.Rows[0]["RecordCount"];
            else total = 0;
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //total = 0;
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_pendingposts",
            //        "@page_index", pageIndex,
            //        "@page_size", pageSize);

            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<PostModel> GetThisWeekPosts(int pageIndex, int pageSize, out long total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_thisweek";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            DataTable dt = _dbHelper.WriteData(cmd);
            if (dt.Rows.Count > 0)
                total = (long)dt.Rows[0]["RecordCount"];
            else total = 0;
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //total = 0;
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_pendingposts",
            //        "@page_index", pageIndex,
            //        "@page_size", pageSize);

            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<PostModel> GetSamePosts(int pageIndex, int pageSize, string small_category, out long total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_same";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            cmd.Parameters.AddWithValue("@small_category", small_category);
            DataTable dt = _dbHelper.WriteData(cmd);
            if (dt.Rows.Count > 0)
                total = (long)dt.Rows[0]["RecordCount"];
            else total = 0;
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //total = 0;
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_pendingposts",
            //        "@page_index", pageIndex,
            //        "@page_size", pageSize);

            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<PostModel> GetBannerPosts(int pageIndex, int pageSize, out long total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_banners";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            DataTable dt = _dbHelper.WriteData(cmd);
            if (dt.Rows.Count > 0)
                total = (long)dt.Rows[0]["RecordCount"];
            else total = 0;
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //total = 0;
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_pendingposts",
            //        "@page_index", pageIndex,
            //        "@page_size", pageSize);

            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
        public List<PostModel> GetCategoryPosts(int pageIndex, int pageSize, string category, out long total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_post_category";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            cmd.Parameters.AddWithValue("@category", category);
            DataTable dt = _dbHelper.WriteData(cmd);
            if (dt.Rows.Count > 0)
                total = (long)dt.Rows[0]["RecordCount"];
            else total = 0;
            return dt.ConvertTo<PostModel>().ToList();
            //string msgError = "";
            //total = 0;
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_post_pendingposts",
            //        "@page_index", pageIndex,
            //        "@page_size", pageSize);

            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //    return dt.ConvertTo<PostModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
    }
}
