using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：密保表
    /// </summary>
    public class IssueAnswer_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        public int IA_id  {get;set;}
        /// <summary>
        /// 用户账号
        /// </summary>
        public string U_UserName { get; set; }
        /// <summary>
        /// 问题1
        /// </summary>
        public string IA_Issue1 { get; set; }
        /// <summary>
        /// 问题2
        /// </summary>
        public string IA_Issue2 { get; set; }
        /// <summary>
        /// 问题3
        /// </summary>
        public string IA_Issue3 { get; set; }
        /// <summary>
        /// 答案1
        /// </summary>
        public string IA_Answer1 { get; set; }
        /// <summary>
        /// 答案2
        /// </summary>
        public string IA_Answer2 { get; set; }
        /// <summary>
        /// 答案3
        /// </summary>
        public string IA_Answer3 { get; set; } 			
    }
}
