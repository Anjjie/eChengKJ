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
    /// 业务逻辑层：【证件类型信息】
    /// </summary>
    public class IDTypeTable_BLL
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
        IIDTypeTable_Server relevanceClass
            = (IIDTypeTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的证件类型信息
        /// <summary>
        /// 获取全部的证件类型信息
        /// </summary>
        /// <returns></returns>
        public List<IDType_Table> GetIDTypeTableAll()
        {
            return relevanceClass.GetIDTypeTableAll();
        }
        #endregion

        #region 根据ID查询证件类型信息
        /// <summary>
        /// 根据ID查询证件类型信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public IDType_Table GetIDTypeTableByConn(string con)
        {
            return relevanceClass.GetIDTypeTableByConn(con);
        }
        #endregion

        #region 添加证件类型信息
        /// <summary>
        /// 添加证件类型信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_IDTypeTableData(IDType_Table obj)
        {
            return relevanceClass.Insert_IDTypeTableData(obj);
        }
        #endregion

        #region 更改证件类型信息
        /// <summary>
        /// 更改证件类型信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_IDTypeTableData(IDType_Table obj)
        {
            return relevanceClass.Update_IDTypeTableData(obj);
        }
        #endregion

        #region 移除证件类型信息
        /// <summary>
        /// 移除证件类型信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_IDTypeTableData(string con)
        {
            return relevanceClass.Delete_IDTypeTableData(con);
        }
        #endregion
    }
}
