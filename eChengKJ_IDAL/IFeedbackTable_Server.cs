using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:反馈表
    /// </summary>
    public interface IFeedbackTable_Server
    {
        /// <summary>
        /// 获取全部的反馈
        /// </summary>
        /// <returns></returns>
        List<Feedback_Table> GetFeedbackTableAll();

        /// <summary>
        /// 添加反馈
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_FeedbackTableData(Feedback_Table obj);

        /// <summary>
        /// 更改反馈
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_FeedbackTableData(Feedback_Table obj);

        /// <summary>
        /// 移除反馈
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_FeedbackTableData(string con);
    }
}
