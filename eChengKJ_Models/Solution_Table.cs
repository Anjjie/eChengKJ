using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：解决方案
    /// </summary>
    public class Solution_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        int S_id { get; set; }
        /// <summary>
        /// 产品ID
        /// </summary>
        int P_id { get; set; }
        /// <summary>
        /// 标题
        /// </summary>
        string S_tatle { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        string S_Content { get; set; }
        /// <summary>
        /// 时间
        /// </summary>
        DateTime S_Datetime  { get; set; }  				
    }
}
