using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:邮箱表
    /// </summary>
    public interface IMailTable_Server
    {
        /// <summary>
        /// 获取全部的邮箱表信息
        /// </summary>
        /// <returns></returns>
        List<Mail_Table> GetMailTableAll();

        /// <summary>
        /// 获取某条【邮箱】信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        Mail_Table GetMailTableByConn(string con);

        /// <summary>
        /// 添加邮箱表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_MailTableData(Mail_Table obj);

        /// <summary>
        /// 更改邮箱表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_MailTableData(Mail_Table obj);

        /// <summary>
        /// 移除邮箱表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_MailTableData(string con);
    }
}
