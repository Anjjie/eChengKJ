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
    /// 业务逻辑层：【是否新产品信息】
    /// </summary>
    public class NewProductTable_BLL
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
        INewProductTable_Server relevanceClass
            = (INewProductTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的是否新产品信息
        /// <summary>
        /// 获取全部的是否新产品信息
        /// </summary>
        /// <returns></returns>
        public List<NewProduct_Table> GetNewProductTableAll()
        {
            return relevanceClass.GetNewProductTableAll();
        }
        #endregion

        #region 根据ID查询是否新产品信息
        /// <summary>
        /// 根据ID查询是否新产品信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public NewProduct_Table GetNewProductTableByConn(string con)
        {
            return relevanceClass.GetNewProductTableByConn(con);
        }
        #endregion

        #region 添加是否新产品信息
        /// <summary>
        /// 添加是否新产品信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_NewProductTableData(NewProduct_Table obj)
        {
            return relevanceClass.Insert_NewProductTableData(obj);
        }
        #endregion

        #region 更改是否新产品信息
        /// <summary>
        /// 更改是否新产品信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_NewProductTableData(NewProduct_Table obj)
        {
            return relevanceClass.Update_NewProductTableData(obj);
        }
        #endregion

        #region 移除是否新产品信息
        /// <summary>
        /// 移除是否新产品信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_NewProductTableData(string con)
        {
            return relevanceClass.Delete_NewProductTableData(con);
        }
        #endregion
    }
}
