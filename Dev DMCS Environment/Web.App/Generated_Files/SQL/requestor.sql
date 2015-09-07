/****** Object:  Table [dbo].[requestor]    Script Date: 9/7/2015 11:23:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[requestor](
  [RequestorID] int IDENTITY(1,1) NOT NULL,
  [EncounterID] int NOT NULL,
  [Requestor_Type] char(1) NOT NULL,
  [MobilUnitID] int NULL,
  [PersonID] int NULL,
  [AgencyID] int NULL,
 CONSTRAINT [requestor_RequestorID_pk] PRIMARY KEY CLUSTERED 
(
	[RequestorID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_REQUESTOR]    Script Date: 9/7/2015 11:23:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_REQUESTOR]
           @RequestorID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [RequestorID]
      ,[EncounterID]
      ,[Requestor_Type]
      ,[MobilUnitID]
      ,[PersonID]
      ,[AgencyID]
  FROM [dbo].[requestor]
 WHERE RequestorID = @RequestorID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_REQUESTOR]    Script Date: 9/7/2015 11:23:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_REQUESTOR]
	  @EncounterID as int,
	  @Requestor_Type as char(1),
	  @MobilUnitID as int,
	  @PersonID as int
	  @AgencyID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @EncounterID = 0
    BEGIN
    SET @EncounterID = null
    END
	  IF @Requestor_Type = ''
    BEGIN
    SET @Requestor_Type = null
    END
	  IF @MobilUnitID = 0
    BEGIN
    SET @MobilUnitID = null
    END
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	Insert INTO [dbo].[requestor]
           (
            [EncounterID]
           ,[Requestor_Type]
           ,[MobilUnitID]
           ,[PersonID]
           ,[AgencyID]
            )
     VALUES (
            @EncounterID
           ,@Requestor_Type
           ,@MobilUnitID
           ,@PersonID
           ,@AgencyID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_REQUESTOR]    Script Date: 9/7/2015 11:23:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_REQUESTOR]
	  @RequestorID as int,
	  @EncounterID as int,
	  @Requestor_Type as char(1),
	  @MobilUnitID as int,
	  @PersonID as int
	  @AgencyID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @EncounterID = 0
    BEGIN
    SET @EncounterID = null
    END
	  IF @Requestor_Type = ''
    BEGIN
    SET @Requestor_Type = null
    END
	  IF @MobilUnitID = 0
    BEGIN
    SET @MobilUnitID = null
    END
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	UPDATE [dbo].[requestor]
       SET
		   [EncounterID] = @EncounterID,
		   [Requestor_Type] = @Requestor_Type,
		   [MobilUnitID] = @MobilUnitID,
		   [PersonID] = @PersonID,
		   [AgencyID] = @AgencyID
       WHERE RequestorID = @RequestorID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_REQUESTOR]    Script Date: 9/7/2015 11:23:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_REQUESTOR]
	@RequestorID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.requestor
	where RequestorID = @RequestorID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_REQUESTOR]    Script Date: 9/7/2015 11:23:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_REQUESTOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_REQUESTOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_REQUESTOR]
	  @EncounterID as int,
	  @Requestor_Type as char(1),
	  @MobilUnitID as int,
	  @PersonID as int
	  @AgencyID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @EncounterID = 0
    BEGIN
    SET @EncounterID = null
    END
	  IF @Requestor_Type = ''
    BEGIN
    SET @Requestor_Type = null
    END
	  IF @MobilUnitID = 0
    BEGIN
    SET @MobilUnitID = null
    END
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
    SELECT [RequestorID] 
      FROM [dbo].[requestor] 
       WHERE ([EncounterID] = @EncounterID)
       AND ([Requestor_Type] = @Requestor_Type)
       AND ([MobilUnitID] = @MobilUnitID or [MobilUnitID] is null)
       AND ([PersonID] = @PersonID or [PersonID] is null)
       AND ([AgencyID] = @AgencyID or [AgencyID] is null)
END
GO

