﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:解决方案表
    /// </summary>
    public interface ISolutionTable_Server
    {
        /// <summary>
        /// 获取全部的解决方案表信息
        /// </summary>
        /// <returns></returns>
        List<Solution_Table> GetSolutionTableAll();

        /// <summary>
        /// 获取某条【产品类型】信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        Solution_Table GetSolutionTableByConn(string con);

        /// <summary>
        /// 添加解决方案表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_SolutionTableData(Solution_Table obj);

        /// <summary>
        /// 更改解决方案表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_SolutionTableData(Solution_Table obj);

        /// <summary>
        /// 移除解决方案表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_SolutionTableData(string con);
    }
}
