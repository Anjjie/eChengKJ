using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Runtime.Serialization.Json;
using eChengKJ_Models;
using eChengKJ_BLL;

namespace eChengKJ_Web.Web_Front.ashx
{
    /// <summary>
    /// Shop_Table 的摘要说明
    /// </summary>
    public class Shop_Table : IHttpHandler
    {
        private string operation;

        ShopTable_BLL shopBLL = new ShopTable_BLL();

        public void ProcessRequest(HttpContext context)
        {
            eChengKJ_Models.Shop_Table obj =new eChengKJ_Models.Shop_Table ();
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            operation = context.Request["operation"];
            switch (operation.ToLower())
            {
                case "insert":
                case "update":
                    obj = new eChengKJ_Models.Shop_Table()
                    {
                        P_No = context.Request["P_No"],
                        Shop_Date = context.Request["Shop_Date"],
                        Shop_Id = Convert.ToInt32(context.Request["Shop_Id"]),
                        Shop_Number = context.Request["Shop_Number"],
                        Shop_User = context.Request["Shop_User"]
                    };
                    break;
            }
            int n=0;
            //操作类型，必填（选择执行操作方式）
            switch (operation.ToLower())
            {
                case "select":
                    List<eChengKJ_Models.Shop_Table> list = new List<eChengKJ_Models.Shop_Table>();
                    //查询类型，必填(二选一)
                    switch (context.Request["operations"].ToLower())
                    {
                        case "all":
                            list = shopBLL.GetShopTableAll();
                            break;
                        case "con":
                            //带入查询购物车ID
                            list=shopBLL.GetShopTableByConns("Shop_User",context.Request["con"]);
                            break;
                    }
                    DataContractJsonSerializer dcjs = new DataContractJsonSerializer(typeof(List<eChengKJ_Models.Shop_Table>));
                    dcjs.WriteObject(context.Response.OutputStream,list);
                    return;
                case "insert":
                    n = shopBLL.Insert_ShopTableData(obj);
                    break;
                case "update":
                    n = shopBLL.Update_ShopTableData(obj);
                    break;
                case "delete":
                    n = shopBLL.Delete_ShopTableData(context.Request["id"]);
                    break;
            }
            if (n>0)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
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