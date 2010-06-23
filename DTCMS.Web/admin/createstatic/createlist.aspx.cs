﻿using System;
using System.Web;
using System.Text;
using System.IO;
using System.Web.SessionState;
using DTCMS.Common;
using DTCMS.BLL;
using DTCMS.BLL.TemplateEngine;
using DTCMS.TemplateEngine;

namespace DTCMS.Web.admin.createstatic
{
    public partial class createlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.TestType = Request.QueryString["testtype"];

            //输出数据
            this.LoadCurrentTemplate();
            this.InitPageTemplate();
            this.Document.Render(this.Response.Output);
        }

        #region 当前页面的测试类型
        /// <summary>
        /// 测试类型
        /// </summary>
        private string TestType { get; set; }
        #endregion

        /// <summary>
        /// 当前页面的模板文档对象
        /// </summary>
        protected TemplateDocument Document
        {
            get;
            private set;
        }
        /// <summary>
        /// 当前页面的模板文档的配置参数
        /// </summary>
        protected virtual TemplateDocumentConfig DocumentConfig
        {
            get
            {
                return TemplateDocumentConfig.Default;
            }
        }
        /// <summary>
        /// 是否读取缓存模板
        /// </summary>
        protected virtual bool IsLoadCacheTemplate
        {
            get
            {
                return true;
            }
        }

        /// <summary>
        /// 装载当前页面的模板文档
        /// </summary>
        public virtual void LoadCurrentTemplate()
        {
            this.LoadTemplateFile(this.Server.MapPath("~/template/default/article_list.html"));
        }
        /// <summary>
        /// 装载模板文件
        /// </summary>
        /// <param name="fileName"></param>
        protected virtual void LoadTemplateFile(string fileName)
        {
            this.Document = null;
            if ("cache".Equals(this.TestType, StringComparison.InvariantCultureIgnoreCase) || this.IsLoadCacheTemplate)
            {
                //测试缓存模板文档
                this.Document = TemplateDocument.FromFileCache(fileName, Encoding.UTF8, this.DocumentConfig);
            }
            else
            {
                //测试实例模板文档
                this.Document = new TemplateDocument(fileName, Encoding.UTF8, this.DocumentConfig);
            }
        }

        /// <summary>
        /// 初始化当前页面模板数据
        /// </summary>
        protected void InitPageTemplate()
        {
            //获取要生成的栏目ID
            int channelID = Utils.GetQueryInt("channelID");
            if (channelID < 0)
            {
                Message.Dialog("生成错误，生成静态页的栏目ID为空！", "-1", MessageIcon.Warning);
            }
            else
            {
                CacheAccess.SaveToCache("ChannelID", channelID);
            }

            //获取栏目类型
            string classType = Utils.GetQueryString("classtype");
            if (classType.Length == 0)
            {
                ArcListBLL arclistBll = new ArcListBLL();
                classType = arclistBll.GetChannelType(channelID);
            }

            //获取生成栏目当前页数
            int pageIndex = Utils.GetQueryInt("pageindex");
            if (pageIndex < 0)
            {
                Message.Dialog("生成错误，生成静态页的当前页数为空！", "-1", MessageIcon.Warning);
            }
            else
            {
                CacheAccess.SaveToCache("PageIndex", pageIndex);
            }

            //获取记录总数
            int totalRecord = Utils.GetQueryInt("totalrecord");
            if (totalRecord < 0)
            {
                ArcListBLL arclistBll = new ArcListBLL();
                totalRecord = arclistBll.GetArcCount(channelID, classType);
            }

            //Tag tag = this.Document.TagName
            Gobal gobal = new Gobal();
            ElementCollection<Tag> tags = this.Document.GetChildTagsByTagName("PageList");
            foreach (Tag tag in tags)
            {
                gobal.PageItem = tag.Attributes["Item"].Value.ToString();
            }


            //获取自定义属性

            this.Document.Variables.SetValue("gobal", gobal);
        }
    }

    /// <summary>
    /// 全局数据实体类
    /// </summary>
    public class Gobal
    {
        private int _totalRecord;
        private int _currentPage;
        private int _totalPage;
        private string _pageItem;

        /// <summary>
        /// 总记录数
        /// </summary>
        public int TotalRecord
        {
            get { return _totalRecord; }
            set { _totalRecord = value; }
        }

        /// <summary>
        /// 当前页数
        /// </summary>
        public int CurrentPage
        {
            get { return _currentPage; }
            set { _currentPage = value; }
        }

        /// <summary>
        /// 总页数
        /// </summary>
        public int TotalPage
        {
            get { return _totalPage; }
            set { _totalPage = value; }
        }

        /// <summary>
        /// 分页标签
        /// </summary>
        public string PageItem
        {
            get { return _pageItem; }
            set { _pageItem = value; }
        }
    }
}