using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eChengKJ_Models;
using eChengKJ_BLL;

namespace eChengKJ_Web.Web_Front.ashx
{
    /// <summary>
    /// AboutUs_JoinUs_btnOK 的摘要说明
    /// </summary>
    public class AboutUs_JoinUs_btnOK : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            JoinUs_Table getData = new JoinUs_Table() {
                JU_Name= context.Request["Name"],
                JU_Sex = context.Request["Sex"],
                JU_Address  = context.Request["Address"],
                JU_Phone = context.Request["Phone"],
                JUP_id =Convert.ToInt32(context.Request["Post"]),
                JU_SubmitDateTime = DateTime.Now
            };
            JoinUsTable_BLL insert = new JoinUsTable_BLL();
            int n = insert.Insert_JoinUsTableData(getData);
            if (n>0)
            {
                context.Response.Write("提交成功！");
            }
            else
            {
                context.Response.Write("提交失败！");
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