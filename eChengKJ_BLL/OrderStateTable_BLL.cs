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
    /// 业务逻辑层：【订单状态信息】
    /// </summary>
    public class OrderStateTable_BLL
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
        IOrderStateTable_Server relevanceClass
            = (IOrderStateTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的订单状态信息
        /// <summary>
        /// 获取全部的订单状态信息
        /// </summary>
        /// <returns></returns>
        public List<OrderState_Table> GetOrderStateTableAll()
        {
            return relevanceClass.GetOrderStateTableAll();
        }
        #endregion

        #region 根据ID查询订单状态信息
        /// <summary>
        /// 根据ID查询订单状态信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public OrderState_Table GetOrderStateTableByConn(string con)
        {
            return relevanceClass.GetOrderStateTableByConn(con);
        }
        #endregion

        #region 添加订单状态信息
        /// <summary>
        /// 添加订单状态信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_OrderStateTableData(OrderState_Table obj)
        {
            return relevanceClass.Insert_OrderStateTableData(obj);
        }
        #endregion

        #region 更改订单状态信息
        /// <summary>
        /// 更改订单状态信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_OrderStateTableData(OrderState_Table obj)
        {
            return relevanceClass.Update_OrderStateTableData(obj);
        }
        #endregion

        #region 移除订单状态信息
        /// <summary>
        /// 移除订单状态信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_OrderStateTableData(string con)
        {
            return relevanceClass.Delete_OrderStateTableData(con);
        }
        #endregion
    }
}
