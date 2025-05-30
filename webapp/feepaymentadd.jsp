<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Fee Payment | College Fee Payment System</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
    
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

        .copyright {
            opacity: 0.8;
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

        .page-title {
            margin-left: auto;
            font-size: 1.2rem;
            font-weight: 500;
        }

        main {
            flex: 1;
            padding: 2rem 1rem;
            max-width: 800px;
            margin: 0 auto;
            width: 100%;
        }

        .payment-container {
            background-color: var(--white);
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }

        .payment-container::before {
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
            box-shadow: 0 0 0 3px rgba(220, 53, 69, 0.2);
        }

        /* Fix the input icon positioning (remove duplicate properties) */
		.input-icon {
		    position: absolute;
		    left: 1rem;
		    top: 70%;
		    transform: translateY(-50%);
		    color: var(--text-light);
		}
		
		/* Ensure buttons have equal width and proper alignment */
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
		    flex: 1; /* This makes both buttons equal width */
		    text-align: center;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    gap: 0.5rem;
		}
		
		/* Make sure the secondary button has the same flex properties */
		.btn-secondary {
		    background-color: var(--text-light);
		    flex: 1; /* Add this to ensure equal width */
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

        .message {
            padding: 1rem;
            margin-bottom: 2rem;
            border-radius: 8px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: fadeIn 0.5s ease-out;
        }

        .success {
            background-color: rgba(40, 167, 69, 0.1);
            color: var(--success-color);
            border-left: 4px solid var(--success-color);
        }

        .error {
            background-color: rgba(220, 53, 69, 0.1);
            color: var(--error-color);
            border-left: 4px solid var(--error-color);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
                gap: 0.5rem;
            }
            
            .page-title {
                margin-left: 0;
            }
            
            main {
                padding: 1.5rem;
            }
            
            .payment-container {
                padding: 1.5rem;
            }
            
            h2 {
                font-size: 1.5rem;
            }
            
            .btn-group {
                flex-direction: column;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
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
        <div class="payment-container">
            <h2><i class="fas fa-plus-circle"></i> Add New Fee Payment</h2>
            
            <% if (request.getAttribute("message") != null) { %>
                <div class="message success">
                    <i class="fas fa-check-circle"></i>
                    <%= request.getAttribute("message") %>
                </div>
            <% } %>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="message error">
                    <i class="fas fa-exclamation-circle"></i>
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="AddFeePaymentServlet" method="post">
                <div class="form-group">
                    <label for="studentID"><i class="fas fa-id-card"></i> Student ID</label>
                    <i class="fas fa-user input-icon"></i>
                    <input type="number" id="studentID" name="studentID" required>
                </div>
                
                <div class="form-group">
                    <label for="studentName"><i class="fas fa-user-graduate"></i> Student Name</label>
                    <i class="fas fa-signature input-icon"></i>
                    <input type="text" id="studentName" name="studentName" required>
                </div>
                
                <div class="form-group">
                    <label for="paymentDate"><i class="far fa-calendar-alt"></i> Payment Date</label>
                    <i class="fas fa-calendar-day input-icon"></i>
                    <input type="date" id="paymentDate" name="paymentDate" required>
                </div>
                
                <div class="form-group">
                    <label for="amount"><i class="fas fa-money-bill-wave"></i> Amount</label>
                    <i class="fas fa-dollar-sign input-icon"></i>
                    <input type="number" id="amount" name="amount" step="0.01" required>
                </div>
                
                <div class="form-group">
                    <label for="status"><i class="fas fa-info-circle"></i> Status</label>
                    <i class="fas fa-tag input-icon"></i>
                    <select id="status" name="status" required>
                        <option value="">Select Status</option>
                        <option value="Paid">Paid</option>
                        <option value="Overdue">Overdue</option>
                        <option value="Pending">Pending</option>
                    </select>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn">
                        <i class="fas fa-save"></i> Add Payment
                    </button>
                    <a href="index.jsp" class="btn btn-primary">
                        <i class="fas fa-home"></i> Back to Home
                    </a>
                </div>
            </form>
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