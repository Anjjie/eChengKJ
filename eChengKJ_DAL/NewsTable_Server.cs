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
    /// 数据访问:新闻表
    /// </summary>
    public class NewsTable_Server : INewsTable_Server
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

        #region 获取全部的新闻
        /// <summary>
        /// 获取全部的新闻
        /// </summary>
        /// <returns></returns>
        public List<News_Table> GetNewsTableAll()
        {
            List<News_Table> list = new List<News_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                News_Table obj = new News_Table()
                {
                    News_id = Convert.ToInt32(dr["News_id"]),
                    News_Content = dr["News_Content"].ToString(),
                    News_Date = dr["News_Date"].ToString(),
                    News_Anthor = dr["News_Anthor"].ToString(),
                    News_Name = dr["News_Name"].ToString()
                };
                list.Add(obj);
            }
            dr.Close();
            return list;
        }
        #endregion

        #region 根据ID查询新闻信息
        /// <summary>
        /// 根据ID查询新闻信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public News_Table GetNewsTableByConn(string con)
        {
            News_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from News_Table where News_id=@News_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@News_id",con)
                 });
            if (dr.Read())
            {
                obj = new News_Table()
                {
                    News_id = Convert.ToInt32(dr["News_id"]),
                    News_Content = dr["News_Content"].ToString(),
                    News_Date = dr["News_Date"].ToString(),
                    News_Anthor = dr["News_Anthor"].ToString(),
                    News_Name = dr["News_Name"].ToString()
                };
            }
            dr.Close();
            return obj;
        }
        #endregion

        #region 添加新闻
        /// <summary>
        /// 添加新闻
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_NewsTableData(News_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@News_Content",obj.News_Content),
                    new SqlParameter("@News_Date",obj.News_Date),
                    new SqlParameter("@News_Anthor",obj.News_Anthor),
                    new SqlParameter("@News_Name",obj.News_Name)
                });
        }
        #endregion

        #region 更改新闻
        /// <summary>
        /// 更改新闻
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_NewsTableData(News_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@News_id",obj.News_id),
                    new SqlParameter("@News_Content",obj.News_Content),
                    new SqlParameter("@News_Date",obj.News_Date),
                    new SqlParameter("@News_Anthor",obj.News_Anthor),
                    new SqlParameter("@News_Name",obj.News_Name)
                 });
        }
        #endregion

        #region 移除新闻
        /// <summary>
        /// 移除新闻
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_NewsTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@News_id",con)
                 });
        }
        #endregion

    }
}
