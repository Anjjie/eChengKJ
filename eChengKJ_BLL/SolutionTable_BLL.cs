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
    /// 业务逻辑层：【解决方案信息】
    /// </summary>
    public class SolutionTable_BLL
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
        ISolutionTable_Server relevanceClass
            = (ISolutionTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的解决方案信息
        /// <summary>
        /// 获取全部的解决方案信息
        /// </summary>
        /// <returns></returns>
        public List<Solution_Table> GetSolutionTableAll()
        {
            return relevanceClass.GetSolutionTableAll();
        }
        #endregion

        #region 根据ID查询解决方案信息
        /// <summary>
        /// 根据ID查询解决方案信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Solution_Table GetSolutionTableByConn(string con)
        {
            return relevanceClass.GetSolutionTableByConn(con);
        }
        #endregion

        #region 添加解决方案信息
        /// <summary>
        /// 添加解决方案信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_SolutionTableData(Solution_Table obj)
        {
            return relevanceClass.Insert_SolutionTableData(obj);
        }
        #endregion

        #region 更改解决方案信息
        /// <summary>
        /// 更改解决方案信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_SolutionTableData(Solution_Table obj)
        {
            return relevanceClass.Update_SolutionTableData(obj);
        }
        #endregion

        #region 移除解决方案信息
        /// <summary>
        /// 移除解决方案信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_SolutionTableData(string con)
        {
            return relevanceClass.Delete_SolutionTableData(con);
        }
        #endregion
    }
}
