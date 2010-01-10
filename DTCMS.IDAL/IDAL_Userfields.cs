﻿//------------------------------------------------------------------------------
// 创建标识: Copyright (C) 2010 91aspx.com 版权所有
// 创建描述: DTCMS V1.0 创建于 2010-1-10 21:34:57
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
	/// 接口层 IUserfields
	/// </summary>
	public interface IDAL_Userfields
	{
		/// <summary>
		/// 增加一条数据
		/// </summary>
		/// <param name="model">实体对象</param>
		/// <returns>返回影响行数</returns>
		int Add(Userfields model);

		/// <summary>
		/// 更新一条数据
		/// </summary>
		/// <param name="model">实体对象</param>
		/// <returns>返回影响行数</returns>
		int Update(Userfields model);

		/// <summary>
		/// 根据ID和值更新一条数据
		/// </summary>
		/// <param name="UID">编号ID</param>
		/// <param name="value">更新值（fieldName=fieldValue）</param>
		/// <returns>返回影响行数</returns>
		int Update(int UID, string value);

		/// <summary>
		/// 删除一条数据
		/// </summary>
		/// <param name="UID">编号ID</param>
		/// <returns>返回影响行数</returns>
		int Delete(int UID);

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		/// <param name="UID">编号ID</param>
		/// <param name="filedName">字段名称</param>
		/// <param name="filedValue">字段值</param>
		/// <returns>存在返回true，不存在返回false</returns>
		bool Exists(int UID, string filedName, string filedValue);

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		/// <param name="UID">编号ID</param>
		/// <returns>实体对象</returns>
		Userfields GetModel(int UID);

		/// <summary>
		/// 获取泛型数据列表
		/// </summary>
		/// <param name="count">返回记录数</param>
		/// <returns>对象泛型集合</returns>
		List<Userfields> GetList(out long count);

		/// <summary>
		/// 分页获取泛型数据列表
		/// </summary>
		/// <param name="pageSize">分页大小</param>
		/// <param name="pageIndex">当前页数</param>
		/// <param name="count">返回记录总数</param>
		/// <returns>分页对象泛型集合</returns>
		List<Userfields> GetPageList(int pageSize, int pageIndex, out long count);
	}
}
