package controller;

import model.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "add", urlPatterns = {"/add"})
public class add extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sname = request.getParameter("customerName");
        String sbirthday = request.getParameter("customerBirthday");
        int sgender = Integer.parseInt(request.getParameter("customerGender"));
        String sidcard = request.getParameter("customerIdCard");
        String sphone = request.getParameter("customerPhone");
        String semail = request.getParameter("customerEmail");
        String saddress = request.getParameter("customerAddress");

        CustomerService customerService = new CustomerService();
        customerService.insertCustomer(sname, sbirthday, sgender, sidcard, sphone, semail, saddress);
        response.sendRedirect("load");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
