USE [DTCMS]
GO
/****** 对象:  Table [dbo].[DT_Userfields]    脚本日期: 01/06/2010 17:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DT_Userfields](
	[UID] [int] NOT NULL,
	[Realname] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[QQ] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[MSN] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Skype] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Phone] [char](16) COLLATE Chinese_PRC_CI_AS NULL,
	[Mobilephone] [char](11) COLLATE Chinese_PRC_CI_AS NULL,
	[Location] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Adress] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[IDcard] [varchar](18) COLLATE Chinese_PRC_CI_AS NULL,
	[Signature] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Introduce] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[Website] [varchar](100) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_DT_Userfields] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID，user表外键' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'UID'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'Realname'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ号码，支持Email帐号' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'QQ'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MSN帐号' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'MSN'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Skype帐号' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'Skype'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'固定电话' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'Phone'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'Adress'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'IDcard'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个性签名' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'Signature'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人简介' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'Introduce'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人网站' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Userfields', @level2type=N'COLUMN', @level2name=N'Website'
