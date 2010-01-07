﻿//------------------------------------------------------------------------------
// 创建标识: Copyright (C) 2010 91aspx.com 版权所有
// 创建描述: DTCMS V1.0 创建于 2010-1-7 23:34:18
// 功能描述: 
// 修改标识: 
// 修改描述: 
//------------------------------------------------------------------------------

using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using DTCMS.Entity;
using DTCMS.IDAL;

namespace DTCMS.SqlServerDAL
{
	/// <summary>
	/// 数据访问类 Roles
	/// </summary>
	public class RolesDAL : BaseDAL, IDAL_Roles
	{
		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(Roles model)
		{
			StringBuilder strSql = new StringBuilder();
			strSql.Append("INSERT INTO Roles(");
            strSql.Append("RoleName,Description)");
			strSql.Append(" VALUES (");
            strSql.Append("@RoleName,@Description)");
			DbParameter[] cmdParms = {
				dbHelper.CreateInDbParameter("@RoleName", DbType.String, model.RoleName),
				dbHelper.CreateInDbParameter("@Description", DbType.String, model.Description)};

			return dbHelper.ExecuteNonQuery(CommandType.Text, strSql.ToString(), cmdParms);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public int Update(Roles model)
		{
			StringBuilder strSql = new StringBuilder();
			strSql.Append("UPDATE Roles SET ");
			strSql.Append("RoleName=@RoleName,");
			strSql.Append("Description=@Description,");
			strSql.Append("OrderID=@OrderID");
			strSql.Append(" WHERE ID=@ID");
			DbParameter[] cmdParms = {
				dbHelper.CreateInDbParameter("@RoleName", DbType.String, model.RoleName),
				dbHelper.CreateInDbParameter("@Description", DbType.String, model.Description),
				dbHelper.CreateInDbParameter("@OrderID", DbType.Int32, model.OrderID),
				dbHelper.CreateInDbParameter("@ID", DbType.Int32, model.ID)};

			return dbHelper.ExecuteNonQuery(CommandType.Text, strSql.ToString(), cmdParms);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public int Delete(int ID)
		{
			StringBuilder strSql = new StringBuilder();
			strSql.Append("DELETE FROM Roles ");
			strSql.Append(" WHERE ID=@ID");
			DbParameter[] cmdParms = {
				dbHelper.CreateInDbParameter("@ID", DbType.Int32, ID)};

			return dbHelper.ExecuteNonQuery(CommandType.Text, strSql.ToString(), cmdParms);
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int ID)
		{
			StringBuilder strSql = new StringBuilder();
			strSql.Append("SELECT COUNT(1) FROM Roles");
			strSql.Append(" WHERE ID=@ID");
			DbParameter[] cmdParms = {
				dbHelper.CreateInDbParameter("@ID", DbType.Int32, ID)};

			object obj = dbHelper.ExecuteScalar(CommandType.Text, strSql.ToString(), cmdParms);
			return dbHelper.GetInt(obj) > 0;
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Roles GetModel(int ID)
		{
			StringBuilder strSql = new StringBuilder();
			strSql.Append("SELECT ID,RoleName,Description,OrderID FROM Roles");
			strSql.Append(" WHERE ID=@ID");
			DbParameter[] cmdParms = {
				dbHelper.CreateInDbParameter("@ID", DbType.Int32, ID)};

			using (DbDataReader dr = dbHelper.ExecuteReader(CommandType.Text, strSql.ToString(), cmdParms))
			{
				if (dr.Read())
				{
					return GetModel(dr);
				}
				return null;
			}
		}

		/// <summary>
		/// 获取泛型数据列表
		/// </summary>
		public List<Roles> GetList(out long count)
		{
			StringBuilder strSql = new StringBuilder();
			strSql.Append("SELECT ID,RoleName,Description,OrderID FROM Roles");
			using (DbDataReader dr = dbHelper.ExecuteReader(CommandType.Text, strSql.ToString(), null))
			{
				List<Roles> lst = GetList(dr, out count);
				return lst;
			}
		}

		/// <summary>
		/// 分页获取泛型数据列表
		/// </summary>
		public List<Roles> GetPageList(int pageSize, int pageIndex, out long count)
		{
			StringBuilder strSql = new StringBuilder();
			strSql.Append("SELECT ID,RoleName,Description,OrderID FROM Roles");
			using (DbDataReader dr = dbHelper.ExecuteReader(CommandType.Text, strSql.ToString(), null))
			{
				List<Roles> lst = GetPageList(dr, pageSize, pageIndex, out count);
				return lst;
			}
		}

		#region -------- 私有方法，通常情况下无需修改 --------
		/// <summary>
		/// 由一行数据得到一个实体
		/// </summary>
		private Roles GetModel(DbDataReader dr)
		{
			Roles model = new Roles();
			model.ID = dbHelper.GetInt(dr["ID"]);
			model.RoleName = dbHelper.GetString(dr["RoleName"]);
			model.Description = dbHelper.GetString(dr["Description"]);
			model.OrderID = dbHelper.GetInt(dr["OrderID"]);
			return model;
		}

		/// <summary>
		/// 由DbDataReader得到泛型数据列表
		/// </summary>
		private List<Roles> GetList(DbDataReader dr, out long count)
		{
			count = 0;
			List<Roles> lst = new List<Roles>();
			while (dr.Read())
			{
				count++;
				lst.Add(GetModel(dr));
			}
			return lst;
		}

		/// <summary>
		/// 由DbDataReader得到分页泛型数据列表
		/// </summary>
		private List<Roles> GetPageList(DbDataReader dr, int pageSize, int pageIndex, out long count)
		{
			long first = GetFirstIndex(pageSize, pageIndex);
			long last = GetLastIndex(pageSize, pageIndex);

			count = 0;

			List<Roles> lst = new List<Roles>();
			while (dr.Read())
			{
				count++;
				if (count >= first && count <= last)
					lst.Add(GetModel(dr));
			}
			return lst;
		}
		#endregion
	}
}