<%-- 
    Document   : ProjectListing
    Created on : 21-Oct-2016, 09:03:03
    Author     : int303
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sit.int303.demo.model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="WEB-INF/jsp/Header.jsp?title=Product Listing"/>
        <br>
        <%
            List<Product> products = Product.findByName("");
            pageContext.setAttribute("products", products);
        %>
    </body>
    <c:if test="${products != null}">
        <table class="table">
            <c:forEach items="${products}" var="p" varStatus="vs">
            <tr>
                <td>
                    <img src="images/${p.productId}.jpg" width="150" height="120"><br>
                    ${p.productId}(${p.productType}),
                    Price: <fmt:formatNumber value="${p.price}" type="currency" /><br>
                    ${p.description}
                </td>
            </tr>
            </c:forEach>
        </table>
    </c:if>
</html>
