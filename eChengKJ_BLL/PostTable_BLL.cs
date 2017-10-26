    using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using eChengKJ_IDAL;
using eChengKJ_DAL;
using eChengKJ_Models;

namespace eChengKJ_BLL
{
    /// <summary>
    /// 业务逻辑层：【职位信息】
    /// </summary>
    public class PostTable_BLL
    {
        #region 获取动态类名
        /// <summary>
        /// 获取动态类名
        /// </summary>
        /// <returns></returns>
        static string GetClassName()
        {
            string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
            className = className.Substring(13, className.Length - 22);
            return className;
        }
        #endregion

        #region 实例化接口
        /// <summary>
        /// 实例化接口
        /// </summary>
        IPostTable_Server relevanceClass
            = (IPostTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的职位信息
        /// <summary>
        /// 获取全部的订单信息
        /// </summary>
        /// <returns></returns>
        public List<Post_Table> GetPostTableAll()
        {
            return relevanceClass.GetPostTableAll();
        }
        #endregion

        #region 根据ID查询订单信息
        /// <summary>
        /// 根据ID查询订单信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Post_Table GetPostTableByConn(string con)
        {
            return relevanceClass.GetPostTableByConn(con);
        }
        #endregion

        #region 添加订单信息
        /// <summary>
        /// 添加订单信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_PostTableData(Post_Table obj)
        {
            return relevanceClass.Insert_PostTableData(obj);
        }
        #endregion

        #region 更改订单信息
        /// <summary>
        /// 更改订单信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_PostTableData(Post_Table obj)
        {
            return relevanceClass.Update_PostTableData(obj);
        }
        #endregion

        #region 移除订单信息
        /// <summary>
        /// 移除订单信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_PostTableData(string con)
        {
            return relevanceClass.Delete_PostTableData(con);
        }
        #endregion
    }
}
