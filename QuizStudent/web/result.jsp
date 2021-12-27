<%-- 
    Document   : result
    Created on : Dec 27, 2021, 2:11:41 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
        <link rel="stylesheet" href="style.css"/>
        <link rel="shortcut icon" href="img/check-list.png"/>
    </head>
    <body>
        <h1>Hello Student: ${sessionScope.STUDENT.name}</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
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

                        <c:forEach var="answer" items="${question.listAnswer}">
                            <c:if test="${answer.isCorrectAnswer == true}">
                                <td>${answer.content}</td>
                            </c:if>
                        </c:forEach>

                        <c:forEach var="questionDoneID" items="${sessionScope.LIST_QUESTION_DONE}">
                            <c:if test="${questionDoneID == question.questionID}">
                                <c:forEach var="studentAnswer" items="${sessionScope.LIST_ANSWER}">
                                    <c:if test="${studentAnswer.questionID == questionDoneID}">
                                        <td class="${(studentAnswer.isCorrectAnswer == true) ? 'right' : 'wrong'}">${studentAnswer.content}</td>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>

                    </tr>
                </c:forEach>

            </tbody>
        </table>

        <h2>Score: ${sessionScope.SCORE}</h2>
        <h3>Right answer: ${sessionScope.N_RIGHT_ANSWER} / ${sessionScope.N_TOTAL_QUESTION}</h3>
    </body>
</html>
