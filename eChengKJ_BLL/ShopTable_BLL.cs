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
    /// 业务逻辑层：【购物车信息】
    /// </summary>
    public class ShopTable_BLL : IShopTable_Server
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
        IShopTable_Server relevanceClass
            = (IShopTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        ProductTable_BLL prodct = new ProductTable_BLL();

        UserTable_BLL user = new UserTable_BLL();

        #region 获取全部的购物车
        /// <summary>
        /// 获取全部的购物车
        /// </summary>
        /// <returns></returns>
        public List<Shop_Table> GetShopTableAll()
        {
            List<Shop_Table> list =new List<Shop_Table> ();
            foreach (Shop_Table obj in relevanceClass.GetShopTableAll())
            {
                obj.GetProductByP_No = prodct.GetProductTableByConn("P_No", obj.P_No);
                obj.GetUserByUserName = user.GetUserTableByConn("name",obj.Shop_User);
                list.Add(obj);
            }
            return list;
        }
        #endregion

        #region 根据ID查询购物车信息
        /// <summary>
        /// 根据ID查询购物车信息
        /// </summary>
        /// <param name="con">带入参数(ID)</param>
        /// <returns></returns>
        public Shop_Table GetShopTableByConn(string con)
        {
            Shop_Table obj = relevanceClass.GetShopTableByConn(con);
            obj.GetProductByP_No = prodct.GetProductTableByConn("P_No", obj.P_No);
            obj.GetUserByUserName = user.GetUserTableByConn("name", obj.Shop_User);
            return obj;
        }
        #endregion

        #region 添加购物车
        /// <summary>
        /// 添加购物车
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_ShopTableData(Shop_Table obj)
        {
            return relevanceClass.Insert_ShopTableData(obj);
        }
        #endregion

        #region 更改购物车
        /// <summary>
        /// 更改购物车
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_ShopTableData(Shop_Table obj)
        {
            return relevanceClass.Update_ShopTableData(obj);
        }
        #endregion

        #region 移除购物车
        /// <summary>
        /// 移除购物车
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_ShopTableData(string con)
        {
            return relevanceClass.Delete_ShopTableData(con);
        }
        #endregion

    }
}
