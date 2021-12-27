USE [QuizSystem]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 8/31/2018 10:32:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[IsCorrectAnswer] [bit] NULL,
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 8/31/2018 10:32:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionQuiz]    Script Date: 8/31/2018 10:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionQuiz](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[QuizID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 8/31/2018 10:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[OwnedBy] [int] NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizSession]    Script Date: 8/31/2018 10:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizSession](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[QuizID] [int] NULL,
	[StartedBy] [int] NULL,
	[StartedDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsInProgress] [bit] NULL,
 CONSTRAINT [PK_QuizSession] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/31/2018 10:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentQuizAnswer]    Script Date: 8/31/2018 10:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentQuizAnswer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[QuizSessionID] [int] NULL,
	[QuizID] [int] NULL,
	[QuestionID] [int] NULL,
	[AnswerID] [bigint] NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentQuizSession]    Script Date: 8/31/2018 10:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentQuizSession](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuizSessionID] [int] NULL,
	[StudentID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 8/31/2018 10:32:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (1, 1, 1, N'A planet in our solar system')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (2, 1, 0, N'An orbit in our solar system')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (3, 1, 0, N'A comet in our solar system')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (4, 1, 0, N'An asteroid in our solar system')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (5, 3, 1, N'8 minutes')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (6, 3, 0, N'18  minutes')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (7, 3, 0, N'18 seconds')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (8, 3, 0, N'8 seconds')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (9, 3, 0, N'18 hours')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (10, 4, 0, N'Yes, it is')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (11, 4, 0, N'No, it is')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (12, 4, 0, N'Yes, it isn''t')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (13, 4, 1, N'No, it isn''t')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (14, 5, 1, N'Programming')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (15, 5, 0, N'Book Reading')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (16, 5, 0, N'Poem Writing')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (17, 5, 0, N'Paint Teaching')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (18, 6, 1, N'Hard Drive Disk')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (19, 6, 0, N'Hard Do Duck')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (20, 6, 0, N'How Done Dude')
INSERT [dbo].[Answer] ([ID], [QuestionID], [IsCorrectAnswer], [Content]) VALUES (21, 6, 0, N'Hate Deal Dishes')
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([ID], [Content]) VALUES (1, N'What is Mars called?')
INSERT [dbo].[Question] ([ID], [Content]) VALUES (3, N'How long does light from the sun take to reach the Earth?')
INSERT [dbo].[Question] ([ID], [Content]) VALUES (4, N'Is Java Web hard?')
INSERT [dbo].[Question] ([ID], [Content]) VALUES (5, N'What is the job of a programmer?')
INSERT [dbo].[Question] ([ID], [Content]) VALUES (6, N'HDD is the short form of which?')
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionQuiz] ON 

INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (1, 1, 1)
INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (2, 3, 1)
INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (3, 4, 1)
INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (4, 5, 1)
INSERT [dbo].[QuestionQuiz] ([ID], [QuestionID], [QuizID]) VALUES (5, 6, 1)
SET IDENTITY_INSERT [dbo].[QuestionQuiz] OFF
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([ID], [Title], [CreatedDate], [OwnedBy]) VALUES (1, N'Funny Quiz for Workshop Class', CAST(N'2018-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Quiz] ([ID], [Title], [CreatedDate], [OwnedBy]) VALUES (2, N'Progress Test 1', CAST(N'2018-08-30T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
SET IDENTITY_INSERT [dbo].[QuizSession] ON 

INSERT [dbo].[QuizSession] ([ID], [Code], [QuizID], [StartedBy], [StartedDate], [EndDate], [IsInProgress]) VALUES (1, N'ABC1234A', 1, 1, NULL, NULL, 1)
INSERT [dbo].[QuizSession] ([ID], [Code], [QuizID], [StartedBy], [StartedDate], [EndDate], [IsInProgress]) VALUES (3, N'PT1', 2, 1, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[QuizSession] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [Name]) VALUES (1, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (3, N'nhattqSE05741')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (4, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (5, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (6, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (7, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (8, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (9, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (10, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (11, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (12, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (13, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (14, N'')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (15, N'')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (16, N'')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (17, N'')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (18, N'')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (19, N'')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (20, NULL)
INSERT [dbo].[Student] ([ID], [Name]) VALUES (21, NULL)
INSERT [dbo].[Student] ([ID], [Name]) VALUES (22, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (23, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (24, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (25, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (26, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (27, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (28, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (29, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (30, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (31, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (32, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (33, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (34, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (35, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (36, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (37, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (38, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (39, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (40, NULL)
INSERT [dbo].[Student] ([ID], [Name]) VALUES (41, NULL)
INSERT [dbo].[Student] ([ID], [Name]) VALUES (42, NULL)
INSERT [dbo].[Student] ([ID], [Name]) VALUES (43, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (44, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (45, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (46, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (47, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (48, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (49, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (50, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (51, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (52, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (53, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (54, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (55, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (56, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (57, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (58, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (59, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (60, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (61, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (62, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (63, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (64, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (65, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (66, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (67, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (68, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (69, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1002, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1003, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1004, N'thaycacac')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1005, N'thaycacac')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1006, N'thaycacac')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1007, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1008, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1009, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1010, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1011, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1012, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1013, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1014, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1015, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1016, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1017, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1018, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1019, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1020, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1021, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1022, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1023, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1024, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1025, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1026, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1027, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1028, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1029, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1030, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1031, N'hoapnse05740')
GO
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1032, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1033, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1034, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1035, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1036, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1037, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1038, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1039, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1040, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1041, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1042, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1043, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1044, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1045, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1046, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1047, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1048, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1049, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1050, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1051, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1052, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1053, N'nhattqse05123')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1054, N'hiepdqse05762')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1055, N'cuongnxse03652')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1056, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1057, N'ManhPVse05704')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1058, N'manhpvse05704')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1059, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1060, N'duvpv04216')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1061, N'duvpv04216')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (1062, N'hoangnvse05693')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2054, N'sangndse054123')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2055, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2056, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2057, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2058, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2059, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2060, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2061, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2062, N'hoapnse05740')
INSERT [dbo].[Student] ([ID], [Name]) VALUES (2063, N'thuynphsb05747')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentQuizAnswer] ON 

INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (1, 1, 1, 1, 1, 1, CAST(N'2018-08-23T13:52:07.160' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (4, 2, 1, 1, 3, 2, NULL, NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (5, 2, 1, 1, 3, 2, CAST(N'2018-08-24T10:53:05.170' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (6, 60, 1, 1, 1, 3, CAST(N'2018-08-24T10:59:14.633' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (7, 61, 1, 1, 1, 2, CAST(N'2018-08-24T11:00:33.817' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (12, 62, 1, 1, 1, 1, CAST(N'2018-08-24T11:02:36.887' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (13, 62, 1, 1, 3, 1, CAST(N'2018-08-24T11:02:36.900' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (14, 62, 1, 1, 4, 1, CAST(N'2018-08-24T11:02:36.910' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (15, 62, 1, 1, 5, 1, CAST(N'2018-08-24T11:02:36.923' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (16, 64, 1, 1, 1, 1, CAST(N'2018-08-24T11:04:13.287' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (17, 64, 1, 1, 3, 1, CAST(N'2018-08-24T11:04:13.303' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (18, 64, 1, 1, 4, 1, CAST(N'2018-08-24T11:04:13.320' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (19, 64, 1, 1, 5, 1, CAST(N'2018-08-24T11:04:13.333' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20, 66, 1, 1, 1, 1, CAST(N'2018-08-24T11:06:26.317' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (21, 66, 1, 1, 3, 1, CAST(N'2018-08-24T11:06:26.330' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (22, 66, 1, 1, 4, 1, CAST(N'2018-08-24T11:06:26.343' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (23, 66, 1, 1, 5, 1, CAST(N'2018-08-24T11:06:26.360' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (25, 67, 1, 1, 3, 6, CAST(N'2018-08-24T11:09:12.947' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (29, 68, 1, 1, 3, 6, CAST(N'2018-08-24T11:15:47.870' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (33, 69, 1, 1, 3, 7, CAST(N'2018-08-24T11:23:50.213' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (35, 69, 1, 1, 5, 14, CAST(N'2018-08-24T11:23:50.263' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10002, 1047, 1, 1, 1, 1, CAST(N'2018-08-26T09:21:40.823' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10003, 1047, 1, 1, 3, 6, CAST(N'2018-08-26T09:21:40.840' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10004, 1047, 1, 1, 4, 11, CAST(N'2018-08-26T09:21:40.857' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10005, 1047, 1, 1, 5, 16, CAST(N'2018-08-26T09:21:40.873' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10006, 1047, 1, 1, 6, 19, CAST(N'2018-08-26T09:21:40.890' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10007, 1048, 1, 1, 1, 1, CAST(N'2018-08-26T09:35:13.030' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10008, 1048, 1, 1, 3, 6, CAST(N'2018-08-26T09:35:13.047' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10009, 1048, 1, 1, 4, 11, CAST(N'2018-08-26T09:35:13.067' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10010, 1048, 1, 1, 5, 15, CAST(N'2018-08-26T09:35:13.080' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10011, 1048, 1, 1, 6, 20, CAST(N'2018-08-26T09:35:13.093' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10017, 1050, 1, 1, 1, 1, CAST(N'2018-08-26T09:38:17.797' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10018, 1050, 1, 1, 3, 5, CAST(N'2018-08-26T09:38:17.813' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10019, 1050, 1, 1, 4, 11, CAST(N'2018-08-26T09:38:17.830' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10020, 1050, 1, 1, 5, 16, CAST(N'2018-08-26T09:38:17.860' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10021, 1050, 1, 1, 6, 21, CAST(N'2018-08-26T09:38:17.873' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10022, 1051, 1, 1, 1, 1, CAST(N'2018-08-26T09:40:00.277' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10023, 1051, 1, 1, 3, 5, CAST(N'2018-08-26T09:40:00.290' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10024, 1051, 1, 1, 4, 11, CAST(N'2018-08-26T09:40:00.303' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10025, 1051, 1, 1, 5, 15, CAST(N'2018-08-26T09:40:00.317' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10026, 1051, 1, 1, 6, 19, CAST(N'2018-08-26T09:40:00.327' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10027, 1052, 1, 1, 1, 1, CAST(N'2018-08-26T09:46:20.807' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10028, 1052, 1, 1, 3, 5, CAST(N'2018-08-26T09:46:20.823' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10029, 1052, 1, 1, 4, 11, CAST(N'2018-08-26T09:46:20.833' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10030, 1052, 1, 1, 5, 14, CAST(N'2018-08-26T09:46:20.853' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10047, 1058, 1, 1, 1, 2, CAST(N'2018-08-29T02:44:29.437' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10032, 1053, 1, 1, 1, 1, CAST(N'2018-08-26T09:47:17.677' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10048, 1058, 1, 1, 3, 7, CAST(N'2018-08-29T02:44:29.450' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10034, 1053, 1, 1, 4, 13, CAST(N'2018-08-26T09:47:17.707' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10035, 1053, 1, 1, 5, 14, CAST(N'2018-08-26T09:47:17.720' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10049, 1058, 1, 1, 4, 11, CAST(N'2018-08-29T02:44:29.463' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10037, 1054, 1, 1, 1, 1, CAST(N'2018-08-27T15:05:27.100' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10038, 1054, 1, 1, 3, 6, CAST(N'2018-08-27T15:05:27.133' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10039, 1054, 1, 1, 4, 11, CAST(N'2018-08-27T15:05:27.150' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10040, 1054, 1, 1, 5, 16, CAST(N'2018-08-27T15:05:27.167' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10041, 1054, 1, 1, 6, 21, CAST(N'2018-08-27T15:05:27.183' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10050, 1058, 1, 1, 5, 16, CAST(N'2018-08-29T02:44:29.477' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10043, 1055, 1, 1, 3, 6, CAST(N'2018-08-27T15:18:53.030' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10051, 1058, 1, 1, 6, 19, CAST(N'2018-08-29T02:44:29.493' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10045, 1055, 1, 1, 5, 17, CAST(N'2018-08-27T15:18:53.063' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10046, 1055, 1, 1, 6, 21, CAST(N'2018-08-27T15:18:53.080' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10052, 1060, 1, 1, 1, 3, CAST(N'2018-08-29T02:58:38.057' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10053, 1062, 1, 1, 5, 15, CAST(N'2018-08-29T03:00:54.987' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10054, 1062, 1, 1, 3, 6, CAST(N'2018-08-29T03:01:08.947' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10055, 1062, 1, 1, 6, 21, CAST(N'2018-08-29T03:01:18.290' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10056, 1062, 1, 1, 3, 6, CAST(N'2018-08-29T03:01:32.293' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20037, 2054, 1, 1, 1, 2, CAST(N'2018-08-31T00:24:19.630' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20038, 2054, 1, 1, 4, 13, CAST(N'2018-08-31T00:24:31.150' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20039, 2054, 1, 1, 6, 21, CAST(N'2018-08-31T00:24:40.320' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20041, 2061, 1, 1, 1, 3, CAST(N'2018-08-31T02:48:55.040' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20042, 2062, 1, 1, 1, 3, CAST(N'2018-08-31T02:49:44.513' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20045, 2062, 1, 1, 4, 11, CAST(N'2018-08-31T02:50:02.960' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20046, 2062, 1, 1, 5, 16, CAST(N'2018-08-31T02:50:04.927' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20048, 2063, 1, 1, 6, 19, CAST(N'2018-08-31T02:52:13.420' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20049, 2063, 1, 1, 1, 2, CAST(N'2018-08-31T02:52:21.117' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20050, 2063, 1, 1, 5, 15, CAST(N'2018-08-31T02:52:27.180' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (9, 61, 1, 1, 3, 2, CAST(N'2018-08-24T11:00:33.923' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10, 61, 1, 1, 4, 2, CAST(N'2018-08-24T11:00:33.940' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (11, 61, 1, 1, 5, 2, CAST(N'2018-08-24T11:00:33.953' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (24, 67, 1, 1, 1, 1, CAST(N'2018-08-24T11:09:12.910' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (27, 67, 1, 1, 5, 17, CAST(N'2018-08-24T11:09:13.050' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (28, 68, 1, 1, 1, 1, CAST(N'2018-08-24T11:15:47.843' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (31, 68, 1, 1, 5, 17, CAST(N'2018-08-24T11:15:47.970' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (32, 69, 1, 1, 1, 4, CAST(N'2018-08-24T11:23:50.187' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (34, 69, 1, 1, 4, 11, CAST(N'2018-08-24T11:23:50.240' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10012, 1049, 1, 1, 1, 1, CAST(N'2018-08-26T09:36:20.180' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10013, 1049, 1, 1, 3, 5, CAST(N'2018-08-26T09:36:20.197' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10014, 1049, 1, 1, 4, 11, CAST(N'2018-08-26T09:36:20.210' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10015, 1049, 1, 1, 5, 14, CAST(N'2018-08-26T09:36:20.220' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (10016, 1049, 1, 1, 6, 18, CAST(N'2018-08-26T09:36:20.240' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20047, 2063, 1, 1, 3, 6, CAST(N'2018-08-31T02:52:05.733' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20040, 2054, 1, 1, 3, 5, CAST(N'2018-08-31T00:25:12.393' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20043, 2062, 1, 1, 6, 18, CAST(N'2018-08-31T02:49:53.663' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20044, 2062, 1, 1, 3, 7, CAST(N'2018-08-31T02:49:58.643' AS DateTime), NULL)
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (20051, 2063, 1, 1, 4, 11, CAST(N'2018-08-31T02:52:31.400' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[StudentQuizAnswer] OFF
SET IDENTITY_INSERT [dbo].[StudentQuizSession] ON 

INSERT [dbo].[StudentQuizSession] ([ID], [QuizSessionID], [StudentID]) VALUES (1, 1, 1)
INSERT [dbo].[StudentQuizSession] ([ID], [QuizSessionID], [StudentID]) VALUES (2, 1, 1053)
INSERT [dbo].[StudentQuizSession] ([ID], [QuizSessionID], [StudentID]) VALUES (3, 1, 1054)
INSERT [dbo].[StudentQuizSession] ([ID], [QuizSessionID], [StudentID]) VALUES (4, 1, 1055)
INSERT [dbo].[StudentQuizSession] ([ID], [QuizSessionID], [StudentID]) VALUES (7, 1, 1058)
INSERT [dbo].[StudentQuizSession] ([ID], [QuizSessionID], [StudentID]) VALUES (8, 1, 1060)
INSERT [dbo].[StudentQuizSession] ([ID], [QuizSessionID], [StudentID]) VALUES (1002, 1, 2054)
SET IDENTITY_INSERT [dbo].[StudentQuizSession] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([ID], [Name]) VALUES (1, N'Tran Binh Duong')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[QuestionQuiz]  WITH CHECK ADD  CONSTRAINT [FK_QuestionQuiz_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[QuestionQuiz] CHECK CONSTRAINT [FK_QuestionQuiz_Question]
GO
ALTER TABLE [dbo].[QuestionQuiz]  WITH CHECK ADD  CONSTRAINT [FK_QuestionQuiz_Quiz] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([ID])
GO
ALTER TABLE [dbo].[QuestionQuiz] CHECK CONSTRAINT [FK_QuestionQuiz_Quiz]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Teacher] FOREIGN KEY([OwnedBy])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Teacher]
GO
ALTER TABLE [dbo].[QuizSession]  WITH CHECK ADD  CONSTRAINT [FK_QuizSession_Quiz] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([ID])
GO
ALTER TABLE [dbo].[QuizSession] CHECK CONSTRAINT [FK_QuizSession_Quiz]
GO
ALTER TABLE [dbo].[QuizSession]  WITH CHECK ADD  CONSTRAINT [FK_QuizSession_Teacher] FOREIGN KEY([StartedBy])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[QuizSession] CHECK CONSTRAINT [FK_QuizSession_Teacher]
GO
ALTER TABLE [dbo].[StudentQuizAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizAnswer_Answer] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answer] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizAnswer] CHECK CONSTRAINT [FK_StudentQuizAnswer_Answer]
GO
ALTER TABLE [dbo].[StudentQuizAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizAnswer_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizAnswer] CHECK CONSTRAINT [FK_StudentQuizAnswer_Question]
GO
ALTER TABLE [dbo].[StudentQuizAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizAnswer_QuizSession] FOREIGN KEY([QuizSessionID])
REFERENCES [dbo].[QuizSession] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizAnswer] CHECK CONSTRAINT [FK_StudentQuizAnswer_QuizSession]
GO
ALTER TABLE [dbo].[StudentQuizAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizAnswer_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizAnswer] CHECK CONSTRAINT [FK_StudentQuizAnswer_Student]
GO
ALTER TABLE [dbo].[StudentQuizSession]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizSession_QuizSession] FOREIGN KEY([QuizSessionID])
REFERENCES [dbo].[QuizSession] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizSession] CHECK CONSTRAINT [FK_StudentQuizSession_QuizSession]
GO
ALTER TABLE [dbo].[StudentQuizSession]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizSession_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[StudentQuizSession] CHECK CONSTRAINT [FK_StudentQuizSession_Student]
GO