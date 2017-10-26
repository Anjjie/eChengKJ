using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:招聘岗位表
    /// </summary>
    public interface IJoinUsPostTable_Server
    {
        /// <summary>
        /// 获取全部的招聘岗位表信息
        /// </summary>
        /// <returns></returns>
        List<JoinUsPost_Table> GetJoinUsPostTableAll();

        /// <summary>
        /// 获取某条【招聘岗位】信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        JoinUsPost_Table GetJoinUsPostTableByConn(string con);

        /// <summary>
        /// 添加招聘岗位表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_JoinUsPostTableData(JoinUsPost_Table obj);

        /// <summary>
        /// 更改招聘岗位表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_JoinUsPostTableData(JoinUsPost_Table obj);

        /// <summary>
        /// 移除招聘岗位表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_JoinUsPostTableData(string con);
    }
}
