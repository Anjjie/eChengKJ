using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eChengKJ_Models;

namespace eChengKJ_IDAL
{
    /// <summary>
    /// 接口:是否热门产品表
    /// </summary>
    public interface IHotProductTable_Server
    {
        /// <summary>
        /// 获取全部的是否热门产品表信息
        /// </summary>
        /// <returns></returns>
        List<HotProduct_Table> GetHotProductTableAll();

        /// <summary>
        /// 添加是否热门产品表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Insert_HotProductTableData(HotProduct_Table obj);

        /// <summary>
        /// 更改是否热门产品表信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        int Update_HotProductTableData(HotProduct_Table obj);

        /// <summary>
        /// 移除是否热门产品表信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        int Delete_HotProductTableData(string con);
    }
}
