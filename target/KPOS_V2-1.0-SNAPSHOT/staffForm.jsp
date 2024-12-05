<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <style>
                html, body {
                    font-family: Roboto, Arial, sans-serif;
                    background-image: url("image/coffeeBg.jpg");
                    font-size: 15px;
                    margin: 0;
                    height: 100%;
                }

                .box {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 85%;
                }

                form {
                    border: 5px solid #f1f1f1;
                    background-color: whitesmoke;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
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

                .icon {
                    font-size: 110px;
                    display: flex;
                    justify-content: center;
                    color: #4286f4;
                    margin-bottom: -50px;
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
                    text-align: center;
                    font-size: 2.5rem;
                    font-weight: bold;
                    margin-bottom: 10px;
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


        <div class="box">
            <div class="formcontainer">
                <div class="container">
                    <c:if test="${staff == null}">
                        <form action="insert" method="post">
                        </c:if>
                        <c:if test="${staff !=null}">
                            <form action="update" method="post">
                            </c:if>
                            <h1>Register Staff</h1>
                            <div class="icon">
                                <i class="fas fa-user-circle"></i>
                            </div>
                            <h2>
                                <c:if test="${staff != null}">
                                    Edit Staff
                                </c:if>
                                <c:if test="${staff == null}">
                                    Register
                                </c:if>
                            </h2>

                            <c:if test="${staff != null}">
                                <input type="hidden" name="id" value="<c:out value='${staff.id}' />" />
                            </c:if>

                            <label>Staff Name</label>
                            <input type="text" value="<c:out value='${staff.name}' />" class="form-control" name="name" required="required">

                            <label>Staff Email</label> 
                            <input type="text" value="<c:out value='${staff.email}' />" class="form-control" name="email" required="required">

                            <label>Staff Password</label> 
                            <input type="text" value="<c:out value='${staff.password}' />" class="form-control" name="password" required="required">


                            <button type="submit" class="btn btn-success">Register</button>
                        </form>
                </div>
            </div>
        </div>
        <%-- footer --%>
        <footer class="footer">
            <div class="ft"></div>
        </footer>     
    </body>

</html>
