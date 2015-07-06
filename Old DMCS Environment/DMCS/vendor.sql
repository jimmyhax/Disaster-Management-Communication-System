/****** Object:  Table [dbo].[vendor]    Script Date: 4/16/2015 1:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vendor](
  [vendor_id] int IDENTITY(1,1) NOT NULL,
  [vendor_name] varchar(50) NOT NULL,
  [phone_num] varchar(11) NOT NULL,
  [email] varchar(50) NULL,
  [address_id] int NOT NULL,
  [Vendor_address2] int NULL,
  [vendor_job_assign] varchar(30) NULL,
  [vendor_start_date] datetime NOT NULL,
  [vendor_end_date] datetime NULL,
  [vendor_meth_of_contact] char(1) NOT NULL,
  [vendor_status] varchar(10) NOT NULL,
  [vendor_meth_of_pay] varchar(15) NULL,
  [vendor_type] varchar(20) NOT NULL,
  [vendor_comments] text(2147483647) NULL,
  [primary_fName] varchar(50) NULL,
  [primary_lName] varchar(50) NULL,
  [primary_phone] varchar(50) NULL,
  [sec_fName] varchar(50) NULL,
  [sec_lName] varchar(50) NULL,
  [sec_phone] varchar(50) NULL,
 CONSTRAINT [vendor_vendor_id_pk] PRIMARY KEY CLUSTERED 
(
	[vendor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR]    Script Date: 4/16/2015 1:10:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR]
           @vendor_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [vendor_id]
      ,[vendor_name]
      ,[phone_num]
      ,[email]
      ,[address_id]
      ,[Vendor_address2]
      ,[vendor_job_assign]
      ,[vendor_start_date]
      ,[vendor_end_date]
      ,[vendor_meth_of_contact]
      ,[vendor_status]
      ,[vendor_meth_of_pay]
      ,[vendor_type]
      ,[vendor_comments]
      ,[primary_fName]
      ,[primary_lName]
      ,[primary_phone]
      ,[sec_fName]
      ,[sec_lName]
      ,[sec_phone]
  FROM [dbo].[vendor]
 WHERE vendor_id = @vendor_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VENDOR]    Script Date: 4/16/2015 1:10:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_VENDOR]
	  @vendor_name as varchar(50),
	  @phone_num as varchar(11),
	  @email as varchar(50),
	  @address_id as int,
	  @Vendor_address2 as int,
	  @vendor_job_assign as varchar(30),
	  @vendor_start_date as datetime,
	  @vendor_end_date as datetime,
	  @vendor_meth_of_contact as char(1),
	  @vendor_status as varchar(10),
	  @vendor_meth_of_pay as varchar(15),
	  @vendor_type as varchar(20),
	  @vendor_comments as text,
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50),
	  @sec_phone as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vendor_name = ''
    BEGIN
    SET @vendor_name = null
    END
	  IF @phone_num = ''
    BEGIN
    SET @phone_num = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @Vendor_address2 = 0
    BEGIN
    SET @Vendor_address2 = null
    END
	  IF @vendor_job_assign = ''
    BEGIN
    SET @vendor_job_assign = null
    END
	  IF @vendor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_start_date = null
    END
	  IF @vendor_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_end_date = null
    END
	  IF @vendor_meth_of_contact = ''
    BEGIN
    SET @vendor_meth_of_contact = null
    END
	  IF @vendor_status = ''
    BEGIN
    SET @vendor_status = null
    END
	  IF @vendor_meth_of_pay = ''
    BEGIN
    SET @vendor_meth_of_pay = null
    END
	  IF @vendor_type = ''
    BEGIN
    SET @vendor_type = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
	Insert INTO [dbo].[vendor]
           (
            [vendor_name]
           ,[phone_num]
           ,[email]
           ,[address_id]
           ,[Vendor_address2]
           ,[vendor_job_assign]
           ,[vendor_start_date]
           ,[vendor_end_date]
           ,[vendor_meth_of_contact]
           ,[vendor_status]
           ,[vendor_meth_of_pay]
           ,[vendor_type]
           ,[vendor_comments]
           ,[primary_fName]
           ,[primary_lName]
           ,[primary_phone]
           ,[sec_fName]
           ,[sec_lName]
           ,[sec_phone]
            )
     VALUES (
            @vendor_name
           ,@phone_num
           ,@email
           ,@address_id
           ,@Vendor_address2
           ,@vendor_job_assign
           ,@vendor_start_date
           ,@vendor_end_date
           ,@vendor_meth_of_contact
           ,@vendor_status
           ,@vendor_meth_of_pay
           ,@vendor_type
           ,@vendor_comments
           ,@primary_fName
           ,@primary_lName
           ,@primary_phone
           ,@sec_fName
           ,@sec_lName
           ,@sec_phone
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VENDOR]    Script Date: 4/16/2015 1:10:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_VENDOR]
	  @vendor_name as varchar(50),
	  @phone_num as varchar(11),
	  @email as varchar(50),
	  @address_id as int,
	  @Vendor_address2 as int,
	  @vendor_job_assign as varchar(30),
	  @vendor_start_date as datetime,
	  @vendor_end_date as datetime,
	  @vendor_meth_of_contact as char(1),
	  @vendor_status as varchar(10),
	  @vendor_meth_of_pay as varchar(15),
	  @vendor_type as varchar(20),
	  @vendor_comments as text,
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50),
	  @sec_phone as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vendor_name = ''
    BEGIN
    SET @vendor_name = null
    END
	  IF @phone_num = ''
    BEGIN
    SET @phone_num = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @Vendor_address2 = 0
    BEGIN
    SET @Vendor_address2 = null
    END
	  IF @vendor_job_assign = ''
    BEGIN
    SET @vendor_job_assign = null
    END
	  IF @vendor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_start_date = null
    END
	  IF @vendor_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_end_date = null
    END
	  IF @vendor_meth_of_contact = ''
    BEGIN
    SET @vendor_meth_of_contact = null
    END
	  IF @vendor_status = ''
    BEGIN
    SET @vendor_status = null
    END
	  IF @vendor_meth_of_pay = ''
    BEGIN
    SET @vendor_meth_of_pay = null
    END
	  IF @vendor_type = ''
    BEGIN
    SET @vendor_type = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
    SELECT [vendor_id] 
      FROM [dbo].[vendor] 
       WHERE ([vendor_name] like @vendor_name)
       AND ([phone_num] like @phone_num)
       AND ([email] like @email or [email] is null)
       AND ([address_id] = @address_id)
       AND ([Vendor_address2] = @Vendor_address2 or [Vendor_address2] is null)
       AND ([vendor_job_assign] like @vendor_job_assign or [vendor_job_assign] is null)
       AND ([vendor_start_date] = @vendor_start_date)
       AND ([vendor_end_date] = @vendor_end_date or [vendor_end_date] is null)
       AND ([vendor_meth_of_contact] = @vendor_meth_of_contact)
       AND ([vendor_status] like @vendor_status)
       AND ([vendor_meth_of_pay] like @vendor_meth_of_pay or [vendor_meth_of_pay] is null)
       AND ([vendor_type] like @vendor_type)
       AND ([vendor_comments] like @vendor_comments or [vendor_comments] is null)
       AND ([primary_fName] like @primary_fName or [primary_fName] is null)
       AND ([primary_lName] like @primary_lName or [primary_lName] is null)
       AND ([primary_phone] like @primary_phone or [primary_phone] is null)
       AND ([sec_fName] like @sec_fName or [sec_fName] is null)
       AND ([sec_lName] like @sec_lName or [sec_lName] is null)
       AND ([sec_phone] like @sec_phone or [sec_phone] is null)
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VENDOR]    Script Date: 4/16/2015 1:10:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_VENDOR]
	  @vendor_id as int,
	  @vendor_name as varchar(50),
	  @phone_num as varchar(11),
	  @email as varchar(50),
	  @address_id as int,
	  @Vendor_address2 as int,
	  @vendor_job_assign as varchar(30),
	  @vendor_start_date as datetime,
	  @vendor_end_date as datetime,
	  @vendor_meth_of_contact as char(1),
	  @vendor_status as varchar(10),
	  @vendor_meth_of_pay as varchar(15),
	  @vendor_type as varchar(20),
	  @vendor_comments as text,
	  @primary_fName as varchar(50),
	  @primary_lName as varchar(50),
	  @primary_phone as varchar(50),
	  @sec_fName as varchar(50),
	  @sec_lName as varchar(50),
	  @sec_phone as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vendor_name = ''
    BEGIN
    SET @vendor_name = null
    END
	  IF @phone_num = ''
    BEGIN
    SET @phone_num = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @Vendor_address2 = 0
    BEGIN
    SET @Vendor_address2 = null
    END
	  IF @vendor_job_assign = ''
    BEGIN
    SET @vendor_job_assign = null
    END
	  IF @vendor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_start_date = null
    END
	  IF @vendor_end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vendor_end_date = null
    END
	  IF @vendor_meth_of_contact = ''
    BEGIN
    SET @vendor_meth_of_contact = null
    END
	  IF @vendor_status = ''
    BEGIN
    SET @vendor_status = null
    END
	  IF @vendor_meth_of_pay = ''
    BEGIN
    SET @vendor_meth_of_pay = null
    END
	  IF @vendor_type = ''
    BEGIN
    SET @vendor_type = null
    END
	  IF @primary_fName = ''
    BEGIN
    SET @primary_fName = null
    END
	  IF @primary_lName = ''
    BEGIN
    SET @primary_lName = null
    END
	  IF @primary_phone = ''
    BEGIN
    SET @primary_phone = null
    END
	  IF @sec_fName = ''
    BEGIN
    SET @sec_fName = null
    END
	  IF @sec_lName = ''
    BEGIN
    SET @sec_lName = null
    END
	  IF @sec_phone = ''
    BEGIN
    SET @sec_phone = null
    END
	UPDATE [dbo].[vendor]
       SET
		   [vendor_name] = @vendor_name,
		   [phone_num] = @phone_num,
		   [email] = @email,
		   [address_id] = @address_id,
		   [Vendor_address2] = @Vendor_address2,
		   [vendor_job_assign] = @vendor_job_assign,
		   [vendor_start_date] = @vendor_start_date,
		   [vendor_end_date] = @vendor_end_date,
		   [vendor_meth_of_contact] = @vendor_meth_of_contact,
		   [vendor_status] = @vendor_status,
		   [vendor_meth_of_pay] = @vendor_meth_of_pay,
		   [vendor_type] = @vendor_type,
		   [vendor_comments] = @vendor_comments,
		   [primary_fName] = @primary_fName,
		   [primary_lName] = @primary_lName,
		   [primary_phone] = @primary_phone,
		   [sec_fName] = @sec_fName,
		   [sec_lName] = @sec_lName,
		   [sec_phone] = @sec_phone
       WHERE vendor_id = @vendor_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VENDOR]    Script Date: 4/16/2015 1:10:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_VENDOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_VENDOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_VENDOR]
	@vendor_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.vendor
	where vendor_id = @vendor_id
END
GO
/***********************************************************/
/*************************************************/
/****** - WHERE CLAUSE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VENDOR_WC]    Script Date: 4/16/2015 1:10:39 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VENDOR_WC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_WC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VENDOR_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'Select * from vendor where ' + @wareclause
	Exec(@string)
END
GO


