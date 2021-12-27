<%-- 
    Document   : showResult
    Created on : Dec 21, 2021, 11:55:12 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="3">
        <title>Result Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>${sessionScope.TITLE}</h1>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                        <c:forEach var="num" items="${sessionScope.NUM_QUESTION}">
                        <th>${num}</th>
                        </c:forEach>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="record" items="${LIST_RR}">
                    <tr>
                        <th>${record.name}
                            ${record.process}%
                        </th>
                        <c:forEach var="answer" items="${record.listAns}">
                            <td class="${(answer == true) ? 'border-quiz-done' :'border-quiz'}"></td>
                            
                        </c:forEach>
                    </tr>
                </c:forEach>
                <tr>
                    <th>All Class</th>
                        <c:forEach var="question" items="${LIST_TOTAL}">
                        <td>${question}%</td>
                    </c:forEach>
                </tr>
            </tbody>
        </table>
    </body>
</html>
