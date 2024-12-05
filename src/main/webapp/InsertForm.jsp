
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <title>Customer Details</title>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
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
                <a class="active" href="StaffMenu.jsp">Home</a>
                <a href="MenuList.jsp">Insert Product</a>
            </div>

            <div class="box">
                <c:if test="${coffee == null}">
                    <form action="insertMenu" method="post">
                    </c:if>
                    <c:if test="${coffee != null}">
                        <form action="updateMenu" method="post">
                        </c:if>
                        <h1>Item Detail</h1>
                        <div class="formcontainer">
                            <div class="container">
                                <label for="prodName"><strong>Coffee Name</strong></label>
                                <input type="text" value="<c:out value='${coffee.prodName}' />"placeholder="Enter Coffee Name" name="prodName" id="prodName" required>
                                <label for="prodCode"><strong>Coffee Code</strong></label>
                                <input type="text" value="<c:out value='${coffee.prodCode}' />"placeholder="Enter Coffee Code" name="prodCode" id="prodCode" required>
                                <label for="prodDesc"><strong>Description</strong></label>
                                <input type="text" value="<c:out value='${coffee.prodDesc}' />"placeholder="Add Some Description" name="prodDesc" id="prodDesc" >
                                <label for="prodPrice"><strong>Coffee Price</strong></label>
                                <input type="text" value="<c:out value='${coffee.prodPrice}' />"placeholder="Enter Price" name="prodPrice" id="prodPrice" required>
                            </div>
                            <button type="submit"><strong>Make Order</strong></button>
                        </div>
                    </form>
            </div>
            <%-- footer --%>
            <footer class="footer">
                <div class="ft"></div>
            </footer>
        </body>
    </html>
