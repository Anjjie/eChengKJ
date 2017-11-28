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
        //设置时间的默认值
        string defaultDate = "1-1-1 00:00:00.000";
        string defaultDates ="1-1-1 00:00:00.000";
        //头像
        string Head = "Logo_ICO.png";

        /// <summary>
        /// 编号
        /// </summary>
        public int U_id { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        public string U_UserName { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        public string U_UserPwd { get; set; }
        /// <summary>
        /// 头像
        /// </summary>
        public string U_Head { get { return Head; } set { Head=value; } }
        /// <summary>
        /// 姓名
        /// </summary>
        public string U_Name { get; set; }
        /// <summary>
        /// 性别
        /// </summary>
        public string U_Sex { get; set; }
        /// <summary>
        /// 证件类型
        /// </summary>
        public int IDT_id { get; set; }
        /// <summary>
        /// 获取证件类型属性对象
        /// </summary>
        public IDType_Table GetIDTtpe { get; set; }
        /// <summary>
        /// 证件号码
        /// </summary>
        public string U_IDS { get; set; }
        /// <summary>
        /// 手机号码
        /// </summary>
        public string U_Phone { get; set; }
        /// <summary>
        /// 邮箱
        /// </summary>
        public int M_id { get; set; }
        /// <summary>
        /// 获取邮箱属性对象
        /// </summary>
        public Mail_Table GetMail { get; set; }
        /// <summary>
        /// 所在公司
        /// </summary>
        public string U_Company { get; set; }
        /// <summary>
        /// 公司地址
        /// </summary>
        public string U_ComPanyAddress { get; set; }
        /// <summary>
        /// 手机验证码
        /// </summary>
        public string U_PhoneVerify { get; set; }
        /// <summary>
        /// 登录状态
        /// </summary>
        public int LS_id { get; set; }
        /// <summary>
        /// 获取登录状态属性对象
        /// </summary>
        public LoginState_Table GetLoginState { get; set; }
        /// <summary>
        /// 登录地址
        /// </summary>
        public string U_LoginAddress { get; set; }
        /// <summary>
        /// 登录时间
        /// </summary>
        public string U_LoginDatetime { get { return defaultDate; } set { defaultDate = value; } }
        /// <summary>
        /// 上次登录地址
        /// </summary>
        public string U_LastLoginAddress { get; set; }
        /// <summary>
        /// 上次登录时间
        /// </summary>
        public string U_LastLoginDatetime { get { return defaultDates; } set { defaultDates = value; } }
        /// <summary>
        /// 创建日期
        /// </summary>
        public string U_CreateUserDate { get; set; }

    }

}
