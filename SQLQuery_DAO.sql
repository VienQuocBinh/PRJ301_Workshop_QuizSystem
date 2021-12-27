-- Get Answer of the Question has ID = ?
SELECT * FROM Answer
WHERE QuestionID = 1

-- Get all Questions have in Quiz has ID = ?
SELECT q.ID, q.Content from Question q
JOIN QuestionQuiz qq ON q.ID = qq.QuestionID
WHERE qq.QuizID = 1

-- QuizSessionDAO: Get into room by Code of Room
SELECT * FROM QuizSession
WHERE Code = 
DBCC CHECKIDENT (QuizSession, RESEED, 0)
DELETE FROM QuizSession


-- StudentQuizSessDAO: Insert Student into Quiz Session to begin quiz
INSERT INTO StudentQuizSession(QuizSessionID, StudentID)
VALUES ()

-- StudentDAO: get studentID
INSERT INTO Student (Name) 
VALUES ('binhvqse161554');
SELECT TOP 1 * FROM Student
ORDER BY ID DESC 



-- StudentQuizAnswerDAO: add student ans
SELECT * FROM StudentQuizAnswer
SET IDENTITY_INSERT [dbo].[StudentQuizAnswer] OFF
INSERT [dbo].[StudentQuizAnswer] ([ID], [StudentID], [QuizSessionID], [QuizID], [QuestionID], [AnswerID], [CreatedTime], [UpdatedTime]) VALUES (1, 1, 1, 1, 1, 1, CAST(N'2018-08-23T13:52:07.160' AS DateTime), NULL)

WHERE StudentID =  AND QuizSessionID = AND QuizID=
INSERT INTO StudentQuizAnswer(StudentID, QuizSessionID, QuizID, QuestionID, AnswerID, CreatedTime)
VALUES ()


-- QuizSessionDAO: get quiz session
SELECT qs.ID, qs.Code, qs.QuizID, qs.StartedBy, qs.StartedDate, qs.EndDate, qs.IsInProgress, q.Title
FROM QuizSession qs
JOIN Quiz q ON q.ID = qs.QuizID
WHERE qs.StartedBy = 1

-- ResultRecordDAO: get List of Student do which Quiz
SELECT sqs.ID, sqs.QuizSessionID, sqs.StudentID, s.Name
FROM StudentQuizSession sqs
JOIN Student s ON s.ID = sqs.StudentID


-- ResultRecordDAO: get list answer by student id
SELECT  
CASE WHEN qq.QuestionID = sqa.QuestionID
THEN 1 ELSE 0
END AS 'done'
FROM QuestionQuiz qq
LEFT OUTER JOIN StudentQuizAnswer sqa
ON qq.QuestionID = sqa.QuestionID
AND qq.QuizID = sqa.QuizID
AND StudentID =

-- ResultRecordDAO: count number of question done in the quiz
SELECT COUNT(qq.ID) AS 'ALL',
COUNT(sqa.QuestionID) AS 'DONE'
FROM QuestionQuiz qq
LEFT OUTER JOIN StudentQuizAnswer sqa
ON sqa.QuestionID = qq.QuestionID
AND sqa.QuizID = qq.QuizID
AND sqa.StudentID = 

-- QuizDAO: get number of question in Quiz
SELECT COUNT(ID) FROM QuestionQuiz
WHERE QuizID = 

-- TotalClassDAO: get number student in each session
SELECT COUNT(QuizSessionID) 
FROM StudentQuizSession
WHERE QuizSessionID = 1
GROUP BY QuizSessionID

-- TotalClassDAO: get number of student do each question
SELECT COUNT(sqs.StudentID) FROM StudentQuizSession sqs
JOIN Student s ON s.ID = sqs.StudentID
JOIN StudentQuizAnswer sqa ON sqa.StudentID = s.ID
AND sqs.QuizSessionID = sqa.QuizSessionID
--AND sqs.QuizSessionID = ?
GROUP BY sqa.QuestionID

-- Fix: 0%
SELECT COUNT(SQA.StudentID) from Question Q
LEFT JOIN StudentQuizAnswer SQA ON Q.ID = SQA.QuestionID 
LEFT JOIN QuizSession QS ON QS.ID = SQA.QuizSessionID
--AND SQA.QuizSessionID = ?
GROUP BY Q.ID, Q.Content


-- Get question in the quizID = ?

SELECT Q.ID, Q.Content FROM QuestionQuiz QQ
JOIN Question Q ON QQ.QuestionID = Q.ID
WHERE QQ.QuizID = 1

-- Get answer of questionID = ? 
SELECT ID, QuestionID, IsCorrectAnswer, Content FROM Answer
WHERE QuestionID = 1


-- Check Question is Done before or this is the first time
SELECT ID FROM StudentQuizAnswer
WHERE StudentID = 41
AND QuizSessionID = 1
AND QuizID = 1
AND QuestionID = 1


-- Update the answer that already has in the session
UPDATE StudentQuizAnswer
SET AnswerID = 1,
UpdatedTime = GETDATE()
WHERE StudentID = 42
AND QuizSessionID = 1
AND QuizID = 1
AND QuestionID = 1


-- Get student answer
SELECT A.ID, A.QuestionID, A.IsCorrectAnswer, A.Content FROM StudentQuizAnswer SQA
JOIN Answer A ON SQA.AnswerID = A.ID
WHERE SQA.StudentID = 55
AND SQA.QuizSessionID = 1
AND SQA.QuizID = 1
AND SQA.QuestionID = 3


-- Calculate Score: COUNT THE NUMBER OF RIGHT ANSWERS 
SELECT SQA.StudentID, COUNT(SQA.QuestionID) 
FROM StudentQuizAnswer SQA
--SELECT SQA.StudentID, SQA.QuestionID, SQA.AnswerID FROM StudentQuizAnswer SQA
JOIN Question Q ON Q.ID = SQA.QuestionID
JOIN Answer A ON SQA.AnswerID = A.ID
WHERE A.IsCorrectAnswer = 1
GROUP BY SQA.StudentID


-- Count total question in the quizID = ?
SELECT COUNT(QuestionID) FROM QuestionQuiz
GROUP BY QuizID



SELECT * FROM Quiz
SELECT * FROM QuestionQuiz
SELECT * FROM Question
SELECT * FROM Answer
SELECT * FROM QuizSession
SELECT * FROM StudentQuizSession
SELECT * FROM StudentQuizAnswer
ORDER BY StudentID ASC

SELECT A.ID,A.QuestionID, A.IsCorrectAnswer, A.Content FROM StudentQuizAnswer SQA
JOIN Answer A ON SQA.AnswerID = A.ID
WHERE StudentID = 67 AND QuizSessionID =1 AND QuizID=1


DBCC CHECKIDENT (Question, RESEED, 0)
DELETE FROM Question

SELECT Title from Quiz where ID =
SELECT * from QuestionQuiz
SELECT * from StudentQuizAnswer
DBCC CHECKIDENT (StudentQuizAnswer, RESEED, 0)
SELECT * FROM StudentQuizSession
SELECT * fROM QuizSession

SELECT QuestionID, * FROM StudentQuizAnswer
WHERE StudentID =3 AND QuizSessionID =1 AND QuizID=1

SELECT * FROM StudentQuizAnswer

-- Get correct answer
select q.ID, q.Content, a.ID, a.Content from Question q
left join Answer a on q.ID = a.QuestionID
and a.IsCorrectAnswer = 1


-- Get student name
SELECT * FROM Student
-- Reset auto increment value to 1
DBCC CHECKIDENT (Student, RESEED, 0)
DELETE FROM Student

-- 
SELECT * FROM StudentQuizSession
DELETE FROM StudentQuizSession
DBCC CHECKIDENT (StudentQuizSession, RESEED, 0)

SELECT * FROM StudentQuizAnswer
DELETE FROM StudentQuizAnswer
DBCC CHECKIDENT (StudentQuizAnswer, RESEED, 0)

SELECT * from Quiz
WHERE ID = 1

--
SELECT ID FROM Teacher
WHERE Name = 'Vien Quoc Binh'