<%-- 
    Document   : cart
    Created on : 15 Jun 2023, 10:24:17 pm
    Author     : edrag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            html, body {
                font-family: Roboto, Arial, sans-serif;
                background-image: url("img/coffeeBg.jpg");
                font-size: 15px;
                margin: 0;
            }

            .footer {
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

            h1 {
                text-align: center;
                font-size: 24px;
                color: #333;
                margin-top: 20px;
            }

            header {
                text-align: right;
                padding: 20px;
                background-color: black;
                font-size: 10px;
            }

            .box {
                width: 320px;
                padding: 10px;
                border: 2px solid black;
                margin: 50px 10px 10px 20px;
            }

            .div {
                display: inline-block;
                position: left;
            }

            .button {
                text-align: center;
                size: 20px;
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

            .table-wrapper {
                margin: 20px auto;
                max-width: 800px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
                font-family: Arial, sans-serif;
            }

            th, td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
                font-weight: bold;
            }

            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tbody tr:hover {
                background-color: #ebebeb;
            }

            .remove-btn {
                color: #ff0000;
                cursor: pointer;
            }

            .checkout-section {
                display: flex;
                justify-content: center; /* Add this line */
                align-items: center;
                padding: 10px 20px;
                background-color: #f2f2f2;
                border-top: 1px solid black;
            }

            .checkout-section input[type="submit"] {
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                background-color: #04AA6D;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .checkout-section input[type="submit"]:hover {
                background-color: #048f5d;
            }

            /* Footer */
            .footer {
                position: fixed;
                bottom: 0;
                padding: 20px;
                width: 100%;
                background-color: #333;
                color: white;
                text-align: center;
            }

            .ft {
                font-size: 14px;
            }

            /* Additional Styling */
            .fa-trash {
                font-size: 20px;
                color: #FF0000;
                cursor: pointer;
                transition: transform 0.3s ease;
            }

            .fa-trash:hover {
                transform: scale(1.2);
            }

            .edit-btn {
                float: right;
                margin-top: 10px;
                margin-right: 20px;
                font-size: 16px;
                font-weight: bold;
                padding: 10px 20px;
                border-radius: 5px;
                background-color: #04AA6D;
                color: white;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .edit-btn:hover {
                background-color: #048f5d;
            }
            .action-buttons {
                display: flex;
                justify-content: center;
                margin: 20px 0;
            }

            .update-btn {
                font-size: 16px;
                font-weight: bold;
                padding: 10px 20px;
                border-radius: 5px;
                background-color: #04AA6D;
                color: white;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .update-btn:hover {
                background-color: #048f5d;
            }
        </style>
    </head>
    <body>
        <div class="topnav">
            <a href="frontPage.jsp">Home</a>
            <a href="<%=request.getContextPath()%>/listProduct?custId=<%=session.getAttribute("custId")%>">Product Menu</a>
            <a href="<%=request.getContextPath()%>/listCart?custId=<%=session.getAttribute("custId")%>" class="active">Cart</a>
        </div>
        <h1>Cart</h1>
        <form action="paymentMenu?custId=<%=session.getAttribute("custId")%>" method="post">
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Product Code</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="prodTotalSum" value="0" />
                        <c:forEach var="cart" items="${listCart}" varStatus="status">
                            <tr>
                                <td><c:out value="${cart.prodCode}"/></td>
                                <td><c:out value="${cart.prodName}"/></td>
                                <td><c:out value="${cart.prodPrice}"/></td>
                                <td><c:out value="${cart.prodQuantity}"/></td>
                                <td style="text-align: center;">
                                    <c:out value="${cart.prodTotal}"/>
                                </td>
                                <td>
                                    <a href="deleteProductInCart?custId=${custId}&prodCode=${cart.prodCode}">
                                        <i class="fa fa-trash remove-btn" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                            <c:set var="prodTotalSum" value="${prodTotalSum + cart.prodTotal}" />
                            <c:if test="${status.last}">
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td colspan="1">Total</td>
                                    <td><c:out value="${prodTotalSum}"/></td>
                                </tr>
                            </c:if>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
            <div class="checkout-section">
                <input type="submit" value="Make Payment">
            </div>
        </form>
        <div class="action-buttons">
            <a href="showEditForm?custId=${custId}" class="update-btn">Update Customer Details</a>
        </div>
        <footer class="footer">
            <div class="ft"></div>
        </footer>
    </body>
</html>
