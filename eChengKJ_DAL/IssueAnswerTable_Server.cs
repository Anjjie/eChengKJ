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
    /// 数据访问:密保表
    /// </summary>
    public class IssueAnswerTable_Server : IIssueAnswerTable_Server
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

        #region 获取全部的密保
        /// <summary>
        /// 获取全部的密保
        /// </summary>
        /// <returns></returns>
        public List<IssueAnswer_Table> GetIssueAnswerTableAll()
        {
            List<IssueAnswer_Table> list = new List<IssueAnswer_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                IssueAnswer_Table obj = new IssueAnswer_Table()
                {
                    IA_Answer1 = dr["IA_Answer1"].ToString(),
                    IA_Answer2 = dr["IA_Answer2"].ToString(),
                    IA_Answer3 = dr["IA_Answer3"].ToString(),
                    IA_id =Convert.ToInt32( dr["IA_id"]),
                    IA_Issue1 = dr["IA_Issue1"].ToString(),
                    IA_Issue2 = dr["IA_Issue2"].ToString(),
                    IA_Issue3 = dr["IA_Issue3"].ToString(),
                    U_UserName = dr["U_UserName"].ToString()
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询密保信息
        /// <summary>
        /// 根据ID查询密保信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public IssueAnswer_Table GetIssueAnswerTableByConn(string con)
        {
            IssueAnswer_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from IssueAnswer_Table where HP_id=@HP_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@HP_id",con)
                 });
            if (dr.Read())
            {
                obj = new IssueAnswer_Table()
                {
                    IA_Answer1 = dr["IA_Answer1"].ToString(),
                    IA_Answer2 = dr["IA_Answer2"].ToString(),
                    IA_Answer3 = dr["IA_Answer3"].ToString(),
                    IA_id = Convert.ToInt32(dr["IA_id"]),
                    IA_Issue1 = dr["IA_Issue1"].ToString(),
                    IA_Issue2 = dr["IA_Issue2"].ToString(),
                    IA_Issue3 = dr["IA_Issue3"].ToString(),
                    U_UserName = dr["U_UserName"].ToString()
                };
            }
            return obj;
        }
        #endregion

        #region 添加密保
        /// <summary>
        /// 添加密保
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_IssueAnswerTableData(IssueAnswer_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@IA_Answer1",obj.IA_Answer1),
                    new SqlParameter("@IA_Answer2",obj.IA_Answer2),
                    new SqlParameter("@IA_Answer3",obj.IA_Answer3),
                    new SqlParameter("@IA_Issue1",obj.IA_Issue1),
                    new SqlParameter("@IA_Issue2",obj.IA_Issue2),
                    new SqlParameter("@IA_Issue3",obj.IA_Issue3),
                    new SqlParameter("@U_UserName",obj.U_UserName)
                });
        }
        #endregion

        #region 更改密保
        /// <summary>
        /// 更改密保
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_IssueAnswerTableData(IssueAnswer_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@IA_Answer1",obj.IA_Answer1),
                    new SqlParameter("@IA_Answer2",obj.IA_Answer2),
                    new SqlParameter("@IA_Answer3",obj.IA_Answer3),
                    new SqlParameter("@IA_id",obj.IA_id),
                    new SqlParameter("@IA_Issue1",obj.IA_Issue1),
                    new SqlParameter("@IA_Issue2",obj.IA_Issue2),
                    new SqlParameter("@IA_Issue3",obj.IA_Issue3),
                    new SqlParameter("@U_UserName",obj.U_UserName)
                });
        }
        #endregion

        #region 移除密保
        /// <summary>
        /// 移除密保
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_IssueAnswerTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
               CommandType.StoredProcedure,
               new SqlParameter[] {
                    new SqlParameter("@IA_id",con)
               });
        }
        #endregion
    }
}
