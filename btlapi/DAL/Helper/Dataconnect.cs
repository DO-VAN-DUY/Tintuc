using DAL.Helper.Interfaces;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Text;
using AutoMapper;

namespace DAL.Helper
{
    public class Dataconnect : IDataconnect
    {
        static string str;
        SqlConnection cnn;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        MapperConfiguration configmapper;
        
        public Dataconnect(IConfiguration config)
        {
            str = config["ConnectionStrings:DefaultConnection"];
            cnn = new SqlConnection(str); 
        }
        public DataTable GetData(string query)
        {
            cnn.Open();
            da = new SqlDataAdapter(query, cnn);
            dt = new DataTable();
            da.Fill(dt);
            cnn.Close();
            return dt;
        }
        //public DataTable WriteData(SqlCommand c)
        //{
        //    cnn.Open();
        //    cmd = new SqlCommand(str);
        //    c.Connection = cnn;
        //    c.ExecuteNonQuery();
        //    da = new SqlDataAdapter(c);
        //    dt = new DataTable();
        //    da.Fill(dt);
        //    cnn.Close();
        //    return dt;

        //}


    }
}
