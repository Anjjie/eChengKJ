using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：用户表
    /// </summary>
    public class User_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        int U_id { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        string U_UserName { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        string U_UserPwd { get; set; }
        /// <summary>
        /// 头像
        /// </summary>
        Byte[] U_Head { get; set; }
        /// <summary>
        /// 姓名
        /// </summary>
        string U_Name { get; set; }
        /// <summary>
        /// 性别
        /// </summary>
        string U_Sex { get; set; }
        /// <summary>
        /// 证件类型
        /// </summary>
        int IDT_id { get; set; }
        /// <summary>
        /// 证件号码
        /// </summary>
        string U_IDS { get; set; }
        /// <summary>
        /// 手机号码
        /// </summary>
        string U_Phone { get; set; }
        /// <summary>
        /// 邮箱
        /// </summary>
        int M_id { get; set; }
        /// <summary>
        /// 所在公司
        /// </summary>
        string U_Company { get; set; }
        /// <summary>
        /// 公司地址
        /// </summary>
        string U_ComPanyAddress { get; set; }
        /// <summary>
        /// 登录状态
        /// </summary>
        int LS_id { get; set; }
        /// <summary>
        /// 登录地址
        /// </summary>
        string U_LoginAddress { get; set; }
        /// <summary>
        /// 登录时间
        /// </summary>
        DateTime U_LoginDatetime { get; set; }
        /// <summary>
        /// 上次登录地址
        /// </summary>
        string U_LastLoginAddress { get; set; }
        /// <summary>
        /// 上次登录时间
        /// </summary>
        DateTime U_LastLoginDatetime { get; set; }
        /// <summary>
        /// 创建日期
        /// </summary>
        DateTime U_CreateUserDate { get; set; }
    }
}
