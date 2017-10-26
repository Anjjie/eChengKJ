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
    /// 数据访问:招聘表
    /// </summary>
    public class JoinUsTable_Server : IJoinUsTable_Server
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

        #region 获取全部的招聘
        /// <summary>
        /// 获取全部的招聘
        /// </summary>
        /// <returns></returns>
        public List<JoinUs_Table> GetJoinUsTableAll()
        {
            List<JoinUs_Table> list = new List<JoinUs_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                JoinUs_Table obj = new JoinUs_Table()
                {
                    JUP_id = Convert.ToInt32(dr["JUP_id"]),
                    JU_id = Convert.ToInt32(dr["JU_id"]),
                    JU_Name = dr["JU_Name"].ToString(),
                    JU_Phone = dr["JU_Phone"].ToString(),
                    JU_Sex = dr["JU_Sex"].ToString()
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
        public JoinUs_Table GetJoinUsTableByConn(string con)
        {
            JoinUs_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from JoinUs_Table where HP_id=@HP_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@HP_id",con)
                 });
            if (dr.Read())
            {
                obj = new JoinUs_Table()
                {
                    JUP_id = Convert.ToInt32(dr["JUP_id"]),
                    JU_id = Convert.ToInt32(dr["JU_id"]),
                    JU_Name = dr["JU_Name"].ToString(),
                    JU_Phone = dr["JU_Phone"].ToString(),
                    JU_Sex = dr["JU_Sex"].ToString()
                };
            }
            return obj;
        }
        #endregion

        #region 添加招聘
        /// <summary>
        /// 添加招聘
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_JoinUsTableData(JoinUs_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@JUP_id",obj.JUP_id),
                    new SqlParameter("@JU_Name",obj.JU_Name),
                    new SqlParameter("@JU_Phone",obj.JU_Phone),
                    new SqlParameter("@JU_Sex",obj.JU_Sex)
                });
        }
        #endregion

        #region 更改招聘
        /// <summary>
        /// 更改招聘
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_JoinUsTableData(JoinUs_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                    new SqlParameter("@JUP_id",obj.JUP_id),
                    new SqlParameter("@JU_id",obj.JU_id),
                    new SqlParameter("@JU_Name",obj.JU_Name),
                    new SqlParameter("@JU_Phone",obj.JU_Phone),
                    new SqlParameter("@JU_Sex",obj.JU_Sex)
                 });
        }
        #endregion

        #region 移除招聘
        /// <summary>
        /// 移除招聘
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_JoinUsTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@JU_id",con)
                 });
        }
        #endregion

    }
}
