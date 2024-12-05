<%-- 
    Document   : frontPage.jsp
    Created on : 13 Jun 2023, 11:07:37 pm
    Author     : edrag
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Kopi Payong</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            /* External CSS file */
            <%@ include file="CSS/frontPageCSS.css"%>
            /* Internal CSS styles */
        </style>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
   
    </head>
    <body>
        <header>
            <img src="img/logoKPOS.png" id="logo">
        </header>
        <div class="container">
            <div class="content">
                <p>WELCOME TO</p>
                <h1 class="catchy-heading">Self Ordering System</h1>
                <p class="catchy-quote">?WHAT GOES BEST WITH A CUP OF COFFEE? ANOTHER CUP.?<br>~HENRY ROLLINS~</p>
                <a href="customerDetails.jsp"><button id="order-button" class="custom-button">ORDER HERE</button></a><br>
                <a href="Login.jsp" class="login-link">Are you a staff? Click here</a>
            </div>
        </div>
    </body>
</html>