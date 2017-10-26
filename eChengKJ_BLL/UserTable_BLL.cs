using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using eChengKJ_IDAL;
using eChengKJ_DAL;
using eChengKJ_Models;

namespace eChengKJ_BLL
{
    /// <summary>
    /// 业务逻辑层：【用户信息】
    /// </summary>
    public class UserTable_BLL
    {
        #region 获取动态类名
        /// <summary>
        /// 获取动态类名
        /// </summary>
        /// <returns></returns>
        static string GetClassName()
        {
            string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
            className = className.Substring(13, className.Length - 22);
            return className;
        }
        #endregion

        #region 实例化接口
        /// <summary>
        /// 实例化接口
        /// </summary>
        IUserTable_Server relevanceClass
            = (IUserTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的用户信息
        /// <summary>
        /// 获取全部的用户信息
        /// </summary>
        /// <returns></returns>
        public List<User_Table> GetUserTableAll()
        {
            return relevanceClass.GetUserTableAll();
        }
        #endregion

        #region 根据ID查询用户信息
        /// <summary>
        /// 根据ID查询用户信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public User_Table GetUserTableByConn(string con)
        {
            return relevanceClass.GetUserTableByConn(con);
        }
        #endregion

        #region 添加用户信息
        /// <summary>
        /// 添加用户信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_UserTableData(User_Table obj)
        {
            return relevanceClass.Insert_UserTableData(obj);
        }
        #endregion

        #region 更改用户信息
        /// <summary>
        /// 更改用户信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_UserTableData(User_Table obj)
        {
            return relevanceClass.Update_UserTableData(obj);
        }
        #endregion

        #region 移除用户信息
        /// <summary>
        /// 移除用户信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_UserTableData(string con)
        {
            return relevanceClass.Delete_UserTableData(con);
        }
        #endregion
    }
}
