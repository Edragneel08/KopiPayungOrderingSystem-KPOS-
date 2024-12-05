/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author User
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import MODEL.Staff;

public class StaffDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/kpos";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_STAFFS_SQL = "INSERT INTO staff (name, email, password) VALUES  (?, ?, ?);";

    private static final String SELECT_STAFF_BY_ID = "select id, name, email, password from staff where id =?";
    private static final String SELECT_ALL_STAFFS = "SELECT * FROM staff";
    private static final String DELETE_STAFFS_SQL = "delete from staff where id = ?;";
    private static final String UPDATE_STAFFS_SQL = "update staff set name = ?, email = ?, password = ? where id =?;";

    public StaffDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            //TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            //TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertStaff(Staff staff) throws SQLException {
        System.out.println("INSERT_STAFFS_SQL");
        //try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STAFFS_SQL)) {
            preparedStatement.setString(1, staff.getName());
            preparedStatement.setString(2, staff.getEmail());
            preparedStatement.setString(3, staff.getPassword());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Staff selectStaff(int id) {
        Staff staff = null;
        // Step 1: Establishing a Connection
        try (
                Connection connection = getConnection(); // Step 2: Create a statement using connection objects
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STAFF_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                staff = new Staff(id, name, email, password);

            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staff;
    }

    public List < Staff > selectAllStaffs() {

        // using try-with-resources to avoid closing resources (boilet plate code)
        List < Staff > staffs = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection(); // Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFFS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                staffs.add(new Staff(id, name, email, password));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staffs;
    }

    public boolean deleteStaff(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_STAFFS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateStaff(Staff staff) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_STAFFS_SQL);) {
            statement.setString(1, staff.getName());
            statement.setString(2, staff.getEmail());
            statement.setString(3, staff.getPassword());
            statement.setInt(4, staff.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.out.println("SQLState: " + ((SQLException) e).getSQLState());
                System.out.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.out.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
