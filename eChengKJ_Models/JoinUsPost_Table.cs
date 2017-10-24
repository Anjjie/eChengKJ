using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：招聘职位
    /// </summary>
    public class JoinUsPost_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        public int JUP_id { get; set; }
        /// <summary>
        /// 岗位名称
        /// </summary>
        public string JUP_Name { get; set; }
        /// <summary>
        /// 招聘人数
        /// </summary>
        public int JUP_Number { get; set; }				
    }
}
