<%-- 
    Document   : CheckPrimeNumber
    Created on : Aug 22, 2016, 4:04:46 PM
    Author     : jiraw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="GET" action="PrimeServlet">
            Please enter number : 
            <input type="number" name="numUserIn">
            <br>
            <input type="submit" value="Send">
        </form>
        <br>
        ${message}
    </body>
</html>
