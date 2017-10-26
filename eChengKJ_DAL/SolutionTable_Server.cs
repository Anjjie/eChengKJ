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
    /// 数据访问:解决方案表
    /// </summary>
    public class SolutionTable_Server : ISolutionTable_Server
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

        #region 获取全部的解决方案
        /// <summary>
        /// 获取全部的解决方案
        /// </summary>
        /// <returns></returns>
        public List<Solution_Table> GetSolutionTableAll()
        {
            List<Solution_Table> list = new List<Solution_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Solution_Table obj = new Solution_Table()
                {
                    P_id = Convert.ToInt32(dr["P_id"]),
                    S_Content = dr["S_Content"].ToString(),
                    S_Datetime = Convert.ToDateTime(dr["S_Datetime"]),
                    S_id = Convert.ToInt32(dr["S_id"]),
                    S_tatle = dr["S_tatle"].ToString()
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询解决方案信息
        /// <summary>
        /// 根据ID查询解决方案信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Solution_Table GetSolutionTableByConn(string con)
        {
            Solution_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Solution_Table where HP_id=@HP_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@HP_id",con)
                 });
            if (dr.Read())
            {
                obj = new Solution_Table()
                {
                    P_id = Convert.ToInt32(dr["P_id"]),
                    S_Content = dr["S_Content"].ToString(),
                    S_Datetime = Convert.ToDateTime(dr["S_Datetime"]),
                    S_id = Convert.ToInt32(dr["S_id"]),
                    S_tatle = dr["S_tatle"].ToString()
                };
            }
            return obj;
        }
        #endregion

        #region 添加解决方案
        /// <summary>
        /// 添加解决方案
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_SolutionTableData(Solution_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@P_id",obj.P_id),
                    new SqlParameter("@S_Content",obj.S_Content),
                    new SqlParameter("@S_Datetime",obj.S_Datetime),
                    new SqlParameter("@S_tatle",obj.S_tatle)
                });
        }
        #endregion

        #region 更改解决方案
        /// <summary>
        /// 更改解决方案
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_SolutionTableData(Solution_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@P_id",obj.P_id),
                    new SqlParameter("@S_Content",obj.S_Content),
                    new SqlParameter("@S_Datetime",obj.S_Datetime),
                    new SqlParameter("@S_id",obj.S_id),
                    new SqlParameter("@S_tatle",obj.S_tatle)
                 });
        }
        #endregion

        #region 移除解决方案
        /// <summary>
        /// 移除解决方案
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_SolutionTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@S_id",con)
                 });
        }
        #endregion

    }
}
