using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：是否新产品表
    /// </summary>
    public class NewProduct_Table
    {
        /// <summary>
        /// 新品编号
        /// </summary>
        public int NP_id { get; set; }
        /// <summary>
        /// 是否新品
        /// </summary>
        public string NP_Name { get; set; }
    }
}
