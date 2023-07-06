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
    public partial class FeedRepository : IFeedRepository
    {
        private IDataconnect _dbHelper;
        private string connect;
        public FeedRepository(IDataconnect dbHelper, IConfiguration config)
        {
            _dbHelper = dbHelper;
            connect = config["ConnectionStrings:DefaultConnection"];
        }

        public bool Create(FeedModel model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_feed_create";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", model.id);
            cmd.Parameters.AddWithValue("@user_id", model.user_id);
            cmd.Parameters.AddWithValue("@post_id", model.post_id);
            cmd.Parameters.AddWithValue("@content", model.content);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_feed_create",
            //    "@id", model.id,
            //    "@user_id", model.user_id,
            //    "@post_id", model.post_id,
            //    "@content", model.content,
            //    "@created_at", model.created_at);
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

        //public bool Delete(string id)
        //{
        //    string msgError = "";
        //    try
        //    {
        //        var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_feed_delete",
        //        "@id", id);
        //        if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
        //        {
        //            throw new Exception(Convert.ToString(result) + msgError);
        //        }
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public bool Update(FeedModel model)
        //{
        //    string msgError = "";
        //    try
        //    {
        //        var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_feed_update",
        //        "@id", model.id,
        //        "@user_id", model.user_id,
        //        "@post_id", model.post_id,
        //        "@content", model.content,
        //        "@created_at", model.created_at);
        //        if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
        //        {
        //            throw new Exception(Convert.ToString(result) + msgError);
        //        }
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public FeedModel GetDatabyID(string id)
        //{
        //    string msgError = "";
        //    try
        //    {
        //        var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_feed_get_by_id",
        //             "@id", id);
        //        if (!string.IsNullOrEmpty(msgError))
        //            throw new Exception(msgError);
        //        return dt.ConvertTo<FeedModel>().FirstOrDefault();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public List<FeedModel> Search(int pageIndex, int pageSize, out long total, string title)
        //{
        //    string msgError = "";
        //    total = 0;
        //    try
        //    {
        //        var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_feed_search",
        //            "@page_index", pageIndex,
        //            "@page_size", pageSize,
        //            "@title", title);

        //        if (!string.IsNullOrEmpty(msgError))
        //            throw new Exception(msgError);
        //        if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
        //        return dt.ConvertTo<FeedModel>().ToList();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        public List<FeedModel> GetDataAll()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_feed_all";
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = _dbHelper.WriteData(cmd);
            return dt.ConvertTo<FeedModel>().ToList();
            //string msgError = "";
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_Feed_all");
            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    return dt.ConvertTo<FeedModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }

    }
}
