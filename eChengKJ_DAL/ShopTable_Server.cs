using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_IDAL;
using eChengKJ_Models;
using System.Data.SqlClient;
using System.Data;

namespace eChengKJ_DAL
{
    /// <summary>
    /// 数据访问：购物车
    /// </summary>
    public class ShopTable_Server : IShopTable_Server
    {

        #region 获取SQL存储过程（固定）
        /// <summary>
        /// 获取SQL存储过程（固定）
        /// </summary>
        /// <param name="content">[select,insert,update,delete]选其一</param>
        /// <returns>返回SQL存储过程</returns>
        private string GetSqlString(string content)
        {
            string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
            className = className.Substring(13, className.Length - 25);
            string returnContene = "";
            switch (content.ToLower())
            {
                case "select":
                    returnContene = "Select_" + className + "Table"; break;
                case "insert":
                    returnContene = "Insert_" + className + "Table"; break;
                case "update":
                    returnContene = "Update_" + className + "Table"; break;
                case "delete":
                    returnContene = "Delete_" + className + "Table"; break;
            }
            return returnContene;
        }
        #endregion

        #region 获取全部的购物车
        /// <summary>
        /// 获取全部的购物车
        /// </summary>
        /// <returns></returns>
        public List<Shop_Table> GetShopTableAll()
        {
            List<Shop_Table> list = new List<Shop_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Shop_Table obj = new Shop_Table()
                {
                   P_No=dr["P_No"].ToString(),
                   Shop_Date = dr["Shop_Date"].ToString(),
                   Shop_Id =Convert.ToInt32(dr["Shop_Id"]),
                   Shop_Number = dr["Shop_Number"].ToString(),
                   Shop_User = dr["Shop_User"].ToString()
                };
                list.Add(obj);
            }
            dr.Close();
            DBHerlper.CloseConn();
            return list;
        }
        #endregion

        #region 根据ID查询购物车信息
        /// <summary>
        /// 根据ID查询购物车信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Shop_Table GetShopTableByConn(string attrName, string con)
        {
            string name = "@" + attrName;
            Shop_Table obj = null;
             SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Shop_Table where " + attrName + "=" + name,
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter(name,con)
                 });
            if (dr.Read())
            {
                 obj = new Shop_Table()
                {
                    P_No = dr["P_No"].ToString(),
                    Shop_Date = dr["Shop_Date"].ToString(),
                    Shop_Id = Convert.ToInt32(dr["Shop_Id"]),
                    Shop_Number = dr["Shop_Number"].ToString(),
                    Shop_User = dr["Shop_User"].ToString()
                };
            }
            dr.Close();
            DBHerlper.CloseConn();
            return obj;
        }
        #endregion

        public List<Shop_Table> GetShopTableByConns(string attrName, string con)
        {
            string name = "@" + attrName;
            List<Shop_Table> list = new List<Shop_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(
               "Select * from Shop_Table where " + attrName + "=" + name,
                CommandType.Text, new SqlParameter[] {
                     new SqlParameter(name,con)
                });
            while (dr.Read())
            {
                Shop_Table obj = new Shop_Table()
                {
                    P_No = dr["P_No"].ToString(),
                    Shop_Date = dr["Shop_Date"].ToString(),
                    Shop_Id = Convert.ToInt32(dr["Shop_Id"]),
                    Shop_Number = dr["Shop_Number"].ToString(),
                    Shop_User = dr["Shop_User"].ToString()
                };
                list.Add(obj);
            }
            dr.Close();
            DBHerlper.CloseConn();
            return list;
        }

        #region 添加购物车
        /// <summary>
        /// 添加购物车
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_ShopTableData(Shop_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@P_No",obj.P_No),
                    new SqlParameter("@Shop_Date",obj.Shop_Date),
                    new SqlParameter("@Shop_Number",obj.Shop_Number),
                    new SqlParameter("@Shop_User",obj.Shop_User)
                });
        }
        #endregion

        #region 更改购物车
        /// <summary>
        /// 更改购物车
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_ShopTableData(Shop_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
               CommandType.StoredProcedure,
               new SqlParameter[] {
                    new SqlParameter("@P_No",obj.P_No),
                    new SqlParameter("@Shop_Date",obj.Shop_Date),
                    new SqlParameter("@Shop_Id",obj.Shop_Id),
                    new SqlParameter("@Shop_Number",obj.Shop_Number),
                    new SqlParameter("@Shop_User",obj.Shop_User)
               });
        }
        #endregion

        #region 移除购物车
        /// <summary>
        /// 移除购物车
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_ShopTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
              CommandType.StoredProcedure,
              new SqlParameter[] {
                  new SqlParameter("@Shop_Id",con)
              });
        }

       
        #endregion


    }
}
