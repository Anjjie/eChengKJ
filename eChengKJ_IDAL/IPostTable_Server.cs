﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口：职位表
    /// </summary>
    public interface IPostTable_Server
    {
        /// <summary>
        /// 获取全部的职位表信息
        /// </summary>
        /// <returns></returns>
        List<Post_Table> GetPostTableAll();

        /// <summary>
        /// 获取全部的职位表信息
        /// </summary>
        /// <returns></returns>
        Post_Table GetPostTableByConn(string con);

        /// <summary>
        /// 添加职位表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_PostTableData(Post_Table obj);

        /// <summary>
        /// 更改职位表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_PostTableData(Post_Table obj);

        /// <summary>
        /// 移除职位表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_PostTableData(string con);
    }
}
