using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:产品类型表
    /// </summary>
    public interface IProductTypeTable_Server
    {
        /// <summary>
        /// 获取全部的产品类型表信息
        /// </summary>
        /// <returns></returns>
        List<ProductType_Table> GetProductTypeTableAll();

        /// <summary>
        /// 获取某条【产品类型】信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        ProductType_Table GetProductTypeTableByConn(string con);

        /// <summary>
        /// 添加产品类型表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_ProductTypeTableData(ProductType_Table obj);

        /// <summary>
        /// 更改产品类型表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_ProductTypeTableData(ProductType_Table obj);

        /// <summary>
        /// 移除产品类型表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_ProductTypeTableData(string con);
    }
}
