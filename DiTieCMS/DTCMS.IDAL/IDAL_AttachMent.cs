﻿//------------------------------------------------------------------------------
// 创建标识: Copyright (C) 2010 91aspx.com 版权所有
// 创建描述: DTCMS V1.0 创建于 2010-01-10 22:48:15
// 功能描述: 
// 修改标识: 
// 修改描述: 
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using DTCMS.Entity;

namespace DTCMS.IDAL
{
	/// <summary>
	/// 接口层 IAttachMent
	/// </summary>
    public interface IDAL_AttachMent : IDAL_Base
	{
		/// <summary>
		/// 增加一条数据
		/// </summary>
		/// <param name="model">实体对象</param>
		/// <returns>返回影响行数</returns>
		int Add(AttachMent model);

		/// <summary>
		/// 更新一条数据
		/// </summary>
		/// <param name="model">实体对象</param>
		/// <returns>返回影响行数</returns>
		int Update(AttachMent model);

		/// <summary>
		/// 根据ID和值更新一条数据
		/// </summary>
		/// <param name="AID">编号ID</param>
		/// <param name="value">更新值（filedName=filedValue）</param>
		/// <returns>返回影响行数</returns>
		int Update(int AID, string value);

		/// <summary>
		/// 删除一条数据
		/// </summary>
		/// <param name="AID">编号ID</param>
		/// <returns>返回影响行数</returns>
		int Delete(int AID);

        /// <summary>
        /// 批量删除文章
        /// </summary>
        /// <param name="ID">文章ID，多个ID用,号隔开</param>
        /// <returns>返回影响行数</returns>
        int Delete(string ID);


		/// <summary>
		/// 是否存在该记录
		/// </summary>
		/// <param name="AID">编号ID</param>
		/// <param name="filedName">字段名称</param>
		/// <param name="filedValue">字段值</param>
		/// <returns>存在返回true，不存在返回false</returns>
		bool Exists(int AID, string filedName, string filedValue);

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		/// <param name="AID">编号ID</param>
		/// <returns>实体对象</returns>
		AttachMent GetModel(int AID);

        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）
        /// </summary>
        /// <param name="filed">要查询的字段</param>
        /// <param name="where">查询条件</param>
        /// <returns>Object对象</returns>
        object GetSingle(string filed, string where);

		/// <summary>
		/// 根据查询字段获取列表
		/// </summary>
		/// <param name="fileds">要查询的字段，多个字段用,号隔开</param>
		/// <returns>DataTable数据集合</returns>
		DataTable GetDataTable(string fileds, string where);

		/// <summary>
		/// 获取泛型数据列表
		/// </summary>
		/// <param name="count">返回记录数</param>
		/// <returns>对象泛型集合</returns>
		List<AttachMent> GetList(out int count);

		/// <summary>
		/// 分页获取泛型数据列表
		/// </summary>
		/// <param name="pageSize">分页大小</param>
		/// <param name="pageIndex">当前页数</param>
		/// <param name="count">返回记录总数</param>
		/// <returns>分页对象泛型集合</returns>
		List<AttachMent> GetPageList(int pageSize, int pageIndex, out int count);

        /// <summary>
        /// 字符串缓存实现的通用分页存储过程  
        /// </summary>
        DataTable GetPageList(string tbname, string fieldKey, int pageCurrent, int pageSize, string fieldShow, string fieldOrder, string where, out int pageCount);
	}
}
