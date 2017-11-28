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
    /// 业务逻辑层：【用户信息】
    /// </summary>
    public class UserTable_BLL
    {
        IDTypeTable_BLL FK_IDType = new IDTypeTable_BLL();
        LoginStateTable_BLL FK_LoginState = new LoginStateTable_BLL();
        MailTable_BLL FK_Mail = new MailTable_BLL();

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
        IUserTable_Server relevanceClass
            = (IUserTable_Server)Factory_BLL.GetDALServer(GetClassName());
        #endregion

        #region 获取全部的用户信息
        /// <summary>
        /// 获取全部的用户信息
        /// </summary>
        /// <returns></returns>
        public List<User_Table> GetUserTableAll()
        {
            List<User_Table> list = relevanceClass.GetUserTableAll();
            List<User_Table> listNew = new List<User_Table>();
            foreach (User_Table obj in list)
            {
                obj.GetIDTtpe = FK_IDType.GetIDTypeTableByConn(obj.IDT_id + "");
                obj.GetLoginState = FK_LoginState.GetLoginStateTableByConn(obj.LS_id + "");
                obj.GetMail = FK_Mail.GetMailTableByConn(obj.M_id + "");
                listNew.Add(obj);
            }
            return listNew;
        }
        #endregion

        #region 根据ID查询用户信息
        /// <summary>
        /// 根据条件查询用户信息
        /// </summary>
        /// <param name="con"></param>
        /// <param name="type">[id，name，phone]选其一(必填)</param>
        public User_Table GetUserTableByConn(string con,string type)
        {
            User_Table obj = relevanceClass.GetUserTableByConn(con, type);
                obj.GetIDTtpe = FK_IDType.GetIDTypeTableByConn(obj.IDT_id + "");
                obj.GetLoginState = FK_LoginState.GetLoginStateTableByConn(obj.LS_id + "");
                obj.GetMail = FK_Mail.GetMailTableByConn(obj.M_id + "");
            return obj;
        }
        #endregion

        #region 添加用户信息
        /// <summary>
        /// 添加用户信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Insert_UserTableData(User_Table obj)
        {
            return relevanceClass.Insert_UserTableData(obj);
        }
        #endregion

        #region 更改用户信息
        /// <summary>
        /// 更改用户信息
        /// </summary>
        /// <param name="obj">带入参数</param>
        /// <returns></returns>
        public int Update_UserTableData(User_Table obj)
        {
            return relevanceClass.Update_UserTableData(obj);
        }
        #endregion

        #region 移除用户信息
        /// <summary>
        /// 移除用户信息
        /// </summary>
        /// <param name="con">参数条件</param>
        /// <returns></returns>
        public int Delete_UserTableData(string con)
        {
            return relevanceClass.Delete_UserTableData(con);
        }
        #endregion
    }
}
