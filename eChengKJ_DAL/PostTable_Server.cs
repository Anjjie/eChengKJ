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
    /// 数据访问:职位表
    /// </summary>
    public class PostTable_Server : IPostTable_Server
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

        #region 获取全部的职位
        /// <summary>
        /// 获取全部的职位
        /// </summary>
        /// <returns></returns>
        public List<Post_Table> GetPostTableAll()
        {
            List<Post_Table> list = new List<Post_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Post_Table obj = new Post_Table()
                {
                    Post_id = Convert.ToInt32(dr["Post_id"]),
                    Post_Name =dr["Post_Name"].ToString()
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询职位信息
        /// <summary>
        /// 根据ID查询职位信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Post_Table GetPostTableByConn(string con)
        {
            Post_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Post_Table where Post_id=@Post_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@Post_id",con)
                 });
            if (dr.Read())
            {
                obj = new Post_Table()
                {
                    Post_id = Convert.ToInt32(dr["Post_id"]),
                    Post_Name = dr["Post_Name"].ToString()
                };
            }
            return obj;
        }
        #endregion

        #region 添加职位
        /// <summary>
        /// 添加职位
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_PostTableData(Post_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@Post_Name",obj.Post_Name)
                });
        }
        #endregion

        #region 更改职位
        /// <summary>
        /// 更改职位
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_PostTableData(Post_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@Post_id",obj.Post_id),
                    new SqlParameter("@Post_Name",obj.Post_Name)
                 });
        }
        #endregion

        #region 移除职位
        /// <summary>
        /// 移除职位
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_PostTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@Post_id",con)
                 });
        }
        #endregion

    }
}
