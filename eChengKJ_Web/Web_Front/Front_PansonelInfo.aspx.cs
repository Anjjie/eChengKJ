using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eChengKJ_Models;
using eChengKJ_BLL;

namespace eChengKJ_Web.Web_Front
{
    public partial class Front_PansonelInfo : System.Web.UI.Page
    {
        public string notIsLogin = "登录";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User_Table u = new User_Table();
                if (Session["loginUserName"]==null)
                {
                    UserTable_BLL userData = new UserTable_BLL();
                     u = userData.GetUserTableByConn(Request.QueryString["userName"].ToString(), "name");
                    Session["loginUserName"] = u;
                }
                GetUserInfo();
            }
        }

        /// <summary>
        /// 获取信息
        /// </summary>
        /// <returns></returns>

       public User_Table GetUserInfo() {
            User_Table u = new User_Table();
            if (Session["loginUserName"]==null)
            {
                notIsLogin = "";
            }
            else
            {
                u =Session["loginUserName"] as User_Table;
            }
            return u;
        }
    }
}