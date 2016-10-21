<%-- 
    Document   : ParamForm
    Created on : Oct 7, 2016, 9:04:53 AM
    Author     : jiraw
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
            Map<String, String> faculty = new HashMap();
            faculty.put("sit", "School of Information Technology");
            faculty.put("eng", "Faculty of Engineering");
            faculty.put("sci", "Faculty of Science");
            application.setAttribute("faculty", faculty);
        %>
        <h1>Student Form XD</h1><hr>
        <form action="ViewParam.jsp?programId=1548625" method="POST">
            Student ID: <input type="text" name="sid" valuie="${param.sid}"><br>
            Student Name: <input type="text" name="sname" value="${param.sname}"><br>
            Faculty: <select name="faculty">
                <option value="sit">${faculty.sit}</option>
                <option value="eng">${faculty.eng}</option>
                <option value="sci">${faculty.sci}</option>
            </select><br>
            Fav Subjects:<br>
            <input type="checkbox" name="subjects" value="int102">Java Programming 1<br>
            <input type="checkbox" name="subjects" value="int105">Java Programming 2<br>
            <input type="checkbox" name="subjects" value="int303">Web Programming<br>
            <input type="checkbox" name="subjects" value="gen101">Physical Education<br>
            <input type="checkbox" name="subjects" value="lng101">General English 1<br>
            <input type="checkbox" name="subjects" value="int107">Computer Platform Technology<br>
            <input type="submit">
        </form>
    </body>
</html>
