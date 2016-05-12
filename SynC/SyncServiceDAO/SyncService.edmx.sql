
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/26/2015 11:45:54
-- Generated from EDMX file: d:\Users\skouyate\documents\visual studio 2013\Projects\SynC\SyncServiceDAO\SyncService.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [D:\USERS\SKOUYATE\DOCUMENTS\VISUAL STUDIO 2013\PROJECTS\SYNC\SYNCSERVICEDAO\SYNCSERVICE.MDF];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_EventAdress]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventSet] DROP CONSTRAINT [FK_EventAdress];
GO
IF OBJECT_ID(N'[dbo].[FK_EventContribution]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContributionSet] DROP CONSTRAINT [FK_EventContribution];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonContribution]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContributionSet] DROP CONSTRAINT [FK_PersonContribution];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonEvent_Event]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonEvent] DROP CONSTRAINT [FK_PersonEvent_Event];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonEvent_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonEvent] DROP CONSTRAINT [FK_PersonEvent_Person];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AdressSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdressSet];
GO
IF OBJECT_ID(N'[dbo].[ContributionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContributionSet];
GO
IF OBJECT_ID(N'[dbo].[EventSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventSet];
GO
IF OBJECT_ID(N'[dbo].[PersonEvent]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonEvent];
GO
IF OBJECT_ID(N'[dbo].[PersonSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AdressSets'
CREATE TABLE [dbo].[AdressSets] (
    [AdressId] int IDENTITY(1,1) NOT NULL,
    [ZipCode] nvarchar(max)  NOT NULL,
    [Street] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ContributionSets'
CREATE TABLE [dbo].[ContributionSets] (
    [ContributionId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Quantity] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [EventEventId] int  NOT NULL,
    [PersonPersonId] int  NOT NULL
);
GO

-- Creating table 'EventSets'
CREATE TABLE [dbo].[EventSets] (
    [EventId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [Status] int  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [PersonPersonId] int  NOT NULL,
    [Adress_AdressId] int  NOT NULL
);
GO

-- Creating table 'PersonSets'
CREATE TABLE [dbo].[PersonSets] (
    [PersonId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [NickName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PersonEvent'
CREATE TABLE [dbo].[PersonEvent] (
    [EventSets_EventId] int  NOT NULL,
    [PersonSets_PersonId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AdressId] in table 'AdressSets'
ALTER TABLE [dbo].[AdressSets]
ADD CONSTRAINT [PK_AdressSets]
    PRIMARY KEY CLUSTERED ([AdressId] ASC);
GO

-- Creating primary key on [ContributionId] in table 'ContributionSets'
ALTER TABLE [dbo].[ContributionSets]
ADD CONSTRAINT [PK_ContributionSets]
    PRIMARY KEY CLUSTERED ([ContributionId] ASC);
GO

-- Creating primary key on [EventId] in table 'EventSets'
ALTER TABLE [dbo].[EventSets]
ADD CONSTRAINT [PK_EventSets]
    PRIMARY KEY CLUSTERED ([EventId] ASC);
GO

-- Creating primary key on [PersonId] in table 'PersonSets'
ALTER TABLE [dbo].[PersonSets]
ADD CONSTRAINT [PK_PersonSets]
    PRIMARY KEY CLUSTERED ([PersonId] ASC);
GO

-- Creating primary key on [EventSets_EventId], [PersonSets_PersonId] in table 'PersonEvent'
ALTER TABLE [dbo].[PersonEvent]
ADD CONSTRAINT [PK_PersonEvent]
    PRIMARY KEY CLUSTERED ([EventSets_EventId], [PersonSets_PersonId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Adress_AdressId] in table 'EventSets'
ALTER TABLE [dbo].[EventSets]
ADD CONSTRAINT [FK_EventAdress]
    FOREIGN KEY ([Adress_AdressId])
    REFERENCES [dbo].[AdressSets]
        ([AdressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventAdress'
CREATE INDEX [IX_FK_EventAdress]
ON [dbo].[EventSets]
    ([Adress_AdressId]);
GO

-- Creating foreign key on [EventEventId] in table 'ContributionSets'
ALTER TABLE [dbo].[ContributionSets]
ADD CONSTRAINT [FK_EventContribution]
    FOREIGN KEY ([EventEventId])
    REFERENCES [dbo].[EventSets]
        ([EventId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventContribution'
CREATE INDEX [IX_FK_EventContribution]
ON [dbo].[ContributionSets]
    ([EventEventId]);
GO

-- Creating foreign key on [PersonPersonId] in table 'ContributionSets'
ALTER TABLE [dbo].[ContributionSets]
ADD CONSTRAINT [FK_PersonContribution]
    FOREIGN KEY ([PersonPersonId])
    REFERENCES [dbo].[PersonSets]
        ([PersonId])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonContribution'
CREATE INDEX [IX_FK_PersonContribution]
ON [dbo].[ContributionSets]
    ([PersonPersonId]);
GO

-- Creating foreign key on [EventSets_EventId] in table 'PersonEvent'
ALTER TABLE [dbo].[PersonEvent]
ADD CONSTRAINT [FK_PersonEvent_EventSet]
    FOREIGN KEY ([EventSets_EventId])
    REFERENCES [dbo].[EventSets]
        ([EventId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PersonSets_PersonId] in table 'PersonEvent'
ALTER TABLE [dbo].[PersonEvent]
ADD CONSTRAINT [FK_PersonEvent_PersonSet]
    FOREIGN KEY ([PersonSets_PersonId])
    REFERENCES [dbo].[PersonSets]
        ([PersonId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonEvent_PersonSet'
CREATE INDEX [IX_FK_PersonEvent_PersonSet]
ON [dbo].[PersonEvent]
    ([PersonSets_PersonId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------