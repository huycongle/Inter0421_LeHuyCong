<%--
  Created by IntelliJ IDEA.
  User: huycong
  Date: 04/29/21
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

</head>
<body>
<form action="/add" method="post">
    <table>
        <tr>
            <td>Name</td>
            <td>
                <input type="text" name="customerName">
            </td>
        </tr>
        <tr>
            <td>Birthday</td>
            <td>
                <input type="text" name="customerBirthday">
            </td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <input type="radio" name="customerGender" value="1">Male
                <input type="radio" name="customerGender" value="0">Female
            </td>
        </tr>
        <tr>
            <td>IdCard</td>
            <td>
                <input type="text" name="customerIdCard">
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <input type="text" name="customerPhone">
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <input type="text" name="customerEmail">
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td>
                <input type="text" name="customerAddress">
            </td>
        </tr>
        <tr>
            <td></td>
            <td><button type="submit">Add Customer</button> </td>
        </tr>

    </table>
</form>


</body>
</html>
