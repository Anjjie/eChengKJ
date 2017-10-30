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
    /// 业务逻辑层：【员工信息】
    /// </summary>
    public class EmployeeTable_BLL
    {
        IDTypeTable_BLL FK_IDType = new IDTypeTable_BLL();
        DepartmentTable_BLL FK_Department = new DepartmentTable_BLL();
        LoginStateTable_BLL FK_LoginState = new LoginStateTable_BLL();
        PostTable_BLL FK_Post = new PostTable_BLL();

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
        IEmployeeTable_Server relevanceClass
            = (IEmployeeTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的员工信息
        /// <summary>
        /// 获取全部的员工信息
        /// </summary>
        /// <returns></returns>
        public List<Employee_Table> GetEmployeeTableAll()
        {
            List<Employee_Table> list = relevanceClass.GetEmployeeTableAll();
            List<Employee_Table> listNew = new List<Employee_Table>();
            foreach (Employee_Table obj in list)
            {
                obj.GetIDType = FK_IDType.GetIDTypeTableByConn(obj.IDT_id+"");
                obj.GetDepartment = FK_Department.GetDepartmentTableByConn(obj.Dep_id + "");
                obj.GetLoginState = FK_LoginState.GetLoginStateTableByConn(obj.LS_ID+"");
                obj.GetPost = FK_Post.GetPostTableByConn(obj.Post_id+"");
                listNew.Add(obj);
            }
            return listNew;
        }
        #endregion

        #region 根据ID查询员工信息
        /// <summary>
        /// 根据ID查询员工信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Employee_Table GetEmployeeTableByConn(string con)
        {
            return relevanceClass.GetEmployeeTableByConn(con);
        }
        #endregion

        #region 添加员工信息
        /// <summary>
        /// 添加员工信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_EmployeeTableData(Employee_Table obj)
        {
            return relevanceClass.Insert_EmployeeTableData(obj);
        }
        #endregion

        #region 更改员工信息
        /// <summary>
        /// 更改员工信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_EmployeeTableData(Employee_Table obj)
        {
            return relevanceClass.Update_EmployeeTableData(obj);
        }
        #endregion

        #region 移除员工信息
        /// <summary>
        /// 移除员工信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_EmployeeTableData(string con)
        {
            return relevanceClass.Delete_EmployeeTableData(con);
        }
        #endregion
    }
}
