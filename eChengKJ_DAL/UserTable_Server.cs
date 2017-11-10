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
    /// 数据访问:用户表
    /// </summary>
    public class UserTable_Server : IUserTable_Server
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

        #region 获取全部的用户
        /// <summary>
        /// 获取全部的用户
        /// </summary>
        /// <returns></returns>
        public List<User_Table> GetUserTableAll()
        {
            List<User_Table> list = new List<User_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                User_Table obj = new User_Table()
                {
                    IDT_id = Convert.ToInt32(dr["IDT_id"]),
                    U_ComPanyAddress = dr["U_ComPanyAddress"].ToString(),
                    U_Company = dr["U_Company"].ToString(),
                    M_id = Convert.ToInt32(dr["M_id"]),
                    U_CreateUserDate = Convert.ToDateTime(dr["U_CreateUserDate"]),
                    U_Head = dr["U_Head"].ToString(),
                    U_id = Convert.ToInt32(dr["U_id"]),
                    U_IDS = dr["U_IDS"].ToString(),
                    U_PhoneVerify = dr["U_PhoneVerify"].ToString(),
                    U_LastLoginAddress = dr["U_LastLoginAddress"].ToString(),
                    U_LastLoginDatetime = Convert.ToDateTime(dr["U_LastLoginDatetime"]),
                    U_LoginAddress = dr["U_LoginAddress"].ToString(),
                    U_LoginDatetime = Convert.ToDateTime(dr["U_LoginDatetime"]),
                    U_Sex = dr["U_Sex"].ToString(),
                    U_Name = dr["U_Name"].ToString(),
                    U_Phone = dr["U_Phone"].ToString(),
                    U_UserName = dr["U_UserName"].ToString(),
                    U_UserPwd = dr["U_UserPwd"].ToString(),
                    LS_id = Convert.ToInt32(dr["LS_id"])
                };
                list.Add(obj);
            }
            dr.Close();
            return list;
        }
        #endregion

        #region 根据ID查询试用户信息
        /// <summary>
        /// 根据条件查询用户信息
        /// </summary>
        /// <param name="con"></param>
        /// <param name="type">[id，name，phone]选其一(必填)</param>
        /// <returns></returns>
        public User_Table GetUserTableByConn(string con,string type)
        {
            string sql = "";
            User_Table obj = null;
            SqlDataReader dr = null;
            switch (type)
            {
                case "id":
                    sql = "Select * from User_Table where U_id=@U_id";
                    dr = DBHerlper.ExecuteReader(
                       sql, CommandType.Text, new SqlParameter[] {
                             new SqlParameter("@U_id",con)
                        });
                    break;
                case "name":
                    sql = "Select * from User_Table where U_UserName=@U_UserName";
                    dr = DBHerlper.ExecuteReader(
                      sql, CommandType.Text, new SqlParameter[] {
                             new SqlParameter("@U_UserName",con)
                       });
                    break;
                case "phone":
                    sql = "Select * from User_Table where U_Phone=@U_Phone";
                    dr = DBHerlper.ExecuteReader(
                      sql, CommandType.Text, new SqlParameter[] {
                             new SqlParameter("@U_Phone",con)
                       });
                    break;
            }
            if (dr.Read())
            {
                obj = new User_Table()
                {
                    U_PhoneVerify = dr["U_PhoneVerify"].ToString(),
                    IDT_id = Convert.ToInt32(dr["IDT_id"]),
                    U_ComPanyAddress = dr["U_ComPanyAddress"].ToString(),
                    U_Company = dr["U_Company"].ToString(),
                    M_id = Convert.ToInt32(dr["M_id"]),
                    U_CreateUserDate = Convert.ToDateTime(dr["U_CreateUserDate"]),
                    U_Head = dr["U_Head"].ToString(),
                    U_id = Convert.ToInt32(dr["U_id"]),
                    U_IDS = dr["U_IDS"].ToString(),
                    U_LastLoginAddress = dr["U_LastLoginAddress"].ToString(),
                    U_LastLoginDatetime = Convert.ToDateTime(dr["U_LastLoginDatetime"]),
                    U_LoginAddress = dr["U_LoginAddress"].ToString(),
                    U_LoginDatetime = Convert.ToDateTime(dr["U_LoginDatetime"]),
                    U_Sex = dr["U_Sex"].ToString(),
                    U_Name = dr["U_Name"].ToString(),
                    U_Phone = dr["U_Phone"].ToString(),
                    U_UserName = dr["U_UserName"].ToString(),
                    U_UserPwd = dr["U_UserPwd"].ToString(),
                    LS_id = Convert.ToInt32(dr["LS_id"])
                };
            }
            dr.Close();
            return obj;
        }
        #endregion

        #region 添加用户
        /// <summary>
        /// 添加用户
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_UserTableData(User_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@U_PhoneVerify",obj.U_PhoneVerify),
                    new SqlParameter("@IDT_id",obj.IDT_id),
                    new SqlParameter("@U_ComPanyAddress",obj.U_ComPanyAddress),
                    new SqlParameter("@U_Company",obj.U_Company),
                    new SqlParameter("@M_id",obj.M_id),
                    new SqlParameter("@U_CreateUserDate",obj.U_CreateUserDate),
                    new SqlParameter("@U_Head",obj.U_Head),
                    new SqlParameter("@U_IDS",obj.U_IDS),
                    new SqlParameter("@U_LastLoginAddress",obj.U_LastLoginAddress),
                    new SqlParameter("@U_LastLoginDatetime",obj.U_LastLoginDatetime),
                    new SqlParameter("@U_LoginAddress",obj.U_LoginAddress),
                    new SqlParameter("@U_LoginDatetime",obj.U_LoginDatetime),
                    new SqlParameter("@U_Sex",obj.U_Sex),
                    new SqlParameter("@U_Name",obj.U_Name),
                    new SqlParameter("@U_Phone",obj.U_Phone),
                    new SqlParameter("@U_UserName",obj.U_UserName),
                    new SqlParameter("@U_UserPwd",obj.U_UserPwd),
                    new SqlParameter("@LS_id",obj.LS_id)
                });
        }
        #endregion

        #region 更改用户
        /// <summary>
        /// 更改用户
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_UserTableData(User_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                    new SqlParameter("@U_PhoneVerify",obj.U_PhoneVerify),
                    new SqlParameter("@IDT_id",obj.IDT_id),
                    new SqlParameter("@U_ComPanyAddress",obj.U_ComPanyAddress),
                    new SqlParameter("@U_Company",obj.U_Company),
                    new SqlParameter("@M_id",obj.M_id),
                    new SqlParameter("@U_CreateUserDate",obj.U_CreateUserDate),
                    new SqlParameter("@U_Head",obj.U_Head),
                    new SqlParameter("@U_id",obj.U_id),
                    new SqlParameter("@U_IDS",obj.U_IDS),
                    new SqlParameter("@U_LastLoginAddress",obj.U_LastLoginAddress),
                    new SqlParameter("@U_LastLoginDatetime",obj.U_LastLoginDatetime),
                    new SqlParameter("@U_LoginAddress",obj.U_LoginAddress),
                    new SqlParameter("@U_LoginDatetime",obj.U_LoginDatetime),
                    new SqlParameter("@U_Sex",obj.U_Sex),
                    new SqlParameter("@U_Name",obj.U_Name),
                    new SqlParameter("@U_Phone",obj.U_Phone),
                    new SqlParameter("@U_UserName",obj.U_UserName),
                    new SqlParameter("@U_UserPwd",obj.U_UserPwd),
                    new SqlParameter("@LS_id",obj.LS_id)
                 });
        }
        #endregion

        #region 移除用户
        /// <summary>
        /// 移除用户
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_UserTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@U_id",con)
                 });
        }
        #endregion

    }
}
