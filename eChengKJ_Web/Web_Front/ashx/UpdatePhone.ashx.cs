using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using eChengKJ_Models;
using eChengKJ_BLL;

namespace eChengKJ_Web.Web_Front.ashx
{
    /// <summary>
    /// UpdatePhone 的摘要说明
    /// </summary>
    public class UpdatePhone : IHttpHandler
    {
        UserTable_BLL userbll = new UserTable_BLL();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            User_Table user = userbll.GetUserTableByConn(context.Request["loginName"], "name");
            user.U_Phone = context.Request["newPhone"];
            int n = userbll.Update_UserTableData(user);
            if (n > 0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
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