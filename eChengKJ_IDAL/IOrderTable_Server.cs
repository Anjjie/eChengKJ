using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口：订单
    /// </summary>
    public interface IOrderTable_Server
    {

            /// <summary>
            /// 获取全部的订单表信息
            /// </summary>
            /// <returns></returns>
            List<Order_Table> GetOrderTableAll();

            /// <summary>
            /// 获取某条【订单】信息
            /// </summary>
            /// <param name="con">参数条件</param>
            /// <returns></returns>
            Order_Table GetOrderTableByConn(string con);

            /// <summary>
            /// 添加订单表信息
            /// </summary>
            /// <param name="obj">带入参数</param>
            /// <returns></returns>
            int Insert_OrderTableData(Order_Table obj);

            /// <summary>
            /// 更改订单表信息
            /// </summary>
            /// <param name="obj">带入参数</param>
            /// <returns></returns>
            int Update_OrderTableData(Order_Table obj);

            /// <summary>
            /// 移除订单表信息
            /// </summary>
            /// <param name="con">参数条件</param>
            /// <returns></returns>
            int Delete_OrderTableData(string con);
        
    }
}
