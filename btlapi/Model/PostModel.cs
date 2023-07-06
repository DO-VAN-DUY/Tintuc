using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    public class PostModel
    {
        public string id { get; set; }
        public string title { get; set; }
        public string small_category_id { get; set; }
        public string metatitle { get; set; }
        public string description { get; set; }
        public string content { get; set; }
        public DateTime? created_at { get; set; }
        public DateTime? updated_at { get; set; }
        public string author { get; set; }
        public string image { get; set; }
        public string status { get; set; }
        public string small_category_title { get; set; }
        public int view { get; set; }
        public string big_category { get; set; }
        public string big_category_id { get; set; }
        public string author_name { get; set; }
        public string feed { get; set; }
    }

}
