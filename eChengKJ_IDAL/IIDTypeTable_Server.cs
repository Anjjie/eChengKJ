using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:证件类型表
    /// </summary>
    public interface IIDTypeTable_Server
    {
        /// <summary>
        /// 获取全部的证件类型表信息
        /// </summary>
        /// <returns></returns>
        List<IDType_Table> GetIDTypeTableAll();

        /// <summary>
        /// 添加证件类型表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_IDTypeTableData(IDType_Table obj);

        /// <summary>
        /// 更改证件类型表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_IDTypeTableData(IDType_Table obj);

        /// <summary>
        /// 移除证件类型表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_IDTypeTableData(string con);
    }
}
