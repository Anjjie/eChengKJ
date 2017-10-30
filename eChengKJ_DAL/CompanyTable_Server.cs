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
    /// 数据访问:公司信息表
    /// </summary>
    public class CompanyTable_Server:ICompanyTable_Server
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
            className = className.Substring(13, className.Length-25);
            string returnContene = "";
            switch (content.ToLower())
            {
                case "select":
                    returnContene = "Select_"+ className + "Table"; break;
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

        #region 获取全部的公司信息
        /// <summary>
        /// 获取全部的公司信息
        /// </summary>
        /// <returns></returns>
        public List<Company_Table> GetCompanyTableAll()
        {
            List<Company_Table> list = new List<Company_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Company_Table obj = new Company_Table();
                obj.Com_Scope = dr["Com_Scope"].ToString();
                obj.Com_Course  = dr["Com_Course"].ToString();
                obj.Com_Honer  = dr["Com_Course"].ToString();
                obj.Com_id = Convert.ToInt32(dr["Com_Course"]);
                obj.Com_Introduce = dr["Com_Course"].ToString();
                obj.Com_Logo = (byte[])(dr["Com_Course"]);
                obj.Com_Name = dr["Com_Course"].ToString();
                obj.Com_Purpose = dr["Com_Course"].ToString();
                obj.Com_Scale = dr["Com_Course"].ToString();
                list.Add(obj);
            }
            dr.Close();
            return list;
        }
        #endregion

        #region 根据ID查询公司信息
        /// <summary>
        /// 根据ID查询公司信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Company_Table GetCompanyTableByConn(string con)
        {
            Company_Table obj = new Company_Table();
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Company_Table where Com_id=@Com_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@Com_id",con)
                 });
            if (dr.Read())
            {
                obj.Com_Scope = dr["Com_Scope"].ToString();
                obj.Com_Course = dr["Com_Course"].ToString();
                obj.Com_Honer = dr["Com_Course"].ToString();
                obj.Com_id = Convert.ToInt32(dr["Com_Course"]);
                obj.Com_Introduce = dr["Com_Course"].ToString();
                obj.Com_Logo = (byte[])(dr["Com_Course"]);
                obj.Com_Name = dr["Com_Course"].ToString();
                obj.Com_Purpose = dr["Com_Course"].ToString();
                obj.Com_Scale = dr["Com_Course"].ToString();
            }
            dr.Close();
            return obj;
        } 
        #endregion

        #region 添加公司信息
        /// <summary>
        /// 添加公司信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_CompanyTableData(Company_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,new SqlParameter[] {
                    new SqlParameter("@Com_Scope", obj.Com_Scope),
                    new SqlParameter("@Com_Course",obj.Com_Course),
                    new SqlParameter("@Com_Honer",obj.Com_Honer),
                    new SqlParameter("@Com_Introduce",obj.Com_Introduce),
                    new SqlParameter("@Com_Logo",obj.Com_Logo),
                    new SqlParameter("@Com_Name",obj.Com_Name),
                    new SqlParameter("@Com_Purpose",obj.Com_Purpose),
                    new SqlParameter("@Com_Scale",obj.Com_Scale)
                });
        }
        #endregion

        #region 更改公司信息
        /// <summary>
        /// 更改公司信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_CompanyTableData(Company_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
               CommandType.StoredProcedure, new SqlParameter[] {
                    new SqlParameter("@Com_Scope", obj.Com_Scope),
                    new SqlParameter("@Com_Course",obj.Com_Course),
                    new SqlParameter("@Com_Honer",obj.Com_Honer),
                    new SqlParameter("@Com_id",obj.Com_id),
                    new SqlParameter("@Com_Introduce",obj.Com_Introduce),
                    new SqlParameter("@Com_Logo",obj.Com_Logo),
                    new SqlParameter("@Com_Name",obj.Com_Name),
                    new SqlParameter("@Com_Purpose",obj.Com_Purpose),
                    new SqlParameter("@Com_Scale",obj.Com_Scale)
               });
        }
        #endregion

        #region 移除公司信息
        /// <summary>
        /// 移除公司信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_CompanyTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                CommandType.StoredProcedure, new SqlParameter[] {
                    new SqlParameter("@Com_id",con)
                });
        }
        #endregion
    }
}
