<%@ page import="com.model.FeePayment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Fee Payment | College Fee Payment System</title>
    
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
            max-width: 800px;
            margin: 0 auto;
            width: 100%;
        }

        .update-container {
            background-color: var(--white);
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }

        .update-container::before {
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

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text-color);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        input, select {
            width: 100%;
            padding: 0.8rem 1rem 0.8rem 2.5rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            font-family: 'Poppins', sans-serif;
            transition: var(--transition);
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 2.5rem;
            color: var(--text-light);
        }

        .btn-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            background-color: var(--primary-color);
            color: white;
            padding: 0.8rem 1.8rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            text-decoration: none;
            transition: var(--transition);
            flex: 1;
            text-align: center;
            display: flex;
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

        .not-found {
            text-align: center;
            padding: 2rem;
            color: var(--text-light);
        }

        .not-found i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: var(--text-light);
            opacity: 0.5;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            main {
                padding: 1.5rem;
            max-width: 100%;
            width: 100%;
            box-sizing: border-box;
            padding: 1rem;
            margin: 0;
            border-radius: 0;
            box-shadow: none;
            padding: 1rem;
            margin: 0;
            border-radius: 0;
            box-shadow: none;
            padding: 1rem;
            margin: 0;
            border-radius: 0;
            box-shadow: none;
        }

        .update-container {
            padding: 1.5rem;
            border-radius: 0;
        }

        h2 {
            font-size: 1.5rem;
        }

        .btn-group {
            flex-direction: column;
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
        <div class="update-container">
            <% 
            FeePayment payment = (FeePayment) request.getAttribute("payment");
            if (payment != null) {
            %>
            
            <h2><i class="fas fa-edit"></i> Update Fee Payment</h2>
            
            <form action="UpdateFeePaymentServlet" method="post">
                <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
                
                <div class="form-group">
                    <label for="studentID"><i class="fas fa-id-card"></i> Student ID</label>
                    <i class="fas fa-user input-icon"></i>
                    <input type="number" id="studentID" name="studentID" value="<%= payment.getStudentID() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="studentName"><i class="fas fa-user-graduate"></i> Student Name</label>
                    <i class="fas fa-signature input-icon"></i>
                    <input type="text" id="studentName" name="studentName" value="<%= payment.getStudentName() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="paymentDate"><i class="far fa-calendar-alt"></i> Payment Date</label>
                    <i class="fas fa-calendar-day input-icon"></i>
                    <input type="date" id="paymentDate" name="paymentDate" value="<%= payment.getPaymentDate() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="amount"><i class="fas fa-money-bill-wave"></i> Amount</label>
                    <i class="fas fa-dollar-sign input-icon"></i>
                    <input type="number" id="amount" name="amount" step="0.01" value="<%= payment.getAmount() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="status"><i class="fas fa-info-circle"></i> Status</label>
                    <i class="fas fa-tag input-icon"></i>
                    <select id="status" name="status" required>
                        <option value="Paid" <%= "Paid".equals(payment.getStatus()) ? "selected" : "" %>>Paid</option>
                        <option value="Overdue" <%= "Overdue".equals(payment.getStatus()) ? "selected" : "" %>>Overdue</option>
                        <option value="Pending" <%= "Pending".equals(payment.getStatus()) ? "selected" : "" %>>Pending</option>
                    </select>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn">
                        <i class="fas fa-save"></i> Update Payment
                    </button>
                    <a href="DisplayFeePaymentsServlet" class="btn btn-secondary">
                        <i class="fas fa-times"></i> Cancel
                    </a>
                </div>
            </form>
            
            <% } else { %>
            <div class="not-found">
                <i class="fas fa-exclamation-triangle"></i>
                <p>Payment record not found</p>
                <a href="DisplayFeePaymentsServlet" class="btn">
                    <i class="fas fa-arrow-left"></i> Back to Payment List
                </a>
            </div>
            <% } %>
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