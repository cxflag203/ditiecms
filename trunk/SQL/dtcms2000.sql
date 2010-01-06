/****** 对象:  Table [dbo].[DT_SYS_Help]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_SYS_Help]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_SYS_Help](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HelpID] [nchar](8) NOT NULL,
	[PID] [nchar](8) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Message] [nvarchar](1000) NULL,
	[OrderID] [int] NULL CONSTRAINT [DF_DT_SYS_Help_OrderID]  DEFAULT (0),
 CONSTRAINT [PK_DT_SYS_Help] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_SYS_Template]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_SYS_Template]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_SYS_Template](
	[TemplateID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](50) NOT NULL,
	[TemplateDirectory] [nvarchar](200) NOT NULL,
	[isEnable] [tinyint] NOT NULL,
	[CreateDateTime] [datetime] NULL,
	[TemplateImg] [nvarchar](200) NULL,
	[Author] [nvarchar](50) NULL,
 CONSTRAINT [PK_DT_SYS_Template] PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_Arc_Class]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_Arc_Class]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_Arc_Class](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL CONSTRAINT [DF_DT_Arc_Class_ParentID]  DEFAULT (0),
	[Attribute] [tinyint] NOT NULL,
	[ClassName] [nvarchar](100) NOT NULL,
	[ClassEName] [nvarchar](100) NULL,
	[ClassType] [tinyint] NOT NULL,
	[ClassDomain] [nvarchar](200) NULL,
	[ClassPath] [nvarchar](200) NULL,
	[IndexTemplet] [nvarchar](200) NULL,
	[ListTemplet] [nvarchar](200) NULL,
	[ArchiveTemplet] [nvarchar](200) NULL,
	[IndexRule] [nvarchar](200) NULL,
	[ListRule] [nvarchar](200) NULL,
	[ArchiveRule] [nvarchar](200) NULL,
	[ClassPage] [tinyint] NULL,
	[Description] [nvarchar](500) NULL,
	[IsHidden] [tinyint] NOT NULL,
	[IsHtml] [tinyint] NOT NULL,
	[CheckLevel] [tinyint] NOT NULL,
	[IsContribute] [tinyint] NOT NULL,
	[IsComment] [tinyint] NOT NULL,
	[Readaccess] [smallint] NULL,
	[SiteID] [tinyint] NULL,
	[AddDate] [datetime] NOT NULL,
	[Relation] [nvarchar](200) NULL,
	[OrderID] [smallint] NOT NULL,
	[ImgUrl] [nvarchar](200) NULL,
	[Keywords] [nvarchar](200) NULL,
	[CrossID] [nvarchar](200) NULL,
	[Content] [ntext] NULL,
 CONSTRAINT [PK_DT_Arc_Class] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_Atr_AttachMent]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_Atr_AttachMent]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_Atr_AttachMent](
	[AttachMentID] [int] IDENTITY(1,1) NOT NULL,
	[AttachMentAttribute] [int] NOT NULL,
	[AttachMentDisplayName] [nvarchar](50) NULL,
	[AttachMentPath] [nvarchar](500) NULL,
	[AttachMentSize] [nvarchar](50) NULL,
	[AbbrPhotoPath] [nvarchar](500) NULL,
	[PubLisher] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[PhotoDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_DT_Atr_AttachMent_Phone] PRIMARY KEY CLUSTERED 
(
	[AttachMentID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'DT_Atr_AttachMent', N'COLUMN',N'AttachMentID'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Atr_AttachMent', @level2type=N'COLUMN',@level2name=N'AttachMentID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'DT_Atr_AttachMent', N'COLUMN',N'AttachMentAttribute'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件类型属性，1图片、2视频、3音频、4flash、5附件、6其它' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Atr_AttachMent', @level2type=N'COLUMN',@level2name=N'AttachMentAttribute'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'DT_Atr_AttachMent', N'COLUMN',N'AttachMentDisplayName'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件显示名称，上传文件名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Atr_AttachMent', @level2type=N'COLUMN',@level2name=N'AttachMentDisplayName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'DT_Atr_AttachMent', N'COLUMN',N'AttachMentPath'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Atr_AttachMent', @level2type=N'COLUMN',@level2name=N'AttachMentPath'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'DT_Atr_AttachMent', N'COLUMN',N'AttachMentSize'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件大小' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Atr_AttachMent', @level2type=N'COLUMN',@level2name=N'AttachMentSize'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'DT_Atr_AttachMent', N'COLUMN',N'AbbrPhotoPath'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'缩略图地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Atr_AttachMent', @level2type=N'COLUMN',@level2name=N'AbbrPhotoPath'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'DT_Atr_AttachMent', N'COLUMN',N'PubLisher'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Atr_AttachMent', @level2type=N'COLUMN',@level2name=N'PubLisher'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'DT_Atr_AttachMent', N'COLUMN',N'AddDate'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Atr_AttachMent', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'USER',N'dbo', N'TABLE',N'DT_Atr_AttachMent', N'COLUMN',N'PhotoDescription'))
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DT_Atr_AttachMent', @level2type=N'COLUMN',@level2name=N'PhotoDescription'
GO
/****** 对象:  StoredProcedure [dbo].[pagehelper]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[pagehelper]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- 字符串缓存实现的通用分页存储过程(转自邹建)  
CREATE PROC [dbo].[pagehelper]  
@tbname     nvarchar(1000)='''',               --要分页显示的表名，可以使用表联合  
@FieldKey   nvarchar(1000)='''',               --用于定位记录的主键(惟一键)字段,只能是单个字段  
@PageCurrent int=1,                 --要显示的页码  
@PageSize   int=10,                --每页的大小(记录数)  
@FieldShow  nvarchar(1000)='''',      --以逗号分隔的要显示的字段列表,如果不指定,则显示所有字段  
@FieldOrder  nvarchar(1000)='''',     --以逗号分隔的排序字段列表,可以指定在字段后面指定DESC/ASC  
                                    -- 用于指定排序顺序  
@Where     nvarchar(1000)='''',      --查询条件  
@PageCount  int OUTPUT            --总页数  
AS  
DECLARE @sql nvarchar(4000)  
SET NOCOUNT ON  

--分页字段检查  
IF ISNULL(@FieldKey,N'''')=''''  
BEGIN  
    RAISERROR(N''分页处理需要主键（或者惟一键）'',1,16)  
    RETURN  
END  
--其他参数检查及规范  
IF ISNULL(@PageCurrent,0)<1 SET @PageCurrent=1  
IF ISNULL(@PageSize,0)<1 SET @PageSize=10  
IF ISNULL(@FieldShow,N'''')=N'''' SET @FieldShow=N''*''  
IF ISNULL(@FieldOrder,N'''')=N''''  
    SET @FieldOrder=N''''  
ELSE  IF CHARINDEX(''ORDER BY'',@FieldOrder)!=0
	SET @FieldOrder=LTRIM(@FieldOrder)
ELSE
    SET @FieldOrder=N''ORDER BY ''+LTRIM(@FieldOrder)  
IF ISNULL(@Where,N'''')=N''''  
    SET @Where=N''''  
ELSE  
    SET @Where=N''WHERE (''+@Where+N'')''  
--如果@PageCount为NULL值,则计算总页数(这样设计可以只在第一次计算总页数,以后调用时,把总页数传回给存储过程,避免再次计算总页数,对于不想计算总页数的处理而言,可以给@PageCount赋值)  
IF @PageCount IS NULL  
BEGIN  
    SET @sql=N''SELECT @PageCount=COUNT(*)''  
        +N'' FROM ''+@tbname  
        +N'' ''+@Where  
    EXEC sp_executesql @sql,N''@PageCount int OUTPUT'',@PageCount OUTPUT  
    --SET @PageCount=(@PageCount+@PageSize-1)/@PageSize  
END  

--@PageCount总记录数为0退出
IF @PageCount = 0
BEGIN
return 
END

--计算分页显示的TOPN值  
DECLARE @TopN varchar(20),@TopN1 varchar(20)  
SELECT @TopN=@PageSize,  
    @TopN1=@PageCurrent*@PageSize      
--第一页直接显示  
IF @PageCurrent=1  
    EXEC(N''SELECT TOP ''+@TopN  
        +N'' ''+@FieldShow  
        +N'' FROM ''+@tbname  
        +N'' ''+@Where  
        +N'' ''+@FieldOrder)  
ELSE  
BEGIN  
    SELECT @PageCurrent=@TopN1,  
        @sql=N''SELECT @n=@n-1,@s=CASE WHEN @n<''+@TopN  
            +N'' THEN @s+N'''',''''+QUOTENAME(RTRIM(CAST(''+@FieldKey  
            +N'' as varchar(8000))),N'''''''''''''''') ELSE N'''''''' END FROM ''+@tbname  
            +N'' ''+@Where  
            +N'' ''+@FieldOrder  

    SET ROWCOUNT @PageCurrent  
    EXEC sp_executesql @sql,  
        N''@n int,@s nvarchar(4000) OUTPUT'',  
        @PageCurrent,@sql OUTPUT  
    SET ROWCOUNT 0  
    IF @sql=N''''  
        EXEC(N''SELECT TOP 0''  
            +N'' ''+@FieldShow  
            +N'' FROM ''+@tbname)  
    ELSE  
    BEGIN  
        SET @sql=STUFF(@sql,1,1,N'''')          
        --执行查询   EXEC
        EXEC (N''SELECT TOP ''+@TopN  
            +N'' ''+@FieldShow  
            +N'' FROM ''+@tbname  
            +N'' ''+@Where + '' and '' + @FieldKey  
            +N'' IN(''+@sql  
            +N'') ''+@FieldOrder ) 
	END
END




' 
END
GO
/****** 对象:  Table [dbo].[DT_SYS_Dict]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_SYS_Dict]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_SYS_Dict](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Url] [nvarchar](50) NULL,
	[Email] [nvarchar](20) NULL,
	[Hits] [int] NULL CONSTRAINT [DF_DT_SYS_Dict_Hits]  DEFAULT (0),
 CONSTRAINT [PK_DT_SYS_Dict] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_SYS_QNavigate]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_SYS_QNavigate]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_SYS_QNavigate](
	[QID] [int] IDENTITY(1,1) NOT NULL,
	[QName] [nvarchar](50) NOT NULL,
	[FilePath] [nvarchar](200) NULL,
	[ISSys] [tinyint] NULL CONSTRAINT [DF_DT_Sys_QNavigate_ISSys]  DEFAULT (0),
	[OrderID] [int] NULL CONSTRAINT [DF_DT_Sys_QNavigate_OrderID]  DEFAULT (0),
 CONSTRAINT [PK_DT_Sys_QNavigate] PRIMARY KEY CLUSTERED 
(
	[QID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_Arc_Soft]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_Arc_Soft]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_Arc_Soft](
	[AID] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_SYS_Navigate]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_SYS_Navigate]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_SYS_Navigate](
	[NID] [int] IDENTITY(1,1) NOT NULL,
	[NvaID] [nvarchar](20) NOT NULL,
	[ParentID] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[EName] [nvarchar](50) NULL,
	[FilePath] [nvarchar](200) NULL,
	[MainURL] [nvarchar](200) NULL,
	[Target] [nvarchar](20) NULL,
	[CopyrightCode] [int] NULL CONSTRAINT [DF_DT_SYS_Navigate_CopyrightCode]  DEFAULT (0),
	[OrderID] [int] NULL CONSTRAINT [DF_Sys_Navigate_OrderID]  DEFAULT (0),
	[CreateTime] [datetime] NULL,
	[ISSys] [tinyint] NULL CONSTRAINT [DF_DT_SYS_Navigate_ISSys]  DEFAULT (0),
	[ISEnable] [tinyint] NULL CONSTRAINT [DF_DT_SYS_Navigate_ISEnable]  DEFAULT (1),
 CONSTRAINT [PK_Sys_Navigate] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_Pre_Usergroup]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_Pre_Usergroup]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_Pre_Usergroup](
	[GID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL CONSTRAINT [DF_DT_Pre_Usergroup_GroupType]  DEFAULT (0),
	[IsSystem] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_IsSystem]  DEFAULT (0),
	[GroupName] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[CreditBegin] [int] NULL CONSTRAINT [DF_DT_Pre_Usergroup_CreditBegin]  DEFAULT (0),
	[CreditEnd] [int] NULL CONSTRAINT [DF_DT_Pre_Usergroup_CreditEnd]  DEFAULT (0),
	[stars] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_stars]  DEFAULT (0),
	[GroupAvatar] [varchar](200) NULL,
	[Readaccess] [int] NULL CONSTRAINT [DF_DT_Pre_Usergroup_Readaccess]  DEFAULT (0),
	[AllowPost] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowPost]  DEFAULT (0),
	[AllowComment] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowComment]  DEFAULT (0),
	[AllowDownload] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowDownload]  DEFAULT (0),
	[AllowAvatar] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowAvatar]  DEFAULT (0),
	[AllowSpace] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowSpace]  DEFAULT (0),
	[AllowTransfer] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowTransfer]  DEFAULT (0),
	[AllowViewInfo] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowViewInfo]  DEFAULT (0),
	[AllowNickname] [tinyint] NULL CONSTRAINT [DF_DT_Pre_Usergroup_AllowNickname]  DEFAULT (0),
	[MaxPMNum] [smallint] NULL,
	[MaxSignSize] [smallint] NULL,
	[MaxAttachSize] [int] NULL,
	[MaxAttachTotalSize] [int] NULL,
	[AttachExtension] [varchar](200) NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_DT_Pre_Usergroup] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_Userfields]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_Userfields]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_Userfields](
	[UID] [int] NOT NULL,
	[Realname] [nvarchar](50) NULL,
	[QQ] [varchar](50) NULL,
	[MSN] [varchar](50) NULL,
	[Skype] [varchar](50) NULL,
	[Phone] [char](16) NULL,
	[Mobilephone] [char](11) NULL,
	[Location] [nvarchar](50) NULL,
	[Adress] [nvarchar](200) NULL,
	[IDcard] [varchar](18) NULL,
	[Signature] [nvarchar](200) NULL,
	[Introduce] [nvarchar](500) NULL,
	[Website] [varchar](100) NULL,
 CONSTRAINT [PK_DT_Userfields] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_Users]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_Users]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_Users](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NULL,
	[Password] [char](32) NOT NULL,
	[SecureQuestion] [nvarchar](50) NULL,
	[SecureAnswer] [nvarchar](50) NULL,
	[Sex] [tinyint] NULL CONSTRAINT [DF_DT_Users_Sex]  DEFAULT (1),
	[Email] [varchar](50) NULL,
	[RoleID] [int] NULL CONSTRAINT [DF_DT_Users_RoleID]  DEFAULT (0),
	[UsergroupID] [int] NULL CONSTRAINT [DF_DT_Users_UsergroupID]  DEFAULT (0),
	[RegisterIP] [char](15) NULL,
	[RegisterTime] [datetime] NULL CONSTRAINT [DF_DT_Users_RegisterDate]  DEFAULT (getdate()),
	[LastloginIP] [char](15) NULL,
	[LastloginTime] [datetime] NULL CONSTRAINT [DF_DT_Users_LastloginTime]  DEFAULT (getdate()),
	[LoginCount] [int] NULL CONSTRAINT [DF_DT_Users_LoginCount]  DEFAULT (0),
	[PostCount] [int] NULL CONSTRAINT [DF_DT_Users_PostCount]  DEFAULT (0),
	[OnlineTime] [int] NULL CONSTRAINT [DF_DT_Users_OnlineTime]  DEFAULT (0),
	[Credits] [int] NULL CONSTRAINT [DF_DT_Users_Credits]  DEFAULT (0),
	[ExtCredits1] [decimal](18, 0) NULL CONSTRAINT [DF_DT_Users_ExtCredits1]  DEFAULT (0),
	[ExtCredits2] [decimal](18, 0) NULL CONSTRAINT [DF_DT_Users_ExtCredits2]  DEFAULT (0),
	[ExtCredits3] [decimal](18, 0) NULL CONSTRAINT [DF_DT_Users_ExtCredits3]  DEFAULT (0),
	[ExtCredits4] [decimal](18, 0) NULL,
	[ExtCredits5] [decimal](18, 0) NULL,
	[Avatar] [varchar](200) NULL,
	[Birthday] [smalldatetime] NULL,
	[PMCount] [int] NULL CONSTRAINT [DF_DT_Users_PmCount]  DEFAULT (0),
	[IsVerify] [tinyint] NULL CONSTRAINT [DF_DT_Users_IsVerify]  DEFAULT (0),
	[IsLock] [tinyint] NULL CONSTRAINT [DF_DT_Users_IsForbidden]  DEFAULT (0),
 CONSTRAINT [PK_DT_Users] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[DT_Arc_Article]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DT_Arc_Article]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DT_Arc_Article](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[ViceClassID] [int] NULL CONSTRAINT [DF_DT_Arc_Article_ViceClassID]  DEFAULT ((-1)),
	[Title] [nvarchar](100) NOT NULL,
	[ShortTitle] [nvarchar](100) NULL,
	[TitleStyle] [nvarchar](100) NULL,
	[TitleFlag] [int] NULL,
	[Tags] [nvarchar](100) NULL,
	[ImgUrl] [nvarchar](200) NULL,
	[Author] [nvarchar](50) NULL,
	[Editor] [nvarchar](50) NULL,
	[PubLisher] [nvarchar](50) NULL,
	[Source] [nvarchar](100) NULL,
	[Templet] [nvarchar](200) NULL,
	[Keywords] [nvarchar](200) NULL,
	[Description] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[Click] [int] NULL CONSTRAINT [DF_DT_Arc_Article_Click]  DEFAULT (0),
	[Good] [int] NULL CONSTRAINT [DF_DT_Arc_Article_Good]  DEFAULT (0),
	[Bad] [int] NULL CONSTRAINT [DF_DT_Arc_Article_Bad]  DEFAULT (0),
	[Readaccess] [smallint] NULL CONSTRAINT [DF_DT_Arc_Article_Readaccess]  DEFAULT (0),
	[Money] [smallint] NULL CONSTRAINT [DF_DT_Arc_Article_Money]  DEFAULT (0),
	[Attribute] [char](1) NULL CONSTRAINT [DF_DT_Arc_Article_Status]  DEFAULT (0),
	[IsComment] [tinyint] NULL,
	[IsChecked] [tinyint] NULL CONSTRAINT [DF_DT_Arc_Article_IsChecked]  DEFAULT (1),
	[IsRecycle] [tinyint] NULL CONSTRAINT [DF_DT_Arc_Article_IsRecycle]  DEFAULT (0),
	[IsRedirect] [int] NULL CONSTRAINT [DF_DT_Arc_Article_IsRedirect]  DEFAULT (0),
	[IsHtml] [tinyint] NULL CONSTRAINT [DF_DT_Arc_Article_IsHtml]  DEFAULT (0),
	[IsPaging] [tinyint] NULL CONSTRAINT [DF_DT_Arc_Article_IsPaging]  DEFAULT (0),
	[FilePath] [nvarchar](200) NULL,
	[SimilarArticle] [nchar](10) NULL,
	[AddDate] [datetime] NOT NULL,
	[PubDate] [datetime] NOT NULL,
	[OrderID] [tinyint] NULL CONSTRAINT [DF_DT_Arc_Article_Sort]  DEFAULT (0),
 CONSTRAINT [PK_DT_Arc_Article] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** 对象:  View [dbo].[V_DT_Arc_Article]    脚本日期: 01/06/2010 20:16:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[V_DT_Arc_Article]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_DT_Arc_Article]
AS
SELECT d.ID, d.ClassID, t.ClassName, d.Title, 
      d.AddDate, d.IsChecked
FROM dbo.DT_Arc_Article d LEFT OUTER JOIN
      dbo.DT_Arc_Class t ON d.ClassID = t.CID
' 
