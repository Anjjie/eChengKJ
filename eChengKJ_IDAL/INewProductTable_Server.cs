using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:是否新产品表
    /// </summary>
    public interface INewProductTable_Server
    {
        /// <summary>
        /// 获取全部的是否新产品表信息
        /// </summary>
        /// <returns></returns>
        List<NewProduct_Table> GetNewProductTableAll();

        /// <summary>
        /// 获取某条【是否新产品】信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        NewProduct_Table GetNewProductTableByConn(string con);

        /// <summary>
        /// 添加是否新产品表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_NewProductTableData(NewProduct_Table obj);

        /// <summary>
        /// 更改是否新产品表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_NewProductTableData(NewProduct_Table obj);

        /// <summary>
        /// 移除是否新产品表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_NewProductTableData(string con);
    }
}
