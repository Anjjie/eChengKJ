using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using eChengKJ_Models;
using eChengKJ_BLL;
using System.IO;
using System.Configuration;

namespace eChengKJ_Web.Web_Front
{
    public partial class Front_Pansonel_SetHead : System.Web.UI.Page
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

        /// <summary>
        /// 取消按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancels_Click(object sender, EventArgs e)
        {
            try
            {
                string[] filePath = ConfigurationManager.AppSettings["filePath"].Split('|');
                if (filePath[0] != "null" && filePath[1] != "nameNull")
                {
                    if (File.Exists(filePath[0]))
                    {
                        File.Delete(filePath[0]);
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),"","alert('操作异常："+ex.Message+"');",true);
            }
            
        }

        /// <summary>
        /// 保存按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSaves_Click(object sender, EventArgs e)
        {
            try
            {
                string[] filePath = ConfigurationManager.AppSettings["filePath"].Split('|');
                if (filePath[0] != "null"&& filePath[1]!= "nameNull")
                {
                    string destFilePath= Server.MapPath(@"image\Head") + "\\" + filePath[1];
                    if (File.Exists(filePath[0]))
                    {
                        if (File.Exists(destFilePath))
                        {
                            File.Delete(destFilePath);
                        }
                        File.Copy(filePath[0], destFilePath);
                        File.Delete(filePath[0]);
                        if (Session["loginUserName"]!=null)
                        {
                            UserTable_BLL bll = new UserTable_BLL();
                            User_Table user = Session["loginUserName"] as User_Table;
                            user.U_Head = filePath[1];
                            ConfigurationManager.AppSettings["defaultHead"] = filePath[1];
                            Session["loginUserName"] = user;
                            int n = bll.Update_UserTableData(user);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('操作异常：" + ex.Message + "');", true);
            }
        }
    }
}