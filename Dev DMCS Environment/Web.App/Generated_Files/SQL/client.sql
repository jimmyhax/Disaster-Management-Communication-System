/****** Object:  Table [dbo].[client]    Script Date: 9/7/2015 11:21:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client](
  [client_id] int IDENTITY(1,1) NOT NULL,
  [client_status] char(1) NOT NULL,
  [ethnicity] varchar(15) NULL,
  [eye_color] varchar(10) NULL,
  [hair_color] varchar(10) NULL,
  [height] varchar(10) NULL,
  [picture] image(2147483647) NULL,
  [weight] int NULL,
  [skin_color] varchar(15) NULL,
  [Info_Field] text(2147483647) NULL,
  [Client_Shelter_ID] int NULL,
  [Emergency_Contact_Name] varchar(25) NULL,
  [Emergency_Contact_Number] varchar(11) NULL,
  [Subscribed_Alerts] char(1) NOT NULL,
 CONSTRAINT [client_client_id_pk] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CLIENT]    Script Date: 9/7/2015 11:21:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT]
           @client_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [client_id]
      ,[client_status]
      ,[ethnicity]
      ,[eye_color]
      ,[hair_color]
      ,[height]
      ,[picture]
      ,[weight]
      ,[skin_color]
      ,[Info_Field]
      ,[Client_Shelter_ID]
      ,[Emergency_Contact_Name]
      ,[Emergency_Contact_Number]
      ,[Subscribed_Alerts]
  FROM [dbo].[client]
 WHERE client_id = @client_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CLIENT]    Script Date: 9/7/2015 11:21:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CLIENT]
	  @client_id as int,
	  @client_status as char(1),
	  @ethnicity as varchar(15),
	  @eye_color as varchar(10),
	  @hair_color as varchar(10),
	  @height as varchar(10),
	  @picture as image,
	  @weight as int,
	  @skin_color as varchar(15),
	  @Info_Field as text,
	  @Client_Shelter_ID as int,
	  @Emergency_Contact_Name as varchar(25),
	  @Emergency_Contact_Number as varchar(11)
	  @Subscribed_Alerts as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_status = ''
    BEGIN
    SET @client_status = null
    END
	  IF @ethnicity = ''
    BEGIN
    SET @ethnicity = null
    END
	  IF @eye_color = ''
    BEGIN
    SET @eye_color = null
    END
	  IF @hair_color = ''
    BEGIN
    SET @hair_color = null
    END
	  IF @height = ''
    BEGIN
    SET @height = null
    END
	  IF @weight = 0
    BEGIN
    SET @weight = null
    END
	  IF @skin_color = ''
    BEGIN
    SET @skin_color = null
    END
	  IF @Client_Shelter_ID = 0
    BEGIN
    SET @Client_Shelter_ID = null
    END
	  IF @Emergency_Contact_Name = ''
    BEGIN
    SET @Emergency_Contact_Name = null
    END
	  IF @Emergency_Contact_Number = ''
    BEGIN
    SET @Emergency_Contact_Number = null
    END
	  IF @Subscribed_Alerts = ''
    BEGIN
    SET @Subscribed_Alerts = null
    END
	Insert INTO [dbo].[client]
           (
            [client_id]
           ,[client_status]
           ,[ethnicity]
           ,[eye_color]
           ,[hair_color]
           ,[height]
           ,[picture]
           ,[weight]
           ,[skin_color]
           ,[Info_Field]
           ,[Client_Shelter_ID]
           ,[Emergency_Contact_Name]
           ,[Emergency_Contact_Number]
           ,[Subscribed_Alerts]
            )
     VALUES (
            @client_id
           ,@client_status
           ,@ethnicity
           ,@eye_color
           ,@hair_color
           ,@height
           ,@picture
           ,@weight
           ,@skin_color
           ,@Info_Field
           ,@Client_Shelter_ID
           ,@Emergency_Contact_Name
           ,@Emergency_Contact_Number
           ,@Subscribed_Alerts
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CLIENT]    Script Date: 9/7/2015 11:21:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CLIENT]
	  @client_id as int,
	  @client_status as char(1),
	  @ethnicity as varchar(15),
	  @eye_color as varchar(10),
	  @hair_color as varchar(10),
	  @height as varchar(10),
	  @picture as image,
	  @weight as int,
	  @skin_color as varchar(15),
	  @Info_Field as text,
	  @Client_Shelter_ID as int,
	  @Emergency_Contact_Name as varchar(25),
	  @Emergency_Contact_Number as varchar(11)
	  @Subscribed_Alerts as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_status = ''
    BEGIN
    SET @client_status = null
    END
	  IF @ethnicity = ''
    BEGIN
    SET @ethnicity = null
    END
	  IF @eye_color = ''
    BEGIN
    SET @eye_color = null
    END
	  IF @hair_color = ''
    BEGIN
    SET @hair_color = null
    END
	  IF @height = ''
    BEGIN
    SET @height = null
    END
	  IF @weight = 0
    BEGIN
    SET @weight = null
    END
	  IF @skin_color = ''
    BEGIN
    SET @skin_color = null
    END
	  IF @Client_Shelter_ID = 0
    BEGIN
    SET @Client_Shelter_ID = null
    END
	  IF @Emergency_Contact_Name = ''
    BEGIN
    SET @Emergency_Contact_Name = null
    END
	  IF @Emergency_Contact_Number = ''
    BEGIN
    SET @Emergency_Contact_Number = null
    END
	  IF @Subscribed_Alerts = ''
    BEGIN
    SET @Subscribed_Alerts = null
    END
	UPDATE [dbo].[client]
       SET
		   [client_status] = @client_status,
		   [ethnicity] = @ethnicity,
		   [eye_color] = @eye_color,
		   [hair_color] = @hair_color,
		   [height] = @height,
		   [picture] = @picture,
		   [weight] = @weight,
		   [skin_color] = @skin_color,
		   [Info_Field] = @Info_Field,
		   [Client_Shelter_ID] = @Client_Shelter_ID,
		   [Emergency_Contact_Name] = @Emergency_Contact_Name,
		   [Emergency_Contact_Number] = @Emergency_Contact_Number,
		   [Subscribed_Alerts] = @Subscribed_Alerts
       WHERE client_id = @client_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CLIENT]    Script Date: 9/7/2015 11:21:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CLIENT]
	@client_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.client
	where client_id = @client_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CLIENT]    Script Date: 9/7/2015 11:21:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CLIENT]
	  @client_status as char(1),
	  @ethnicity as varchar(15),
	  @eye_color as varchar(10),
	  @hair_color as varchar(10),
	  @height as varchar(10),
	  @picture as image,
	  @weight as int,
	  @skin_color as varchar(15),
	  @Info_Field as text,
	  @Client_Shelter_ID as int,
	  @Emergency_Contact_Name as varchar(25),
	  @Emergency_Contact_Number as varchar(11)
	  @Subscribed_Alerts as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_status = ''
    BEGIN
    SET @client_status = null
    END
	  IF @ethnicity = ''
    BEGIN
    SET @ethnicity = null
    END
	  IF @eye_color = ''
    BEGIN
    SET @eye_color = null
    END
	  IF @hair_color = ''
    BEGIN
    SET @hair_color = null
    END
	  IF @height = ''
    BEGIN
    SET @height = null
    END
	  IF @weight = 0
    BEGIN
    SET @weight = null
    END
	  IF @skin_color = ''
    BEGIN
    SET @skin_color = null
    END
	  IF @Client_Shelter_ID = 0
    BEGIN
    SET @Client_Shelter_ID = null
    END
	  IF @Emergency_Contact_Name = ''
    BEGIN
    SET @Emergency_Contact_Name = null
    END
	  IF @Emergency_Contact_Number = ''
    BEGIN
    SET @Emergency_Contact_Number = null
    END
	  IF @Subscribed_Alerts = ''
    BEGIN
    SET @Subscribed_Alerts = null
    END
    SELECT [client_id] 
      FROM [dbo].[client] 
       WHERE ([client_status] = @client_status)
       AND ([ethnicity] like @ethnicity or [ethnicity] is null)
       AND ([eye_color] like @eye_color or [eye_color] is null)
       AND ([hair_color] like @hair_color or [hair_color] is null)
       AND ([height] like @height or [height] is null)
       AND ([weight] = @weight or [weight] is null)
       AND ([skin_color] like @skin_color or [skin_color] is null)
       AND ([Info_Field] like @Info_Field or [Info_Field] is null)
       AND ([Client_Shelter_ID] = @Client_Shelter_ID or [Client_Shelter_ID] is null)
       AND ([Emergency_Contact_Name] like @Emergency_Contact_Name or [Emergency_Contact_Name] is null)
       AND ([Emergency_Contact_Number] like @Emergency_Contact_Number or [Emergency_Contact_Number] is null)
       AND ([Subscribed_Alerts] = @Subscribed_Alerts)
END
GO

