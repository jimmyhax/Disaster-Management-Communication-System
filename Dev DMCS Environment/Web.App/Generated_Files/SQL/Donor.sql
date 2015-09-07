/****** Object:  Table [dbo].[Donor]    Script Date: 9/7/2015 11:22:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Donor](
  [donor_id] int IDENTITY(1,1) NOT NULL,
  [PersonID] int NULL,
  [Status] varchar(30) NULL,
  [DonorType] char(1) NULL,
  [AgencyID] int NULL,
  [Phone] int NULL,
 CONSTRAINT [Donor_donor_id_pk] PRIMARY KEY CLUSTERED 
(
	[donor_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DONOR]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DONOR]
           @donor_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [donor_id]
      ,[PersonID]
      ,[Status]
      ,[DonorType]
      ,[AgencyID]
      ,[Phone]
  FROM [dbo].[Donor]
 WHERE donor_id = @donor_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DONOR]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DONOR]
	  @PersonID as int,
	  @Status as varchar(30),
	  @DonorType as char(1),
	  @AgencyID as int
	  @Phone as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @Status = ''
    BEGIN
    SET @Status = null
    END
	  IF @DonorType = ''
    BEGIN
    SET @DonorType = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	Insert INTO [dbo].[Donor]
           (
            [PersonID]
           ,[Status]
           ,[DonorType]
           ,[AgencyID]
           ,[Phone]
            )
     VALUES (
            @PersonID
           ,@Status
           ,@DonorType
           ,@AgencyID
           ,@Phone
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DONOR]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DONOR]
	  @donor_id as int,
	  @PersonID as int,
	  @Status as varchar(30),
	  @DonorType as char(1),
	  @AgencyID as int
	  @Phone as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @Status = ''
    BEGIN
    SET @Status = null
    END
	  IF @DonorType = ''
    BEGIN
    SET @DonorType = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	UPDATE [dbo].[Donor]
       SET
		   [PersonID] = @PersonID,
		   [Status] = @Status,
		   [DonorType] = @DonorType,
		   [AgencyID] = @AgencyID,
		   [Phone] = @Phone
       WHERE donor_id = @donor_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DONOR]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DONOR]
	@donor_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Donor
	where donor_id = @donor_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DONOR]    Script Date: 9/7/2015 11:22:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DONOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DONOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DONOR]
	  @PersonID as int,
	  @Status as varchar(30),
	  @DonorType as char(1),
	  @AgencyID as int
	  @Phone as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @PersonID = 0
    BEGIN
    SET @PersonID = null
    END
	  IF @Status = ''
    BEGIN
    SET @Status = null
    END
	  IF @DonorType = ''
    BEGIN
    SET @DonorType = null
    END
	  IF @AgencyID = 0
    BEGIN
    SET @AgencyID = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
    SELECT [donor_id] 
      FROM [dbo].[Donor] 
       WHERE ([PersonID] = @PersonID or [PersonID] is null)
       AND ([Status] like @Status or [Status] is null)
       AND ([DonorType] = @DonorType or [DonorType] is null)
       AND ([AgencyID] = @AgencyID or [AgencyID] is null)
       AND ([Phone] = @Phone or [Phone] is null)
END
GO

