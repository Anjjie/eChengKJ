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
    /// 数据访问:试用审核状态表
    /// </summary>
    public class TryOutTable_Server : ITryOutTable_Server
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

        #region 获取全部的试用审核状态
        /// <summary>
        /// 获取全部的试用审核状态
        /// </summary>
        /// <returns></returns>
        public List<TryOut_Table> GetTryOutTableAll()
        {
            List<TryOut_Table> list = new List<TryOut_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                TryOut_Table obj = new TryOut_Table()
                {
                    TO_id = Convert.ToInt32(dr["TO_id"]),
                    TO_Name = dr["TO_Name"].ToString()
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询试用审核状态信息
        /// <summary>
        /// 根据ID查询试用审核状态信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public TryOut_Table GetTryOutTableByConn(string con)
        {
            TryOut_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from TryOut_Table where HP_id=@HP_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@HP_id",con)
                 });
            if (dr.Read())
            {
                obj = new TryOut_Table()
                {
                    TO_id = Convert.ToInt32(dr["TO_id"]),
                    TO_Name = dr["TO_Name"].ToString()
                };
            }
            return obj;
        }
        #endregion

        #region 添加试用审核状态
        /// <summary>
        /// 添加试用审核状态
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_TryOutTableData(TryOut_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@TO_Name",obj.TO_Name)
                });
        }
        #endregion

        #region 更改试用审核状态
        /// <summary>
        /// 更改试用审核状态
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_TryOutTableData(TryOut_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                      new SqlParameter("@TO_id",obj.TO_id),
                    new SqlParameter("@TO_Name",obj.TO_Name)
                 });
        }
        #endregion

        #region 移除试用审核状态
        /// <summary>
        /// 移除试用审核状态
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_TryOutTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@TO_id",con)
                 });
        }
        #endregion

    }
}
