using AutoMapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Model
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<DataTable, UserModel>().ForMember(m => m.id, s => s.MapFrom(r => r.Rows[0].ToString()))
.ForMember(m => m.hoten, s => s.MapFrom(r => r.Rows[1].ToString())); ;
        }
    }
}
