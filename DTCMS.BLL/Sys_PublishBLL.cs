﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using DTCMS.Common;
using DTCMS.DALFactory;
using DTCMS.IDAL;
using DTCMS.Entity;

namespace DTCMS.BLL
{
    public class Sys_PublishBLL
    {
        IDAL_Sys_Publish dalPublish = DataAccess.CreateFactoryDAL<IDAL_Sys_Publish>("Sys_PublishDAL");

        /// <summary>
        /// 得到所有的栏目信息
        /// </summary>
        /// <param name="totalCount">共多少条数据</param>
        /// <returns></returns>
        public DataTable GetClassByClassID(int CID,out int totalCount)
        {
            return dalPublish.GetClassByClassID(CID,out totalCount);
        }

        /// <summary>
        /// 根据栏目编号获取栏目信息
        /// </summary>
        /// <param name="CID">栏目编号</param>
        /// <returns></returns>
        public Arc_Class GetClassByID(int CID)
        {
            return dalPublish.GetClassByID(CID);
        }

        /// <summary>
        /// 按照类别编号发布文章
        /// </summary>
        /// <param name="CID">类别编号</param>
        /// <param name="publishchild">是否发布其子栏目</param>
        /// <param name="orderBy">文章排序</param>
        /// <param name="orderWay">排序方式 desc asc</param>
        /// <param name="totalCount">共有多少条</param>
        /// <returns></returns>
        public DataTable GetArticleByClassID(int CID, string orderBy, string orderWay, out int totalCount)
        {
            return dalPublish.GetArticleByClassID(CID, orderWay, orderWay,out totalCount);
        }

        /// <summary>
        /// 按照日期发布文章
        /// </summary>
        /// <param name="CID">类别编号</param>
        /// <param name="publishchild">是否发布其子栏目</param>
        /// <param name="orderBy">文章排序</param>
        /// <param name="totalCount">共有多少条</param>
        /// <returns></returns>
        public DataTable GetArticleByTime(DateTime startTime, DateTime endTime, out int totalCount)
        {
            return dalPublish.GetArticleByTime(startTime,endTime, out totalCount);
        }

        /// <summary>
        /// 根据文章编号范围发布 
        /// </summary>
        /// <param name="minId">开始编号</param>
        /// <param name="maxId">结束编号</param>
        /// <param name="totalCount">共有几条数据</param>
        /// <returns></returns>
        public DataTable GetArticleByID(int minId, int maxId, out int totalCount)
        {
            return dalPublish.GetArticleByID(minId, maxId,out totalCount);
        }

        /// <summary>
        /// 根据组合条件获取前多少条数据
        /// </summary>
        /// <param name="topnum">前多少条数据</param>
        /// <param name="orderBy">排序字段</param>
        /// <param name="orderWay">排序方式 desc asc</param>
        /// <param name="search">组合条件</param>
        /// <returns></returns>
        public DataTable GetTopArticleBySearch(int topnum, string orderBy, string orderWay, string search)
        {
            return dalPublish.GetTopArticleBySearch(topnum,orderBy,orderWay,search);
        }
    }
}