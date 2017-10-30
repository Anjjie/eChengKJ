using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:用户表
    /// </summary>
    public interface IUserTable_Server
    {
        /// <summary>
        /// 获取全部的用户信息
        /// </summary>
        /// <returns></returns>
        List<User_Table> GetUserTableAll();

        /// <summary>
        /// 获取某条用户信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        User_Table GetUserTableByConn(string con, string type);

        /// <summary>
        /// 添加用户信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_UserTableData(User_Table obj);

        /// <summary>
        /// 更改用户信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_UserTableData(User_Table obj);

        /// <summary>
        /// 移除用户信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_UserTableData(string con);
    }
}
