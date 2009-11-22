﻿using System;
using System.Collections.Generic;
using System.Text;
using DTCMS.DALFactory;
using DTCMS.IDAL;
using DTCMS.Entity;
namespace DTCMS.BLL
{
    public class Arc_ClassBLL : BaseBLL
    {
        IDAL_Arc_Class dalArcClass = DataAccess.CreateFactoryDAL<IDAL_Arc_Class>("Arc_ClassDAL");
         /// <summary>
        /// 判断某个字段值是否存在
        /// </summary>
        /// <param name="CID">栏目编号</param>
        /// <param name="filedName">字段名称</param>
        /// <param name="filedValue">字段值</param>
        /// <returns>成功返回true，失败返回false</returns>
        public bool Exists(int CID, string filedName, string filedValue)
        {
           return dalArcClass.Exists(CID, filedName, filedValue);
        }
        /// <summary>
        /// 添加栏目
        /// </summary>
        /// <param name="Entity">栏目实体对象</param>
        /// <returns>返回影响行数</returns>
        public int Add(Arc_Class model)
        {
            return dalArcClass.Add(model);
        }
         /// <summary>
        /// 更新栏目
        /// </summary>
        /// <param name="Entity">栏目实体对象</param>
        /// <returns>返回影响行数</returns>
        public int Update(Arc_Class model)
        {
            return dalArcClass.Update(model);
        }
         /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="CID">栏目编号</param>
        /// <returns>返回影响行数</returns>
        public int Delete(int CID)
        {
            return dalArcClass.Delete(CID);
        }
        /// <summary>
        /// 得到一条数据
        /// </summary>
        /// <param name="CID">栏目ID</param>
        /// <returns>栏目实体</returns>
        public Arc_Class GetModel(int CID)
        {
            return dalArcClass.GetModel(CID);
        }
         /// <summary>
        /// 获取栏目关系
        /// </summary>
        /// <param name="ParentID">父栏目ID</param>
        /// <returns>栏目关系</returns>
        public string GetRelation(int ParentID)
        {
            return dalArcClass.GetRelation(ParentID);
        }
        /// <summary>
        /// 获取栏目深度
        /// </summary>
        /// <returns>栏目深度</returns>
        public int GetClassDepth(int ParentID)
        {
            string iRelation = GetRelation(ParentID);

            if (iRelation == "")
            {
                return 1;
            }
            return iRelation.Split('.').Length + 1;
        }
         /// <summary>
        /// 获取符栏目名称
        /// </summary>
        /// <param name="ParentID">父栏目ID</param>
        /// <returns>栏目名称</returns>
        public string GetParentName(int ParentID)
        {
            return dalArcClass.GetParentName(ParentID);
        }
    }
}