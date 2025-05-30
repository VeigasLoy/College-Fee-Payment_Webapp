package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.FeePaymentDAO;

@WebServlet("/DeleteFeePaymentServlet")
public class DeleteFeePaymentServlet extends HttpServlet {
    private FeePaymentDAO feePaymentDAO;
    
    public void init() {
        feePaymentDAO = new FeePaymentDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int paymentID = Integer.parseInt(request.getParameter("id"));
        
        try {
            feePaymentDAO.deleteFeePayment(paymentID);
            request.setAttribute("message", "Fee payment deleted successfully!");
        } catch (SQLException e) {
            request.setAttribute("error", "Error deleting fee payment: " + e.getMessage());
        }
        
        response.sendRedirect("DisplayFeePaymentsServlet");
    }
}