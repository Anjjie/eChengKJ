using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:密保表
    /// </summary>
    public interface IIssueAnswerTable_Server
    {
        /// <summary>
        /// 获取全部的密保表信息
        /// </summary>
        /// <returns></returns>
        List<IssueAnswer_Table> GetIssueAnswerTableAll();

        /// <summary>
        /// 添加密保表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_IssueAnswerTableData(IssueAnswer_Table obj);

        /// <summary>
        /// 更改密保表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_IssueAnswerTableData(IssueAnswer_Table obj);

        /// <summary>
        /// 移除密保表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_IssueAnswerTableData(string con);
    }
}
