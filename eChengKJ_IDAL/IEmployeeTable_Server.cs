using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:员工表
    /// </summary>
    interface IEmployeeTable_Server
    {
        /// <summary>
        /// 获取全部的员工
        /// </summary>
        /// <returns></returns>
        Employee_Table GetEmployeeTableAll();

        /// <summary>
        /// 添加员工
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_EmployeeTableData(Employee_Table obj);

        /// <summary>
        /// 更改员工
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_EmployeeTableData(Employee_Table obj);

        /// <summary>
        /// 移除员工
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_EmployeeTableData(string con);
    }
}
