/****** Object:  Table [dbo].[encounter_services]    Script Date: 9/7/2015 11:22:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[encounter_services](
  [encounter_serv_id] int IDENTITY(1,1) NOT NULL,
  [encounter_id] int NULL,
  [mobile_unit_id] int NULL,
  [service_id] int NOT NULL,
  [service_date] datetime NOT NULL,
  [service_completed] datetime NULL,
 CONSTRAINT [encounter_services_encounter_serv_id_pk] PRIMARY KEY CLUSTERED 
(
	[encounter_serv_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES]    Script Date: 9/7/2015 11:22:17 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_SERVICES]
           @encounter_serv_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [encounter_serv_id]
      ,[encounter_id]
      ,[mobile_unit_id]
      ,[service_id]
      ,[service_date]
      ,[service_completed]
  FROM [dbo].[encounter_services]
 WHERE encounter_serv_id = @encounter_serv_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ENCOUNTER_SERVICES]    Script Date: 9/7/2015 11:22:17 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER_SERVICES]
	  @encounter_id as int,
	  @mobile_unit_id as int,
	  @service_id as int,
	  @service_date as datetime
	  @service_completed as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @service_id = 0
    BEGIN
    SET @service_id = null
    END
	  IF @service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_date = null
    END
	  IF @service_completed = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_completed = null
    END
	Insert INTO [dbo].[encounter_services]
           (
            [encounter_id]
           ,[mobile_unit_id]
           ,[service_id]
           ,[service_date]
           ,[service_completed]
            )
     VALUES (
            @encounter_id
           ,@mobile_unit_id
           ,@service_id
           ,@service_date
           ,@service_completed
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ENCOUNTER_SERVICES]    Script Date: 9/7/2015 11:22:17 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER_SERVICES]
	  @encounter_serv_id as int,
	  @encounter_id as int,
	  @mobile_unit_id as int,
	  @service_id as int,
	  @service_date as datetime
	  @service_completed as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @service_id = 0
    BEGIN
    SET @service_id = null
    END
	  IF @service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_date = null
    END
	  IF @service_completed = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_completed = null
    END
	UPDATE [dbo].[encounter_services]
       SET
		   [encounter_id] = @encounter_id,
		   [mobile_unit_id] = @mobile_unit_id,
		   [service_id] = @service_id,
		   [service_date] = @service_date,
		   [service_completed] = @service_completed
       WHERE encounter_serv_id = @encounter_serv_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ENCOUNTER_SERVICES]    Script Date: 9/7/2015 11:22:17 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER_SERVICES]
	@encounter_serv_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.encounter_services
	where encounter_serv_id = @encounter_serv_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ENCOUNTER_SERVICES]    Script Date: 9/7/2015 11:22:17 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ENCOUNTER_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER_SERVICES]
	  @encounter_id as int,
	  @mobile_unit_id as int,
	  @service_id as int,
	  @service_date as datetime
	  @service_completed as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @service_id = 0
    BEGIN
    SET @service_id = null
    END
	  IF @service_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_date = null
    END
	  IF @service_completed = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @service_completed = null
    END
    SELECT [encounter_serv_id] 
      FROM [dbo].[encounter_services] 
       WHERE ([encounter_id] = @encounter_id or [encounter_id] is null)
       AND ([mobile_unit_id] = @mobile_unit_id or [mobile_unit_id] is null)
       AND ([service_id] = @service_id)
       AND ([service_date] = @service_date)
       AND ([service_completed] = @service_completed or [service_completed] is null)
END
GO

