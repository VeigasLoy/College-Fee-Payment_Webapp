<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports | College Fee Payment System</title>
    
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
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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

        

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
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
        
        .fas fa-file-export{
        	color: white;
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

        .reports-container {
            background-color: var(--white);
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }

        .reports-container::before {
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
            margin-bottom: 2rem;
            font-weight: 600;
            font-size: 2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .report-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .report-card {
        	background-color: var(--white);
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
            background-color: var(--white);
            border: 1px solid rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: var(--transition);
        }

        .report-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .report-card::before {
        	content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark));
            opacity: 0;
            transition: var(--transition);
        }

        .report-card:hover::before {
            opacity: 1;
        }

        .report-card i {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }

        .report-card h3 {
            color: var(--text-color);
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .report-card p {
            color: var(--text-light);
            font-size: 0.95rem;
            margin-bottom: 1.5rem;
            line-height: 1.6;
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

        .action-buttons {
            text-align: center;
            margin-top: 2rem;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            main {
                padding: 1.5rem;
            }
            
            .reports-container {
                padding: 1.5rem;
            }
            
            h2 {
                font-size: 1.5rem;
            }
            
            .report-options {
                grid-template-columns: 1fr;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .report-card {
            animation: fadeIn 0.5s ease-out forwards;
            opacity: 0;
        }

        .report-card:nth-child(1) { animation-delay: 0.1s; }
        .report-card:nth-child(2) { animation-delay: 0.2s; }
        .report-card:nth-child(3) { animation-delay: 0.3s; }
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
        <div class="reports-container">
            <h2><i class="fas fa-chart-pie"></i> Generate Reports</h2>
            
            <div class="report-options">
                <div class="report-card">
                    <i class="fas fa-exclamation-circle"></i>
                    <h3>Overdue Payments</h3>
                    <p>View detailed report of all students with overdue fee payments including amount due</p>
                    <a href="ReportCriteriaServlet?reportType=overdue" class="btn">
                        <i></i> Generate Report
                    </a>
                </div>
                
                <div class="report-card">
                    <i class="fas fa-clock"></i>
                    <h3>Pending Payments</h3>
                    <p>Find students who have pending (unpaid) fees within a specific date range with payment details</p>
                    <a href="ReportCriteriaServlet?reportType=noPayment" class="btn">
                        <i></i> Generate Report
                    </a>
                </div>
                
                <div class="report-card">
                    <i class="fas fa-money-bill-wave"></i>
                    <h3>Total Collection</h3>
                    <p>Calculate total fee collection for a period with breakdown by categories</p>
                    <a href="ReportCriteriaServlet?reportType=totalCollection" class="btn">
                        <i></i> Generate Report
                    </a>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="index.jsp" class="btn btn-secondary">
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