﻿//------------------------------------------------------------------------------
// 创建标识: Copyright (C) 2010 91aspx.com 版权所有
// 创建描述: DTCMS V1.0 创建于 2010-1-10 19:36:36
// 功能描述: 
// 修改标识: 
// 修改描述: 
//------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Text;
using DTCMS.Entity;
using DTCMS.IDAL;
using DTCMS.DALFactory;

namespace DTCMS.BLL
{
	/// <summary>
	/// 业务逻辑类 Arc_Class
	/// </summary>
	public class Arc_ClassBLL
	{
		private readonly IDAL_Arc_Class dal = DataAccess.CreateFactoryDAL<IDAL_Arc_Class>("Arc_ClassDAL");

		public Arc_ClassBLL()
		{ }

        /// <summary>
        /// 添加栏目
        /// </summary>
        /// <param name="model">栏目实体对象</param>
        /// <returns>返回影响行数</returns>
        public int Add(Arc_Class model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 更新栏目
        /// </summary>
        /// <param name="model">栏目实体对象</param>
        /// <returns>返回影响行数</returns>
        public int Update(Arc_Class model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 更新排序
        /// </summary>
        /// <param name="cid">栏目ID</param>
        /// <param name="order">排序编号</param>
        /// <returns></returns>
        public int UpdateOrder(int cid, int order)
        {
            return dal.Update(cid, "OrderID=" + order);
        }

        /// <summary>
		/// 删除一条数据
		/// </summary>
        /// <param name="CID">CID</param>
        /// <returns>返回影响行数</returns>
        public int Delete(int CID)
        {
            return dal.Delete(CID);
        }

        /// <summary>
		/// 判断某个字段值是否存在
		/// </summary>
        /// <param name="CID">CID</param>
        /// <param name="filedName">字段名称</param>
        /// <param name="filedValue">字段值</param>
        /// <returns>成功返回true，失败返回false</returns>
        public bool Exists(int CID, string filedName, string filedValue)
        {
            return dal.Exists(CID, filedName, filedValue);
        }

        /// <summary>
		/// 得到一个对象实体
		/// </summary>
        /// <param name="CID">CID</param>
        /// <returns>实体对象</returns>
        public Arc_Class GetModel(int CID)
        {
            return dal.GetModel(CID);
        }

        /// <summary>
		/// 获得泛型数据列表
		/// </summary>
        /// <param name="count">返回记录数</param>
        /// <returns>对象泛型集合</returns>
        public List<Arc_Class> GetList(out long count)
        {
            return dal.GetList(out count);
        }

        /// <summary>
		/// 分页获取泛型数据列表
		/// </summary>
        /// <param name="pageSize">分页大小</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="count">返回记录数</param>
        /// <returns>分页对象泛型集合</returns>
        public List<Arc_Class> GetPageList(int pageSize, int pageIndex, out long count)
        {
            if (pageSize <= 0)
                throw new Exception("每页数据条数必须大于0。");

            if (pageIndex <= 0)
                throw new Exception("页索引必须大于0。");

            return dal.GetPageList(pageSize, pageIndex, out count);
        }
	}
}
