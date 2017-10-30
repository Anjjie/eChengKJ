using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：评价
    /// </summary>
    public class Evaluate_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        public int Eva_id { get; set; }
        /// <summary>
        /// 用户ID
        /// </summary>
        public int U_id { get; set; }
        /// <summary>
        /// 获取用户属性对象
        /// </summary>
        public User_Table GetUser { get; set; }
        /// <summary>
        /// 产品ID
        /// </summary>
        public int P_id { get; set; }
        /// <summary>
        /// 获取产品属性对象
        /// </summary>
        public Product_Table GetProduct { get; set; }
        /// <summary>
        /// 评价内容
        /// </summary>
        public string Eva_Content { get; set; }
        /// <summary>
        /// 时间
        /// </summary>
        public DateTime Eva_Datetime { get; set; }			
    }
}
