<%-- 
    Document   : index
    Created on : 14-Oct-2016, 09:23:40
    Author     : int303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body style="margin-left: 50px;width: 90%;background-color: #f5f5f5">
        <jsp:include page="/WEB-INF/jsp/Header.jsp?title=Homepage"/>
        <div style="margin-left: 50px;width: 30%">
            <p> Main-Menu</p>
            <hr>
            <p><a href="member/Page1?target=Page1">Page1</a></p>
            <p><a href="member/Page2?target=Page2">Page2</a></p>
            <p><a href="member/Page3?target=Page3">Page3</a></p>
            <p><a href="member/Page3?target=Page4">Page4</a></p>
            <p><a href="SearchCustomer">SearchCustomer</a></p>
            <p><a href="SearchProduct">Our Products</a>
        </div>
    </body>
</html>
