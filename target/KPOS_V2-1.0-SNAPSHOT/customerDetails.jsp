<%-- 
    Document   : customerDetails
    Created on : 13 Jun 2023, 1:57:16 pm
    Author     : edrag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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

            /* Popup */
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 300px;
                padding: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                border-radius: 5px;
                text-align: center;
                font-size: 16px;
                z-index: 9999;
            }
        </style>
        <script>
            function showPopup() {
                var popup = document.getElementById("popup");
                popup.style.display = "block";
                setTimeout(function () {
                    popup.style.display = "none";
                    window.location.href = 'updateCust';
                }, 30000); // Hide the popup after 3 seconds
            }
        </script>
    </head>
    <body>
        <div class="topnav">
            <a href="frontPage.jsp">Home</a>
            <a class="active" href="customerDetails.jsp">Customer Details</a>
        </div>

        <div class="box">
            <c:if test="${cust == null}">
                <form action="insertCust" method="post">
                </c:if>
                <c:if test="${cust != null}">
                    <form action="updateCust" method="post">
                    </c:if>
                    <h1>Customer Details</h1>
                    <div class="icon">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <div class="formcontainer">
                        <div class="container">
                            <input type="hidden" value="<c:out value='${cust.custId}' />">
                            <label for="uname">Customer Name</label>
                            <input type="text" value="<c:out value='${cust.custName}' />" placeholder="Enter your name" name="custName" id="custName" required>
                            <label for="mail">Phone Number</label>
                            <input type="text" value="<c:out value='${cust.custPhoneNo}' />" placeholder="Enter Phone Number" name="custPhoneNo" required>
                        </div>
                        <c:if test="${cust != null}">
                            <button type="submit" onclick="showPopup()">UPDATE</button>
                        </c:if>
                        <c:if test="${cust == null}">
                            <button type="submit">Choose Drinks</button>
                        </c:if>
                    </div>
                </form>
        </div>

        <div class="popup" id="popup">
            <p>Successful Updated   </p>
        </div>

        <%-- footer --%>
        <footer class="footer">
            <div class="ft"></div>
        </footer>
    </body>
</html>
