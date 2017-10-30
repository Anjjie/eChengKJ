using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eChengKJ_Models;

namespace eChengKJ_Web.Web_Front
{
    public partial class eChengKJ_Site : System.Web.UI.MasterPage
    {
        public static string loginType = "";

        public User_Table GetUserInfo() {
            if (Session["loginUserName"]==null)
            {
                 loginType = "登录";
            }
            User_Table u= Session["loginUserName"] as User_Table;
            return u;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUserInfo();
            }
        }
    }
}