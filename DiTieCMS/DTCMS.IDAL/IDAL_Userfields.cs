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
	/// 接口层 IUserfields
	/// </summary>
    public interface IDAL_Userfields : IDAL_Base
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
		/// <param name="value">更新值（filedName=filedValue）</param>
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
        /// 执行一条计算查询结果语句，返回查询结果（object）
        /// </summary>
        /// <param name="filed">要查询的字段</param>
        /// <param name="where">查询条件</param>
        /// <returns>Object对象</returns>
        object GetSingle(string filed, string where);
	}
}
