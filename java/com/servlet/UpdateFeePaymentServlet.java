package com.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.FeePaymentDAO;
import com.model.FeePayment;

@WebServlet("/UpdateFeePaymentServlet")
public class UpdateFeePaymentServlet extends HttpServlet {
    private FeePaymentDAO feePaymentDAO;
    
    public void init() {
        feePaymentDAO = new FeePaymentDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int paymentID = Integer.parseInt(request.getParameter("id"));
        FeePayment payment = feePaymentDAO.getFeePaymentById(paymentID);
        request.setAttribute("payment", payment);
        request.getRequestDispatcher("feepaymentupdate.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int paymentID = Integer.parseInt(request.getParameter("paymentID"));
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        String studentName = request.getParameter("studentName");
        Date paymentDate = Date.valueOf(request.getParameter("paymentDate"));
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        String status = request.getParameter("status");
        
        FeePayment payment = new FeePayment(studentID, studentName, paymentDate, amount, status);
        payment.setPaymentID(paymentID);
        
        try {
            feePaymentDAO.updateFeePayment(payment);
            request.setAttribute("message", "Fee payment updated successfully!");
        } catch (SQLException e) {
            request.setAttribute("error", "Error updating fee payment: " + e.getMessage());
        }
        
        response.sendRedirect("DisplayFeePaymentsServlet");
    }
}
