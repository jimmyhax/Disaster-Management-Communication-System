/****** Object:  Table [dbo].[mobile_unit]    Script Date: 9/7/2015 11:22:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mobile_unit](
  [mobile_unit_id] int IDENTITY(1,1) NOT NULL,
  [vehicle_id] int NOT NULL,
  [mobile_desc] varchar(50) NOT NULL,
  [call_center_id] int NULL,
 CONSTRAINT [mobile_unit_mobile_unit_id_pk] PRIMARY KEY CLUSTERED 
(
	[mobile_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_tableName]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_tableName] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_tableName] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MOBILE_UNIT]    Script Date: 9/7/2015 11:22:52 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_UNIT]
           @mobile_unit_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [mobile_unit_id]
      ,[vehicle_id]
      ,[mobile_desc]
      ,[call_center_id]
  FROM [dbo].[mobile_unit]
 WHERE mobile_unit_id = @mobile_unit_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MOBILE_UNIT]    Script Date: 9/7/2015 11:22:52 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_UNIT]
	  @vehicle_id as int,
	  @mobile_desc as varchar(50)
	  @call_center_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vehicle_id = 0
    BEGIN
    SET @vehicle_id = null
    END
	  IF @mobile_desc = ''
    BEGIN
    SET @mobile_desc = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	Insert INTO [dbo].[mobile_unit]
           (
            [vehicle_id]
           ,[mobile_desc]
           ,[call_center_id]
            )
     VALUES (
            @vehicle_id
           ,@mobile_desc
           ,@call_center_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MOBILE_UNIT]    Script Date: 9/7/2015 11:22:52 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_UNIT]
	  @mobile_unit_id as int,
	  @vehicle_id as int,
	  @mobile_desc as varchar(50)
	  @call_center_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vehicle_id = 0
    BEGIN
    SET @vehicle_id = null
    END
	  IF @mobile_desc = ''
    BEGIN
    SET @mobile_desc = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	UPDATE [dbo].[mobile_unit]
       SET
		   [vehicle_id] = @vehicle_id,
		   [mobile_desc] = @mobile_desc,
		   [call_center_id] = @call_center_id
       WHERE mobile_unit_id = @mobile_unit_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MOBILE_UNIT]    Script Date: 9/7/2015 11:22:52 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_UNIT]
	@mobile_unit_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.mobile_unit
	where mobile_unit_id = @mobile_unit_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MOBILE_UNIT]    Script Date: 9/7/2015 11:22:52 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MOBILE_UNIT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_UNIT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_UNIT]
	  @vehicle_id as int,
	  @mobile_desc as varchar(50)
	  @call_center_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vehicle_id = 0
    BEGIN
    SET @vehicle_id = null
    END
	  IF @mobile_desc = ''
    BEGIN
    SET @mobile_desc = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
    SELECT [mobile_unit_id] 
      FROM [dbo].[mobile_unit] 
       WHERE ([vehicle_id] = @vehicle_id)
       AND ([mobile_desc] like @mobile_desc)
       AND ([call_center_id] = @call_center_id or [call_center_id] is null)
END
GO

