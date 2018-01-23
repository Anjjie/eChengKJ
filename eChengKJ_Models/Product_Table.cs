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
        /// 产品封面
        /// </summary>
        public string P_CoverImage { get; set; }
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
        /// 获取产品类型属性对象
        /// </summary>
        public ProductType_Table GetProductType { get; set; }
        /// <summary>
        /// 是否热门
        /// </summary>
        public int HP_id { get; set; }
        /// <summary>
        /// 获取是否热门属性对象
        /// </summary>
        public HotProduct_Table GetHotProduct { get; set; }
        /// <summary>
        /// 是否新品
        /// </summary>
        public int NP_id { get; set; }
        /// <summary>
        /// 获取是否新品属性对象
        /// </summary>
        public NewProduct_Table GetNewProduct { get; set; }
        /// <summary>
        /// 产品介绍
        /// </summary>
        public string P_Introduce { get; set; }
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
        /// <summary>
        /// 获取员工属性对象
        /// </summary>
        public Employee_Table GetEmployee { get; set; }						
    }
}
