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
    /// 数据访问:产品类型表
    /// </summary>
    public class ProductTypeTable_Server : IProductTypeTable_Server
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

        #region 获取全部的产品类型
        /// <summary>
        /// 获取全部的产品类型
        /// </summary>
        /// <returns></returns>
        public List<ProductType_Table> GetProductTypeTableAll()
        {
            List<ProductType_Table> list = new List<ProductType_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                ProductType_Table obj = new ProductType_Table()
                {
                    PT_id = Convert.ToInt32(dr["PT_id"]),
                    PT_Name = dr["PT_Name"].ToString()
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询产品类型信息
        /// <summary>
        /// 根据ID查询产品类型信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public ProductType_Table GetProductTypeTableByConn(string con)
        {
            ProductType_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from ProductType_Table where PT_id=@PT_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@PT_id",con)
                 });
            if (dr.Read())
            {
                obj = new ProductType_Table()
                {
                    PT_id = Convert.ToInt32(dr["PT_id"]),
                    PT_Name = dr["PT_Name"].ToString()
                };
            }
            return obj;
        }
        #endregion

        #region 添加产品类型
        /// <summary>
        /// 添加产品类型
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_ProductTypeTableData(ProductType_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@PT_Name",obj.PT_Name)
                });
        }
        #endregion

        #region 更改产品类型
        /// <summary>
        /// 更改产品类型
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_ProductTypeTableData(ProductType_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                   new SqlParameter("@PT_id",obj.PT_id),
                    new SqlParameter("@PT_Name",obj.PT_Name)
                 });
        }
        #endregion

        #region 移除产品类型
        /// <summary>
        /// 移除产品类型
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_ProductTypeTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@PT_id",con)
                 });
        }
        #endregion

    }
}
