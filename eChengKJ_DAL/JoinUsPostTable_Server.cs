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
    /// 数据访问:招聘职位表
    /// </summary>
    public class JoinUsPostTable_Server : IJoinUsPostTable_Server
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

        #region 获取全部的招聘职位
        /// <summary>
        /// 获取全部的招聘职位
        /// </summary>
        /// <returns></returns>
        public List<JoinUsPost_Table> GetJoinUsPostTableAll()
        {
            List<JoinUsPost_Table> list = new List<JoinUsPost_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                JoinUsPost_Table obj = new JoinUsPost_Table()
                {
                    JUP_id = (int)dr["JUP_id"],
                    JUP_Name = dr["JUP_Name"].ToString(),
                    JUP_Number = (int)dr["JUP_Number"]
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询招聘职位信息
        /// <summary>
        /// 根据ID查询招聘职位信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public JoinUsPost_Table GetJoinUsPostTableByConn(string con)
        {
            JoinUsPost_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from JoinUsPost_Table where HP_id=@HP_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@HP_id",con)
                 });
            if (dr.Read())
            {
                obj = new JoinUsPost_Table()
                {
                    JUP_id = (int)dr["JUP_id"],
                    JUP_Name = dr["JUP_Name"].ToString(),
                    JUP_Number = (int)dr["JUP_Number"]
                };
            }
            return obj;
        }
        #endregion

        #region 添加招聘职位
        /// <summary>
        /// 添加招聘职位
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_JoinUsPostTableData(JoinUsPost_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@JUP_Name",obj.JUP_Name),
                    new SqlParameter("@JUP_Number",obj.JUP_Number)
                });
        }
        #endregion

        #region 更改招聘职位
        /// <summary>
        /// 更改招聘职位
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_JoinUsPostTableData(JoinUsPost_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@JUP_id",obj.JUP_id),
                    new SqlParameter("@JUP_Name",obj.JUP_Name),
                    new SqlParameter("@JUP_Number",obj.JUP_Number)
                });
        }
        #endregion

        #region 移除招聘职位
        /// <summary>
        /// 移除招聘职位
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_JoinUsPostTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
               CommandType.StoredProcedure,
               new SqlParameter[] {
                    new SqlParameter("@JUP_id",con)
               });
        }
        #endregion
    }
}
