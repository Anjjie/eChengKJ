using eChengKJ_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eChengKJ_Web.Web_Front
{
    public partial class Front_Pansonel_Shop : System.Web.UI.Page
    {
        public string notIsLogin = "登录";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUserInfo();
            }
        }

        /// <summary>
        /// 获取信息
        /// </summary>
        /// <returns></returns>

        public User_Table GetUserInfo()
        {
            User_Table u = new User_Table();
            if (Session["loginUserName"] == null)
            {
                notIsLogin = "";
            }
            else
            {
                u = Session["loginUserName"] as User_Table;
            }
            return u;
        }
    }
}