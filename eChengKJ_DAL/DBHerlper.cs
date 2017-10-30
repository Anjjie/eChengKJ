using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace eChengKJ_DAL
{
    /// <summary>
    /// [连接数据库]服务类
    /// </summary>
    public class DBHerlper
    {
        #region 获取连接字符串
        /// <summary>
        /// 获取连接字符串
        /// </summary>
        /// <returns></returns>
        public static string GetConnStr()
        {
            try
            {
                return ConfigurationManager.ConnectionStrings["connStr"].ToString();
            }
            catch
            {

                return ConfigurationManager.AppSettings["connStr"].ToString();
            }

        } 
        #endregion

        #region 创建连接
        /// <summary>
        /// 创建连接
        /// </summary>
        static SqlConnection conn = null; 
        #endregion

        #region 获取连接方法1
        /// <summary>
        /// 获取连接方法1
        /// </summary>
        /// <returns></returns>
        public static SqlConnection GetConn()
        {
            if (conn == null || conn.ConnectionString == "")
            {
                conn = new SqlConnection(GetConnStr());
            }
            return conn;
        } 
        #endregion

        #region 打开连接
        /// <summary>
        /// 打开连接
        /// </summary>
        public static void OpenConn()
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        } 
        #endregion

        #region 关闭连接
        /// <summary>
        /// 关闭连接
        /// </summary>
        public static void CloseConn()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        } 
        #endregion

        #region 判断获取当前状态事件
        /// <summary>
        /// 判断获取当前状态事件
        /// </summary>
        public static void AllConnState(SqlConnection sqlConn)
        {
            switch (sqlConn.State)
            {
                case ConnectionState.Closed:
                    sqlConn.Open();
                    break;
                case ConnectionState.Open:
                    sqlConn.Close();
                    sqlConn.Open();
                    break;
                case ConnectionState.Broken:
                    sqlConn.Close();
                    sqlConn.Open();
                    break;
            }
        } 
        #endregion

        #region 获取连接方法2
        /// <summary>
        /// 获取连接方法2
        /// </summary>
        public static SqlConnection GetConns()
        {
            if (conn == null || conn.ConnectionString == "")
            {
                conn = new SqlConnection(GetConnStr());
            }
            AllConnState(conn);
            return conn;
        } 
        #endregion

        #region 查询:返回多行多列
        /// <summary>
        /// 查询:返回多行多列
        /// </summary>
        /// <param name="sql">SQL语句(执行语句)</param>
        /// <param name="type">执行类型(命令类型)</param>
        /// <param name="paras">[@XXX]类型传参</param>
        /// <returns>返回查询到的数据</returns>
        public static SqlDataReader ExecuteReader(string sql,
            CommandType type, params SqlParameter[] paras)
        {
            SqlCommand com = new SqlCommand(sql, GetConns());
            com.CommandType = type;
            com.Parameters.AddRange(paras);
            SqlDataReader dr = com.ExecuteReader();
            return dr;
        } 
        #endregion

        #region  动作查询:添加/修改/删除
        /// <summary>
        /// 动作查询:添加/修改/删除
        /// </summary>
        /// <param name="sql">SQL语句(执行语句)</param>
        /// <param name="type">执行类型(命令类型)</param>
        /// <param name="paras">[@XXX]类型传参</param>
        /// <returns>返回添加成功行数</returns>
        public static int ExecuteNonQuery(string sql,
            CommandType type, params SqlParameter[] paras)
        {
            SqlCommand com = new SqlCommand(sql, GetConns());
            com.CommandType = type;
            com.Parameters.AddRange(paras);
            int n = com.ExecuteNonQuery();
            com.Clone();
            return n;
        } 
        #endregion

        #region 程序集获取全部数据
        /// <summary>
        /// 程序集获取全部数据
        /// </summary>
        /// <param name="sql">SQL语句(执行语句)</param>
        /// <param name="type">执行类型(命令类型)</param>
        /// <param name="paras">[@XXX]类型传参</param>
        /// <returns></returns>
        public static DataSet GetData(string sql, CommandType type, params SqlParameter[] paras)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(sql, GetConns());
            sda.SelectCommand.CommandType = type;
            sda.SelectCommand.Parameters.AddRange(paras);
            sda.Fill(ds);
            return ds;
        } 
        #endregion

    }
}
