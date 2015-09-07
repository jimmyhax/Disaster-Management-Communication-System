/****** Object:  Table [dbo].[disaster_encounter]    Script Date: 9/7/2015 11:22:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[disaster_encounter](
  [disaster_encounter_id] int IDENTITY(1,1) NOT NULL,
  [disaster_id] int NOT NULL,
  [encounter_id] int NOT NULL,
  [location_id] int NOT NULL,
 CONSTRAINT [disaster_encounter_disaster_encounter_id_pk] PRIMARY KEY CLUSTERED 
(
	[disaster_encounter_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER]    Script Date: 9/7/2015 11:22:05 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DISASTER_ENCOUNTER]
           @disaster_encounter_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [disaster_encounter_id]
      ,[disaster_id]
      ,[encounter_id]
      ,[location_id]
  FROM [dbo].[disaster_encounter]
 WHERE disaster_encounter_id = @disaster_encounter_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DISASTER_ENCOUNTER]    Script Date: 9/7/2015 11:22:05 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DISASTER_ENCOUNTER]
	  @disaster_id as int,
	  @encounter_id as int
	  @location_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @location_id = 0
    BEGIN
    SET @location_id = null
    END
	Insert INTO [dbo].[disaster_encounter]
           (
            [disaster_id]
           ,[encounter_id]
           ,[location_id]
            )
     VALUES (
            @disaster_id
           ,@encounter_id
           ,@location_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DISASTER_ENCOUNTER]    Script Date: 9/7/2015 11:22:05 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DISASTER_ENCOUNTER]
	  @disaster_encounter_id as int,
	  @disaster_id as int,
	  @encounter_id as int
	  @location_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @location_id = 0
    BEGIN
    SET @location_id = null
    END
	UPDATE [dbo].[disaster_encounter]
       SET
		   [disaster_id] = @disaster_id,
		   [encounter_id] = @encounter_id,
		   [location_id] = @location_id
       WHERE disaster_encounter_id = @disaster_encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DISASTER_ENCOUNTER]    Script Date: 9/7/2015 11:22:05 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DISASTER_ENCOUNTER]
	@disaster_encounter_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.disaster_encounter
	where disaster_encounter_id = @disaster_encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DISASTER_ENCOUNTER]    Script Date: 9/7/2015 11:22:05 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DISASTER_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DISASTER_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DISASTER_ENCOUNTER]
	  @disaster_id as int,
	  @encounter_id as int
	  @location_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @encounter_id = 0
    BEGIN
    SET @encounter_id = null
    END
	  IF @location_id = 0
    BEGIN
    SET @location_id = null
    END
    SELECT [disaster_encounter_id] 
      FROM [dbo].[disaster_encounter] 
       WHERE ([disaster_id] = @disaster_id)
       AND ([encounter_id] = @encounter_id)
       AND ([location_id] = @location_id)
END
GO

