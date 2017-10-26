﻿using System;
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
    /// 业务逻辑层：【部门信息】
    /// </summary>
    public class DepartmentTable_BLL
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
        IDepartmentTable_Server relevanceClass
            = (IDepartmentTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的部门信息
        /// <summary>
        /// 获取全部的部门信息
        /// </summary>
        /// <returns></returns>
        public List<Department_Table> GetDepartmentTableAll()
        {
           return relevanceClass.GetDepartmentTableAll();
        }
        #endregion

        #region 根据ID查询部门信息
        /// <summary>
        /// 根据ID查询部门信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Department_Table GetDepartmentTableByConn(string con)
        {
            return relevanceClass.GetDepartmentTableByConn(con);
        }
        #endregion

        #region 添加部门信息
        /// <summary>
        /// 添加部门信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_DepartmentTableData(Department_Table obj)
        {
            return relevanceClass.Insert_DepartmentTableData(obj);
        }
        #endregion

        #region 更改部门信息
        /// <summary>
        /// 更改部门信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_DepartmentTableData(Department_Table obj)
        {
            return relevanceClass.Update_DepartmentTableData(obj);
        }
        #endregion

        #region 移除部门信息
        /// <summary>
        /// 移除部门信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_DepartmentTableData(string con)
        {
            return relevanceClass.Delete_DepartmentTableData(con);
        }
        #endregion
    }
}
