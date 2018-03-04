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
        EmployeeTable_BLL FK_Employee = new EmployeeTable_BLL();
        OrderStateTable_BLL FK_OrderState = new OrderStateTable_BLL();
        ProductTable_BLL FK_Product = new ProductTable_BLL();
        UserTable_BLL FK_User = new UserTable_BLL();

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
            List<Order_Table> list = relevanceClass.GetOrderTableAll();
            List<Order_Table> listNew = new List<Order_Table>();
            foreach (Order_Table obj in list)
            {
                obj.GetEmployee = FK_Employee.GetEmployeeTableByConn(obj.E_id + "");
                obj.GetOrderState = FK_OrderState.GetOrderStateTableByConn(obj.OState_id + "");
                obj.GetProduct = FK_Product.GetProductTableByConn("P_id", obj.P_id + "");
                obj.GetUser = FK_User.GetUserTableByConn(obj.U_id + "","id");
                listNew.Add(obj);
            }
            return listNew;
        }
        #endregion

        #region 根据条件查询订单信息
        /// <summary>
        /// 根据条件查询订单信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public List<Order_Table> GetOrderTableByConn(string attr, string con)
        {
            List<Order_Table> list = relevanceClass.GetOrderTableByConn(attr, con);
            List<Order_Table> listNew = new List<Order_Table>();
            foreach (Order_Table obj in list)
            {
                obj.GetEmployee = FK_Employee.GetEmployeeTableByConn(obj.E_id + "");
                obj.GetOrderState = FK_OrderState.GetOrderStateTableByConn(obj.OState_id + "");
                obj.GetProduct = FK_Product.GetProductTableByConn("P_id", obj.P_id + "");
                obj.GetUser = FK_User.GetUserTableByConn(obj.U_id + "", "id");
                listNew.Add(obj);
            }
            return listNew;
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

        /// <summary>
        /// 根据条件查询订单信息并且进行分页
        /// </summary>
        /// <param name="id">用户ID</param>
        /// <param name="pageNo">当前页（用户选中的页数）</param>
        /// <param name="pageSize">显示数据</param>
        /// <returns></returns>
        public List<Order_Table> GetOrderTableByConn_Page(int id, int pageNo, int pageSize)
        {
            List<Order_Table> list = relevanceClass.GetOrderTableByConn_Page(id,pageNo,pageSize);
            List<Order_Table> listNew = new List<Order_Table>();
            foreach (Order_Table obj in list)
            {
                obj.GetEmployee = FK_Employee.GetEmployeeTableByConn(obj.E_id + "");
                obj.GetOrderState = FK_OrderState.GetOrderStateTableByConn(obj.OState_id + "");
                obj.GetProduct = FK_Product.GetProductTableByConn("P_id", obj.P_id + "");
                obj.GetUser = FK_User.GetUserTableByConn(obj.U_id + "", "id");
                listNew.Add(obj);
            }
            return listNew;
        }

    }
}
