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
    /// 数据访问:评价表
    /// </summary>
    public class EvaluateTable_Server:IEvaluateTable_Server
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

        #region 获取全部的评价
        /// <summary>
        /// 获取全部的评价
        /// </summary>
        /// <returns></returns>
        public List<Evaluate_Table> GetEvaluateTableAll()
        {
            List<Evaluate_Table> list = new List<Evaluate_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Evaluate_Table obj = new Evaluate_Table()
                {
                    Eva_Content = dr["Eva_Content"].ToString(),
                    Eva_Datetime = Convert.ToDateTime(dr["Eva_Datetime"]),
                    Eva_id = Convert.ToInt32(dr["Eva_id"]),
                    P_id = Convert.ToInt32(dr["P_id"]),
                    U_id = Convert.ToInt32(dr["U_id"])
                };
                list.Add(obj);
            }
            dr.Close();
            return list;
        }
        #endregion

        #region 根据ID查询评价信息
        /// <summary>
        /// 根据ID查询评价信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Evaluate_Table GetEvaluateTableByConn(string con)
        {
            Evaluate_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Evaluate_Table where Eva_id=@Eva_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@Eva_id",con)
                 });
            if (dr.Read())
            {
                obj = new Evaluate_Table()
                {
                    Eva_Content = dr["Eva_Content"].ToString(),
                    Eva_Datetime = Convert.ToDateTime(dr["Eva_Datetime"]),
                    Eva_id = Convert.ToInt32(dr["Eva_id"]),
                    P_id = Convert.ToInt32(dr["P_id"]),
                    U_id = Convert.ToInt32(dr["U_id"])
                };
            }
            dr.Close();
            return obj;
        }
        #endregion

        #region 添加评价
        /// <summary>
        /// 添加评价
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_EvaluateTableData(Evaluate_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@U_id",obj.U_id),
                    new SqlParameter("@P_id",obj.P_id),
                    new SqlParameter("@Eva_Datetime",obj.Eva_Datetime),
                    new SqlParameter("@Eva_Content",obj.Eva_Content)
                });
        }
        #endregion

        #region 更改评价
        /// <summary>
        /// 更改评价
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_EvaluateTableData(Evaluate_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@U_id",obj.U_id),
                    new SqlParameter("@P_id",obj.P_id),
                    new SqlParameter("@Eva_id",obj.Eva_id),
                    new SqlParameter("@Eva_Datetime",obj.Eva_Datetime),
                    new SqlParameter("@Eva_Content",obj.Eva_Content)
                });
        }
        #endregion

        #region 移除评价
        /// <summary>
        /// 移除评价
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_EvaluateTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
               CommandType.StoredProcedure,
               new SqlParameter[] {
                    new SqlParameter("@Eva_id",con)
               });
        }
        #endregion
    }
}
