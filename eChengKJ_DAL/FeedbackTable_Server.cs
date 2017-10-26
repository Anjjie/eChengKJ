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
    /// 数据访问:反馈表
    /// </summary>
    public class FeedbackTable_Server : IFeedbackTable_Server
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

        #region 获取全部的反馈
        /// <summary>
        /// 获取全部的反馈
        /// </summary>
        /// <returns></returns>
        public List<Feedback_Table> GetFeedbackTableAll()
        {
            List<Feedback_Table> list = new List<Feedback_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Feedback_Table obj = new Feedback_Table()
                {
                    Feed_Content = dr["Feed_Content"].ToString(),
                    Feed_Datetime = Convert.ToDateTime(dr["Feed_Datetime"]),
                    Feed_id = Convert.ToInt32(dr["Feed_id"]),
                    P_id = Convert.ToInt32(dr["P_id"]),
                    U_id = Convert.ToInt32(dr["U_id"])
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询反馈信息
        /// <summary>
        /// 根据ID查询反馈信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Feedback_Table GetFeedbackTableByConn(string con)
        {
            Feedback_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Feedback_Table where Feed_id=@Feed_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@Feed_id",con)
                 });
            if (dr.Read())
            {
                obj = new Feedback_Table()
                {
                    Feed_Content = dr["Feed_Content"].ToString(),
                    Feed_Datetime = Convert.ToDateTime(dr["Feed_Datetime"]),
                    Feed_id = Convert.ToInt32(dr["Feed_id"]),
                    P_id = Convert.ToInt32(dr["P_id"]),
                    U_id = Convert.ToInt32(dr["U_id"])
                };
            }
            return obj;
        }
        #endregion

        #region 添加反馈
        /// <summary>
        /// 添加反馈
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_FeedbackTableData(Feedback_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@U_id",obj.U_id),
                    new SqlParameter("@P_id",obj.P_id),
                    new SqlParameter("@Feed_Datetime",obj. Feed_Datetime),
                    new SqlParameter("@Feed_Content",obj. Feed_Content)
                });
        }
        #endregion

        #region 更改反馈
        /// <summary>
        /// 更改反馈
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_FeedbackTableData(Feedback_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@U_id",obj.U_id),
                    new SqlParameter("@P_id",obj.P_id),
                    new SqlParameter("@Feed_id",obj.Feed_id),
                    new SqlParameter("@Feed_Datetime",obj.Feed_Datetime),
                    new SqlParameter("@Feed_Content",obj.Feed_Content)
                });
        }
        #endregion

        #region 移除反馈
        /// <summary>
        /// 移除反馈
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_FeedbackTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
               CommandType.StoredProcedure,
               new SqlParameter[] {
                    new SqlParameter("@Feed_id",con)
               });
        }
        #endregion
    }
}
