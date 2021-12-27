<%-- 
    Document   : login
    Created on : Dec 21, 2021, 12:32:36 AM
    Author     : LucasBV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Teacher Login</h1>
        <s:form action="TeacherLogin" method="post">
            <s:textfield label="Name" key="teacherName" name="teacherName"></s:textfield>
            <s:submit></s:submit> 
        </s:form>
    </body>
</html>
