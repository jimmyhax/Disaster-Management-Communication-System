/****** Object:  Table [dbo].[medicine]    Script Date: 9/7/2015 11:22:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medicine](
  [Medicine_Id] int IDENTITY(1,1) NOT NULL,
  [Medication_type] varchar(30) NOT NULL,
  [Medication_name] varchar(50) NOT NULL,
  [Clients_Served] int NULL,
 CONSTRAINT [medicine_Medicine_Id_pk] PRIMARY KEY CLUSTERED 
(
	[Medicine_Id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEDICINE]    Script Date: 9/7/2015 11:22:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICINE]
           @Medicine_Id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Medicine_Id]
      ,[Medication_type]
      ,[Medication_name]
      ,[Clients_Served]
  FROM [dbo].[medicine]
 WHERE Medicine_Id = @Medicine_Id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEDICINE]    Script Date: 9/7/2015 11:22:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEDICINE]
	  @Medication_type as varchar(30),
	  @Medication_name as varchar(50)
	  @Clients_Served as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Medication_type = ''
    BEGIN
    SET @Medication_type = null
    END
	  IF @Medication_name = ''
    BEGIN
    SET @Medication_name = null
    END
	  IF @Clients_Served = 0
    BEGIN
    SET @Clients_Served = null
    END
	Insert INTO [dbo].[medicine]
           (
            [Medication_type]
           ,[Medication_name]
           ,[Clients_Served]
            )
     VALUES (
            @Medication_type
           ,@Medication_name
           ,@Clients_Served
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEDICINE]    Script Date: 9/7/2015 11:22:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEDICINE]
	  @Medicine_Id as int,
	  @Medication_type as varchar(30),
	  @Medication_name as varchar(50)
	  @Clients_Served as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Medication_type = ''
    BEGIN
    SET @Medication_type = null
    END
	  IF @Medication_name = ''
    BEGIN
    SET @Medication_name = null
    END
	  IF @Clients_Served = 0
    BEGIN
    SET @Clients_Served = null
    END
	UPDATE [dbo].[medicine]
       SET
		   [Medication_type] = @Medication_type,
		   [Medication_name] = @Medication_name,
		   [Clients_Served] = @Clients_Served
       WHERE Medicine_Id = @Medicine_Id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEDICINE]    Script Date: 9/7/2015 11:22:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEDICINE]
	@Medicine_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.medicine
	where Medicine_Id = @Medicine_Id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEDICINE]    Script Date: 9/7/2015 11:22:35 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEDICINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEDICINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEDICINE]
	  @Medication_type as varchar(30),
	  @Medication_name as varchar(50)
	  @Clients_Served as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Medication_type = ''
    BEGIN
    SET @Medication_type = null
    END
	  IF @Medication_name = ''
    BEGIN
    SET @Medication_name = null
    END
	  IF @Clients_Served = 0
    BEGIN
    SET @Clients_Served = null
    END
    SELECT [Medicine_Id] 
      FROM [dbo].[medicine] 
       WHERE ([Medication_type] like @Medication_type)
       AND ([Medication_name] like @Medication_name)
       AND ([Clients_Served] = @Clients_Served or [Clients_Served] is null)
END
GO

