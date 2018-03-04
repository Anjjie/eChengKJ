using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using eChengKJ_Models;
using eChengKJ_IDAL;

namespace eChengKJ_DAL
{
    /// <summary>
    /// 数据访问:订单
    /// </summary>
    public class OrderTable_Server : IOrderTable_Server
    {
        #region 获取SQL存储过程（固定）
        /// <summary>
        /// 获取SQL存储过程（固定）
        /// </summary>
        /// <param name="content">[select,insert,update,delete]选其一</param>
        /// <returns>返回SQL存储过程</returns>
        private string GetSqlString(string content)
        {
            string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
            className = className.Substring(13, className.Length - 25);
            string returnContene = "";
            switch (content.ToLower())
            {
                case "select":
                    returnContene = "Select_" + className + "Table"; break;
                case "insert":
                    returnContene = "Insert_" + className + "Table"; break;
                case "update":
                    returnContene = "Update_" + className + "Table"; break;
                case "delete":
                    returnContene = "Delete_" + className + "Table"; break;
            }
            return returnContene;
        }
        #endregion

        #region 获取全部的订单
        /// <summary>
        /// 获取全部的订单
        /// </summary>
        /// <returns></returns>
        public List<Order_Table> GetOrderTableAll()
        {
            List<Order_Table> list = new List<Order_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(GetSqlString("Select"),
                CommandType.StoredProcedure);
            while (dr.Read())
            {
                Order_Table obj = new Order_Table()
                {
                    O_id = Convert.ToInt32(dr["O_id"]),
                    OState_id = (int)dr["OState_id"],
                    O_DateTime =(DateTime) dr["O_DateTime"],
                    E_id = (int)dr["E_id"],
                    O_DealWay = dr["O_DealWay"].ToString(),
                    O_LeaveWords = dr["O_LeaveWords"].ToString(),
                    O_Remark = dr["O_Remark"].ToString(),
                    P_id = (int)dr["P_id"],
                    U_id = (int)dr["U_id"]
                };
                list.Add(obj);
            }
            dr.Close();
            return list;
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
            List<Order_Table> list = new List<Order_Table> ();
            string attrs = "@" + attr;
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "Select * from Order_Table where "+ attr + "="+ attrs,
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter(attrs,con)
                 });
            if (dr.Read())
            {
                Order_Table obj = new Order_Table()
                {
                    O_id = Convert.ToInt32(dr["O_id"]),
                    OState_id = (int)dr["OState_id"],
                    O_DateTime = (DateTime)dr["O_DateTime"],
                    E_id = (int)dr["E_id"],
                    O_DealWay = dr["O_DealWay"].ToString(),
                    O_LeaveWords = dr["O_LeaveWords"].ToString(),
                    O_Remark = dr["O_Remark"].ToString(),
                    P_id = (int)dr["P_id"],
                    U_id = (int)dr["U_id"]
                };
                list.Add(obj);
            }
            dr.Close();
            return list;
        }
        #endregion

        #region 添加订单
        /// <summary>
        /// 添加订单
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_OrderTableData(Order_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Insert"),
                CommandType.StoredProcedure,
                new SqlParameter[] {
                    new SqlParameter("@O_id",obj.O_id),
                    new SqlParameter("@O_DateTime",obj.O_DateTime),
                    new SqlParameter("@E_id",obj.E_id),
                    new SqlParameter("@O_DealWay",obj.O_DealWay),
                    new SqlParameter("@O_LeaveWords",obj.O_LeaveWords),
                    new SqlParameter("@O_Remark",obj.O_Remark),
                    new SqlParameter("@P_id",obj.P_id),
                    new SqlParameter("@U_id",obj.U_id)
                });
        }
        #endregion

        #region 更改订单
        /// <summary>
        /// 更改订单
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_OrderTableData(Order_Table obj)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Update"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@O_id",obj.O_id),
                    new SqlParameter("@O_id",obj.O_id),
                    new SqlParameter("@O_DateTime",obj.O_DateTime),
                    new SqlParameter("@E_id",obj.E_id),
                    new SqlParameter("@O_DealWay",obj.O_DealWay),
                    new SqlParameter("@O_LeaveWords",obj.O_LeaveWords),
                    new SqlParameter("@O_Remark",obj.O_Remark),
                    new SqlParameter("@P_id",obj.P_id),
                    new SqlParameter("@U_id",obj.U_id)
                 });
        }
        #endregion

        #region 移除订单
        /// <summary>
        /// 移除订单
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_OrderTableData(string con)
        {
            return DBHerlper.ExecuteNonQuery(GetSqlString("Delete"),
                 CommandType.StoredProcedure,
                 new SqlParameter[] {
                     new SqlParameter("@O_id",con)
                 });
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
            List<Order_Table> list = new List<Order_Table>();
            SqlDataReader dr = DBHerlper.ExecuteReader(
                "proc_OrderPage",
                 CommandType.Text, new SqlParameter[] {
                     new SqlParameter("@U_id",id),
                     new SqlParameter("@PageNo",pageNo),
                     new SqlParameter("@PageSize",pageSize)
                 });
            if (dr.Read())
            {
                Order_Table obj = new Order_Table()
                {
                    O_id = Convert.ToInt32(dr["O_id"]),
                    OState_id = (int)dr["OState_id"],
                    O_DateTime = (DateTime)dr["O_DateTime"],
                    E_id = (int)dr["E_id"],
                    O_DealWay = dr["O_DealWay"].ToString(),
                    O_LeaveWords = dr["O_LeaveWords"].ToString(),
                    O_Remark = dr["O_Remark"].ToString(),
                    P_id = (int)dr["P_id"],
                    U_id = (int)dr["U_id"]
                };
                list.Add(obj);
            }
            dr.Close();
            return list;
        }

    }
}
