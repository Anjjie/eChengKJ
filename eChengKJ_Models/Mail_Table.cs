using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：邮箱表
    /// </summary>
    public class Mail_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        public int M_id {get;set;}
        /// <summary>
        /// 邮箱号
        /// </summary>
        public string M_Mail { get; set; }
        /// <summary>
        /// 是否激活
        /// </summary>
        public string M_YesNo { get; set; }               
    }
}
