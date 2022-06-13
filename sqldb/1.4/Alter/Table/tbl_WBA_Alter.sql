Alter table WBA Add ContactId int NULL
GO
ALTER TABLE [dbo].[WBA] WITH CHECK ADD FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contacts] ([Id])
GO

Alter table WBA Add TargetPremium [bigint] NULL
Go
Update WBA Set TargetPremium=0
GO
Alter table WBA Alter Column TargetPremium [bigint] Not NULL
GO
GO
Alter table WBA Alter Column UserId [int]  NULL
GO
ALTER TABLE [dbo].[WBA]  WITH CHECK ADD  CONSTRAINT [FK_WBA_Users__Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])

Alter table WBA Add PriorityId [int] NULL
Go
ALTER TABLE [dbo].[WBA] WITH CHECK ADD FOREIGN KEY([PriorityId])
REFERENCES [dbo].[Priority] ([Id])
GO
Alter table WBA Add ResultId [int] NULL
Go
ALTER TABLE [dbo].[WBA] WITH CHECK ADD FOREIGN KEY([ResultId])
REFERENCES [dbo].[Result] ([Id])
GO
Alter table WBA Add LeadGenerateId [int] NULL
Go
ALTER TABLE [dbo].[WBA] WITH CHECK ADD FOREIGN KEY([LeadGenerateId])
REFERENCES [dbo].[LeadGenerator] ([Id])
GO
Alter table WBA Add ProgressId [int] NULL
Go
ALTER TABLE [dbo].[WBA] WITH CHECK ADD FOREIGN KEY([ProgressId])
REFERENCES [dbo].[Progress] ([Id])
GO
GO
Alter table WBA Add ExpiringCarrierId [int] NULL
Go
ALTER TABLE [dbo].[WBA] WITH CHECK ADD FOREIGN KEY([ExpiringCarrierId])
REFERENCES [dbo].[ExpiringCarrier] ([Id])
GO	
Alter table WBA Add ExpiringPremium [bigint] NULL
Go
Alter table WBA Add ExpiringRevenue [bigint] NULL
Go	
Alter table WBA Add AccountManagerUserId [bigint] NULL
Go
ALTER TABLE [dbo].[WBA] WITH CHECK ADD FOREIGN KEY([AccountManagerUserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[WBA]  WITH CHECK ADD FOREIGN KEY([ExpiringCarrierId])
REFERENCES [dbo].[ExpiringCarrier] ([Id])
GO

ALTER TABLE [dbo].[WBA]  WITH CHECK ADD FOREIGN KEY([ResultId])
REFERENCES [dbo].[Result] ([Id])
GO