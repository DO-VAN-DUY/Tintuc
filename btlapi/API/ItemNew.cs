using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace API
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemNew : ControllerBase
    {
        public string SqlConnection { get; set; }
        //public DatabaseHelper(IConfiguration configuration)
        //{
        //    SqlConnection = configuration["ConnectionStrings:DefaultConnection"];
        //}

    }
}
