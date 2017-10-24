using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：产品
    /// </summary>
   public class Product_Table
    {
        /// <summary>
        /// 产品编号
        /// </summary>
        public int P_id {get;set;}
        /// <summary>
        /// 自定义产品编号
        /// </summary>
        public string P_No { get; set; }
        /// <summary>
        /// 产品名称
        /// </summary>
        public string P_Name { get; set; }
        /// <summary>
        /// 产品价格
        /// </summary>
        public double P_Price { get; set; }
        /// <summary>
        /// 类型
        /// </summary>
        public int PT_id { get; set; }
        /// <summary>
        /// 是否热门
        /// </summary>
        public int HP_id { get; set; }
        /// <summary>
        /// 是否新品
        /// </summary>
        public int NP_id { get; set; }
        /// <summary>
        /// 发布日期
        /// </summary>
        public DateTime P_Date  {get;set;}
        /// <summary>
        /// 出品公司
        /// </summary>
        public string P_Company { get; set; }
        /// <summary>
        /// 操作人
        /// </summary>
        public int E_id { get; set; }							
    }
}
