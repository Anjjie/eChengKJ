using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Configuration;
using eChengKJ_Models;
using eChengKJ_BLL;

namespace eChengKJ_Web.Web_Front
{
    public partial class UPFileImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string defaultHead = ConfigurationManager.AppSettings["defaultHead"];
                if (defaultHead!= "null")
                {
                    this.getFileName.InnerHtml = @"image\Head\"+ defaultHead;
                }
            }
        }

        protected void btnUp_Click(object sender, EventArgs e)
        {
            string name= Request["name"];
            try
            {
                string excInfo = "";
                if (this.selFileImage.HasFile)
                {
                    string[] suffix = this.selFileImage.FileName.Split('.');
                    string fileName = name + "." + suffix[suffix.Length-1];
                    string filePath= Server.MapPath(@"image\Temporary_Image_Storage") + "\\" + fileName;
                    if (File.Exists(filePath))
                    {
                        File.Delete(filePath);
                    }
                    this.selFileImage.PostedFile.SaveAs(filePath);
                    string[] UPFileNames = this.selFileImage.FileName.Split('\\');
                    string UPFileName = UPFileNames[UPFileNames.Length - 1];
                    ConfigurationManager.AppSettings["filePath"] = filePath+"|"+ fileName;
                    //Session["filePath"] = filePath;
                    this.getFileName.InnerHtml = @"image\Temporary_Image_Storage\" + fileName;
                    excInfo = "已选择文件名："+ UPFileName;
                }
                else
                {
                    excInfo = "您没有选择图片或者图片格式有误，请重新选择！";
                }
                this.lbHint.InnerHtml = excInfo;
            }
            catch (Exception ex)
            {
                 this.lbHint.InnerHtml = ex.Message;
            }

        }
    }
}