using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Text;
using CheckInfo_Web.Extension;
using eChengKJ_Models;
using eChengKJ_BLL;

namespace eChengKJ_Web.Web_Front.ashx
{
    /// <summary>
    /// 获取手机验证码
    /// </summary>
    public class PhoneVerify : IHttpHandler
    {
        //UserTable_BLL getUser = new UserTable_BLL();
        //User_Table obj = new User_Table ();
        string temMsg;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            GetCheckNum(context.Request["phone"]);
            context.Response.Write("{\"Verify\":\"" + temMsg + "\"}");
        }

        /// <summary>
        /// 给手机发送验证信息
        /// </summary>
        /// <param name="userName"></param>
        public void GetCheckNum(string phone)
        {
            //TODO: 在这里再次判断用户手机号是否与数据库中已有的重复
            //产生随机验证码
            Random r = new Random();
            temMsg = string.Empty;
            for (int i = 0; i < 5; i++)
            {
                temMsg += r.Next(0, 9);
            }
            //保存随机码
            //Session["num"] = temMsg;
            //ControllerContext.HttpContext.Application["num"] = temMsg;
            //TODO: 这里建议随机码保存到数据库，因为调用API发送短信，Session,Application状态会丢失
            //拼接短信内容
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("{0}", temMsg); //您注册{1}网站的验证码为{2}，请于{3}分钟内正确输入验证码
            #region Demo
            //string serverIp = "api.ucpaas.com";
            //string serverPort = "443";
            //string account = "";     //用户sid
            //string token = "";         //用户sid对应的token
            //string appId = "";      //对应的应用id，非测试应用需上线使用
            //string templatedId = "";          //短信模板id，需通过审核
            //UCSRestRequest api = new UCSRestRequest();
            //api.init(serverIp, serverPort);
            //api.setAccount(account, token);
            //api.enabeLog(true);
            //api.setAppId(appId);
            //api.enabeLog(true);
            //api.SendSMS(phone, templatedId, sb.ToString());
            #endregion
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