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
    /// 业务逻辑层：【新闻信息】
    /// </summary>
    public class NewsTable_BLL
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
        INewsTable_Server relevanceClass
            = (INewsTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的新闻信息
        /// <summary>
        /// 获取全部的新闻信息
        /// </summary>
        /// <returns></returns>
        public List<News_Table> GetNewsTableAll()
        {
            return relevanceClass.GetNewsTableAll();
        }
        #endregion

        #region 根据ID查询新闻信息
        /// <summary>
        /// 根据ID查询新闻信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public News_Table GetNewsTableByConn(string con)
        {
            return relevanceClass.GetNewsTableByConn(con);
        }
        #endregion

        #region 添加新闻信息
        /// <summary>
        /// 添加新闻信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_NewsTableData(News_Table obj)
        {
            return relevanceClass.Insert_NewsTableData(obj);
        }
        #endregion

        #region 更改新闻信息
        /// <summary>
        /// 更改新闻信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_NewsTableData(News_Table obj)
        {
            return relevanceClass.Update_NewsTableData(obj);
        }
        #endregion

        #region 移除新闻信息
        /// <summary>
        /// 移除新闻信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_NewsTableData(string con)
        {
            return relevanceClass.Delete_NewsTableData(con);
        }
        #endregion
    }
}
