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
    /// 数据访问:邮箱表
    /// </summary>
    public class MailTable_Server : IMailTable_Server
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

        #region 获取全部的邮箱
        /// <summary>
        /// 获取全部的邮箱
        /// </summary>
        /// <returns></returns>
        public List<Mail_Table> GetMailTableAll()
        {
            List<Mail_Table> list = new List<Mail_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Mail_Table obj = new Mail_Table()
                {
                    M_id = Convert.ToInt32(dr["M_id"]),
                    M_Mail = dr["M_Mail"].ToString(),
                    M_YesNo = dr["M_YesNo"].ToString()
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询邮箱信息
        /// <summary>
        /// 根据ID查询邮箱信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Mail_Table GetMailTableByConn(string con)
        {
            Mail_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Mail_Table where M_id=@M_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@M_id",con)
                 });
            if (dr.Read())
            {
                obj = new Mail_Table()
                {
                    M_id = Convert.ToInt32(dr["M_id"]),
                    M_Mail = dr["M_Mail"].ToString(),
                    M_YesNo = dr["M_YesNo"].ToString()
                };
            }
            return obj;
        }
        #endregion

        #region 添加邮箱
        /// <summary>
        /// 添加邮箱
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_MailTableData(Mail_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@M_Mail",obj.M_Mail),
                    new SqlParameter("@M_YesNo",obj.M_YesNo)
                });
        }
        #endregion

        #region 更改邮箱
        /// <summary>
        /// 更改邮箱
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_MailTableData(Mail_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                   new SqlParameter("@M_id",obj.M_id),
                    new SqlParameter("@M_Mail",obj.M_Mail),
                    new SqlParameter("@M_YesNo",obj.M_YesNo)
                 });
        }
        #endregion

        #region 移除邮箱
        /// <summary>
        /// 移除邮箱
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_MailTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@M_id",con)
                 });
        }
        #endregion

    }
}
