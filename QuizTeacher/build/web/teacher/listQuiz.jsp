<%-- 
    Document   : listQuiz
    Created on : Dec 21, 2021, 5:31:23 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Quiz Page</title>
    </head>
    <body>
        <h1>List student ${sessionScope.TEACHER.id}</h1>
        <hr>
        <ul>
            <c:forEach var="quiz" items="${sessionScope.LIST_QUIZ_SESSION}">
                <s:form action="ShowResult" method="">
                    <s:hidden name="quizSessionID" value="1"/>
                    <li>
                        ${quiz.titleQuiz}
                        <c:if test="${quiz.isInProgress == true}">
                            <s:submit value="ViewResult"></s:submit>
                        </c:if>
                    </li>
                </s:form> 
            </c:forEach>
        </ul>

    </body>
</html>
