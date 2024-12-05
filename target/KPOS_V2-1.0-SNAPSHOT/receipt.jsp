<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS/payment.css">
        <title>Receipt</title>
        <style>

            body {
                font-family: "Arial", sans-serif;
                margin: 0;
                background-image: url("img/frontBg.jpg");
                background-size: cover;
            }

            .receipt {
                width: 1000px;
                margin: 100px auto;
                padding: 20px;
                border: 1px solid #ccc;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }

            .receipt-header {
                text-align: center;
                margin-bottom: 20px;
            }

            .receipt-header h2 {
                margin: 0;
                font-size: 24px;
                color: #333;
            }

            .receipt-details {
                margin-bottom: 20px;
            }

            .receipt-details p {
                margin: 5px 0;
                font-size: 16px;
                color: #555;
            }

            .receipt-items {
                margin-bottom: 20px;
                overflow-x: auto;
            }

            .receipt-items table {
                width: 100%;
                border-collapse: collapse;
                table-layout: fixed;
            }

            .receipt-items th,
            .receipt-items td {
                padding: 10px;
                border: 1px solid #ccc;
                text-align: left;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .receipt-items th {
                background-color: #f5f5f5;
            }

            .receipt-items tbody tr:hover {
                background-color: #f5f5f5;
            }

            .receipt-total {
                text-align: right;
                font-weight: bold;
            }

            footer {
                background-color: #f5f5f5;
                padding: 20px;
                text-align: center;
            }


        </style>
    </head>
    <body>
        <header class="header">
            <div class="container">
                <nav class="topnav">
                    <a href="frontPage.jsp">Home</a>
                    <a href="<%=request.getContextPath()%>/listProduct?custId=<%=session.getAttribute("custId")%>">Product Menu</a>
                    <a href="<%=request.getContextPath()%>/listCart?custId=<%=session.getAttribute("custId")%>">Cart</a>
                    <a class="active" href="<%=request.getContextPath()%>/showReceipt?custId=<%=session.getAttribute("custId")%>">Receipt</a>
                </nav>
            </div>
        </header>
        <div class="receipt">
            <div class="receipt-header">
                <h2>Receipt</h2>
            </div>
            <div class="receipt-details">
                <p>Customer ID: <strong><c:out value="${receipt.custId}" /></strong></p>
                <p>Customer Name: <strong><c:out value="${receipt.custName}" /></strong></p>
                <p>Customer Phone No: <strong><c:out value="${receipt.custPhoneNo}" /></strong></p>
                <p>Payment Type: <strong><c:out value="${receipt.paymentType}" /></strong></p>
                <p>Date: <strong><c:out value="${receipt.orderDate}" /></strong></p>
            </div>
            <div class="receipt-items">
                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Product Code</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="prodTotalSum" value="0" />
                            <c:forEach var="cart" items="${listCart}" varStatus="status">
                                <tr>
                                    <td><c:out value="${cart.prodCode}" /></td>
                                    <td><c:out value="${cart.prodName}" /></td>
                                    <td><c:out value="${cart.prodPrice}" /></td>
                                    <td><c:out value="${cart.prodQuantity}" /></td>
                                    <td style="text-align: center;"><c:out value="${cart.prodTotal}" /></td>
                                </tr>
                                <c:set var="prodTotalSum" value="${prodTotalSum + cart.prodTotal}" />
                                <c:if test="${status.last}">
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td colspan="1">Total</td>
                                        <td class="receipt-total"><c:out value="${prodTotalSum}" /></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <p align="center">THANKS FOR PURCHASING, YOUR ORDER IS THE MAKING</p>
        </div>
        <footer class="footer">
            <div class="container">
                <div class="ft"></div>
            </div>
        </footer>
    </body>
</html>