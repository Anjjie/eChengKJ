using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:产品试用申请试用申请表
    /// </summary>
    public interface IProductTryOurTable_Server
    {
        /// <summary>
        /// 获取全部的产品试用申请表信息
        /// </summary>
        /// <returns></returns>
        List<ProductTryOur_Table> GetProductTryOurTableAll();

        /// <summary>
        /// 获取某条产品信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        ProductTryOur_Table GetProductTryOurTableByConn(string con);

        /// <summary>
        /// 添加产品试用申请表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_ProductTryOurTableData(ProductTryOur_Table obj);

        /// <summary>
        /// 更改产品试用申请表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_ProductTryOurTableData(ProductTryOur_Table obj);

        /// <summary>
        /// 移除产品试用申请表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_ProductTryOurTableData(string con);
    }
}
