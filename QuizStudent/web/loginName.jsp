<%-- 
    Document   : loginName
    Created on : Dec 19, 2021, 8:46:24 PM
    Author     : LucasBV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Name</title>
    </head>
    <body>
        <h1>Enter your name</h1>
        <form action="StudentMainController" method="POST">
            <input type="text" name="studentName">
            <input type="hidden" name="action" value="StudentLoginName">
            <input type="submit" name="Join">
        </form>
    </body>
</html>
