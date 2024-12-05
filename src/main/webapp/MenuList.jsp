

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title> Product Add List</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            html, body {
                font-family: Roboto, Arial, sans-serif;
                background-image: url("image/coffeeBg.jpg");
                font-size: 15px;
                margin: 0;
            }

            .box{
                display: flex;
                justify-content: center;
                margin-top: 150px;
            }

            .footer{
                position: fixed;
                bottom: 0;
                padding: 20px;
                width: 100%;
                background: black;
            }

            .header {
                background-color: black;
                font-size: 10px;
                margin-top: 0;
            }

            form {
                border: 5px solid #f1f1f1;
                background-color: whitesmoke;
            }
            input[type=text], input[type=password] {
                width: 100%;
                padding: 16px 8px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }
            .icon {
                font-size: 110px;
                display: flex;
                justify-content: center;
                color: #4286f4;
            }
            button {
                background-color: #4286f4;
                color: white;
                padding: 14px 0;
                margin: 10px 0;
                border: none;
                cursor: grab;
                width: 48%;
            }
            h1 {
                text-align:center;
                fone-size:18;
            }
            button:hover {
                opacity: 0.8;
            }
            .formcontainer {
                text-align: center;
                margin: 14px 50px 12px;
            }
            .container {
                padding: 16px 0;
                text-align:left;
            }
            span.psw {
                float: right;
                padding-top: 0;
                padding-right: 15px;
            }

            header {
                text-align: right;
                padding: 20px;
                background-color: black;
                font-size: 10px;
            }

            /*Navigation bar*/
            .topnav {
                overflow: hidden;
                background-color: #333;
            }

            .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

            .topnav a.active {
                background-color: #04AA6D;
                color: white;
            }
            /* Change styles for span on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
            </style>
        </head>
        <body>
            <div class="topnav">
                <a href="<%=request.getContextPath()%>/StaffMenu.jsp">Home</a>
                <a class="active" href="<%=request.getContextPath()%>/listCoffee">Customer Details</a>
            </div>

            <div class="row">
                <!-- <div class="alert alert-sucess" *ngIf='message'>{{message}}</div>--> 
                <div class ="container">
                    <h3 class="text-center">List Of Product</h3>
                    <hr> 
                    <div class="container text-left">
                        <a href="<%=request.getContextPath()%>/newProduct" class="nav-link"> Add New Product</a>
                    </div>
                    <br> 
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Product Code</th>
                                <th>Product Name</th>
                                <th>Product Price</th>
                                <th>Product Description</th>
                                <th colspan=2>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="coffee" items="${listCoffee}">
                                <tr>
                                    <td><c:out value="${coffee.prodCode}" /></td>
                                    <td><c:out value="${coffee.prodName}" /></td>
                                    <td><c:out value="${coffee.prodPrice}" /></td>
                                    <td><c:out value="${coffee.prodDesc}" /></td>
                                    <td>
                                        <a href="editProduct?prodCode=<c:out value='${coffee.prodCode}'/>">Edit</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="deleteProduct?prodCode=<c:out value='${coffee.prodCode}'/>">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </body>
    </html>
