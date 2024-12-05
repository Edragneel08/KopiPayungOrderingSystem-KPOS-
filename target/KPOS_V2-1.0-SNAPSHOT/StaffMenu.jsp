<%-- 
    Document   : frontPage.jsp
    Created on : 13 Jun 2023, 11:07:37 pm
    Author     : edrag
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Kopi Payong Staff Menu</title>
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
        <div class="container">
            <div class="content">
                <p>WELCOME TO KOPI PAYUNG STAFF MENU</p>
                <a href="staffForm.jsp"><button id="register-button" class="custom-button">REGISTER STAFF</button></a><br>
                <a href="listStaff"><button id="addmenu-button" class="custom-button">LIST STAFF</button></a><br>
                <a href="newProduct"><button id="addmenu-button" class="custom-button">ADD MENU</button></a><br>
                <a href="listCoffee"><button id="listmenu-button" class="custom-button">LIST MENU</button></a><br>
                <a href="frontPage.jsp"><button id="listmenu-button" class="custom-button">LOG OUT</button></a><br>
            </div>
        </div>
    </body>
</html>
</html>
