//------------------------------------------------------------------------------
// 创建标识: Copyright (C) 2010 91aspx.com 版权所有
// 创建描述: DTCMS V1.0 创建于 2009-12-12 23:56:15
// 功能描述: 
// 修改标识:
// 修改描述: 
//------------------------------------------------------------------------------
using System;
using System.Web;
using System.Web.Caching;

namespace DTCMS.Common
{
    /// <summary>
    /// 公共类，用于缓存对象操作
    /// </summary>
    public sealed class CacheAccess
    {

        /// <summary>
        /// 将对象加入到缓存中
        /// </summary>
        /// <param name="cacheKey">缓存键</param>
        /// <param name="cacheObject">缓存对象</param>
        public static void SaveToCache(string cacheKey, object cacheObject)
        {
            Cache cache = HttpRuntime.Cache;
            cache.Insert(cacheKey, cacheObject);
        }

        /// <summary>
        /// 将对象加入到缓存中
        /// </summary>
        /// <param name="cacheKey">缓存键</param>
        /// <param name="cacheObject">缓存对象</param>
        /// <param name="cacheDependency">缓存依赖项</param>
        public static void SaveToCache(string cacheKey, object cacheObject, CacheDependency cacheDependency)
        {
            Cache cache = HttpRuntime.Cache;
            cache.Insert(cacheKey, cacheObject, cacheDependency);
        }

        /// <summary>
        /// 将对象加入到缓存中
        /// </summary>
        /// <param name="cacheKey">缓存键</param>
        /// <param name="cacheObject">缓存对象</param>
        /// <param name="absoluteExpiration">时间</param>
        /// <param name="slidingExpiration">时间</param>
        public static void SaveToCache(string cacheKey, object cacheObject, DateTime absoluteExpiration, TimeSpan slidingExpiration)
        {
            Cache cache = HttpRuntime.Cache;
            cache.Insert(cacheKey, cacheObject, null, absoluteExpiration, slidingExpiration);
        }

        /// <summary>
        /// 从缓存中取出对象，如不存在返回NULL
        /// </summary>
        /// <param name="cacheKey">缓存键</param>
        /// <returns>取出缓存对象</returns>
        public static object GetFromCache(string cacheKey)
        {
            Cache cache = HttpRuntime.Cache;
            return cache[cacheKey];
        }
    }
}
