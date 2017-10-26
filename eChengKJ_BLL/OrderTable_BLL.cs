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
    /// 业务逻辑层：【订单信息】
    /// </summary>
    public class OrderTable_BLL
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
        IOrderTable_Server relevanceClass
            = (IOrderTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的订单信息
        /// <summary>
        /// 获取全部的订单信息
        /// </summary>
        /// <returns></returns>
        public List<Order_Table> GetOrderTableAll()
        {
            return relevanceClass.GetOrderTableAll();
        }
        #endregion

        #region 根据ID查询订单信息
        /// <summary>
        /// 根据ID查询订单信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Order_Table GetOrderTableByConn(string con)
        {
            return relevanceClass.GetOrderTableByConn(con);
        }
        #endregion

        #region 添加订单信息
        /// <summary>
        /// 添加订单信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_OrderTableData(Order_Table obj)
        {
            return relevanceClass.Insert_OrderTableData(obj);
        }
        #endregion

        #region 更改订单信息
        /// <summary>
        /// 更改订单信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_OrderTableData(Order_Table obj)
        {
            return relevanceClass.Update_OrderTableData(obj);
        }
        #endregion

        #region 移除订单信息
        /// <summary>
        /// 移除订单信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_OrderTableData(string con)
        {
            return relevanceClass.Delete_OrderTableData(con);
        }
        #endregion
    }
}
