<%-- 
    Document   : Header
    Created on : 14-Oct-2016, 09:57:28
    Author     : int303
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="loginOrlogout" value="${sessionScope.user==null ? 'Login' : 'Logout'}"/>
<table>
    <td style="width: 3%"></td>
    <td style="width: 10%"><a href="index.jsp">~</a></td>
    <td style="width: 1%"></td>
    <td style="width: 70%;font-size: x-large;color: black">${param.title}</td>
    <td style="width: 10%">
        <a href="${loginOrLogout}" title="${loginOrLogout}">~~</a>
        Hello <c:out value="${user.name}" default="Guest"/>
</td>
<td style="width: 3%"></td>
</table>
