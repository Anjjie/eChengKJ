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
    /// 业务逻辑层：【是否热门产品信息】
    /// </summary>
    public class HotProductTable_BLL
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
        IHotProductTable_Server relevanceClass
            = (IHotProductTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的是否热门产品信息
        /// <summary>
        /// 获取全部的是否热门产品信息
        /// </summary>
        /// <returns></returns>
        public List<HotProduct_Table> GetHotProductTableAll()
        {
            return relevanceClass.GetHotProductTableAll();
        }
        #endregion

        #region 根据ID查询是否热门产品信息
        /// <summary>
        /// 根据ID查询是否热门产品信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public HotProduct_Table GetHotProductTableByConn(string con)
        {
            return relevanceClass.GetHotProductTableByConn(con);
        }
        #endregion

        #region 添加是否热门产品信息
        /// <summary>
        /// 添加是否热门产品信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_HotProductTableData(HotProduct_Table obj)
        {
            return relevanceClass.Insert_HotProductTableData(obj);
        }
        #endregion

        #region 更改是否热门产品信息
        /// <summary>
        /// 更改是否热门产品信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_HotProductTableData(HotProduct_Table obj)
        {
            return relevanceClass.Update_HotProductTableData(obj);
        }
        #endregion

        #region 移除是否热门产品信息
        /// <summary>
        /// 移除是否热门产品信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_HotProductTableData(string con)
        {
            return relevanceClass.Delete_HotProductTableData(con);
        }
        #endregion
    }
}
