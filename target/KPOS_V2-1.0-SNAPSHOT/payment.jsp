<%-- 
    Document   : payment
    Created on : 19 Jun 2023, 12:58:15 am
    Author     : edrag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="CSS/payment.css">
        <style>
            html, body {
                font-family: Roboto, Arial, sans-serif;
                background-image: url("img/coffeeBg.jpg");
                font-size: 15px;
                margin: 0;
                height: 100%;
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
                }, 50000); // Hide the popup after 3 seconds
            }
        </script>
    </head>
    <body>
        <header class="header">
            <div class="container">
                <nav class="topnav">
                    <a href="frontPage.jsp">Home</a>
                    <a href="<%=request.getContextPath()%>/listProduct?custId=<%=session.getAttribute("custId")%>">Product Menu</a>
                    <a href="<%=request.getContextPath()%>/listCart?custId=<%=session.getAttribute("custId")%>">Cart</a>
                </nav>
            </div>
        </header>

        <div class="box">
            <div class="icon">
                <i class="fa fa-credit-card"></i>
            </div>
            <form action="processPayment" method="post">

                <!--get current session-->
                <input type="hidden" name="custId" value="<c:out value='${cust.custId}' />">

                <label for="paymentType">Payment Type:</label>
                <select id="paymentType" name="paymentType" required>
                    <option value="Online Payment">Online Payment</option>
                    <option value="Cash">Cash</option>
                </select>
                <br><br>
                <label for="paymentDate">Payment Date:</label>
                <input type="date" id="OrderDate" name="OrderDate" required>
                <br><br>
                <!--<input type="text" id="cu" name="cus" value="<%=session.getAttribute("custId")%>" required>-->
                <button type="submit onclick="showPopup()">
                    <input type="text" name="custId" value="custId=<%=session.getAttribute("custId")%>" />">
                    Make Payment
                </button>
            </form>
        </div>

        <div class="popup" id="popup">
            <p>Thank You For Making Payment</p>
        </div>

        <footer class="footer">
            <div class="container">
                <div class="ft"></div>
            </div>
        </footer>
    </body>
</html>