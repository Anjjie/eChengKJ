using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    public class Shop_Table
    {
        /// <summary>
        /// 购物车编号
        /// </summary>
        public int Shop_Id { get; set; }
        /// <summary>
        /// 用户
        /// </summary>
        public string Shop_User { get; set; }
        /// <summary>
        /// 获取用户对象
        /// </summary>
        public User_Table GetUserByUserName { get; set; }
        /// <summary>
        /// 产品定义编号
        /// </summary>
        public string P_No { get; set; }
        /// <summary>
        /// 产品对象
        /// </summary>
        public Product_Table GetProductByP_No { get; set; }
       /// <summary>
       /// 数量
       /// </summary>
        public string Shop_Number { get; set; }
        /// <summary>
        /// 日期时间
        /// </summary>
        public string Shop_Date { get; set; }



    }
}
