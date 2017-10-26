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
    /// 业务逻辑层：【密保信息】
    /// </summary>
    public class IssueAnswerTable_BLL
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
        IIssueAnswerTable_Server relevanceClass
            = (IIssueAnswerTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的密保信息
        /// <summary>
        /// 获取全部的密保信息
        /// </summary>
        /// <returns></returns>
        public List<IssueAnswer_Table> GetIssueAnswerTableAll()
        {
            return relevanceClass.GetIssueAnswerTableAll();
        }
        #endregion

        #region 根据ID查询密保信息
        /// <summary>
        /// 根据ID查询密保信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public IssueAnswer_Table GetIssueAnswerTableByConn(string con)
        {
            return relevanceClass.GetIssueAnswerTableByConn(con);
        }
        #endregion

        #region 添加密保信息
        /// <summary>
        /// 添加密保信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_IssueAnswerTableData(IssueAnswer_Table obj)
        {
            return relevanceClass.Insert_IssueAnswerTableData(obj);
        }
        #endregion

        #region 更改密保信息
        /// <summary>
        /// 更改密保信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_IssueAnswerTableData(IssueAnswer_Table obj)
        {
            return relevanceClass.Update_IssueAnswerTableData(obj);
        }
        #endregion

        #region 移除密保信息
        /// <summary>
        /// 移除密保信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_IssueAnswerTableData(string con)
        {
            return relevanceClass.Delete_IssueAnswerTableData(con);
        }
        #endregion
    }
}
