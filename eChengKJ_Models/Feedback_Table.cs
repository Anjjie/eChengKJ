using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：反馈
    /// </summary>
   public class Feedback_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        int Feed_id { get; set; }
        /// <summary>
        /// 用户ID
        /// </summary>
        int U_id { get; set; }
        /// <summary>
        /// 产品ID
        /// </summary>
        int P_id { get; set; }
        /// <summary>
        /// 反馈内容
        /// </summary>
        string Feed_Content { get; set; }
        /// <summary>
        /// 时间
        /// </summary>
        DateTime Feed_Datetime { get; set; }
    }
}
