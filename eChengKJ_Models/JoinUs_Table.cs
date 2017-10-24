using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：招聘
    /// </summary>
    public class JoinUs_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        int JU_id { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        string JU_Name { get; set; }
        /// <summary>
        /// 性别
        /// </summary>
        string JU_Sex { get; set; }
        /// <summary>
        /// 联系方式
        /// </summary>
        string JU_Phone { get; set; }
        /// <summary>
        /// 地址
        /// </summary>
        string JU_Address { get; set; }
        /// <summary>
        /// 招聘岗位
        /// </summary>
        int JUP_id { get; set; }
        /// <summary>
        /// 提交时间
        /// </summary>
        DateTime JU_SubmitDateTime { get; set; } 			
    }
}
