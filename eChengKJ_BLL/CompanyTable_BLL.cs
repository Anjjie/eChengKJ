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
    /// 业务逻辑层：【公司信息信息】
    /// </summary>
    public class CompanyTable_BLL
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
        ICompanyTable_Server relevanceClass
            = (ICompanyTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的公司信息
        /// <summary>
        /// 获取全部的公司信息
        /// </summary>
        /// <returns></returns>
        public List<Company_Table> GetCompanyTableAll()
        {
           return relevanceClass.GetCompanyTableAll();
        }
        #endregion

        #region 根据ID查询公司信息
        /// <summary>
        /// 根据ID查询公司信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Company_Table GetCompanyTableByConn(string con)
        {
            return relevanceClass.GetCompanyTableByConn(con);
        }
        #endregion

        #region 添加公司信息
        /// <summary>
        /// 添加公司信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_CompanyTableData(Company_Table obj)
        {
            return relevanceClass.Insert_CompanyTableData(obj);
        }
        #endregion

        #region 更改公司信息
        /// <summary>
        /// 更改公司信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_CompanyTableData(Company_Table obj)
        {
            return relevanceClass.Update_CompanyTableData(obj);
        }
        #endregion

        #region 移除公司信息
        /// <summary>
        /// 移除公司信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_CompanyTableData(string con)
        {
            return relevanceClass.Delete_CompanyTableData(con);
        }
        #endregion
    }
}
