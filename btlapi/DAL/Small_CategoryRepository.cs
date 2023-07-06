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
    public partial class Small_CategoryRepository : ISmall_CategoryRepository
    {
        private IDataconnect _dbHelper;
        private string connect;
        public Small_CategoryRepository(IDataconnect dbHelper, IConfiguration config)
        {
            _dbHelper = dbHelper;
            connect = config["ConnectionStrings:DefaultConnection"];
        }

        public bool Create(Small_CategoryModel model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_small_category_create";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", model.id);
            cmd.Parameters.AddWithValue("@title", model.title);
            cmd.Parameters.AddWithValue("@description", model.description);
            cmd.Parameters.AddWithValue("@category_id", model.category_id);
            cmd.Parameters.AddWithValue("@metatitle", model.metatitle);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_small_category_create",
            //    "@id", model.id,
            //    "@title", model.title,
            //    "@description", model.description,
            //    "@category_id", model.category_id);
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
            cmd.CommandText = "sp_small_category_delete";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_small_category_delete",
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
        public bool Update(Small_CategoryModel model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_small_category_update";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", model.id);
            cmd.Parameters.AddWithValue("@title", model.title);
            cmd.Parameters.AddWithValue("@description", model.description);
            cmd.Parameters.AddWithValue("@metatitle", model.metatitle);
            cmd.Parameters.AddWithValue("@category_id", model.category_id);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //string msgError = "";
            //try
            //{
            //    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_small_category_update",
            //     "@id", model.id,
            //    "@title", model.title,
            //    "@description", model.description,
            //    "@category_id",model.category_id);
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

        //public Small_CategoryModel GetDatabyID(string id)
        //{
        //    string msgError = "";
        //    try
        //    {
        //        var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_small_category_get_by_id",
        //             "@id", id);
        //        if (!string.IsNullOrEmpty(msgError))
        //            throw new Exception(msgError);
        //        return dt.ConvertTo<Small_CategoryModel>().FirstOrDefault();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public List<Small_CategoryModel> Search(int pageIndex, int pageSize, out long total, string title)
        //{
        //    string msgError = "";
        //    total = 0;
        //    try
        //    {
        //        var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_Small_Category_search",
        //            "@page_index", pageIndex,
        //            "@page_size", pageSize,
        //            "@title", title);

        //        if (!string.IsNullOrEmpty(msgError))
        //            throw new Exception(msgError);
        //        if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
        //        return dt.ConvertTo<Small_CategoryModel>().ToList();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        public List<Small_CategoryModel> GetDataAll()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_small_category_all";
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = _dbHelper.WriteData(cmd);
            return dt.ConvertTo<Small_CategoryModel>().ToList();
            //string msgError = "";
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_Small_Category_all");
            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    return dt.ConvertTo<Small_CategoryModel>().ToList();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }

    }
}
