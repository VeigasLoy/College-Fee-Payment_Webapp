package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String reportType = request.getParameter("reportType");
        
        if (reportType != null) {
            request.setAttribute("reportType", reportType);
            
            // Set report-specific attributes
            switch (reportType) {
                case "overdue":
                    request.setAttribute("reportTitle", "Students with Overdue Payments");
                    request.setAttribute("reportDescription", "This report shows all students who have overdue fee payments.");
                    request.setAttribute("requiresDateRange", false);
                    break;
                    
                case "noPayment":
                    request.setAttribute("reportTitle", "Students with No Payment in Period");
                    request.setAttribute("reportDescription", "This report shows students who haven't made any payments within a specified date range.");
                    request.setAttribute("requiresDateRange", true);
                    break;
                    
                case "totalCollection":
                    request.setAttribute("reportTitle", "Total Fee Collection Report");
                    request.setAttribute("reportDescription", "This report shows the total amount collected within a specified date range.");
                    request.setAttribute("requiresDateRange", true);
                    break;
                    
                default:
                    response.sendRedirect("report_form.jsp");
                    return;
            }
            
            request.getRequestDispatcher("reports.jsp").forward(request, response);
        } else {
            response.sendRedirect("report_form.jsp");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}