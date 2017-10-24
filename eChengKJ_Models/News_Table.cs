using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eChengKJ_Models
{
    /// <summary>
    /// 实体类：新闻表
    /// </summary>
    public class News_Table
    {
        /// <summary>
        /// 编号
        /// </summary>
        int News_id { get; set; }
        /// <summary>
        /// 新闻标题
        /// </summary>
        string News_Name { get; set; }
        /// <summary>
        /// 新闻内容
        /// </summary>
        string News_Content { get; set; }
        /// <summary>
        /// 新闻作者
        /// </summary>
        string News_Anthor { get; set; }
        /// <summary>
        /// 发布时间
        /// </summary>
        string News_Date { get; set; }                
    }
}
