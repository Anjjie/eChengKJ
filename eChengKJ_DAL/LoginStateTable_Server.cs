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
    /// 数据访问:登录状态表
    /// </summary>
    public class LoginStateTable_Server : ILoginStateTable_Server
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

        #region 获取全部的登录状态
        /// <summary>
        /// 获取全部的登录状态
        /// </summary>
        /// <returns></returns>
        public List<LoginState_Table> GetLoginStateTableAll()
        {
            List<LoginState_Table> list = new List<LoginState_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                LoginState_Table obj = new LoginState_Table()
                {
                    LS_id = Convert.ToInt32(dr["LS_id"]),
                    LS_Name = dr["LS_Name"].ToString()
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询登录状态信息
        /// <summary>
        /// 根据ID查询登录状态信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public LoginState_Table GetLoginStateTableByConn(string con)
        {
            LoginState_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from LoginState_Table where LS_id=@LS_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@LS_id",con)
                 });
            if (dr.Read())
            {
                obj = new LoginState_Table()
                {
                    LS_id = Convert.ToInt32(dr["LS_id"]),
                    LS_Name = dr["LS_Name"].ToString()
                };
            }
            return obj;
        }
        #endregion

        #region 添加登录状态
        /// <summary>
        /// 添加登录状态
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_LoginStateTableData(LoginState_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@LS_Name",obj.LS_Name)  
                });
        }
        #endregion

        #region 更改登录状态
        /// <summary>
        /// 更改登录状态
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_LoginStateTableData(LoginState_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                    new SqlParameter("@LS_id",obj.LS_id),
                    new SqlParameter("@LS_Name",obj.LS_Name)
                 });
        }
        #endregion

        #region 移除登录状态
        /// <summary>
        /// 移除登录状态
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_LoginStateTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@LS_id",con)
                 });
        }
        #endregion

    }
}
