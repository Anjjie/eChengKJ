using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：订单
    /// </summary>
    public class Order_Table
    {
        /// <summary>
        ///  编号
        /// </summary>
        public int O_id { get; set; }
        /// <summary>
        /// 产品编号
        /// </summary>
        public int P_id { get; set; }
        /// <summary>
        /// 购买人编号
        /// </summary>
        public int U_id { get; set; }
        /// <summary>
        /// 客户留言
        /// </summary>
        public string O_LeaveWords { get; set; }
        /// <summary>
        /// 支付方式
        /// </summary>
        public string O_DealWay { get; set; }
        /// <summary>
        /// 受理人编号
        /// </summary>
        public int E_id { get; set; }
        /// <summary>
        /// 购买时间
        /// </summary>
        public DateTime O_DateTime { get; set; }
        /// <summary>
        /// 订单状态编号
        /// </summary>
        public int OState_id { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string O_Remark { get; set; }

    }
}
