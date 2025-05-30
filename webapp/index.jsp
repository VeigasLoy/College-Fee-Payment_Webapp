<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AIET - College Fee Payment System</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
    
    <!-- Font Awesome (updated to v6) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Favicon -->
    <link rel="icon" href="https://via.placeholder.com/32" type="image/x-icon">

    <style>
        :root {
            --primary-color: #dc3545; /* Bootstrap danger red */
            --primary-dark: #dc3545;
            --secondary-color: #f1c40f; /* Gold accent color */
            --text-color: #333333;
            --text-light: #666666;
            --background-light: #f9f9f9;
            --white: #ffffff;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        }
        
        .copyright {
            opacity: 0.8;
            margin-bottom: 0.5rem;
        }

        .developer-credit {
            font-size: 0.8rem;
            opacity: 0.7;
        }

        .developer-credit a {
            color: var(--secondary-color);
            text-decoration: none;
            transition: var(--transition);
        }

        .developer-credit a:hover {
            text-decoration: underline;
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
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.8)), url('https://cdn-ilckkap.nitrocdn.com/rMNIGAqtniUxPuOnJDQbsPYclpYTbDLa/assets/images/optimized/rev-2d620eb/www.aiet.org.in/wp-content/themes/aiet-2019/images/banner.jpg') no-repeat center center;
            background-size: cover;
            color: white;
            padding: 3rem 1rem 2rem;
            text-align: center;
            box-shadow: var(--shadow);
            border-bottom: 5px solid var(--secondary-color);
            position: relative;
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
        }

        .institute-name {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
            color: var(--white);
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }

        .institute-subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 1.5rem;
            font-weight: 300;
            max-width: 800px;
            margin: 0 auto 1.5rem;
        }

        h1 {
            font-weight: 600;
            font-size: 2rem;
            margin: 1.5rem 0 0.5rem;
            color: var(--white);
        }

        .subtitle {
            font-weight: 400;
            font-size: 1.1rem;
            opacity: 0.9;
            max-width: 800px;
            margin: 0 auto 2rem;
        }

        .breadcrumb {
            background-color: rgba(220, 53, 69, 0.7); /* Using the new red color */
            padding: 0.7rem 1rem;
            border-radius: 30px;
            display: inline-block;
            margin-top: 1rem;
            font-size: 0.9rem;
            backdrop-filter: blur(5px);
        }

        main {
            flex: 1;
            padding: 3rem 1rem;
            max-width: 1400px;
            margin: 0 auto;
            width: 100%;
        }

        .section-title {
            font-family: 'Playfair Display', serif;
            color: var(--primary-color);
            font-size: 1.8rem;
            margin-bottom: 2rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--secondary-color);
            display: inline-block;
        }

        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 1rem;
        }

        .menu-item {
            background-color: var(--white);
            color: var(--text-color);
            text-align: center;
            padding: 2.5rem 2rem;
            border-radius: 10px;
            text-decoration: none;
            transition: var(--transition);
            box-shadow: var(--shadow);
            border: 1px solid rgba(0, 0, 0, 0.05);
            position: relative;
            overflow: hidden;
            z-index: 1;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .menu-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            z-index: -1;
            opacity: 0;
            transition: var(--transition);
        }

        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
            color: var(--white);
        }

        .menu-item:hover::before {
            opacity: 1;
        }

        .menu-item:hover i,
        .menu-item:hover h3,
        .menu-item:hover p {
            color: var(--white);
        }

        .menu-item i {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            transition: var(--transition);
        }

        .menu-item h3 {
            margin: 0.75rem 0 0.5rem;
            font-size: 1.5rem;
            font-weight: 600;
            transition: var(--transition);
        }

        .menu-item p {
            font-size: 1rem;
            color: var(--text-light);
            transition: var(--transition);
            max-width: 300px;
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

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .institute-name {
                font-size: 1.8rem;
            }
            
            h1 {
                font-size: 1.5rem;
            }
            
            .subtitle {
                font-size: 1rem;
                margin-bottom: 1.5rem;
            }
            
            .menu {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .menu-item {
                padding: 2rem 1.5rem;
            }
            
            .section-title {
                font-size: 1.6rem;
                margin-bottom: 1.5rem;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .menu-item {
            animation: fadeIn 0.5s ease-out forwards;
            opacity: 0;
        }

        .menu-item:nth-child(1) { animation-delay: 0.1s; }
        .menu-item:nth-child(2) { animation-delay: 0.2s; }
        .menu-item:nth-child(3) { animation-delay: 0.3s; }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="institute-name">Alva's Institute of Engineering & Technology</div>
            <div class="institute-subtitle">An Alva's Education Foundation® Institution</div>
            <h1>College Fee Payment System</h1>
            <p class="subtitle">Manage student payments efficiently with our secure online platform</p>
            <div class="breadcrumb">
                <i class="fas fa-home"></i> Home > Fee Payment Portal
            </div>
        </div>
    </header>

    <main>
        <h2 class="section-title">Payment Services</h2>
        <div class="menu">
            <a href="feepaymentadd.jsp" class="menu-item">
                <i class="fas fa-money-bill-wave"></i>
                <h3>Make Payment</h3>
                <p>Submit new student fee payments with complete details</p>
            </a>

            <a href="DisplayFeePaymentsServlet" class="menu-item">
                <i class="fas fa-history"></i>
                <h3>Payment History</h3>
                <p>View and track all payment transactions</p>
            </a>

            <a href="report_form.jsp" class="menu-item">
                <i class="fas fa-chart-pie"></i>
                <h3>Reports & Analytics</h3>
                <p>Generate detailed financial reports and insights</p>
            </a>
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