<%@ page import="java.util.List" %>
<%@ page import="com.model.FeePayment" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= request.getAttribute("reportTitle") %> | College Fee Payment System</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome (updated to v6) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Favicon -->
    <link rel="icon" href="https://via.placeholder.com/32" type="image/x-icon">

    <style>
        :root {
        	--primary-color: #dc3545;
            --primary-dark: #bb2d3b;
            --secondary-color: #f1c40f; /* Gold accent color */
            --text-color: #333333;
            --text-light: #666666;
            --background-light: #f9f9f9;
            --white: #ffffff;
            --success-color: #28a745;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            --warning-color: #ffc107;
            --danger-color: #dc3545;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem;
            box-shadow: var(--shadow);
            border-bottom: 5px solid var(--secondary-color);
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .logo-img {
            height: 50px;
            width: auto;
        }

        .logo-text {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
            font-size: 1.5rem;
            color: var(--white);
        }

        main {
            flex: 1;
            padding: 2rem 1rem;
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }

        .report-container {
        	background-color: var(--white);
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }

        .report-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark));
        }

        h2 {
            text-align: center;
            color: var(--text-color);
            margin-bottom: 1.5rem;
            font-weight: 600;
            font-size: 1.8rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .report-info {
            background-color: var(--background-light);
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 2rem;
            color: var(--text-color);
            font-weight: 500;
            border-left: 4px solid var(--primary-color);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1.5rem 0;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: var(--background-light);
            font-weight: 600;
            color: var(--text-color);
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
        }

        tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }

        .total-amount {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--success-color);
            text-align: center;
            padding: 2rem;
            background-color: var(--background-light);
            border-radius: 8px;
            margin: 2rem 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .status-paid {
            color: var(--success-color);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .status-overdue {
            color: var(--danger-color);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .status-pending {
            color: var(--warning-color);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .empty-state {
            text-align: center;
            padding: 3rem;
            color: var(--text-light);
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: var(--success-color);
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            background-color: var(--primary-color);
            color: white;
            padding: 0.8rem 1.8rem;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            text-decoration: none;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: var(--text-light);
        }

        .btn-secondary:hover {
            background-color: var(--text-color);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            main {
                padding: 1.5rem;
            }
            
            .report-container {
                padding: 1.5rem;
                overflow-x: auto;
            }
            
            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                text-align: center;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .report-container {
            animation: fadeIn 0.5s ease-out forwards;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="logo-container">
                <img src="https://alvas.org/wp-content/themes/alvas-2021/img/alvas-org-logo-white.png" 
                     alt="Alva's Logo" 
                     class="logo-img">
                <span class="logo-text">Alva's Institute Fee Payment System</span>
            </div>
        </div>
    </header>

    <main>
        <div class="report-container">
            <h2><i class="fas fa-file-alt"></i> <%= request.getAttribute("reportTitle") %></h2>
            
            <% 
            String reportType = (String) request.getAttribute("reportType");
            Date startDate = (Date) request.getAttribute("startDate");
            Date endDate = (Date) request.getAttribute("endDate");
            
            if (startDate != null && endDate != null) {
            %>
            <div class="report-info">
                <i class="far fa-calendar-alt"></i>
                <div>
                    <strong>Report Period:</strong> <%= startDate %> to <%= endDate %>
                </div>
            </div>
            <% } %>
            
            <% if ("overdue".equals(reportType)) { 
               List<FeePayment> payments = (List<FeePayment>) request.getAttribute("payments");
               if (payments != null && !payments.isEmpty()) {
            %>
            
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Payment Date</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (FeePayment payment : payments) { %>
                    <tr>
                        <td><%= payment.getStudentID() %></td>
                        <td><%= payment.getStudentName() %></td>
                        <td><%= payment.getPaymentDate() %></td>
                        <td>$<%= String.format("%.2f", payment.getAmount()) %></td>
                        <td>
                            <span class="status-overdue">
                                <i class="fas fa-exclamation-circle"></i> <%= payment.getStatus() %>
                            </span>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
            <% } else { %>
            <div class="empty-state">
                <i class="fas fa-check-circle"></i>
                <p>No overdue payments found</p>
            </div>
            <% } %>
            
            <% } else if ("noPayment".equals(reportType)) { 
               List<FeePayment> students = (List<FeePayment>) request.getAttribute("students");
               if (students != null && !students.isEmpty()) {
            %>
            
            <div class="report-info">
                <i class="fas fa-info-circle"></i>
                <div>
                    <strong>Students with Pending Payments (Not Yet Paid)</strong>
                </div>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (FeePayment student : students) { %>
                    <tr>
                        <td><%= student.getStudentID() %></td>
                        <td><%= student.getStudentName() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
            <% } else { %>
            <div class="empty-state">
                <i class="fas fa-check-circle"></i>
                <p>All students have paid their fees in the specified period</p>
            </div>
            <% } %>
            
            <% } else if ("totalCollection".equals(reportType)) { 
               BigDecimal totalCollection = (BigDecimal) request.getAttribute("totalCollection");
            %>
            
            <div class="total-amount">
                <i class="fas fa-coins"></i>
                <div>Total Collection: Rs.<%= totalCollection != null ? String.format("%.2f", totalCollection) : "0.00" %></div>
            </div>
            
            <% } %>
            
            <div class="action-buttons">
                <a href="report_form.jsp" class="btn">
                    <i class="fas fa-file-export"></i> Generate Another Report
                </a>
                <a href="index.jsp" class="btn btn-secondary">
                    <i class="fas fa-home"></i> Back to Home
                </a>
            </div>
        </div>
    </main>
        
</body>
</html>