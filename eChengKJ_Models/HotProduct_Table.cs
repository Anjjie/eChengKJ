using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：是否热门产品表
    /// </summary>
    public class HotProduct_Table
    {
        /// <summary>
        /// 热门编号
        /// </summary>
        public int HP_id { get; set; }
        /// <summary>
        /// 是否热门
        /// </summary>
        public string HP_Name { get; set; }			
    }
}
