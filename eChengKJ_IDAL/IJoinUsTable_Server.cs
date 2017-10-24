using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:招聘表
    /// </summary>
    interface IJoinUsTable_Server
    {
        /// <summary>
        /// 获取全部的招聘表信息
        /// </summary>
        /// <returns></returns>
        JoinUs_Table GetJoinUsTableAll();

        /// <summary>
        /// 添加招聘表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_JoinUsTableData(JoinUs_Table obj);

        /// <summary>
        /// 更改招聘表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_JoinUsTableData(JoinUs_Table obj);

        /// <summary>
        /// 移除招聘表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_JoinUsTableData(string con);
    }
}
