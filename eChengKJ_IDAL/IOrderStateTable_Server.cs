using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口：订单状态表
    /// </summary>
    public interface IOrderStateTable_Server
    {
        /// <summary>
        /// 获取全部的订单状态表信息
        /// </summary>
        /// <returns></returns>
        List<OrderState_Table> GetOrderStateTableAll();

        /// <summary>
        /// 获取某条订单状态信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        OrderState_Table GetOrderStateTableByConn(string con);

        /// <summary>
        /// 添加订单状态表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_OrderStateTableData(OrderState_Table obj);

        /// <summary>
        /// 更改订单状态表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_OrderStateTableData(OrderState_Table obj);

        /// <summary>
        /// 移除订单状态表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_OrderStateTableData(string con);
    }
}
