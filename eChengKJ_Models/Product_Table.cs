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
        int P_id {get;set;}
        /// <summary>
        /// 自定义产品编号
        /// </summary>
        string P_No { get; set; }
        /// <summary>
        /// 产品名称
        /// </summary>
        string P_Name { get; set; }				
        /// <summary>
       /// 产品价格
       /// </summary>
        double P_Price { get; set; }					
        /// <summary>
       /// 类型
       /// </summary>
        int PT_id { get; set; }		
        /// <summary>
       /// 是否热门
       /// </summary>
        int HP_id { get; set; }	
        /// <summary>
       /// 是否新品
       /// </summary>
        int NP_id { get; set; }
        /// <summary>
        /// 发布日期
        /// </summary>
        DateTime P_Date  {get;set;} 
        /// <summary>
        /// 出品公司
        /// </summary>
        string P_Company { get; set; }
        /// <summary>
        /// 操作人
        /// </summary>
        int E_id { get; set; }							
    }
}
