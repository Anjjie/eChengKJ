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
    /// 业务逻辑层：【试用审核状态信息】
    /// </summary>
    public class TryOutTable_BLL
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
        ITryOutTable_Server relevanceClass
            = (ITryOutTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的试用审核状态信息
        /// <summary>
        /// 获取全部的试用审核状态信息
        /// </summary>
        /// <returns></returns>
        public List<TryOut_Table> GetTryOutTableAll()
        {
            return relevanceClass.GetTryOutTableAll();
        }
        #endregion

        #region 根据ID查询试用审核状态信息
        /// <summary>
        /// 根据ID查询试用审核状态信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public TryOut_Table GetTryOutTableByConn(string con)
        {
            return relevanceClass.GetTryOutTableByConn(con);
        }
        #endregion

        #region 添加试用审核状态信息
        /// <summary>
        /// 添加试用审核状态信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_TryOutTableData(TryOut_Table obj)
        {
            return relevanceClass.Insert_TryOutTableData(obj);
        }
        #endregion

        #region 更改试用审核状态信息
        /// <summary>
        /// 更改试用审核状态信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_TryOutTableData(TryOut_Table obj)
        {
            return relevanceClass.Update_TryOutTableData(obj);
        }
        #endregion

        #region 移除试用审核状态信息
        /// <summary>
        /// 移除试用审核状态信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_TryOutTableData(string con)
        {
            return relevanceClass.Delete_TryOutTableData(con);
        }
        #endregion
    }
}
