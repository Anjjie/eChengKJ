using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:登录状态表
    /// </summary>
    interface ILoginStateTable_Server
    {
        /// <summary>
        /// 获取全部的登录状态表信息
        /// </summary>
        /// <returns></returns>
        LoginState_Table GetLoginStateTableAll();

        /// <summary>
        /// 添加登录状态表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_LoginStateTableData(LoginState_Table obj);

        /// <summary>
        /// 更改登录状态表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_LoginStateTableData(LoginState_Table obj);

        /// <summary>
        /// 移除登录状态表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_LoginStateTableData(string con);
    }
}
