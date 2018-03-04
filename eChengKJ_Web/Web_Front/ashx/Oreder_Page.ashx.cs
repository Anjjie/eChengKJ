using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using eChengKJ_BLL;
using eChengKJ_Models;

namespace eChengKJ_Web.Web_Front.ashx
{
    /// <summary>
    /// Oreder_Page 的摘要说明
    /// </summary>
    public class Oreder_Page : IHttpHandler
    {
        OrderTable_BLL order_bll = new OrderTable_BLL();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            int id = Convert.ToInt32(context.Request["uid"]);
            int pageNo = Convert.ToInt32(context.Request["no"]);
            int pageSize= Convert.ToInt32(context.Request["size"]);

            int order_count = order_bll.GetOrderTableByConn("U_id", id.ToString()).Count;
            if (order_count==0)
            {
                context.Response.Write("<sanp style='width:100%;text-align:center;font-size:15pt;'>没有数据</span>");
                return;
            }

            int pageCount = Convert.ToInt32(Math.Ceiling((double)order_count/10))+1;

            context.Response.Write(pageCount);


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