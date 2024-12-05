<%-- 
    Document   : menuOrder
    Created on : 13 Jun 2023, 3:22:46 pm
    Author     : edrag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            html, body {
                font-family: Roboto, Arial, sans-serif;
                font-size: 15px;
                margin: 0;
                height: 100%;
                background-image: linear-gradient(to bottom right, #D1D1D1, #EFEFEF);
            }

            .footer {
                position: fixed;
                bottom: 0;
                padding: 20px;
                width: 100%;
                background: #333;
                color: white;
                text-align: center;
            }

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

            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .box {
                width: 320px;
                padding: 10px;
                border: 2px solid black;
                margin: 50px 10px 10px 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .icon {
                display: flex;
                justify-content: center;
                margin-bottom: 10px;
            }

            .icon i {
                font-size: 48px;
                color: black;
            }

            .product-info {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 10px;
            }

            .product-info .name {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .product-info .price {
                font-size: 18px;
            }

            .add-to-cart {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-top: 10px;
            }

            .add-to-cart button {
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                background-color: #04AA6D;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }

            .add-to-cart button:hover {
                background-color: #048f5d;
            }
        </style>
    </head>
    <body>
        <div class="topnav">
            <a href="frontPage.jsp">Home</a>
            <a href="<%=request.getContextPath()%>/listProduct?custId=<%=session.getAttribute("custId")%>" class="active">Product Menu</a>
            <a href="<%=request.getContextPath()%>/listCart?custId=<%=session.getAttribute("custId")%>">Cart</a>
        </div>

        <div class="container">
            <c:forEach var="product" items="${listProduct}">
                <div class="box">
                    <div class="icon">
                        <i class="fa fa-coffee"></i>
                    </div>
                    <div class="product-info">
                        <div class="name">
                            <c:out value="${product.prodName}"/>
                        </div>
                        <div class="price">
                            RM <c:out value="${product.prodPrice}"/>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <form action="insertCart" method="POST">
                            <input type="hidden" name="orderID" id="orderID" value="<%=session.getAttribute("custId")%>" required>
                            <input type="hidden" name="prodCode" id="prodCode" value="${product.prodCode}" required>
                            <input type="hidden" name="prodPrice" id="prodPrice" value="${product.prodPrice}" required>
                            <button type="submit">Add To Cart <i class="fa fa-coffee"></i></button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>

        <%-- footer --%>
        <footer class="footer">
            <div class="ft"></div>
        </footer>
    </body>
</html>
