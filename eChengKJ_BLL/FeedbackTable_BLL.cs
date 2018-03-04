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
    /// 业务逻辑层：【反馈信息】
    /// </summary>
    public class FeedbackTable_BLL
    {
        ProductTable_BLL FK_Product = new ProductTable_BLL();
        UserTable_BLL FK_User = new UserTable_BLL();

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
        IFeedbackTable_Server relevanceClass
            = (IFeedbackTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的反馈信息
        /// <summary>
        /// 获取全部的反馈信息
        /// </summary>
        /// <returns></returns>
        public List<Feedback_Table> GetFeedbackTableAll()
        {
            List<Feedback_Table> list = relevanceClass.GetFeedbackTableAll();
            List<Feedback_Table> listNew = new List<Feedback_Table>();
            foreach (Feedback_Table obj in list)
            {
                obj.GetProduct = FK_Product.GetProductTableByConn("P_id", obj.P_id + "");
                obj.GetUser = FK_User.GetUserTableByConn(obj.U_id + "","id");
                listNew.Add(obj);
            }
            return listNew;
        }
        #endregion

        #region 根据ID查询反馈信息
        /// <summary>
        /// 根据ID查询反馈信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Feedback_Table GetFeedbackTableByConn(string con)
        {
            return relevanceClass.GetFeedbackTableByConn(con);
        }
        #endregion

        #region 添加反馈信息
        /// <summary>
        /// 添加反馈信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_FeedbackTableData(Feedback_Table obj)
        {
            return relevanceClass.Insert_FeedbackTableData(obj);
        }
        #endregion

        #region 更改反馈信息
        /// <summary>
        /// 更改反馈信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_FeedbackTableData(Feedback_Table obj)
        {
            return relevanceClass.Update_FeedbackTableData(obj);
        }
        #endregion

        #region 移除反馈信息
        /// <summary>
        /// 移除反馈信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_FeedbackTableData(string con)
        {
            return relevanceClass.Delete_FeedbackTableData(con);
        }
        #endregion
    }
}
