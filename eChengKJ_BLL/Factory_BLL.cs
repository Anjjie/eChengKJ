using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Reflection;

namespace eChengKJ_BLL
{
    public class Factory_BLL
    {
        #region 获取DAL接口中的方法
        /// <summary>
        /// 获取DAL接口中的方法
        /// </summary>
        /// <param name="className">拼接DAL服务类名</param>
        /// <returns></returns>
        public static Object GetDALServer(string className)
        {
            //创建接收器
            Object obj = null;
            //创建一个程序集用以执行加载DAL
            Assembly ass = Assembly.Load("eChengKJ_DAL");
            //Object 获取对象
            obj = ass.CreateInstance("eChengKJ_DAL." + className+ "Table_Server");
            return obj;
        } 
        #endregion
    }
}
