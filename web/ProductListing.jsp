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
    <script>
        function changeSearchText() {
            var txt1 = document.getElementById('txt1');
            var txt2 = document.getElementById('txt2');
            var cat = document.getElementById('category');
            var label = document.getElementById('caption1');
            //txt2.value =  cat.options[cat.selectedIndex].value;
            var selectedValue = cat.options[cat.selectedIndex].value;

            if (selectedValue === 'price') {
                txt2.hidden = false;
                txt2.type = 'number';
                txt2.min = 0;
                txt2.size = '10';

                txt1.size = '10';
                txt1.type = 'number';
                txt1.min = 0;
                label.innerHTML = '&nbsp:Price Range:&nbsp';
            } else if (selectedValue === 'name') {
                txt2.hidden = true;
                txt1.type = 'text';
                txt1.size = '50';
                label.innerHTML = '&nbsp:Product Name/Type:&nbsp';
            } else {
                txt2.hidden = true;
                txt1.type = 'number';
                txt1.min = 0;
                txt1.size = '10';
                label.innerHTML = '&nbsp:Enter product ID:&nbsp';
            }
        }
    </script>

    <body onload="changeSearchText()">
        <jsp:include page="WEB-INF/jsp/Header.jsp?title=Product Listing"/>
        ${messageState}
        <br>
        <%
            //List<Product> products = Product.findByPrice(100, 200);
            //pageContext.setAttribute("products", products);
%>
        <form action="SearchProduct" method="post">
            <table>
                <tr><td>Category : </td>
                    <td>
                        <select name="searchCategory" onchange="changeSearchText()" id="category">
                            <option value="id" ${param.searchCategory=='id' ? 'selected': ''}>Product ID</option>
                            <option value="name" ${param.searchCategory=='name' ? 'selected': ''}>Product Description</option>
                            <option value="price" ${param.searchCategory=='price' ? 'selected': ''}>Price Range</option>
                        </select>
                    </td>
                    <td id="caption1">&nbsp;</td>
                    <td><input type="text" name="searchText1" id="txt1" value="${param.searchText1}" /></td>
                    <td id="caption2">&nbsp;</td>
                    <td><input type="text" name="searchText2" id="txt2" value="${param.searchText2}" /></td>
                    <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td><td> View : 
                        <select name="viewBy">
                            <option value="row" ${param.viewBy=='row' ? 'selected': ''}>List View</option>
                            <option value="column" ${param.viewBy=='column' ? 'selected': ''}>Gallery View</option>
                        </select>
                    </td>
                    <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                    <td><input type="submit" value="Go"/></td>
                </tr>
            </table>
        </form>
        <c:if test="${! empty message}">
            <table class="table" style="width: 98%;background-color: yellow;color:red">
                <tr><td>${message}</td></tr>
            </table>
        </c:if>
        <c:if test="${products != null}">
            <form action="AddToCart" method="GET">
                <input type="hidden" name="searchCategory" value="${param.searchCategory}"/>
                <input type="hidden" name="viewBy" value="${param.viewBy}"/>
                <input type="hidden" name="searchText1" value="${param.searchText1}"/>
                <input type="hidden" name="searchText1" value="${param.searchText2}"/>
                <c:choose>
                    <c:when test="${param.viewBy=='column'}">
                        <table class="table">
                            <tr><td colspan="3"><input type="submit" value="Add to cart."></td></tr>
                                    <c:forEach items="${products}" var="p" varStatus="vs">
                                <td>
                                    <input type="checkbox" name="pid" value="${p.productId}" title="Add ${p.description} to your cart">
                                    <img src="images/${p.productId}.jpg" width="150" height="120"><br>
                                    ${p.productId}(${p.productType}),
                                    Price: <fmt:formatNumber value="${p.price}" type="currency" /><br>
                                    ${p.description}
                                </td>
                                ${vs.count%4==0?"</tr>":""}
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <table class="table">
                            <tr><td colspan="3"><input type="submit" value="Add selected product to cart."></td></tr>
                                    <c:forEach items="${products}" var="p" varStatus="vs">
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td><img src="images/${p.productId}.jpg" width="200" height="160"></td>
                                                <td style="width: 10%">&nbsp;</td>
                                                <td>${p.productId}(${p.productType})<br>
                                                    ${p.description}<br>
                                                    Price: <fmt:formatNumber value="${p.price}" type="currency" /><br>
                                                    <input type="checkbox" name="pid" value="${p.productId}" title="Add ${p.description} to your cart">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                ${vs.count%4==0?"</tr>":""}
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>
            </form>
        </c:if>
    </body>
</html>
