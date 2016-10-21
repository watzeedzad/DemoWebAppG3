<%-- 
    Document   : HiLow
    Created on : Aug 5, 2016, 10:22:55 AM
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
        <h1>HiLow Game :D</h1>
        <form action="HiLow" method="POST">
            Enter your guess number : <input type="number" required name="number"/>
            <br>
            <input type="submit"/>
        </form>
        <hr>
        <h3>${message}</h3>
        (${h1.d1.face},${h1.d2.face},${h1.d3.face}) ==> ${h1.hiLow}
    </body>
</html>
