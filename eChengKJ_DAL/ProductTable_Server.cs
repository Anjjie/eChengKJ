using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using eChengKJ_Models;
using eChengKJ_IDAL;

namespace eChengKJ_DAL
{
    /// <summary>
    /// 数据访问:产品表
    /// </summary>
    public class ProductTable_Server : IProductTable_Server
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

        #region 获取全部的产品
        /// <summary>
        /// 获取全部的产品
        /// </summary>
        /// <returns></returns>
        public List<Product_Table> GetProductTableAll()
        {
            List<Product_Table> list = new List<Product_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Product_Table obj = new Product_Table()
                {
                    E_id = Convert.ToInt32(dr["E_id"]),
                    HP_id =Convert.ToInt32( dr["HP_id"]),
                    NP_id = Convert.ToInt32(dr["NP_id"]),
                    PT_id = Convert.ToInt32(dr["PT_id"]),
                    P_Company = dr["P_Company"].ToString(),
                    P_Date = Convert.ToDateTime(dr["P_Date"]),
                    P_id = Convert.ToInt32(dr["P_id"]),
                    P_Name = dr["P_Name"].ToString(),
                    P_No = dr["P_No"].ToString(),
                    P_Price = Convert.ToDouble(dr["P_Price"])
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询产品信息
        /// <summary>
        /// 根据ID查询产品信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Product_Table GetProductTableByConn(string con)
        {
            Product_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Product_Table where P_id=@P_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@P_id",con)
                 });
            if (dr.Read())
            {
                obj = new Product_Table()
                {
                    E_id = Convert.ToInt32(dr["E_id"]),
                    HP_id = Convert.ToInt32(dr["HP_id"]),
                    NP_id = Convert.ToInt32(dr["NP_id"]),
                    PT_id = Convert.ToInt32(dr["PT_id"]),
                    P_Company = dr["P_Company"].ToString(),
                    P_Date = Convert.ToDateTime(dr["P_Date"]),
                    P_id = Convert.ToInt32(dr["P_id"]),
                    P_Name = dr["P_Name"].ToString(),
                    P_No = dr["P_No"].ToString(),
                    P_Price = Convert.ToDouble(dr["P_Price"])
                };
            }
            return obj;
        }
        #endregion

        #region 添加产品
        /// <summary>
        /// 添加产品
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_ProductTableData(Product_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@E_id",obj.E_id),
                    new SqlParameter("@HP_id",obj.HP_id),
                    new SqlParameter("@NP_id",obj.NP_id),
                    new SqlParameter("@PT_id",obj.PT_id),
                    new SqlParameter("@P_Company",obj.P_Company),
                    new SqlParameter("@P_Date",obj.P_Date),
                    new SqlParameter("@P_Name",obj.P_Name),
                    new SqlParameter("@P_No",obj.P_No),
                    new SqlParameter("@P_Price",obj.P_Price)
                });
        }
        #endregion

        #region 更改产品
        /// <summary>
        /// 更改产品
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_ProductTableData(Product_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                    new SqlParameter("@E_id",obj.E_id),
                    new SqlParameter("@HP_id",obj.HP_id),
                    new SqlParameter("@NP_id",obj.NP_id),
                    new SqlParameter("@PT_id",obj.PT_id),
                    new SqlParameter("@P_Company",obj.P_Company),
                    new SqlParameter("@P_Date",obj.P_Date),
                    new SqlParameter("@P_id",obj.P_id),
                    new SqlParameter("@P_Name",obj.P_Name),
                    new SqlParameter("@P_No",obj.P_No),
                    new SqlParameter("@P_Price",obj.P_Price)
                 });
        }
        #endregion

        #region 移除产品
        /// <summary>
        /// 移除产品
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_ProductTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@P_id",con)
                 });
        }
        #endregion

    }
}
