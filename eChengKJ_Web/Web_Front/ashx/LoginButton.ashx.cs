using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Runtime.Serialization.Json; //json空间
using eChengKJ_Models;
using eChengKJ_BLL;

namespace eChengKJ_Web.Web_Front.ashx
{
    /// <summary>
    /// LoginButton 的摘要说明
    /// </summary>
    public class LoginButton : IHttpHandler
    {
        UserTable_BLL User = new UserTable_BLL();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            var userName = context.Request["userName"];
            var type = context.Request["con"];
            User_Table getUser = new User_Table();
            switch (type)
            {
                case "id":  getUser = User.GetUserTableByConn(userName, "id"); break;
                case "name":  getUser = User.GetUserTableByConn(userName, "name"); break;
                case "phone":  getUser = User.GetUserTableByConn(userName, "phone"); break;
            }
            List<User_Table> getUserList = new List<User_Table>();
            getUserList.Add(getUser);
            //创建可对数据进行Json【序列化/反序列化】操作对象
            DataContractJsonSerializer dcjs = new DataContractJsonSerializer(typeof(List<User_Table>));
            //将数据序列化为Jaon数据，通过流输出到客户端
            dcjs.WriteObject(context.Response.OutputStream, getUserList);
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