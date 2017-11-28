using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eChengKJ_Models;
using eChengKJ_BLL;
using System.Runtime.Serialization.Json;

namespace eChengKJ_Web.Web_Front.ashx
{
    /// <summary>
    /// AboutUs_JoinUs_SelPost 的摘要说明
    /// </summary>
    public class AboutUs_JoinUs_SelPost : IHttpHandler
    {
        JoinUsPostTable_BLL bll = new JoinUsPostTable_BLL();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            //获取数据信息
            List<JoinUsPost_Table> list = bll.GetJoinUsPostTableAll();
            //创建可对数据进行Json【序列化/反序列化】操作对象
            DataContractJsonSerializer dcjs = new DataContractJsonSerializer(typeof(List<JoinUsPost_Table>));
            //将数据序列化为Json数据，通过数据流输出到客户端
            dcjs.WriteObject(context.Response.OutputStream,list);
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