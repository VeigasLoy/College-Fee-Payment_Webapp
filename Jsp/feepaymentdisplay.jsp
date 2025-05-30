<%@ page import="java.util.List" %>
<%@ page import="com.model.FeePayment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fee Payment Records | College Fee Payment System</title>
    
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
            --error-color: #dc3545;
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
            background-color: var(--background-light);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            padding: 0;
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


        .logo {
            font-size: 1.5rem;
            font-weight: 600;
            text-decoration: none;
            color: white;
        }

        .logo i {
            margin-right: 10px;
        }

        main {
            flex: 1;
            padding: 2rem 1rem;
            max-width: 1400px;
            margin: 0 auto;
            width: 100%;
        }

        .records-container {
            
            background-color: var(--white);
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }

        .records-container::before {
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

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 500;
            text-decoration: none;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .btn-edit {
            background-color: rgba(255, 193, 7, 0.1);
            color: var(--warning-color);
            border: 1px solid rgba(255, 193, 7, 0.3);
        }

        .btn-edit:hover {
            background-color: rgba(255, 193, 7, 0.2);
        }

        .btn-delete {
            background-color: rgba(220, 53, 69, 0.1);
            color: var(--danger-color);
            border: 1px solid rgba(220, 53, 69, 0.3);
        }

        .btn-delete:hover {
            background-color: rgba(220, 53, 69, 0.2);
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .status-paid {
            color: var(--success-color);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        footer {
            background-color: var(--primary-color);
            color: var(--white);
            text-align: center;
            padding: 2rem 1.5rem;
            font-size: 0.9rem;
            border-top: 3px solid var(--secondary-color);
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .footer-links {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
            justify-content: center;
        }

        .footer-links a {
            color: var(--white);
            text-decoration: none;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer-links a:hover {
            color: var(--secondary-color);
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

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: var(--text-light);
            opacity: 0.5;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            main {
                padding: 1rem;
            }
            
            .records-container {
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
            
            .btn-primary {
                width: 100%;
                text-align: center;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .records-container {
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
        <div class="records-container">
            <h2><i class="fas fa-file-invoice-dollar"></i> Fee Payment Records</h2>
            
            <% 
            List<FeePayment> payments = (List<FeePayment>) request.getAttribute("payments");
            if (payments != null && !payments.isEmpty()) {
            %>
            
            <table>
                <thead>
                    <tr>
                        <th>Payment ID</th>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Payment Date</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (FeePayment payment : payments) { %>
                    <tr>
                        <td><%= payment.getPaymentID() %></td>
                        <td><%= payment.getStudentID() %></td>
                        <td><%= payment.getStudentName() %></td>
                        <td><%= payment.getPaymentDate() %></td>
                        <td>$<%= String.format("%.2f", payment.getAmount()) %></td>
                        <td>
                            <% if ("Paid".equals(payment.getStatus())) { %>
                                <span class="status-paid"><i class="fas fa-check-circle"></i> <%= payment.getStatus() %></span>
                            <% } else if ("Overdue".equals(payment.getStatus())) { %>
                                <span class="status-overdue"><i class="fas fa-exclamation-circle"></i> <%= payment.getStatus() %></span>
                            <% } else { %>
                                <span class="status-pending"><i class="fas fa-clock"></i> <%= payment.getStatus() %></span>
                            <% } %>
                        </td>
                        <td>
                            <a href="UpdateFeePaymentServlet?id=<%= payment.getPaymentID() %>" class="btn btn-edit">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="DeleteFeePaymentServlet?id=<%= payment.getPaymentID() %>" 
                               class="btn btn-delete" 
                               onclick="return confirm('Are you sure you want to delete this payment record?')">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
            <% } else { %>
            <div class="empty-state">
                <i class="fas fa-file-alt"></i>
                <p>No payment records found</p>
            </div>
            <% } %>
            
            <div class="action-buttons">
                <a href="feepaymentadd.jsp" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Add New Payment
                </a>
                <a href="index.jsp" class="btn btn-primary">
                    <i class="fas fa-home"></i> Back to Home
                </a>
            </div>
        </div>
    </main>
        <footer>
        <div class="footer-content">
            <div class="footer-links">
                <a href="#"><i class="fas fa-globe"></i> www.aiet.org.in</a>
                <a href="#"><i class="fas fa-envelope"></i> loyostonr@gmail.com</a>
                <a href="#"><i class="fas fa-phone"></i> +91 7338295807</a>
            </div>
            <div class="copyright">&copy; 2025 Alva's Institute of Engineering & Technology | All Rights Reserved</div>
            <div class="developer-credit">
                Developed by <a href="https://github.com/VeigasLoy" target="_blank">Loyston Veigas</a>
            </div>
        </div>
    </footer>
</body>
</html>
</body>
</html>