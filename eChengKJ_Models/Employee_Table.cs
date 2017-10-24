using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：员工
    /// </summary>
    public class Employee_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        int E_id { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        string E_UserName { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        string E_UserPwd { get; set; }
        /// <summary>
        /// 姓名
        /// </summary>
        string E_Name { get; set; }
        /// <summary>
        /// 性别
        /// </summary>
        string E_Sex { get; set; }
        /// <summary>
        /// 证件类型
        /// </summary>
        int IDT_id { get; set; }
        /// <summary>
        /// 证件号
        /// </summary>
        string E_IdS { get; set; }
        /// <summary>
        /// 毕业学校
        /// </summary>
        string E_School { get; set; }
        /// <summary>
        /// 学历
        /// </summary>
        string E_Education { get; set; }
        /// <summary>
        /// 联系方式
        /// </summary>
        string E_Phone { get; set; }
        /// <summary>
        /// 家庭住址
        /// </summary>
        string E_Address { get; set; }
        /// <summary>
        /// 部门
        /// </summary>
        int Dep_id { get; set; }
        /// <summary>
        /// 职位
        /// </summary>
        int Post_id { get; set; }
        /// <summary>
        /// 薪资
        /// </summary>
        double E_Pay { get; set; }
        /// <summary>
        /// 登录状态
        /// </summary>
        int LS_ID { get; set; }
        /// <summary>
        /// 登录地址
        /// </summary>
        string E_LoginAddress { get; set; }
        /// <summary>
        /// 登录时间
        /// </summary>
        DateTime E_LoginDate { get; set; }
        /// <summary>
        /// 上次登录地址
        /// </summary>
        string E_LastLoginAddress { get; set; }
        /// <summary>
        /// 上次登录时间
        /// </summary>
        DateTime E_LastLoginDate { get; set; }
        /// <summary>
        /// 注册时间
        /// </summary>
        DateTime E_Date { get; set; }				
    }
}
