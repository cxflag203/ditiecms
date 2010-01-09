﻿//------------------------------------------------------------------------------
// 创建标识: Copyright (C) 2010 91aspx.com 版权所有
// 创建描述: DTCMS V1.0 创建于 2010-1-9 0:23:01
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
	/// 接口层 IArc_Soft
	/// </summary>
	public interface IDAL_Arc_Soft
	{
		/// <summary>
		/// 增加一条数据
		/// </summary>
		int Add(Arc_Soft model);

		/// <summary>
		/// 更新一条数据
		/// </summary>
		int Update(Arc_Soft model);

		/// <summary>
		/// 删除一条数据
		/// </summary>
		int Delete(int AID);

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		bool Exists(int AID);

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		Arc_Soft GetModel(int AID);

		/// <summary>
		/// 获取泛型数据列表
		/// </summary>
		List<Arc_Soft> GetList(out long count);

		/// <summary>
		/// 分页获取泛型数据列表
		/// </summary>
		List<Arc_Soft> GetPageList(int pageSize, int pageIndex, out long count);
	}
}
