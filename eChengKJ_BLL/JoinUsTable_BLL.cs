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
    /// 业务逻辑层：【招聘信息】
    /// </summary>
    public class JoinUsTable_BLL
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
        IJoinUsTable_Server relevanceClass
            = (IJoinUsTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的招聘信息
        /// <summary>
        /// 获取全部的招聘信息
        /// </summary>
        /// <returns></returns>
        public List<JoinUs_Table> GetJoinUsTableAll()
        {
            return relevanceClass.GetJoinUsTableAll();
        }
        #endregion

        #region 根据ID查询招聘信息
        /// <summary>
        /// 根据ID查询招聘信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public JoinUs_Table GetJoinUsTableByConn(string con)
        {
            return relevanceClass.GetJoinUsTableByConn(con);
        }
        #endregion

        #region 添加招聘信息
        /// <summary>
        /// 添加招聘信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_JoinUsTableData(JoinUs_Table obj)
        {
            return relevanceClass.Insert_JoinUsTableData(obj);
        }
        #endregion

        #region 更改招聘信息
        /// <summary>
        /// 更改招聘信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_JoinUsTableData(JoinUs_Table obj)
        {
            return relevanceClass.Update_JoinUsTableData(obj);
        }
        #endregion

        #region 移除招聘信息
        /// <summary>
        /// 移除招聘信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_JoinUsTableData(string con)
        {
            return relevanceClass.Delete_JoinUsTableData(con);
        }
        #endregion
    }
}
