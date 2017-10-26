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
    /// 数据访问:是否热门产品表
    /// </summary>
    public class HotProductTable_Server : IHotProductTable_Server
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

        #region 获取全部的是否热门产品
        /// <summary>
        /// 获取全部的是否热门产品
        /// </summary>
        /// <returns></returns>
        public List<HotProduct_Table> GetHotProductTableAll()
        {
            List<HotProduct_Table> list = new List<HotProduct_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                HotProduct_Table obj = new HotProduct_Table()
                {
                    HP_Name = dr["HP_Name"].ToString(),
                    HP_id = Convert.ToInt32(dr["HP_id"])
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询是否热门产品信息
        /// <summary>
        /// 根据ID查询是否热门产品信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public HotProduct_Table GetHotProductTableByConn(string con)
        {
            HotProduct_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from HotProduct_Table where HP_id=@HP_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@HP_id",con)
                 });
            if (dr.Read())
            {
                obj = new HotProduct_Table()
                {
                    HP_Name = dr["HP_Name"].ToString(),
                    HP_id = Convert.ToInt32(dr["HP_id"])
                };
            }
            return obj;
        }
        #endregion

        #region 添加是否热门产品
        /// <summary>
        /// 添加是否热门产品
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_HotProductTableData(HotProduct_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@HP_Name",obj.HP_Name)
                });
        }
        #endregion

        #region 更改是否热门产品
        /// <summary>
        /// 更改是否热门产品
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_HotProductTableData(HotProduct_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@HP_Name",obj.HP_Name),
                    new SqlParameter("@HP_id",obj.HP_id)
                });
        }
        #endregion

        #region 移除是否热门产品
        /// <summary>
        /// 移除是否热门产品
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_HotProductTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
               CommandType.StoredProcedure,
               new SqlParameter[] {
                    new SqlParameter("@HP_id",con)
               });
        }
        #endregion
    }
}
