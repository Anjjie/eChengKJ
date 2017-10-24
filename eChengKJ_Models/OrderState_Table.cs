using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：订单状态
    /// </summary>
   public class OrderState_Table
    {
       /// <summary>
       /// 订单状态编号
       /// </summary>
       int OState_id {get;set;}  
       /// <summary>
       /// 订单状态名称
       /// </summary>
       string OState_Name { get; set; }                 
    }
}
