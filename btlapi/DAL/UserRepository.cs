using DAL.Helper;
using Model;
using Helper;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using DAL.Helper.Interfaces;
using System.Data;
using AutoMapper;

namespace DAL
{
    public partial class UserRepository : IUserRepository
    {
        private IDataconnect _dbHelper;
        private string connect;
        private IMapper mapper;
        public UserRepository(IDataconnect dbHelper, IConfiguration config, IMapper im)
        {
            _dbHelper = dbHelper;
            connect = config["ConnectionStrings:DefaultConnection"];
            mapper = im;
        }

        public bool Create(UserModel model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_user_create";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter id = new SqlParameter
            {
                ParameterName = "@id",
                SqlDbType = SqlDbType.Text,
                Value = model.id

            };
            cmd.Parameters.Add(id);
            SqlParameter hoten = new SqlParameter
            {
                ParameterName = "@hoten",
                SqlDbType = SqlDbType.NVarChar,
                Value = (object)model.hoten ?? DBNull.Value

            };
            cmd.Parameters.Add(hoten);
            SqlParameter ngaysinh = new SqlParameter
            {
                ParameterName = "@ngaysinh",
                SqlDbType = SqlDbType.DateTime,
                Value = (object)model.ngaysinh ?? DBNull.Value

            };
            cmd.Parameters.Add(ngaysinh);
            SqlParameter diachi = new SqlParameter
            {
                ParameterName = "@diachi",
                SqlDbType = SqlDbType.NVarChar,
                Value = (object)model.diachi ?? DBNull.Value

            };
            cmd.Parameters.Add(diachi);
            SqlParameter gioitinh = new SqlParameter
            {
                ParameterName = "@gioitinh",
                SqlDbType = SqlDbType.NVarChar,
                Value = (object)model.gioitinh ?? DBNull.Value

            };
            cmd.Parameters.Add(gioitinh);
            SqlParameter email = new SqlParameter
            {
                ParameterName = "@email",
                SqlDbType = SqlDbType.NVarChar,
                Value = (object)model.email ?? DBNull.Value

            };
            cmd.Parameters.Add(email);
            SqlParameter taikhoan = new SqlParameter
            {
                ParameterName = "@taikhoan",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.taikhoan

            };
            cmd.Parameters.Add(taikhoan);
            SqlParameter matkhau = new SqlParameter
            {
                ParameterName = "@matkhau",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.matkhau

            };
            cmd.Parameters.Add(matkhau);
            SqlParameter role = new SqlParameter
            {
                ParameterName = "@role",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.role

            };
            cmd.Parameters.Add(role);
            SqlParameter image = new SqlParameter
            {
                ParameterName = "@image",
                SqlDbType = SqlDbType.NVarChar,
                Value = (object)model.image ?? DBNull.Value

            };
            cmd.Parameters.Add(image);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //    string msgError = "";
            //    try
            //    {
            //        var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_user_create",
            //        "@id", model.id,
            //        "@hoten", model.hoten,
            //        "@ngaysinh", model.ngaysinh,
            //        "@diachi", model.diachi,
            //        "@gioitinh", model.gioitinh,
            //        "@email", model.email,
            //        "@taikhoan", model.taikhoan,
            //        "@matkhau", model.matkhau,
            //        "@role", model.role,
            //        "@image", model.image);
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
        }

        //public bool Delete(string id)
        //{
        //    string msgError = "";
        //    try
        //    {
        //        var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_user_delete",
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
        public bool Update(UserModel model)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_user_update";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter id = new SqlParameter
            {
                ParameterName = "@id",
                SqlDbType = SqlDbType.Text,
                Value = model.id

            };
            cmd.Parameters.Add(id);
            SqlParameter hoten = new SqlParameter
            {
                ParameterName = "@hoten",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.hoten

            };
            cmd.Parameters.Add(hoten);
            SqlParameter ngaysinh = new SqlParameter
            {
                ParameterName = "@ngaysinh",
                SqlDbType = SqlDbType.DateTime,
                Value = model.ngaysinh

            };
            cmd.Parameters.Add(ngaysinh);
            SqlParameter diachi = new SqlParameter
            {
                ParameterName = "@diachi",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.diachi

            };
            cmd.Parameters.Add(diachi);
            SqlParameter gioitinh = new SqlParameter
            {
                ParameterName = "@gioitinh",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.gioitinh

            };
            cmd.Parameters.Add(gioitinh);
            SqlParameter email = new SqlParameter
            {
                ParameterName = "@email",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.email

            };
            cmd.Parameters.Add(email);
            SqlParameter taikhoan = new SqlParameter
            {
                ParameterName = "@taikhoan",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.taikhoan

            };
            cmd.Parameters.Add(taikhoan);
            SqlParameter matkhau = new SqlParameter
            {
                ParameterName = "@matkhau",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.matkhau

            };
            cmd.Parameters.Add(matkhau);
            SqlParameter role = new SqlParameter
            {
                ParameterName = "@role",
                SqlDbType = SqlDbType.NVarChar,
                Value = model.role

            };
            cmd.Parameters.Add(role);
            SqlParameter image = new SqlParameter
            {
                ParameterName = "@image",
                SqlDbType = SqlDbType.NVarChar,
                Value = (object)model.image ?? DBNull.Value

            };
            cmd.Parameters.Add(image);
            DataTable dt = _dbHelper.WriteData(cmd);
            return true;
            //    string msgError = "";
            //    try
            //    {
            //        var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_user_update",
            //        "@id", model.id,
            //        "@hoten", model.hoten,
            //        "@ngaysinh", model.ngaysinh,
            //        "@diachi", model.diachi,
            //        "@gioitinh", model.gioitinh,
            //        "@email", model.email,
            //        "@taikhoan", model.taikhoan,
            //        "@matkhau", model.matkhau,
            //        "@role", model.role,
            //        "@image", model.image);
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
        }


        public UserModel GetUser(string username, string password)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_user_get_by_username_password";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter taikhoan = new SqlParameter
            {
                ParameterName = "@taikhoan",
                SqlDbType = SqlDbType.Text,
                Value = username

            };
            cmd.Parameters.Add(taikhoan);
            SqlParameter matkhau = new SqlParameter
            {
                ParameterName = "@matkhau",
                SqlDbType = SqlDbType.Text,
                Value = password

            };
            cmd.Parameters.Add(matkhau);
            DataTable dt = _dbHelper.WriteData(cmd);
            return dt.ConvertTo<UserModel>().FirstOrDefault();
            //string msgError = "";
            //try
            //{
            //    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_user_get_by_username_password",
            //         "@taikhoan", username,
            //         "@matkhau", password);
            //    if (!string.IsNullOrEmpty(msgError))
            //        throw new Exception(msgError);
            //    return dt.ConvertTo<UserModel>().FirstOrDefault();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }

        public UserModel GetDatabyID(string id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_user_get_by_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            DataTable dt = _dbHelper.WriteData(cmd);

            //UserModel user = new UserModel();
            //foreach (DataRow row in dt.Rows)
            //{
            //    user.id = row["id"].ToString();
            //    user.email = row["email"].ToString();
            //    user.taikhoan = row["taikhoan"].ToString();
            //}
            return dt.ConvertTo<UserModel>().FirstOrDefault();
            //    string msgError = "";
            //    try
            //    {
            //        var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_user_get_by_id",
            //             "@id", id);
            //        if (!string.IsNullOrEmpty(msgError))
            //            throw new Exception(msgError);
            //        return dt.ConvertTo<UserModel>().FirstOrDefault();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
        }
            //public List<UserModel> Search(int pageIndex, int pageSize, out long total, string hoten, string taikhoan)
            //{
            //    string msgError = "";
            //    total = 0;
            //    try
            //    {
            //        var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_user_search",
            //            "@page_index", pageIndex,
            //            "@page_size", pageSize,
            //            "@hoten", hoten,
            //            "@taikhoan", taikhoan);
            //        if (!string.IsNullOrEmpty(msgError))
            //            throw new Exception(msgError);
            //        if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //        return dt.ConvertTo<UserModel>().ToList();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
        //}
        public List<UserModel> GetStaffList(int pageIndex, int pageSize, out long total)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "sp_user_getstafflist";
            cmd.CommandType = CommandType.StoredProcedure;
            //SqlParameter pageindex = new SqlParameter
            //  {
            //      ParameterName = "@page_index",
            //      DbType = DbType.Int32,


            //  };
            //cmd.Parameters["@page_index"].Value = pageIndex;
            cmd.Parameters.AddWithValue("@page_index", pageIndex);
            cmd.Parameters.AddWithValue("@page_size", pageSize);
            //SqlParameter pagesize = new SqlParameter
            //{
            //    ParameterName = "@page_size",
            //    DbType = DbType.Int32,
            //    Value = pageSize.ToString()

            //};
            //cmd.Parameters.Add(pageSize);
            DataTable dt = _dbHelper.WriteData(cmd);
            total = (long)dt.Rows[0]["RecordCount"];
            return dt.ConvertTo<UserModel>().ToList();

            //    string msgError = "";
            //    total = 0;
            //    try
            //    {
            //        var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_user_getstafflist",
            //            "@page_index", pageIndex,
            //            "@page_size", pageSize);                
            //        if (!string.IsNullOrEmpty(msgError))
            //            throw new Exception(msgError);
            //        if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
            //        return dt.ConvertTo<UserModel>().ToList();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
        }
    }
}
