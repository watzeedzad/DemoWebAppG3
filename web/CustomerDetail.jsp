<%-- 
    Document   : CustomerDetail
    Created on : Sep 30, 2016, 10:01:32 AM
    Author     : Better3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td>Customer ID : </td>
                <td><input type="text" name="custId" size="8" readonly
                           value="<jsp:getProperty name="customer" property="custId" />"></td>
            </tr>
            <tr>
                <td>Name : </td>
                <td><input type="text" name="name" size="20" readonly
                           value="<jsp:getProperty name="customer" property="name" />"></td>
            </tr>
            <tr>
                <td>Address : </td>
                <td>
                    <textarea name="addrLine1" rows="2" style="width: 400px">
                        <jsp:getProperty name="customer" property="addrLine1" />
                    </textarea><br>
                    <textarea name="addrLine2" rows="2" style="width: 400px">
                        <jsp:getProperty name="customer" property="addrLine2" />
                    </textarea>
                </td>
            </tr>
            <tr>
                <td>City : </td>
                <td><input type="text" name="city" size="12" disabled
                           value='<jsp:getProperty name="customer" property="city" />'></td>
            </tr>
            <tr>
                <td>State : </td>
                <td><input type="text" name="city" size="8" disabled
                           value='<jsp:getProperty name="customer" property="state" />'></td>
            </tr>
            <tr>
                <td>Zip code : </td>
                <td><input type="text" name="city" size="8" disabled
                           value='<jsp:getProperty name="customer" property="zip" />'></td>
            </tr>
            <tr>
                <td></td><td><input type="button" value="Back" onclick="history.back()"></td>
            </tr>
        </table>
    </body>
</html>
