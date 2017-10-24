using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:评价表
    /// </summary>
    interface IEvaluateTable_Server
    {
        /// <summary>
        /// 获取全部的评价
        /// </summary>
        /// <returns></returns>
        Evaluate_Table GetEvaluateTableAll();

        /// <summary>
        /// 添加评价
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_EvaluateTableData(Evaluate_Table obj);

        /// <summary>
        /// 更改评价
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_EvaluateTableData(Evaluate_Table obj);

        /// <summary>
        /// 移除评价
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_EvaluateTableData(string con);
    }
}
