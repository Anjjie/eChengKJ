﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：产品试用申请表
    /// </summary>
    public class ProductTryOur_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        public int PTO_id { get; set; }
        /// <summary>
        /// 公司名称
        /// </summary>
        public string PTO_Name { get; set; }
        /// <summary>
        /// 申请人
        /// </summary>
        public int U_id { get; set; }
        /// <summary>
        /// 获取用户属性对象
        /// </summary>
        public User_Table GetUser { get; set; }
        /// <summary>
        /// 申请日期
        /// </summary>
        public DateTime PTO_ApplyFor { get; set; }
        /// <summary>
        /// 审核状态
        /// </summary>
        public int TO_id { get; set; }
        /// <summary>
        /// 获取审核状态属性对象
        /// </summary>
        public TryOut_Table GetTryOut { get; set; }
        /// <summary>
        /// 处理人（操作员）
        /// </summary>
        public int E_id { get; set; }
        /// <summary>
        /// 获取员工属性对象
        /// </summary>
        public Employee_Table GetEmployee{ get; set; }
        /// <summary>
        /// 操作时间
        /// </summary>
        public DateTime PTO_AuditDate { get; set; }
        /// <summary>
        /// 是否激活
        /// </summary>
        public int PTO_Activate { get; set; }
        /// <summary>
        /// 到期时间
        /// </summary>
        public DateTime PTO_ExpireDate { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string PTO_Remark { get; set; }  
    }
}
