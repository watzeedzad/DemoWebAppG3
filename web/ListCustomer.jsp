<%-- 
    Document   : ListCustomer
    Created on : Sep 2, 2016, 9:42:18 AM
    Author     : jiraw
--%>

<%@page import="java.util.List"%>
<%@page import="sit.int303.demo.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/Header.jsp?title=Customer Listing"/>
        <jsp:useBean id="customers" scope="session" type="java.util.List<Customer>"/>
        <form action="SearchCustomer" method="get">
            Enter Cutomer name or id  <input type="text" name="inputParam">
            <br>
            <input type="submit" value="Send">
            <c:if test="${customers != null}">
                <table>
                    <thead>
                        <tr>
                            <th>Customer ID</th>
                            <th>Name</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Phone</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${customers}" var="c" varStatus="vs">
                            <tr>
                                <td>${c.custId}</td>
                                <td><a href="SearchCustomer?inputParam=${c.custId}">${c.name}</td>
                                <td>${c.city}</td>
                                <td>${c.state}</td>
                                <td>${c.phone}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <hr>
            ${message}
            <hr>

        </form>
    </body>
</html>
