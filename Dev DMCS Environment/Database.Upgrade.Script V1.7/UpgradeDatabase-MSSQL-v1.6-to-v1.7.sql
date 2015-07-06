
/*
Run this script on:

        SimpleTools.RoleMemberAdmin.V1.6 -  This database will be modified to synchronize it with:
        SimpleTools.RoleMemberAdmin.v1.7

		You are recommended to back up your database before running this script
*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Adding AuthMemberTickets ...'
GO

CREATE TABLE [dbo].[AuthMemberTickets](
	[AuthMemberTicketID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberID] [bigint] NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[Expiration] [datetime] NOT NULL,
	[IsPersistent] [int] NOT NULL,
	[Token] [varchar](128) NOT NULL,
 CONSTRAINT [PK_AuthMemberTickets] PRIMARY KEY CLUSTERED 
(
	[AuthMemberTicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_AuthMemberTickets] UNIQUE NONCLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[AuthMemberTickets]  WITH CHECK ADD  CONSTRAINT [FK_AuthMemberTickets_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO

ALTER TABLE [dbo].[AuthMemberTickets] CHECK CONSTRAINT [FK_AuthMemberTickets_Members]
GO

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO