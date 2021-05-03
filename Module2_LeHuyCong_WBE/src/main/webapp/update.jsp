
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

</head>
<body>
<form action="/update" method="post">
    <table>
        <tr>
            <td>Id</td>
            <td>
                <input value="${st.customerId}" type="text" name="customerId" readonly>
            </td>
        </tr>
        <tr>
            <td>Name</td>
            <td>
                <input value="${st.customerName}" type="text" name="customerName">
            </td>
        </tr>
        <tr>
            <td>Birthday</td>
            <td>
                <input value="${st.customerBirthday}" type="text" name="customerBirthday">
            </td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <input type="radio" name="customerGender" value="1" ${st.customerGender == 1?"checked":""}>Male
                <input type="radio" name="customerGender" value="0" ${st.customerGender == 0?"checked":""}>Female
            </td>
        </tr>
        <tr>
            <td>IdCard</td>
            <td>
                <input value="${st.customerIdCard}" type="text" name="customerIdCard">
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <input value="${st.customerPhone}" type="text" name="customerPhone">
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <input value="${st.customerEmail}" type="text" name="customerEmail">
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td>
                <input value="${st.customerAddress}" type="text" name="customerAddress">
            </td>
        </tr>
        <tr>
            <td></td>
            <td><button type="submit">Update Customer</button> </td>
        </tr>

    </table>
</form>


</body>
</html>
