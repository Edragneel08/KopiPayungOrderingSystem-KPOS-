/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import MODEL.order_product;
import MODEL.product;
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
public class productDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/kpos";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_ORDER_PRODUCT_SQL = "INSERT INTO ORDER_PRODUCT(orderID ,prodCode, prodPrice) VALUES (?,?,?)";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM PRODUCT";
    private static final String SELECT_ALL_CARTS = "SELECT order_product.prodCode, order_product.prodPrice, product.prodName, COUNT(order_product.prodCode) AS prodQuantity, SUM(order_product.prodPrice) AS prodTotal, ( SELECT SUM(order_product.prodPrice) FROM order_product INNER JOIN product ON order_product.prodCode = product.prodCode ) AS prodTotalSum FROM order_product INNER JOIN product ON order_product.prodCode = product.prodCode GROUP BY order_product.prodCode, order_product.prodPrice, product.prodName ORDER BY order_product.prodCode";
    private static final String SELECT_CART_BY_ID = "SELECT op.prodCode, op.prodPrice, p.prodName, COUNT(op.prodCode) AS prodQuantity, SUM(op.prodPrice) AS prodTotal, ( SELECT SUM(op.prodPrice) FROM order_product AS op INNER JOIN product AS p ON op.prodCode = p.prodCode WHERE op.orderID = ? ) AS prodTotalSum, op.orderID FROM order_product AS op INNER JOIN product AS p ON op.prodCode = p.prodCode WHERE op.orderID = ? GROUP BY op.prodCode, op.prodPrice, p.prodName, op.orderID ORDER BY op.prodCode";
    private static final String DELETE_PRODUCT_CART_SQL = "DELETE FROM ORDER_PRODUCT WHERE prodCode = ? AND orderID = ? LIMIT 1";
    
    private static final String INSERT_COFFEES_SQL = "INSERT INTO product (prodCode,prodName,prodPrice,prodDesc) VALUES (?,?,?,?)";
    private static final String SELECT_COFFEE_BYID = "SELECT prodName,prodPrice,prodDesc from product where prodCode = ?";
    private static final String DELETE_COFFEES_SQL = "DELETE FROM product where prodCode = ?";
    private static final String UPDATE_COFFEES_SQL = "UPDATE product set prodName = ? ,prodPrice = ? ,prodDesc = ? where prodCode = ?";

    public productDAO() {
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

    //Get user id as session
//GET PRODUCT LIST
    public List<product> selectAllProducts() {
        List<product> products = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int prodCode = rs.getInt("prodCode");
                String prodName = rs.getString("prodName");
                double prodPrice = Double.parseDouble(rs.getString("prodPrice"));
                String prodDesc = rs.getString("prodDesc");

                products.add(new product(prodCode, prodName, prodPrice, prodDesc));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    //GET ALL ORDER_PRODUCT LIST
    public List<order_product> selectAllCarts() {
        List<order_product> carts = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CARTS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String prodCode = rs.getString("prodCode");
                String prodName = rs.getString("prodName");
                double prodPrice = Double.parseDouble(rs.getString("prodPrice"));
                int prodQuantity = Integer.parseInt(rs.getString("prodQuantity"));
                double prodTotal = Double.parseDouble(rs.getString("prodTotal"));
                double prodTotalSum = Double.parseDouble(rs.getString("prodTotalSum"));

                carts.add(new order_product(prodCode, prodName, prodPrice, prodQuantity, prodTotal, prodTotalSum));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return carts;
    }

    //GET ORDER_PRODUCT BY ID
    public List<order_product> selectCartById(String orderID) {
        List<order_product> carts = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CART_BY_ID);) {
            preparedStatement.setString(1, orderID);
            preparedStatement.setString(2, orderID);

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String prodCode = rs.getString("prodCode");
                String prodName = rs.getString("prodName");
                double prodPrice = Double.parseDouble(rs.getString("prodPrice"));
                int prodQuantity = Integer.parseInt(rs.getString("prodQuantity"));
                double prodTotal = Double.parseDouble(rs.getString("prodTotal"));
                double prodTotalSum = Double.parseDouble(rs.getString("prodTotalSum"));

                carts.add(new order_product(prodCode, prodName, prodPrice, prodQuantity, prodTotal, prodTotalSum));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return carts;
    }
    
    
    //delete only one product
    public boolean deleteProductInCart(int custId, String prodCode) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_CART_SQL)) {
            int orderID = custId;
            statement.setString(1, prodCode);
            statement.setInt(2, orderID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    //insert PRODUCT to ORDER PRODUCT table
    public void insertIntoCart(order_product OrderProduct) {
        System.out.println(INSERT_ORDER_PRODUCT_SQL);

        try (Connection connection = getConnection();//connect database guna method getConnection 
                 PreparedStatement ps = connection.prepareStatement(INSERT_ORDER_PRODUCT_SQL);) { //insert data SQL
            ps.setString(1, OrderProduct.getOrderID());
            ps.setString(2, OrderProduct.getProdCode());
            ps.setDouble(3, OrderProduct.getProdPrice());
            System.out.println(ps);
            ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //insert coffee aka product
    public void insertProduct(product Product) throws SQLException {
        System.out.println(INSERT_COFFEES_SQL);
        //try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(INSERT_COFFEES_SQL)) {

            preparedStatement.setInt(1, Product.getProdCode());
            preparedStatement.setString(2, Product.getProdName());
            preparedStatement.setDouble(3, Product.getProdPrice());
            preparedStatement.setString(4, Product.getProdDesc());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //SELECT COFFEE BY ID
    public product selectCoffeeBYID(int prodCode) {
        product Product = null;
        //Step 1 : Establishing a connection
        try (Connection connection = getConnection(); //Step 2 Create a statement using connection object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COFFEE_BYID);) {
            preparedStatement.setInt(1, prodCode);
            System.out.println(preparedStatement);
            //Step3 Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4 Process  the ResultSet object
            while (rs.next()) {
                String prodName = rs.getString("prodName");
                Double prodPrice = rs.getDouble("prodPrice");
                String prodDesc = rs.getString("prodDesc");
                Product = new product(prodCode, prodName, prodPrice, prodDesc);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return Product;
    }

    //delete the cofffee
    public boolean deleteCoffee(int prodCode) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(DELETE_COFFEES_SQL);) {
            statement.setInt(1,prodCode);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    //update the product or the coffee
    public boolean updateCoffee(product Product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(UPDATE_COFFEES_SQL);) {
            statement.setString(1, Product.getProdName());
            statement.setDouble(2, Product.getProdPrice());
            statement.setString(3, Product.getProdDesc());
            statement.setInt(4, Product.getProdCode());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
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
