using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:新闻表
    /// </summary>
    interface INewsTable_Server
    {
        /// <summary>
        /// 获取全部的新闻表信息
        /// </summary>
        /// <returns></returns>
        News_Table GetNewsTableAll();

        /// <summary>
        /// 添加新闻表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_NewsTableData(News_Table obj);

        /// <summary>
        /// 更改新闻表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_NewsTableData(News_Table obj);

        /// <summary>
        /// 移除新闻表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_NewsTableData(string con);
    }
}
