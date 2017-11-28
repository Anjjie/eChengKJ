using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eChengKJ_Models;
using eChengKJ_BLL;
using System.IO;

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


        #region 上传图片按钮事件方法
        /// <summary>
        /// 上传图片按钮事件方法
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUp_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.selFileImage.HasFile)//判断是否选择文件
                {
                    string fileName= GetUserInfo ().U_UserName+"."+ this.selFileImage.PostedFile.FileName.Split('.')[1];
                    string pathFile = Server.MapPath("image/Head") + "\\"+ fileName;
                    if (File.Exists(pathFile))
                    {
                        File.Delete(pathFile);
                    }
                    this.selFileImage.PostedFile.SaveAs(pathFile);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(),"","alert('对不起，请选择图片！');",true);
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),"ExceptionFile","alert("+ex.Message+");",true);    
            }
        } 
        #endregion
    }
}