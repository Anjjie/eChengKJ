using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口：购物车表
    /// </summary>
    public interface IShopTable_Server
    {
        /// <summary>
        /// 获取全部的购物信息
        /// </summary>
        /// <returns></returns>
        List<Shop_Table> GetShopTableAll();

        /// <summary>
        /// 获取某条【购物】信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        Shop_Table GetShopTableByConn(string con);

        /// <summary>
        /// 添加购物信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_ShopTableData(Shop_Table obj);

        /// <summary>
        /// 更改购物信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_ShopTableData(Shop_Table obj);

        /// <summary>
        /// 移除购物信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_ShopTableData(string con);
    }
}
