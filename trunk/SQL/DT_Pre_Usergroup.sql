USE [DTCMS]
GO
/****** 对象:  Table [dbo].[DT_Pre_Usergroup]    脚本日期: 01/06/2010 16:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DT_Pre_Usergroup](
	[GID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL CONSTRAINT [DF_DT_Pre_Usergroup_GroupType]  DEFAULT ((0)),
	[GroupName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[CreditBegin] [int] NULL CONSTRAINT [DF_DT_Pre_Usergroup_CreditBegin]  DEFAULT ((0)),
	[CreditEnd] [int] NULL CONSTRAINT [DF_DT_Pre_Usergroup_CreditEnd]  DEFAULT ((0)),
	[stars] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_stars]  DEFAULT ((0)),
	[GroupAvatar] [varchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Readaccess] [int] NULL CONSTRAINT [DF_DT_Pre_Usergroup_Readaccess]  DEFAULT ((0)),
	[AllowPost] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowPost]  DEFAULT ((0)),
	[AllowComment] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowComment]  DEFAULT ((0)),
	[AllowDownload] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowDownload]  DEFAULT ((0)),
	[AllowAvatar] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowAvatar]  DEFAULT ((0)),
	[AllowSpace] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowSpace]  DEFAULT ((0)),
	[AllowTransfer] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowTransfer]  DEFAULT ((0)),
	[AllowViewInfo] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowViewInfo]  DEFAULT ((0)),
	[AllowNickname] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowNickname]  DEFAULT ((0)),
	[MaxPMNum] [smallint] NULL,
	[MaxSignSize] [smallint] NULL,
	[MaxAttachSize] [int] NULL,
	[MaxAttachTotalSize] [int] NULL,
	[AttachExtension] [varchar](200) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_DT_Pre_Usergroup] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组ID' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'GID'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组类型，1系统组，2管理组，0用户组' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'Type'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组名' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'GroupName'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始积分' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'CreditBegin'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束积分' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'CreditEnd'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'星星等级' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'stars'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组头像' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'GroupAvatar'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读权限' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'Readaccess'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许发布文章，1允许，0不允许' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'AllowPost'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许评论' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'AllowComment'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许下载附件' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'AllowDownload'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许使用头像，0不允许，1允许使用系统自带头像，2允许使用URL地址头像，3允许使用上传头像' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'AllowAvatar'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许开通个人空间' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'AllowSpace'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许积分转账' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'AllowTransfer'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许查看其他用户资料' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'AllowViewInfo'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许使用昵称' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'AllowNickname'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短消息最大条数' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'MaxPMNum'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签名最大字节数' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'MaxSignSize'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件最大尺寸' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'MaxAttachSize'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件最大总尺寸' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'MaxAttachTotalSize'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许上传附件类型，例：.txt,.rar,.jpg' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DT_Pre_Usergroup', @level2type=N'COLUMN', @level2name=N'AttachExtension'
