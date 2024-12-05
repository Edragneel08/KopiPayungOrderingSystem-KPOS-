/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package WEB;

import DAO.StaffDAO;
import DAO.custDAO;
import DAO.paymentDAO;
import DAO.productDAO;
import MODEL.customer;
import MODEL.order_product;
import MODEL.payment;
import MODEL.product;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Formatter;
import java.util.List;

/**
 *
 * @author edrag
 */
@WebServlet("/CustKposServlet")
public class CustKposServlet extends HttpServlet {

    private custDAO CustDAO;
    private productDAO ProductDAO;
    private paymentDAO PaymentDAO;
    private StaffDAO staffDAO;

    public void init() {
        CustDAO = new custDAO();
        ProductDAO = new productDAO();
        PaymentDAO = new paymentDAO();
        staffDAO = new StaffDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case"/CustKposServlet":
                    
                case "/listProduct":
                    showListProduct(request, response);
                    break;

                case "/listCart":
                    showListCart(request, response);
                    break;

                case "/insertCust":
                    insertCust(request, response);
                    break;

                case "/updateCust":
                    updateCust(request, response);
                    break;

                case "/showEditForm":
                    showEditForm(request, response);
                    break;

                case "/insertCart":
                    insertCart(request, response);
                    break;

                case "/deleteProductInCart":
                    deleteProductInCart(request, response);
                    break;

                case "/processPayment":
                    processPayment(request, response);
                    break;

                case "/paymentMenu":
                    paymentMenu(request, response);
                    break;

                case "/showReceipt":
                    showReceipt(request, response);
                    break;

                default:
                    frontPage(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    //insert
    private void insertCust(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        HttpSession session = request.getSession();

        String custName = request.getParameter("custName");
        String custPhoneNo = request.getParameter("custPhoneNo");

        customer newCust = new customer(custName, custPhoneNo);
        int generatedCustId = CustDAO.insertCustomer(newCust); // Retrieve the generated custId
        session.setAttribute("custId", generatedCustId); // Store the custId in the session

        response.sendRedirect("listProduct?custId=" + generatedCustId);
        session.setAttribute("register", "Succesfully");
    }

    //update cust details
    private void updateCust(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        HttpSession session = request.getSession();
        int custId = (int) session.getAttribute("custId");
        String custName = request.getParameter("custName");
        String custPhoneNo = request.getParameter("custPhoneNo");

        customer upCust = new customer(custId, custName, custPhoneNo);
        CustDAO.updateCust(upCust);

        response.sendRedirect("listCart?custId=" + custId);
    }

    //edit form cust
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int custId = Integer.parseInt(request.getParameter("custId"));
        customer existingCust = CustDAO.selectCustById(custId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customerDetails.jsp");
        request.setAttribute("cust", existingCust);
        dispatcher.forward(request, response);

    }

    private void frontPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("frontPage.jsp");
        dispatcher.forward(request, response);
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        HttpSession session = request.getSession();
        String custPhoneNo = request.getParameter("custPhoneNo");
        List<product> listProduct = ProductDAO.selectAllProducts();
        request.setAttribute("listProduct", listProduct);

        // Retrieve the custId from the session
        int custId = (int) session.getAttribute("custId");

        RequestDispatcher dispatcher = request.getRequestDispatcher("menuOrder.jsp?custId=" + custId);
        dispatcher.forward(request, response);
    }

    //list cart
    private void showListCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        HttpSession session = request.getSession();
        // Retrieve the custId from the session
        int custId = (int) session.getAttribute("custId");

//        String custPhoneNo = request.getParameter("custPhoneNo");
        String orderID = request.getParameter("custId");
        List<order_product> listCart = ProductDAO.selectCartById(orderID);
        request.setAttribute("listCart", listCart);

        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp?custId=" + custId);
        dispatcher.forward(request, response);
    }

    //insert into cart
    private void insertCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        HttpSession session = request.getSession();
        int custId = (int) session.getAttribute("custId");
        String orderID = request.getParameter("orderID");
        String prodCode = request.getParameter("prodCode");
        double prodPrice = Double.parseDouble(request.getParameter("prodPrice"));

        order_product cartProd = new order_product(orderID, prodCode, prodPrice);
        ProductDAO.insertIntoCart(cartProd);

        response.sendRedirect("listProduct?custId=" + custId);
    }

    //delete only one product in cart
    private void deleteProductInCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        HttpSession session = request.getSession();
        int custId = (int) session.getAttribute("custId");
        String prodCode = request.getParameter("prodCode");
        ProductDAO.deleteProductInCart(custId, prodCode);
        response.sendRedirect("listCart?custId=" + custId);
    }

    //paymentMenu
    private void paymentMenu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int custId = (int) session.getAttribute("custId");
        RequestDispatcher dispatcher = request.getRequestDispatcher("payment.jsp?custId=" + custId);
        dispatcher.forward(request, response);
    }

    //checkout and payment
    private void processPayment(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        HttpSession session = request.getSession();
        int custId = (int) session.getAttribute("custId");
        int orderID = custId;
        String paymentType = request.getParameter("paymentType");
        String OrderDate = request.getParameter("OrderDate");

        payment payCheckout = new payment(orderID, custId, OrderDate, paymentType);
        //payment
        PaymentDAO.insertIntoOder(payCheckout);
        
        session.setAttribute("custId", custId);
        response.sendRedirect("showReceipt?custId=" + custId);
    }

    //Show receipt
    private void showReceipt(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {

        HttpSession session = request.getSession();
        int custId = (Integer) session.getAttribute("custId");
        String orderID = request.getParameter("custId");
        custId = Integer.parseInt(request.getParameter("custId"));
        payment receipt = PaymentDAO.selectReceiptById(custId);
        
        List<order_product> listCart = ProductDAO.selectCartById(orderID);
        request.setAttribute("listCart", listCart);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("receipt.jsp");
        request.setAttribute("receipt", receipt);
        dispatcher.forward(request, response);
}
    
    


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
