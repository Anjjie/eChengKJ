using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口：产品表
    /// </summary>
    public interface IProductTable_Server
    {
        /// <summary>
        /// 获取全部的产品表信息
        /// </summary>
        /// <returns></returns>
        List<Product_Table> GetProductTableAll();

        /// <summary>
        /// 添加产品表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_ProductTableData(Product_Table obj);

        /// <summary>
        /// 更改产品表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_ProductTableData(Product_Table obj);

        /// <summary>
        /// 移除产品表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_ProductTableData(string con);
    }
}
