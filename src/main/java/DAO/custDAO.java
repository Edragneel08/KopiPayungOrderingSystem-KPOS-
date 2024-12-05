/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import MODEL.customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author edrag
 */
public class custDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/kpos";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_CUST_SQL = "INSERT INTO CUSTOMER (custName,custPhoneNo) VALUES (?,?)";
    private static final String UPDATE_CUST_SQL = "UPDATE CUSTOMER SET custName=?, custPhoneNo=? WHERE custId=? ";
    private static final String SELECT_CUST_BY_ID = "SELECT custId,custName,custPhoneNo FROM CUSTOMER WHERE custId = ?";
    
    public custDAO() {
    }

    protected Connection getConnection() { //mathod connection

        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //insert cust to customer table
    public int insertCustomer(customer cust) {
        int generatedCustId = -1; // Initialize with a default value
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(INSERT_CUST_SQL, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, cust.getCustName());
            ps.setString(2, cust.getCustPhoneNo());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    generatedCustId = rs.getInt(1); // Retrieve the generated custId
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return generatedCustId;
    }
    
    //CUST UPDATE
    public boolean updateCust(customer cust) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_CUST_SQL);) {
          
            ps.setString(1, cust.getCustName());
            ps.setString(2, cust.getCustPhoneNo());
            ps.setInt(3, cust.getCustId());

            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    //select by id for update cust details
    public customer selectCustById(int custId) {
        customer cust = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUST_BY_ID);) {
            preparedStatement.setInt(1, custId);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String custName = rs.getString("custName");
                String custPhoneNo = rs.getString("custPhoneNo");

                cust = new customer(custId, custName, custPhoneNo);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return cust;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
