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
    /// 数据访问:产品试用申请试用申请表
    /// </summary>
    public class ProductTryOurTable_Server : IProductTryOurTable_Server
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

        #region 获取全部的产品试用申请
        /// <summary>
        /// 获取全部的产品试用申请
        /// </summary>
        /// <returns></returns>
        public List<ProductTryOur_Table> GetProductTryOurTableAll()
        {
            List<ProductTryOur_Table> list = new List<ProductTryOur_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                ProductTryOur_Table obj = new ProductTryOur_Table()
                {
                    E_id = Convert.ToInt32(dr["E_id"]),
                    PTO_Activate = Convert.ToInt32(dr["PTO_Activate"]),
                    PTO_ApplyFor = Convert.ToDateTime(dr["PTO_ApplyFor"]),
                    PTO_AuditDate = Convert.ToDateTime(dr["PTO_AuditDate"]),
                    PTO_ExpireDate = Convert.ToDateTime(dr["PTO_ExpireDate"]),
                    PTO_id = Convert.ToInt32(dr["PTO_id"]),
                    TO_id = Convert.ToInt32(dr["TO_id"]),
                    PTO_Remark = dr["PTO_Remark"].ToString(),
                    PTO_Name = dr["TO_id"].ToString(),
                    U_id = Convert.ToInt32(dr["U_id"])
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询产品试用申请信息
        /// <summary>
        /// 根据ID查询产品试用申请信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public ProductTryOur_Table GetProductTryOurTableByConn(string con)
        {
            ProductTryOur_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from ProductTryOur_Table where PTO_id=@PTO_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@PTO_id",con)
                 });
            if (dr.Read())
            {
                obj = new ProductTryOur_Table()
                {
                    E_id = Convert.ToInt32(dr["E_id"]),
                    PTO_Activate = Convert.ToInt32(dr["PTO_Activate"]),
                    PTO_ApplyFor = Convert.ToDateTime(dr["PTO_ApplyFor"]),
                    PTO_AuditDate = Convert.ToDateTime(dr["PTO_AuditDate"]),
                    PTO_ExpireDate = Convert.ToDateTime(dr["PTO_ExpireDate"]),
                    PTO_id = Convert.ToInt32(dr["PTO_id"]),
                    TO_id = Convert.ToInt32(dr["TO_id"]),
                    PTO_Remark = dr["PTO_Remark"].ToString(),
                    PTO_Name = dr["TO_id"].ToString(),
                    U_id = Convert.ToInt32(dr["U_id"])
                };
            }
            return obj;
        }
        #endregion

        #region 添加产品试用申请
        /// <summary>
        /// 添加产品试用申请
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_ProductTryOurTableData(ProductTryOur_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@E_id",obj.E_id),
                    new SqlParameter("@PTO_Activate",obj.PTO_Activate),
                    new SqlParameter("@PTO_ApplyFor",obj.PTO_ApplyFor),
                    new SqlParameter("@PTO_AuditDate",obj.PTO_AuditDate),
                    new SqlParameter("@PTO_ExpireDate",obj.PTO_ExpireDate),
                    new SqlParameter("@TO_id",obj.TO_id),
                    new SqlParameter("@PTO_Remark",obj.PTO_Remark),
                    new SqlParameter("@PTO_Name",obj.PTO_Name),
                    new SqlParameter("@U_id",obj.U_id)
                });
        }
        #endregion

        #region 更改产品试用申请
        /// <summary>
        /// 更改产品试用申请
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_ProductTryOurTableData(ProductTryOur_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                    new SqlParameter("@E_id",obj.E_id),
                    new SqlParameter("@PTO_Activate",obj.PTO_Activate),
                    new SqlParameter("@PTO_ApplyFor",obj.PTO_ApplyFor),
                    new SqlParameter("@PTO_AuditDate",obj.PTO_AuditDate),
                    new SqlParameter("@PTO_ExpireDate",obj.PTO_ExpireDate),
                    new SqlParameter("@PTO_id",obj.PTO_id),
                    new SqlParameter("@TO_id",obj.TO_id),
                    new SqlParameter("@PTO_Remark",obj.PTO_Remark),
                    new SqlParameter("@PTO_Name",obj.PTO_Name),
                    new SqlParameter("@U_id",obj.U_id)
                 });
        }
        #endregion

        #region 移除产品试用申请
        /// <summary>
        /// 移除产品试用申请
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_ProductTryOurTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@PTO_id",con)
                 });
        }
        #endregion

    }
}
