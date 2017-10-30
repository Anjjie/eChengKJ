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
        public int E_id { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        public string E_UserName { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        public string E_UserPwd { get; set; }
        /// <summary>
        /// 姓名
        /// </summary>
        public string E_Name { get; set; }
        /// <summary>
        /// 性别
        /// </summary>
        public string E_Sex { get; set; }
        /// <summary>
        /// 证件类型
        /// </summary>
        public int IDT_id { get; set; }
        /// <summary>
        /// 获取证件属性对象
        /// </summary>
        public IDType_Table GetIDType { get; set; }
        /// <summary>
        /// 证件号
        /// </summary>
        public string E_IdS { get; set; }
        /// <summary>
        /// 毕业学校
        /// </summary>
        public string E_School { get; set; }
        /// <summary>
        /// 学历
        /// </summary>
        public string E_Education { get; set; }
        /// <summary>
        /// 联系方式
        /// </summary>
        public string E_Phone { get; set; }
        /// <summary>
        /// 家庭住址
        /// </summary>
        public string E_Address { get; set; }
        /// <summary>
        /// 部门
        /// </summary>
        public int Dep_id { get; set; }
        /// <summary>
        /// 部门属性对象
        /// </summary>
        public Department_Table GetDepartment { get;set;}
        /// <summary>
        /// 职位
        /// </summary>
        public int Post_id { get; set; }
        /// <summary>
        /// 职位属性对象
        /// </summary>
        public Post_Table GetPost { get; set; }
        /// <summary>
        /// 薪资
        /// </summary>
        public double E_Pay { get; set; }
        /// <summary>
        /// 登录状态
        /// </summary>
        public int LS_ID { get; set; }
        /// <summary>
        /// 登陆状态属性对象
        /// </summary>
        public LoginState_Table GetLoginState { get; set; }
        /// <summary>
        /// 登录地址
        /// </summary>
        public string E_LoginAddress { get; set; }
        /// <summary>
        /// 登录时间
        /// </summary>
        public DateTime E_LoginDate { get; set; }
        /// <summary>
        /// 上次登录地址
        /// </summary>
        public string E_LastLoginAddress { get; set; }
        /// <summary>
        /// 上次登录时间
        /// </summary>
        public DateTime E_LastLoginDate { get; set; }
        /// <summary>
        /// 注册时间
        /// </summary>
        public DateTime E_Date { get; set; }				
    }
}
