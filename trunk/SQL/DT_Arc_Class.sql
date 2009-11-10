USE [dtcms]
GO
/****** 对象:  Table [dbo].[DT_Arc_Class]    脚本日期: 11/10/2009 21:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DT_Arc_Class](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ClassType] [tinyint] NOT NULL,
	[ParentID] [int] NOT NULL CONSTRAINT [DF_DT_Arc_Class_ParentID]  DEFAULT (0),
	[Relation] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Attribute] [tinyint] NOT NULL,
	[IndexTemplet] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ListTemplet] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ArchiveTemplet] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ImgUrl] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[ClassPage] [tinyint] NULL,
	[ClassPath] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[ListRule] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[ArchiveRule] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Keywords] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[IsComment] [tinyint] NULL,
	[IsRedirect] [tinyint] NULL,
	[IsHtml] [tinyint] NULL,
	[IsHidden] [tinyint] NULL,
	[Readaccess] [smallint] NULL,
	[SiteID] [tinyint] NULL,
	[ClassUrl] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[CrossID] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[AddDate] [datetime] NOT NULL,
	[OrderID] [smallint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'CID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ClassType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目父ID，默认0为顶级栏目' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目深度，顶级栏目为1，二级栏目为2，以此类推' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'Relation'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目属性，1封面，2列表，3链接地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'Attribute'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'封面模版' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'IndexTemplet'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'列表模版' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ListTemplet'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档模版' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ArchiveTemplet'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目图片地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目分页大小,列表条数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ClassPage'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目目录，{#CmsPath}/Archive/' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ClassPath'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'列表页规则，访问路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ListRule'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档页规则，访问路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ArchiveRule'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目关键字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'Keywords'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'本栏目文章是否允许评论，1允许，0不允许' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'IsComment'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否跳转地址，1是，0否' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'IsRedirect'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否生成静态页，1生成静态，0动态访问' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'IsHtml'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否隐藏，1启用，0隐藏' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'IsHidden'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'Readaccess'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'站点ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'SiteID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目地址,二级域名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'ClassUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'交叉栏目，多个栏目用,号隔开' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'CrossID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目排序，升序排列' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Arc_Class', @level2type=N'COLUMN',@level2name=N'OrderID'