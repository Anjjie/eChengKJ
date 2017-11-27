using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eChengKJ_BLL;
using eChengKJ_Models;


namespace eChengKJ_Web.Web_Front.ashx
{
    /// <summary>
    /// Login_RegisterInfo 的摘要说明
    /// </summary>
    public class Login_RegisterInfo : IHttpHandler
    {
        UserTable_BLL bll = new UserTable_BLL();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            User_Table getUserRegister = new User_Table() {
                U_Phone = context.Request["phone"],
                U_UserName = context.Request["username"],
                U_UserPwd = context.Request["userpwd"],
                LS_id =0,
                U_CreateUserDate=DateTime.Now+"",
                IDT_id=0,
                M_id = 0,
                U_Company = "",
                U_ComPanyAddress = "",
                U_Head = "Logo_ICO.png",
                U_LastLoginAddress = "",
                U_IDS ="",
                U_LoginAddress = "",
                U_Name = "客户(请完善信息)",
                U_PhoneVerify = "",
                U_Sex = ""
            };
            int n = bll.Insert_UserTableData(getUserRegister);
            if (n>0)
            {
                context.Response.Write("Yes");
            }
            else
            {
                context.Response.Write("No");
            }
        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}