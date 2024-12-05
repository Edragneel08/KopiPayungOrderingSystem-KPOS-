/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import MODEL.customer;
import MODEL.order_product;
import MODEL.payment;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author edrag
 */
public class paymentDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/kpos";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_ODER_SQL = "INSERT INTO ODER(orderID ,custId, Orderdate, paymentType) VALUES (?,?,?,?)";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM PRODUCT";
    private static final String SELECT_RECEIPT = "SELECT * FROM oder JOIN CUSTOMER ON oder.custId = CUSTOMER.custId WHERE oder.custId = ?";

    public paymentDAO() {
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

    //insert ORDER PRODUCT to oder table
    public void insertIntoOder(payment pay) {
        System.out.println(INSERT_ODER_SQL);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_ODER_SQL);) { //insert data SQL
            ps.setInt(1, pay.getOrderID());
            ps.setInt(2, pay.getCustId());
            ps.setString(3, pay.getOrderDate());
            ps.setString(4, pay.getPaymentType());
            System.out.println(ps);
            ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //Get for receipt
    public payment selectReceiptById(int custId) {
        payment receipt = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RECEIPT);) {
            preparedStatement.setInt(1, custId);
//            preparedStatement.setString(2, orderID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                int orderID = rs.getInt("orderID");
                custId = rs.getInt("custId");
                String OrderDate = rs.getString("OrderDate");
                String paymentType = rs.getString("paymentType");
                String custName = rs.getString("custName");
                String custPhoneNo = rs.getString("custPhoneNo");
                //double prodTotal = rs.getDouble("prodTotal");

                receipt = new payment(orderID, custId, OrderDate, paymentType,custName,custPhoneNo);

//                String prodCode = rs.getString("prodCode");
//                String prodName = rs.getString("prodName");
//                double prodPrice = Double.parseDouble(rs.getString("prodPrice"));
//                int prodQuantity = Integer.parseInt(rs.getString("prodQuantity"));
//                double prodTotal = Double.parseDouble(rs.getString("prodTotal"));
//                double prodTotalSum = Double.parseDouble(rs.getString("prodTotalSum"));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return receipt;
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
