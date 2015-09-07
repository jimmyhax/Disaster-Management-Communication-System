/****** Object:  Table [dbo].[house_choice]    Script Date: 9/7/2015 11:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[house_choice](
  [house_choice_id] int IDENTITY(1,1) NOT NULL,
  [house_id] int NOT NULL,
  [address_id] int NOT NULL,
  [house_choice_bathrooms] int NOT NULL,
  [house_choice_comments] varchar(30) NULL,
  [house_choice_contact_person_id] int NULL,
  [house_choice_laundry] varchar(15) NOT NULL,
  [house_choice_no_floors] int NOT NULL,
  [house_choice_parking] varchar(15) NOT NULL,
  [house_choice_rent] money NOT NULL,
  [house_choice_type] varchar(30) NOT NULL,
  [house_choice_units_avail] int NOT NULL,
 CONSTRAINT [house_choice_house_choice_id_pk] PRIMARY KEY CLUSTERED 
(
	[house_choice_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_HOUSE_CHOICE]    Script Date: 9/7/2015 11:22:25 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE_CHOICE]
           @house_choice_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [house_choice_id]
      ,[house_id]
      ,[address_id]
      ,[house_choice_bathrooms]
      ,[house_choice_comments]
      ,[house_choice_contact_person_id]
      ,[house_choice_laundry]
      ,[house_choice_no_floors]
      ,[house_choice_parking]
      ,[house_choice_rent]
      ,[house_choice_type]
      ,[house_choice_units_avail]
  FROM [dbo].[house_choice]
 WHERE house_choice_id = @house_choice_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_HOUSE_CHOICE]    Script Date: 9/7/2015 11:22:25 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_HOUSE_CHOICE]
	  @house_id as int,
	  @address_id as int,
	  @house_choice_bathrooms as int,
	  @house_choice_comments as varchar(30),
	  @house_choice_contact_person_id as int,
	  @house_choice_laundry as varchar(15),
	  @house_choice_no_floors as int,
	  @house_choice_parking as varchar(15),
	  @house_choice_rent as money,
	  @house_choice_type as varchar(30)
	  @house_choice_units_avail as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @house_id = 0
    BEGIN
    SET @house_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @house_choice_bathrooms = 0
    BEGIN
    SET @house_choice_bathrooms = null
    END
	  IF @house_choice_comments = ''
    BEGIN
    SET @house_choice_comments = null
    END
	  IF @house_choice_contact_person_id = 0
    BEGIN
    SET @house_choice_contact_person_id = null
    END
	  IF @house_choice_laundry = ''
    BEGIN
    SET @house_choice_laundry = null
    END
	  IF @house_choice_no_floors = 0
    BEGIN
    SET @house_choice_no_floors = null
    END
	  IF @house_choice_parking = ''
    BEGIN
    SET @house_choice_parking = null
    END
	  IF @house_choice_rent = 0
    BEGIN
    SET @house_choice_rent = null
    END
	  IF @house_choice_type = ''
    BEGIN
    SET @house_choice_type = null
    END
	  IF @house_choice_units_avail = 0
    BEGIN
    SET @house_choice_units_avail = null
    END
	Insert INTO [dbo].[house_choice]
           (
            [house_id]
           ,[address_id]
           ,[house_choice_bathrooms]
           ,[house_choice_comments]
           ,[house_choice_contact_person_id]
           ,[house_choice_laundry]
           ,[house_choice_no_floors]
           ,[house_choice_parking]
           ,[house_choice_rent]
           ,[house_choice_type]
           ,[house_choice_units_avail]
            )
     VALUES (
            @house_id
           ,@address_id
           ,@house_choice_bathrooms
           ,@house_choice_comments
           ,@house_choice_contact_person_id
           ,@house_choice_laundry
           ,@house_choice_no_floors
           ,@house_choice_parking
           ,@house_choice_rent
           ,@house_choice_type
           ,@house_choice_units_avail
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_HOUSE_CHOICE]    Script Date: 9/7/2015 11:22:25 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_HOUSE_CHOICE]
	  @house_choice_id as int,
	  @house_id as int,
	  @address_id as int,
	  @house_choice_bathrooms as int,
	  @house_choice_comments as varchar(30),
	  @house_choice_contact_person_id as int,
	  @house_choice_laundry as varchar(15),
	  @house_choice_no_floors as int,
	  @house_choice_parking as varchar(15),
	  @house_choice_rent as money,
	  @house_choice_type as varchar(30)
	  @house_choice_units_avail as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @house_id = 0
    BEGIN
    SET @house_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @house_choice_bathrooms = 0
    BEGIN
    SET @house_choice_bathrooms = null
    END
	  IF @house_choice_comments = ''
    BEGIN
    SET @house_choice_comments = null
    END
	  IF @house_choice_contact_person_id = 0
    BEGIN
    SET @house_choice_contact_person_id = null
    END
	  IF @house_choice_laundry = ''
    BEGIN
    SET @house_choice_laundry = null
    END
	  IF @house_choice_no_floors = 0
    BEGIN
    SET @house_choice_no_floors = null
    END
	  IF @house_choice_parking = ''
    BEGIN
    SET @house_choice_parking = null
    END
	  IF @house_choice_rent = 0
    BEGIN
    SET @house_choice_rent = null
    END
	  IF @house_choice_type = ''
    BEGIN
    SET @house_choice_type = null
    END
	  IF @house_choice_units_avail = 0
    BEGIN
    SET @house_choice_units_avail = null
    END
	UPDATE [dbo].[house_choice]
       SET
		   [house_id] = @house_id,
		   [address_id] = @address_id,
		   [house_choice_bathrooms] = @house_choice_bathrooms,
		   [house_choice_comments] = @house_choice_comments,
		   [house_choice_contact_person_id] = @house_choice_contact_person_id,
		   [house_choice_laundry] = @house_choice_laundry,
		   [house_choice_no_floors] = @house_choice_no_floors,
		   [house_choice_parking] = @house_choice_parking,
		   [house_choice_rent] = @house_choice_rent,
		   [house_choice_type] = @house_choice_type,
		   [house_choice_units_avail] = @house_choice_units_avail
       WHERE house_choice_id = @house_choice_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_HOUSE_CHOICE]    Script Date: 9/7/2015 11:22:25 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_HOUSE_CHOICE]
	@house_choice_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.house_choice
	where house_choice_id = @house_choice_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_HOUSE_CHOICE]    Script Date: 9/7/2015 11:22:25 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_HOUSE_CHOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_HOUSE_CHOICE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_HOUSE_CHOICE]
	  @house_id as int,
	  @address_id as int,
	  @house_choice_bathrooms as int,
	  @house_choice_comments as varchar(30),
	  @house_choice_contact_person_id as int,
	  @house_choice_laundry as varchar(15),
	  @house_choice_no_floors as int,
	  @house_choice_parking as varchar(15),
	  @house_choice_rent as money,
	  @house_choice_type as varchar(30)
	  @house_choice_units_avail as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @house_id = 0
    BEGIN
    SET @house_id = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @house_choice_bathrooms = 0
    BEGIN
    SET @house_choice_bathrooms = null
    END
	  IF @house_choice_comments = ''
    BEGIN
    SET @house_choice_comments = null
    END
	  IF @house_choice_contact_person_id = 0
    BEGIN
    SET @house_choice_contact_person_id = null
    END
	  IF @house_choice_laundry = ''
    BEGIN
    SET @house_choice_laundry = null
    END
	  IF @house_choice_no_floors = 0
    BEGIN
    SET @house_choice_no_floors = null
    END
	  IF @house_choice_parking = ''
    BEGIN
    SET @house_choice_parking = null
    END
	  IF @house_choice_rent = 0
    BEGIN
    SET @house_choice_rent = null
    END
	  IF @house_choice_type = ''
    BEGIN
    SET @house_choice_type = null
    END
	  IF @house_choice_units_avail = 0
    BEGIN
    SET @house_choice_units_avail = null
    END
    SELECT [house_choice_id] 
      FROM [dbo].[house_choice] 
       WHERE ([house_id] = @house_id)
       AND ([address_id] = @address_id)
       AND ([house_choice_bathrooms] = @house_choice_bathrooms)
       AND ([house_choice_comments] like @house_choice_comments or [house_choice_comments] is null)
       AND ([house_choice_contact_person_id] = @house_choice_contact_person_id or [house_choice_contact_person_id] is null)
       AND ([house_choice_laundry] like @house_choice_laundry)
       AND ([house_choice_no_floors] = @house_choice_no_floors)
       AND ([house_choice_parking] like @house_choice_parking)
       AND ([house_choice_rent] = @house_choice_rent)
       AND ([house_choice_type] like @house_choice_type)
       AND ([house_choice_units_avail] = @house_choice_units_avail)
END
GO

