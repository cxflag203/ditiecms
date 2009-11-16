﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace DTCMS.DBUtility
{
    public static class SqlHelper
    {
        /// <summary>
        /// 数据库连接对象
        /// </summary>
        private static SqlConnection connection;

        /// <summary>
        /// 数据库连接串
        /// </summary>
        public static String ConnString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
            }
        }

        /// <summary>
        /// 数据库连接对象,已打开连接
        /// </summary>
        public static SqlConnection Connection
        {
            get
            {
                if (connection == null)
                {
                    connection = new SqlConnection(ConnString);
                }
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                return connection;
            }
        }

        /// <summary>
        /// 关闭数据库连接
        /// </summary>
        public static void  CloseSqlConn(){
            if (connection != null && connection.State == ConnectionState.Open)
            {
                connection.Close();
                connection.Dispose();
                connection = null;
            }
        }

        #region SQL语句

        /// <summary>
        /// 执SQL语句,返回执行行数
        /// </summary>
        public static int ExecuteNonQuery(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, Connection);
            int result = cmd.ExecuteNonQuery();
            CloseSqlConn();
            return result;
        }
        /// <summary>
        /// 执行事务
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="tran">执行事务</param>
        /// <returns></returns>
        public static int ExecuteNonQueryTran(string sql, SqlTransaction tran)
        {
            SqlCommand cmd = new SqlCommand(sql, Connection);
            cmd.Transaction = tran;
            int result = cmd.ExecuteNonQuery();
            return result;

        }
        /// <summary>
        /// 执行SQL语句,返回执行行数
        /// </summary>
        public static int ExecuteNonQuery(string sql, SqlParameter[] prams)
        {

            SqlCommand cmd = new SqlCommand(sql, Connection);
            if (prams != null)
            {
                cmd.Parameters.AddRange(prams);
            }
            int iResult = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            CloseSqlConn();
            return iResult;
        }
        /// <summary>
        /// 执行事务
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="tran">执行事务</param>
        /// <returns></returns>
        public static int ExecuteNonQueryTran(string sql, SqlParameter[] prams, SqlTransaction tran)
        {
            SqlCommand cmd = new SqlCommand(sql, Connection);
            if (prams != null)
            {
                cmd.Parameters.AddRange(prams);
            }
            cmd.Transaction = tran;
            int iResult = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return iResult;

        }

        /// <summary>
        /// 执行SQL语句，并返回首行首列
        /// </summary>
        public static object ExecuteScalar(string sql)
        {

            SqlCommand cmd = new SqlCommand(sql, Connection);
            object iResult = cmd.ExecuteScalar();
            CloseSqlConn();
            return iResult;

        }
        /// <summary>
        /// 执行SQL语句，并返回首行首列
        /// </summary>
        public static object ExecuteScalar(string sql, SqlParameter[] prams)
        {
            SqlCommand cmd = new SqlCommand(sql, Connection);
            cmd.Parameters.AddRange(prams);
            object iResult = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            CloseSqlConn();
            return iResult;
        }

        /// <summary>
        /// 执行无参SQL语句，并返回SqlDataReader
        /// </summary>
        public static SqlDataReader ExecuteReader(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, Connection);
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        /// <summary>
        /// 执行SQL语句，并返回SqlDataReader
        /// </summary>
        public static SqlDataReader ExecuteReader(string sql, SqlParameter[] prams)
        {
            SqlCommand cmd = new SqlCommand(sql, Connection);
            if (prams != null)
            {
                cmd.Parameters.AddRange(prams);
            }
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            cmd.Parameters.Clear();
            return dr;
        }

        /// <summary>
        /// 执行sql语句，并返回DataSet
        /// </summary>
        /// <param name="safeSql"></param>
        /// <returns></returns>
        public static DataSet ExecuteDataSet(string sql)
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand(sql, Connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            CloseSqlConn();
            return ds;
        }

        /// <summary>
        /// 执行sql语句，并返回DataSet
        /// </summary>
        /// <param name="safeSql"></param>
        /// <returns></returns>
        public static DataSet ExecuteDataSet(string sql, SqlParameter[] prams)
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = null;

            cmd = new SqlCommand(sql, Connection);
            if (prams != null)
            {
                cmd.Parameters.AddRange(prams);
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cmd.Parameters.Clear();
            CloseSqlConn();
            return ds;
        }
        #endregion
    }
}