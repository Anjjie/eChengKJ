using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:部门表
    /// </summary>
    public interface IDepartmentTable_Server
    {
        /// <summary>
        /// 获取全部的部门
        /// </summary>
        /// <returns></returns>
        List<Department_Table> GetDepartmentTableAll();

        /// <summary>
        /// 获取某条【部门】信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        Department_Table GetDepartmentTableByConn(string con);

        /// <summary>
        /// 添加部门
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_DepartmentTableData(Department_Table obj);

        /// <summary>
        /// 更改部门
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_DepartmentTableData(Department_Table obj);

        /// <summary>
        /// 移除部门
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_DepartmentTableData(string con);

    }
}
