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
    /// 数据访问:证件类型表
    /// </summary>
    public class IDTypeTable_Server:IIDTypeTable_Server
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

        #region 获取全部的证件类型
        /// <summary>
        /// 获取全部的证件类型
        /// </summary>
        /// <returns></returns>
        public List<IDType_Table> GetIDTypeTableAll()
        {
            List<IDType_Table> list = new List<IDType_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                IDType_Table obj = new IDType_Table()
                {
                    IDT_Name = dr["IDT_Name"].ToString(),
                    IDT_id = Convert.ToInt32(dr["IDT_id"])
                };
                list.Add(obj);
            }
            dr.Close();
            DBHerlper.CloseConn();
            return list;
        }
        #endregion

        #region 根据ID查询证件类型信息
        /// <summary>
        /// 根据ID查询证件类型信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public IDType_Table GetIDTypeTableByConn(string con)
        {
            IDType_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from IDType_Table where IDT_id=@IDT_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@IDT_id",con)
                 });
            if (dr.Read())
            {
                obj = new IDType_Table()
                {
                    IDT_Name = dr["IDT_Name"].ToString(),
                    IDT_id = Convert.ToInt32(dr["IDT_id"])
                };
            }
            dr.Close();
            DBHerlper.CloseConn();
            return obj;
        }
        #endregion

        #region 添加证件类型
        /// <summary>
        /// 添加证件类型
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_IDTypeTableData(IDType_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@IDT_Name",obj.IDT_Name)
                });
        }
        #endregion

        #region 更改证件类型
        /// <summary>
        /// 更改证件类型
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_IDTypeTableData(IDType_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@IDT_Name",obj.IDT_Name),
                    new SqlParameter("@IDT_id",obj.IDT_id)
                });
        }
        #endregion

        #region 移除证件类型
        /// <summary>
        /// 移除证件类型
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_IDTypeTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
               CommandType.StoredProcedure,
               new SqlParameter[] {
                    new SqlParameter("@IDT_id",con)
               });
        }
        #endregion
    }
}
