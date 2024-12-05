<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
        String defaultName = "";
        String defaultPassword = "";

        String name1 = request.getParameter("name");
        String password1 = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/kpos";
            String username = "root";
            String password = "";
            Connection conn = DriverManager.getConnection(jdbcURL, username, password);

            String credentialsQuery = "SELECT * FROM staff WHERE name = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(credentialsQuery);
            stmt.setString(1, name1);
            stmt.setString(2, password1);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                defaultName = rs.getString("name");
                defaultPassword = rs.getString("password");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>


        <%
            if (name1.equals(defaultName) && password1.equals(defaultPassword)) {
                response.sendRedirect("StaffMenu.jsp");
            } else {
                    out.println("<script>alert('Please check your name and password, then try again'); window.location.href = 'Login.jsp';</script>");
            }
        %>


    </body>
</html>