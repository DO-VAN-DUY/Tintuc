using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Text;

namespace DAL.Helper.Interfaces
{
    public interface IDataconnect
    {
        DataTable GetData(string query);
        DataTable WriteData(SqlCommand c);
    }
}
