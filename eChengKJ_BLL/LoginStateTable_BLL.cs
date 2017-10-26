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
    /// 业务逻辑层：【登录状态信息】
    /// </summary>
    public class LoginStateTable_BLL
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
        ILoginStateTable_Server relevanceClass
            = (ILoginStateTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的登录状态信息
        /// <summary>
        /// 获取全部的登录状态信息
        /// </summary>
        /// <returns></returns>
        public List<LoginState_Table> GetLoginStateTableAll()
        {
            return relevanceClass.GetLoginStateTableAll();
        }
        #endregion

        #region 根据ID查询登录状态信息
        /// <summary>
        /// 根据ID查询登录状态信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public LoginState_Table GetLoginStateTableByConn(string con)
        {
            return relevanceClass.GetLoginStateTableByConn(con);
        }
        #endregion

        #region 添加登录状态信息
        /// <summary>
        /// 添加登录状态信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_LoginStateTableData(LoginState_Table obj)
        {
            return relevanceClass.Insert_LoginStateTableData(obj);
        }
        #endregion

        #region 更改登录状态信息
        /// <summary>
        /// 更改登录状态信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_LoginStateTableData(LoginState_Table obj)
        {
            return relevanceClass.Update_LoginStateTableData(obj);
        }
        #endregion

        #region 移除登录状态信息
        /// <summary>
        /// 移除登录状态信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_LoginStateTableData(string con)
        {
            return relevanceClass.Delete_LoginStateTableData(con);
        }
        #endregion
    }
}
