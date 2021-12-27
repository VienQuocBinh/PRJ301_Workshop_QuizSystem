<%-- 
    Document   : quiz
    Created on : Dec 20, 2021, 4:28:34 PM
    Author     : LucasBV
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Page</title>
        <link rel="stylesheet" href="style.css"/>
        <link rel="shortcut icon" href="img/exam_note_paper.png"/>

    </head>
    <body>
        <h3>Quiz title: ${sessionScope.QUIZ.title}</h3>
        <hr>

        <c:forEach var="question" items="${sessionScope.LIST_QUESTION}" varStatus="count">
            <form action="StudentMainController" method="POST">

                <ul style="list-style-type: upper-latin">

                    <p>${count.count}.${question.content}</p>

                    <c:forEach var="answer" items="${question.listAnswer}">
                        <li>
                            <label>
                                <input type="radio" name="question" value="${question.questionID}-${answer.id}">${answer.content}
                            </label>
                        </li>
                    </c:forEach>

                </ul>

                <input type="submit" name="action" value="StudentSubmit">


            </form>

        </c:forEach>

        <hr>
        <table border="1">
            <thead>
                <tr>
                    <th>Number</th>
                    <th>Question</th>
                    <th>Answer</th>
                    <th>Your answer</th>

                </tr>
            </thead>
            <tbody>

                <c:forEach var="question" items="${sessionScope.LIST_QUESTION}" varStatus="count">
                    <tr>
                        <td>${count.count}</td>
                        <td>${question.content}</td>

                        <c:forEach var="listAnswer" items="${question.listAnswer}">
                            <c:if test="${listAnswer.isCorrectAnswer == true}">
                                <td>${listAnswer.content}</td>
                            </c:if> 
                        </c:forEach>

                        <c:forEach var="questionDoneID" items="${sessionScope.LIST_QUESTION_DONE}">
                            <c:if test="${questionDoneID == question.questionID}">
                                <c:forEach var="answer" items="${sessionScope.LIST_ANSWER}">

                                    <c:if test="${answer.questionID == questionDoneID}">
                                        <td>${answer.content}</td>
                                    </c:if>

                                </c:forEach>

                            </c:if>

                        </c:forEach>    

                    </tr>
                </c:forEach>


            </tbody>
        </table>



        <form action="StudentMainController" method="POST">
            <input type="submit" name="action" value="ShowResult">
        </form>


    </body>
</html>
