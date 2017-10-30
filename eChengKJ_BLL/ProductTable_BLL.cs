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
    /// 业务逻辑层：【产品信息】
    /// </summary>
    public class ProductTable_BLL
    {
        EmployeeTable_BLL FK_Employee = new EmployeeTable_BLL();
        HotProductTable_BLL FK_HotProduct = new HotProductTable_BLL();
        NewProductTable_BLL FK_NewProduct = new NewProductTable_BLL();
        ProductTypeTable_BLL FK_ProductType = new ProductTypeTable_BLL();

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
        IProductTable_Server relevanceClass
            = (IProductTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的产品信息
        /// <summary>
        /// 获取全部的产品信息
        /// </summary>
        /// <returns></returns>
        public List<Product_Table> GetProductTableAll()
        {
            List<Product_Table> list = relevanceClass.GetProductTableAll();
            List<Product_Table> listNew = new List<Product_Table>();
            foreach (Product_Table obj in list)
            {
                obj.GetEmployee = FK_Employee.GetEmployeeTableByConn(obj.E_id + "");
                obj.GetHotProduct = FK_HotProduct.GetHotProductTableByConn(obj.HP_id + "");
                obj.GetNewProduct = FK_NewProduct.GetNewProductTableByConn(obj.NP_id + "");
                obj.GetProductType = FK_ProductType.GetProductTypeTableByConn(obj.PT_id + "");
                listNew.Add(obj);
            }
            return listNew;
        }
        #endregion

        #region 根据ID查询产品信息
        /// <summary>
        /// 根据ID查询产品信息
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        public Product_Table GetProductTableByConn(string con)
        {
            return relevanceClass.GetProductTableByConn(con);
        }
        #endregion

        #region 添加产品信息
        /// <summary>
        /// 添加产品信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_ProductTableData(Product_Table obj)
        {
            return relevanceClass.Insert_ProductTableData(obj);
        }
        #endregion

        #region 更改产品信息
        /// <summary>
        /// 更改产品信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_ProductTableData(Product_Table obj)
        {
            return relevanceClass.Update_ProductTableData(obj);
        }
        #endregion

        #region 移除产品信息
        /// <summary>
        /// 移除产品信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_ProductTableData(string con)
        {
            return relevanceClass.Delete_ProductTableData(con);
        }
        #endregion
    }
}
