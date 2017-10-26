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
    /// 业务逻辑层：【邮箱信息】
    /// </summary>
    public class MailTable_BLL
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
        IMailTable_Server relevanceClass
            = (IMailTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的邮箱信息
        /// <summary>
        /// 获取全部的邮箱信息
        /// </summary>
        /// <returns></returns>
        public List<Mail_Table> GetMailTableAll()
        {
            return relevanceClass.GetMailTableAll();
        }
        #endregion

        #region 根据ID查询邮箱信息
        /// <summary>
        /// 根据ID查询邮箱信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Mail_Table GetMailTableByConn(string con)
        {
            return relevanceClass.GetMailTableByConn(con);
        }
        #endregion

        #region 添加邮箱信息
        /// <summary>
        /// 添加邮箱信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_MailTableData(Mail_Table obj)
        {
            return relevanceClass.Insert_MailTableData(obj);
        }
        #endregion

        #region 更改邮箱信息
        /// <summary>
        /// 更改邮箱信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_MailTableData(Mail_Table obj)
        {
            return relevanceClass.Update_MailTableData(obj);
        }
        #endregion

        #region 移除邮箱信息
        /// <summary>
        /// 移除邮箱信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_MailTableData(string con)
        {
            return relevanceClass.Delete_MailTableData(con);
        }
        #endregion
    }
}
