<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Self Ordering Application</title>
        <link rel="stylesheet" href="http://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integritiy="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQU0hcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    </head>
    <header>
        <style>
            html, body {
                font-family: Roboto, Arial, sans-serif;
                background-image: url("image/coffeeBg.jpg");
                font-size: 15px;
                margin: 0;
                height: 100%;
            }

            .box{
                display: flex;
                justify-content: center;
                align-items: center;
                height: 80%;
            }

            .footer{
                position: fixed;
                bottom: 0;
                padding: 20px;
                width: 100%;
                background: black;
                color: white;
                text-align: center;
            }

            .header {
                background-color: black;
                font-size: 10px;
                margin-top: 0;
            }

            form {
                border: 5px solid #f1f1f1;
                background-color: whitesmoke;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            .icon {
                font-size: 110px;
                display: flex;
                justify-content: center;
                color: #4286f4;
                margin-bottom: 20px;
            }

            button {
                background-color: #4286f4;
                color: white;
                padding: 14px 20px;
                margin-top: 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                font-size: 1.2rem;
                font-weight: bold;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #0069d9;
            }

            h1 {
                text-align:center;
                font-size: 2.5rem;
                font-weight: bold;
                margin-bottom: 20px;
            }

            label {
                font-size: 1.2rem;
                font-weight: bold;
            }

            input[type=text] {
                width: 100%;
                padding: 12px 10px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
                border-radius: 5px;
                font-size: 1rem;
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
            }
        </style>
    </header>
    <body>
        <div class="topnav">
            <a href="StaffMenu.jsp">Home</a>
            <a class="active" href="staffForm.jsp">Register Staff</a>
        </div>
        <br>
        <div class="row">
            <!--<div class="alert alert-success" *ngIf='message'>{{message}}</div>-->

            <div class="container">
                <h3 class="text-center">List of Staffs</h3>
                <hr>
                <div class="container text-left">
                    <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New Staff</a>
                    <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Login</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- for (Todo todo: todos) { -->
                        <c:forEach var="staff" items="${listStaff}">
                            <tr>
                                <td>
                                    <c:out value="${staff.id}" />
                                </td>
                                <td>
                                    <c:out value="${staff.name}" />
                                </td>
                                <td>
                                    <c:out value="${staff.email}" />
                                </td>
                                <td>
                                    <c:out value="${staff.password}" />
                                </td>
                                <td><a href="edit?id=<c:out value='${staff.id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="delete?id=<c:out value='${staff.id}' />">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%-- footer --%>
        <footer class="footer">
            <div class="ft"></div>
        </footer>     
    </body>
</html>
