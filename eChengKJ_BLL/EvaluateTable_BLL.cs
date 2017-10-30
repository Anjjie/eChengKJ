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
    /// 业务逻辑层：【评价信息】
    /// </summary>
    public class EvaluateTable_BLL
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
        IEvaluateTable_Server relevanceClass
            = (IEvaluateTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的评价信息
        /// <summary>
        /// 获取全部的评价信息
        /// </summary>
        /// <returns></returns>
        public List<Evaluate_Table> GetEvaluateTableAll()
        {
            List<Evaluate_Table> list = relevanceClass.GetEvaluateTableAll();
            List < Evaluate_Table > listNew = new List<Evaluate_Table>();
            foreach (Evaluate_Table obj in list)
            {
                //获取外键信息
                obj.GetProduct = FK_Product.GetProductTableByConn(obj.P_id+"");
                obj.GetUser = FK_User.GetUserTableByConn(obj.U_id+"","id");
                listNew.Add(obj);
            }
            return listNew;
        }
        #endregion

        #region 根据ID查询评价信息
        /// <summary>
        /// 根据ID查询评价信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Evaluate_Table GetEvaluateTableByConn(string con)
        {
            return relevanceClass.GetEvaluateTableByConn(con);
        }
        #endregion

        #region 添加评价信息
        /// <summary>
        /// 添加评价信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_EvaluateTableData(Evaluate_Table obj)
        {
            return relevanceClass.Insert_EvaluateTableData(obj);
        }
        #endregion

        #region 更改评价信息
        /// <summary>
        /// 更改评价信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_EvaluateTableData(Evaluate_Table obj)
        {
            return relevanceClass.Update_EvaluateTableData(obj);
        }
        #endregion

        #region 移除评价信息
        /// <summary>
        /// 移除评价信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_EvaluateTableData(string con)
        {
            return relevanceClass.Delete_EvaluateTableData(con);
        }
        #endregion

    }
}
