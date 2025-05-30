package com.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.FeePaymentDAO;
import com.model.FeePayment;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private FeePaymentDAO feePaymentDAO;
    
    public void init() {
        feePaymentDAO = new FeePaymentDAO();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String reportType = request.getParameter("reportType");
        
        if ("overdue".equals(reportType)) {
            List<FeePayment> overduePayments = feePaymentDAO.getOverduePayments();
            request.setAttribute("reportTitle", "Students with Overdue Payments");
            request.setAttribute("payments", overduePayments);
            
        } else if ("noPayment".equals(reportType)) {
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));
            List<FeePayment> students = feePaymentDAO.getStudentsWithNoPaymentInPeriod(startDate, endDate);
            request.setAttribute("reportTitle", "Students with No Payment in Period");
            request.setAttribute("students", students);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            
        } else if ("totalCollection".equals(reportType)) {
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));
            BigDecimal totalCollection = feePaymentDAO.getTotalCollectionInPeriod(startDate, endDate);
            request.setAttribute("reportTitle", "Total Fee Collection");
            request.setAttribute("totalCollection", totalCollection);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
        }
        
        request.setAttribute("reportType", reportType);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}