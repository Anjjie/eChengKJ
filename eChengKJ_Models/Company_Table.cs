using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：公司信息
    /// </summary>
   public class Company_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        public int Com_id { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        public string Com_Name { get; set; }
        /// <summary>
        /// Logo
        /// </summary>
        public Byte[] Com_Logo { get; set; }
        /// <summary>
        /// 介绍
        /// </summary>
        public string Com_Introduce { get; set; }
        /// <summary>
        /// 荣誉
        /// </summary>
        public string Com_Honer { get; set; }
        /// <summary>
        /// 销售范围
        /// </summary>
        string Com_Scope { get; set; }
        /// <summary>
        /// 规模
        /// </summary>
        public string Com_Scale { get; set; }
        /// <summary>
        /// 发展历程
        /// </summary>
        public string Com_Course { get; set; }
        /// <summary>
        /// 宗旨
        /// </summary>
        public string Com_Purpose { get; set; }                
    }
}
