<%-- 
    Document   : loginroom
    Created on : Dec 19, 2021, 8:28:39 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Room</title>
    </head>
    <body>
        <h1>Student Login</h1>
        <p>Room Name</p>
        <form action="StudentMainController" method="POST">
            <input type="text" name="roomName" placeholder="Enter room">
            <input type="hidden" name="action" value="StudentLoginRoom">
            <input type="submit" value="Join">
        </form>
        <c:if test="${requestScope.ERROR_MESSAGE !=null}">
            ERROR: ${requestScope.ERROR_MESSAGE}
        </c:if>
    </body>
</html>
