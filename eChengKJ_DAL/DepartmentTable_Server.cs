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
    /// 数据访问:部门表
    /// </summary>
    public class DepartmentTable_Server : IDepartmentTable_Server
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

        #region 获取全部的部门
        /// <summary>
        /// 获取全部的部门
        /// </summary>
        /// <returns></returns>
        public List<Department_Table> GetDepartmentTableAll()
        {
            List<Department_Table> list = new List<Department_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Department_Table obj = new Department_Table();
                obj.Dep_id = Convert.ToInt32( dr["Dep_id"].ToString());
                obj.Dep_Name = dr["Dep_Name"].ToString();
                list.Add(obj);
            }
            dr.Close();
            return list;
        }
        #endregion

        #region 根据ID查询部门信息
        /// <summary>
        /// 根据ID查询部门信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Department_Table GetDepartmentTableByConn(string con)
        {
            Department_Table obj = new Department_Table();
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Department_Table where Dep_id=@Dep_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@Dep_id",con)
                 });
            if (dr.Read())
            {
                obj.Dep_id = Convert.ToInt32(dr["Dep_id"].ToString());
                obj.Dep_Name = dr["Dep_Name"].ToString();
            }
            dr.Close();
            return obj;
        }
        #endregion

        #region 添加部门
        /// <summary>
        /// 添加部门
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_DepartmentTableData(Department_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@Dep_Name",obj.Dep_Name)
                });
        }
        #endregion

        #region 更改部门
        /// <summary>
        /// 更改部门
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_DepartmentTableData(Department_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                    new SqlParameter("@Dep_Name",obj.Dep_Name),
                     new SqlParameter("@Dep_id",obj.Dep_id)
                 });
        }
        #endregion

        #region 移除部门
        /// <summary>
        /// 移除部门
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_DepartmentTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@Dep_id",con)
                 });
        } 
        #endregion

    }
}
