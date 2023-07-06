﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    public class FeedModel
    {
        public string id { get; set; }
        public string user_id { get; set; }
        public string post_id { get; set; }
        public string content { get; set; }
        public DateTime? created_at { get; set; }
    }
}
