using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:公司信息表
    /// </summary>
    interface ICompanyTable_Server
    {
        /// <summary>
        /// 获取全部的公司信息
        /// </summary>
        /// <returns></returns>
        Company_Table GetCompanyTableAll();

        /// <summary>
        /// 添加公司信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_CompanyTableData(Company_Table obj);

        /// <summary>
        /// 更改公司信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_CompanyTableData(Company_Table obj);

        /// <summary>
        /// 移除公司信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_CompanyTableData(string con);

    }
}
