/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package WEB;

import DAO.productDAO;
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
import java.util.List;

/**
 *
 * @author edrag
 */
@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    private productDAO ProductDAO;

    //initailize
    public void init() {
        ProductDAO = new productDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/MenuServlet":
                case "/newProduct":
                    showNewForm(request, response);
                    break;
                case "/insertMenu":
                    insertMenu(request, response);
                    break;
                case "/deleteProduct":
                    deleteMenu(request, response);
                    break;
                case "/editProduct":
                    showEditForm(request, response);
                    break;
                case "/updateMenu":
                    updateMenu(request, response);
                    break;

                case "/listCoffee":
                    listCoffee(request, response);
                    break;
                    
                default:
                    listCoffee(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("InsertForm.jsp");
        dispatcher.forward(request, response);
    }

    private void insertMenu(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        HttpSession session = request.getSession();

        int prodCode = Integer.parseInt(request.getParameter("prodCode"));
        String prodName = request.getParameter("prodName");
        Double prodPrice = Double.parseDouble(request.getParameter("prodPrice"));
        String prodDesc = request.getParameter("prodDesc");

        product newCoffe = new product(prodCode, prodName, prodPrice, prodDesc);
        ProductDAO.insertProduct(newCoffe);
        response.sendRedirect("listCoffee");
    }

    private void deleteMenu(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int prodCode = Integer.parseInt(request.getParameter("prodCode"));
        ProductDAO.deleteCoffee(prodCode);
        response.sendRedirect("listCoffee");

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int prodCode = Integer.parseInt(request.getParameter("prodCode"));
        product existingCoffee = ProductDAO.selectCoffeeBYID(prodCode);
        RequestDispatcher dispatcher = request.getRequestDispatcher("InsertForm.jsp");
        request.setAttribute("coffee", existingCoffee);
        dispatcher.forward(request, response);
    }

    private void updateMenu(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int prodCode = Integer.parseInt(request.getParameter("prodCode"));
        String prodName = request.getParameter("prodName");
        Double prodPrice = Double.parseDouble(request.getParameter("prodPrice"));
        String prodDesc = request.getParameter("prodDesc");

        product ucoffee = new product(prodCode, prodName, prodPrice, prodDesc);
        ProductDAO.updateCoffee(ucoffee);
        response.sendRedirect("listCoffee");

    }

    private void listCoffee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<product> listCoffee = ProductDAO.selectAllProducts();
        request.setAttribute("listCoffee", listCoffee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("MenuList.jsp");
        dispatcher.forward(request, response);
    }
}
