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
    /// 数据访问:员工表
    /// </summary>
    public class EmployeeTable_Server:IEmployeeTable_Server
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

        #region 获取全部的员工
        /// <summary>
        /// 获取全部的员工
        /// </summary>
        /// <returns></returns>
        public List<Employee_Table> GetEmployeeTableAll()
        {
            List<Employee_Table> list = new List<Employee_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Employee_Table obj = new Employee_Table() {
                     Dep_id = Convert.ToInt32(dr["Dep_id"]),
                     E_Address = dr["E_Address"].ToString(),
                     E_Date =Convert.ToDateTime( dr["E_Date"]),
                     E_Education = dr["E_Education"].ToString(),
                     E_id = Convert.ToInt32(dr["E_id"]),
                     E_IdS = dr["E_IdS"].ToString(),
                     E_LastLoginAddress = dr["E_LastLoginAddress"].ToString(),
                     E_LastLoginDate = Convert.ToDateTime(dr["E_LastLoginDate"]),
                     E_LoginAddress = dr["E_LoginAddress"].ToString(),
                     E_LoginDate = Convert.ToDateTime(dr["E_LoginDate"]),
                     E_Name = dr["E_Name"].ToString(),
                     E_Pay = Convert.ToDouble(dr["E_Pay"]),
                     E_Phone = dr["E_Phone"].ToString(),
                     E_School = dr["E_School"].ToString(),
                     E_Sex = dr["E_Sex"].ToString(),
                     E_UserName = dr["E_UserName"].ToString(),
                     E_UserPwd = dr["E_UserPwd"].ToString(),
                     IDT_id = Convert.ToInt32(dr["IDT_id"]),
                     LS_ID = Convert.ToInt32(dr["LS_ID"]),
                     Post_id = Convert.ToInt32(dr["Post_id"])
                };
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询员工信息
        /// <summary>
        /// 根据ID查询员工信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Employee_Table GetEmployeeTableByConn(string con)
        {
            Employee_Table obj = null;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Employee_Table where E_id=@E_id",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@E_id",con)
                 });
            if (dr.Read())
            {
                obj = new Employee_Table()
                {
                    Dep_id = Convert.ToInt32(dr["Dep_id"]),
                    E_Address = dr["E_Address"].ToString(),
                    E_Date = Convert.ToDateTime(dr["E_Date"]),
                    E_Education = dr["E_Education"].ToString(),
                    E_id = Convert.ToInt32(dr["E_id"]),
                    E_IdS = dr["E_IdS"].ToString(),
                    E_LastLoginAddress = dr["E_LastLoginAddress"].ToString(),
                    E_LastLoginDate = Convert.ToDateTime(dr["E_LastLoginDate"]),
                    E_LoginAddress = dr["E_LoginAddress"].ToString(),
                    E_LoginDate = Convert.ToDateTime(dr["E_LoginDate"]),
                    E_Name = dr["E_Name"].ToString(),
                    E_Pay = Convert.ToDouble(dr["E_Pay"]),
                    E_Phone = dr["E_Phone"].ToString(),
                    E_School = dr["E_School"].ToString(),
                    E_Sex = dr["E_Sex"].ToString(),
                    E_UserName = dr["E_UserName"].ToString(),
                    E_UserPwd = dr["E_UserPwd"].ToString(),
                    IDT_id = Convert.ToInt32(dr["IDT_id"]),
                    LS_ID = Convert.ToInt32(dr["LS_ID"]),
                    Post_id = Convert.ToInt32(dr["Post_id"])
                };
            }
            return obj;
        }
        #endregion

        #region 添加员工
        /// <summary>
        /// 添加员工
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_EmployeeTableData(Employee_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@Dep_id",obj.Dep_id),
                    new SqlParameter("@E_Address",obj.E_Address),
                    new SqlParameter("@E_Date",obj.E_Date),
                    new SqlParameter("@E_Education",obj.E_Education),
                    new SqlParameter("@E_IdS",obj.E_IdS),
                    new SqlParameter("@E_LastLoginAddress",obj.E_LastLoginAddress),
                    new SqlParameter("@E_LastLoginDate",obj.E_LastLoginDate),
                    new SqlParameter("@E_LoginAddress",obj.E_LoginAddress),
                    new SqlParameter("@E_LoginDate",obj.E_LoginDate),
                    new SqlParameter("@E_Name",obj.E_Name),
                    new SqlParameter("@E_Pay",obj.E_Pay),
                    new SqlParameter("@E_Phone",obj.E_Phone),
                    new SqlParameter("@E_School",obj.E_School),
                    new SqlParameter("@E_Sex",obj.E_Sex),
                    new SqlParameter("@E_UserName",obj.E_UserName),
                    new SqlParameter("@IDT_id",obj.IDT_id),
                    new SqlParameter("@LS_ID",obj.LS_ID),
                    new SqlParameter("@Post_id",obj.Post_id),
                    new SqlParameter("@E_UserPwd",obj.E_UserPwd)
                });
        }
        #endregion

        #region 更改员工
        /// <summary>
        /// 更改员工
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_EmployeeTableData(Employee_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
               CommandType.StoredProcedure,
               new SqlParameter[] {
                    new SqlParameter("@E_id",obj.E_id),
                    new SqlParameter("@Dep_id",obj.Dep_id),
                    new SqlParameter("@E_Address",obj.E_Address),
                    new SqlParameter("@E_Date",obj.E_Date),
                    new SqlParameter("@E_Education",obj.E_Education),
                    new SqlParameter("@E_IdS",obj.E_IdS),
                    new SqlParameter("@E_LastLoginAddress",obj.E_LastLoginAddress),
                    new SqlParameter("@E_LastLoginDate",obj.E_LastLoginDate),
                    new SqlParameter("@E_LoginAddress",obj.E_LoginAddress),
                    new SqlParameter("@E_LoginDate",obj.E_LoginDate),
                    new SqlParameter("@E_Name",obj.E_Name),
                    new SqlParameter("@E_Pay",obj.E_Pay),
                    new SqlParameter("@E_Phone",obj.E_Phone),
                    new SqlParameter("@E_School",obj.E_School),
                    new SqlParameter("@E_Sex",obj.E_Sex),
                    new SqlParameter("@E_UserName",obj.E_UserName),
                    new SqlParameter("@IDT_id",obj.IDT_id),
                    new SqlParameter("@LS_ID",obj.LS_ID),
                    new SqlParameter("@Post_id",obj.Post_id),
                    new SqlParameter("@E_UserPwd",obj.E_UserPwd)
               });
        }
        #endregion

        #region 移除员工
        /// <summary>
        /// 移除员工
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_EmployeeTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
              CommandType.StoredProcedure,
              new SqlParameter[] {
                    new SqlParameter("@E_id",con)
              });
       }
        #endregion
    }
}
