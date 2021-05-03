<%--
  Created by IntelliJ IDEA.
  User: huycong
  Date: 04/27/21
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="css/home.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-sm-3" id="header_logo">
          <div class="img">
            <img src="image/logo_resort.jpg" width="50px" height="50px">
          </div>
          <h6>Furama </h6>
        </div>
        <div class="col-sm-6">

        </div>
        <div class="col-sm-3" id="header_username">
          <p>Nguyen Van A</p>
        </div>
      </div>
      <div class="row">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Employee</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Customer</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Service</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Contract</a>
                </li>

              </ul>
              <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
              </form>
            </div>
          </div>

        </nav>
      </div>

      <section>
        <table id="example" class="table table-striped table-bordered" style="width:100%">

              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>IdCard</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
              </tr>

              <c:forEach var="customer" items="${list}">
                <tr>
                  <td><c:out value="${customer.customerId}" /></td>
                  <td><c:out value="${customer.customerName}" /></td>
                  <td><c:out value="${customer.customerBirthday}" /></td>
                  <td><c:out value="${customer.customerGender}" /></td>
                  <td><c:out value="${customer.customerIdCard}" /></td>
                  <td><c:out value="${customer.customerPhone}" /></td>
                  <td><c:out value="${customer.customerEmail}" /></td>
                  <td><c:out value="${customer.customerAddress}" /></td>
                  <td>
                    <a href="update?sid=${customer.customerId}">Update</a>

                    <a href="#" onclick="showMess(${customer.customerId})">Delete</a>
                  </td>
                </tr>
              </c:forEach>

            </table>
        <a href="form.jsp">Create Customer</a>
      </section>

    </div>

  </body>
  <script>
    $(document).ready(function() {
      $('#example').DataTable();
    } );
    
    function showMess(id) {
      var option = confirm(' Are you sure to delete');
      if (option === true){
        window.location.href = 'delete?sid=' + id;
      }
    }
  </script>

</html>
