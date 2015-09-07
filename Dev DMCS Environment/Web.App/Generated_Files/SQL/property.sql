/****** Object:  Table [dbo].[property]    Script Date: 9/7/2015 11:23:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[property](
  [property_id] int IDENTITY(1,1) NOT NULL,
  [approx_mrkt_value] money NULL,
  [address_id] int NOT NULL,
  [case_id] int NOT NULL,
  [client_id] int NOT NULL,
  [Homeowners_Insurance_Payment] money NOT NULL,
  [monthly_property_payment] money NOT NULL,
  [mortg_comp] varchar(30) NULL,
  [Property_Tax_Payment] money NOT NULL,
  [own_prop] char(1) NULL,
  [rent_prop] char(1) NULL,
  [date_purchased] int NULL,
 CONSTRAINT [property_property_id_pk] PRIMARY KEY CLUSTERED 
(
	[property_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PROPERTY]    Script Date: 9/7/2015 11:23:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PROPERTY]
           @property_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [property_id]
      ,[approx_mrkt_value]
      ,[address_id]
      ,[case_id]
      ,[client_id]
      ,[Homeowners_Insurance_Payment]
      ,[monthly_property_payment]
      ,[mortg_comp]
      ,[Property_Tax_Payment]
      ,[own_prop]
      ,[rent_prop]
      ,[date_purchased]
  FROM [dbo].[property]
 WHERE property_id = @property_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PROPERTY]    Script Date: 9/7/2015 11:23:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PROPERTY]
	  @approx_mrkt_value as money,
	  @address_id as int,
	  @case_id as int,
	  @client_id as int,
	  @Homeowners_Insurance_Payment as money,
	  @monthly_property_payment as money,
	  @mortg_comp as varchar(30),
	  @Property_Tax_Payment as money,
	  @own_prop as char(1),
	  @rent_prop as char(1)
	  @date_purchased as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @approx_mrkt_value = 0
    BEGIN
    SET @approx_mrkt_value = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @Homeowners_Insurance_Payment = 0
    BEGIN
    SET @Homeowners_Insurance_Payment = null
    END
	  IF @monthly_property_payment = 0
    BEGIN
    SET @monthly_property_payment = null
    END
	  IF @mortg_comp = ''
    BEGIN
    SET @mortg_comp = null
    END
	  IF @Property_Tax_Payment = 0
    BEGIN
    SET @Property_Tax_Payment = null
    END
	  IF @own_prop = ''
    BEGIN
    SET @own_prop = null
    END
	  IF @rent_prop = ''
    BEGIN
    SET @rent_prop = null
    END
	  IF @date_purchased = 0
    BEGIN
    SET @date_purchased = null
    END
	Insert INTO [dbo].[property]
           (
            [approx_mrkt_value]
           ,[address_id]
           ,[case_id]
           ,[client_id]
           ,[Homeowners_Insurance_Payment]
           ,[monthly_property_payment]
           ,[mortg_comp]
           ,[Property_Tax_Payment]
           ,[own_prop]
           ,[rent_prop]
           ,[date_purchased]
            )
     VALUES (
            @approx_mrkt_value
           ,@address_id
           ,@case_id
           ,@client_id
           ,@Homeowners_Insurance_Payment
           ,@monthly_property_payment
           ,@mortg_comp
           ,@Property_Tax_Payment
           ,@own_prop
           ,@rent_prop
           ,@date_purchased
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PROPERTY]    Script Date: 9/7/2015 11:23:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PROPERTY]
	  @property_id as int,
	  @approx_mrkt_value as money,
	  @address_id as int,
	  @case_id as int,
	  @client_id as int,
	  @Homeowners_Insurance_Payment as money,
	  @monthly_property_payment as money,
	  @mortg_comp as varchar(30),
	  @Property_Tax_Payment as money,
	  @own_prop as char(1),
	  @rent_prop as char(1)
	  @date_purchased as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @approx_mrkt_value = 0
    BEGIN
    SET @approx_mrkt_value = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @Homeowners_Insurance_Payment = 0
    BEGIN
    SET @Homeowners_Insurance_Payment = null
    END
	  IF @monthly_property_payment = 0
    BEGIN
    SET @monthly_property_payment = null
    END
	  IF @mortg_comp = ''
    BEGIN
    SET @mortg_comp = null
    END
	  IF @Property_Tax_Payment = 0
    BEGIN
    SET @Property_Tax_Payment = null
    END
	  IF @own_prop = ''
    BEGIN
    SET @own_prop = null
    END
	  IF @rent_prop = ''
    BEGIN
    SET @rent_prop = null
    END
	  IF @date_purchased = 0
    BEGIN
    SET @date_purchased = null
    END
	UPDATE [dbo].[property]
       SET
		   [approx_mrkt_value] = @approx_mrkt_value,
		   [address_id] = @address_id,
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [Homeowners_Insurance_Payment] = @Homeowners_Insurance_Payment,
		   [monthly_property_payment] = @monthly_property_payment,
		   [mortg_comp] = @mortg_comp,
		   [Property_Tax_Payment] = @Property_Tax_Payment,
		   [own_prop] = @own_prop,
		   [rent_prop] = @rent_prop,
		   [date_purchased] = @date_purchased
       WHERE property_id = @property_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PROPERTY]    Script Date: 9/7/2015 11:23:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PROPERTY]
	@property_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.property
	where property_id = @property_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PROPERTY]    Script Date: 9/7/2015 11:23:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PROPERTY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PROPERTY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PROPERTY]
	  @approx_mrkt_value as money,
	  @address_id as int,
	  @case_id as int,
	  @client_id as int,
	  @Homeowners_Insurance_Payment as money,
	  @monthly_property_payment as money,
	  @mortg_comp as varchar(30),
	  @Property_Tax_Payment as money,
	  @own_prop as char(1),
	  @rent_prop as char(1)
	  @date_purchased as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @approx_mrkt_value = 0
    BEGIN
    SET @approx_mrkt_value = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @Homeowners_Insurance_Payment = 0
    BEGIN
    SET @Homeowners_Insurance_Payment = null
    END
	  IF @monthly_property_payment = 0
    BEGIN
    SET @monthly_property_payment = null
    END
	  IF @mortg_comp = ''
    BEGIN
    SET @mortg_comp = null
    END
	  IF @Property_Tax_Payment = 0
    BEGIN
    SET @Property_Tax_Payment = null
    END
	  IF @own_prop = ''
    BEGIN
    SET @own_prop = null
    END
	  IF @rent_prop = ''
    BEGIN
    SET @rent_prop = null
    END
	  IF @date_purchased = 0
    BEGIN
    SET @date_purchased = null
    END
    SELECT [property_id] 
      FROM [dbo].[property] 
       WHERE ([approx_mrkt_value] = @approx_mrkt_value or [approx_mrkt_value] is null)
       AND ([address_id] = @address_id)
       AND ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([Homeowners_Insurance_Payment] = @Homeowners_Insurance_Payment)
       AND ([monthly_property_payment] = @monthly_property_payment)
       AND ([mortg_comp] like @mortg_comp or [mortg_comp] is null)
       AND ([Property_Tax_Payment] = @Property_Tax_Payment)
       AND ([own_prop] = @own_prop or [own_prop] is null)
       AND ([rent_prop] = @rent_prop or [rent_prop] is null)
       AND ([date_purchased] = @date_purchased or [date_purchased] is null)
END
GO

