<%-- 
    Document   : ViewParam
    Created on : Oct 7, 2016, 8:49:25 AM
    Author     : jiraw
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Map<String, String> subjects = new HashMap();
            subjects.put("int102", "Java Programming 1");
            subjects.put("int105", "Java Programming 2");
            subjects.put("int303", "Web Programming");
            subjects.put("gen101", "Physical Education");
            subjects.put("lng101", "General English");
            subjects.put("int107", "Computer Platform Technology");
            application.setAttribute("subjects", subjects);
        %>
        <h1>ViewParameter XD</h1>
        <table border="1">
            <tbody>
                <tr><td>Program ID: ${param.programId}</td></tr>>
                <tr><td>Student ID: ${param.sid}</td></tr>
                <tr><td>Student Name: ${param.sname}</td></tr>
                <tr><td>Faculty: ${faculty[param.faculty]}</td></tr>
                <tr><td>Fav Subject: <br>
                        ${subjects[paramValues.subjects[0]]} ${paramValues.subjects[1] == null ? "" : "<br>"}
                        ${subjects[paramValues.subjects[1]]} ${paramValues.subjects[2] == null ? "" : "<br>"}
                        ${subjects[paramValues.subjects[2]]} ${paramValues.subjects[3] == null ? "" : "<br>"}
                        ${subjects[paramValues.subjects[3]]} ${paramValues.subjects[4] == null ? "" : "<br>"}
                        ${subjects[paramValues.subjects[4]]} ${paramValues.subjects[5] == null ? "" : "<br>"}
                        ${subjects[paramValues.subjects[5]]}
                </tr>
            </tbody>
        </table>
        <table>
            <tbody>
                <tr><td>Browser: </td><td>${header["User-Agent"]}</td></tr>
                <tr><td>Accept-Language: </td><td>${header["Accept-Language"]}</td></tr>
                <tr><td>Session ID: </td><td>${cookie.JSESSIONID.value}</td></tr>
            </tbody>
        </table>

    </body>
</html>
