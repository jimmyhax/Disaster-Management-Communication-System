/****** Object:  Table [dbo].[deceased]    Script Date: 9/7/2015 11:22:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deceased](
  [deceased_id] int IDENTITY(1,1) NOT NULL,
  [date_of_autopsy] datetime NOT NULL,
  [external_exam] text(2147483647) NULL,
  [identifying_marks] text(2147483647) NOT NULL,
  [internal_exam] text(2147483647) NULL,
  [reason_of_death] text(2147483647) NULL,
  [time_of_death] datetime NULL,
 CONSTRAINT [deceased_deceased_id_pk] PRIMARY KEY CLUSTERED 
(
	[deceased_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DECEASED]    Script Date: 9/7/2015 11:22:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DECEASED]
           @deceased_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [deceased_id]
      ,[date_of_autopsy]
      ,[external_exam]
      ,[identifying_marks]
      ,[internal_exam]
      ,[reason_of_death]
      ,[time_of_death]
  FROM [dbo].[deceased]
 WHERE deceased_id = @deceased_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DECEASED]    Script Date: 9/7/2015 11:22:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DECEASED]
	  @deceased_id as int,
	  @date_of_autopsy as datetime,
	  @external_exam as text,
	  @identifying_marks as text,
	  @internal_exam as text,
	  @reason_of_death as text
	  @time_of_death as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @date_of_autopsy = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_autopsy = null
    END
	  IF @time_of_death = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_death = null
    END
	Insert INTO [dbo].[deceased]
           (
            [deceased_id]
           ,[date_of_autopsy]
           ,[external_exam]
           ,[identifying_marks]
           ,[internal_exam]
           ,[reason_of_death]
           ,[time_of_death]
            )
     VALUES (
            @deceased_id
           ,@date_of_autopsy
           ,@external_exam
           ,@identifying_marks
           ,@internal_exam
           ,@reason_of_death
           ,@time_of_death
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DECEASED]    Script Date: 9/7/2015 11:22:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DECEASED]
	  @deceased_id as int,
	  @date_of_autopsy as datetime,
	  @external_exam as text,
	  @identifying_marks as text,
	  @internal_exam as text,
	  @reason_of_death as text
	  @time_of_death as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @date_of_autopsy = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_autopsy = null
    END
	  IF @time_of_death = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_death = null
    END
	UPDATE [dbo].[deceased]
       SET
		   [date_of_autopsy] = @date_of_autopsy,
		   [external_exam] = @external_exam,
		   [identifying_marks] = @identifying_marks,
		   [internal_exam] = @internal_exam,
		   [reason_of_death] = @reason_of_death,
		   [time_of_death] = @time_of_death
       WHERE deceased_id = @deceased_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DECEASED]    Script Date: 9/7/2015 11:22:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DECEASED]
	@deceased_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.deceased
	where deceased_id = @deceased_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DECEASED]    Script Date: 9/7/2015 11:22:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DECEASED]
	  @date_of_autopsy as datetime,
	  @external_exam as text,
	  @identifying_marks as text,
	  @internal_exam as text,
	  @reason_of_death as text
	  @time_of_death as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @date_of_autopsy = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_autopsy = null
    END
	  IF @time_of_death = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_death = null
    END
    SELECT [deceased_id] 
      FROM [dbo].[deceased] 
       WHERE ([date_of_autopsy] = @date_of_autopsy)
       AND ([external_exam] like @external_exam or [external_exam] is null)
       AND ([identifying_marks] like @identifying_marks)
       AND ([internal_exam] like @internal_exam or [internal_exam] is null)
       AND ([reason_of_death] like @reason_of_death or [reason_of_death] is null)
       AND ([time_of_death] = @time_of_death or [time_of_death] is null)
END
GO

