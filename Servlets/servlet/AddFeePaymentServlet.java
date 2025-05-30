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

@WebServlet("/AddFeePaymentServlet")
public class AddFeePaymentServlet extends HttpServlet {
    private FeePaymentDAO feePaymentDAO;
    
    public void init() {
        feePaymentDAO = new FeePaymentDAO();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        String studentName = request.getParameter("studentName");
        Date paymentDate = Date.valueOf(request.getParameter("paymentDate"));
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        String status = request.getParameter("status");
        
        FeePayment payment = new FeePayment(studentID, studentName, paymentDate, amount, status);
        
        try {
            feePaymentDAO.addFeePayment(payment);
            request.setAttribute("message", "Fee payment added successfully!");
        } catch (SQLException e) {
            request.setAttribute("error", "Error adding fee payment: " + e.getMessage());
        }
        
        request.getRequestDispatcher("feepaymentadd.jsp").forward(request, response);
    }
}