<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= request.getAttribute("reportTitle") %> | College Fee System</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: var(--text);
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            background: var(--white);
            border-radius: 12px;
            box-shadow: var(--shadow);
            overflow: hidden;
            position: relative;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .header {
            padding: 25px 30px 10px;
            text-align: center;
        }

        h2 {
            color: var(--text);
            font-weight: 600;
            margin-bottom: 5px;
            font-size: 24px;
        }

        .description {
            background-color: var(--light);
            padding: 18px;
            border-radius: 8px;
            margin: 20px 30px;
            color: var(--text-light);
            font-size: 15px;
            border-left: 4px solid var(--primary);
        }

        .form-content {
            padding: 0 30px 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text);
            font-size: 15px;
        }

        input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border);
            border-radius: 8px;
            font-size: 15px;
            font-family: 'Poppins', sans-serif;
            transition: var(--transition);
        }

        input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }

        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

		.btn {
		    flex: 1;
		    padding: 12px;
		    border-radius: 8px;
		    font-weight: 500;
		    font-size: 15px;
		    text-align: center;
		    cursor: pointer;
		    transition: var(--transition);
		    border: none;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    gap: 8px;
		    background-color: var(--primary-color);
		    color: var(--white);
		    text-decoration: none;
		}
		
		.btn:hover {
		    background-color: var(--primary-dark);
		    transform: translateY(-2px);
		}

        @media (max-width: 768px) {
            .container {
                margin: 20px auto;
            }
            
            .header, .form-content {
                padding: 20px;
            }
            
            .description {
                margin: 15px 20px;
            }
            
            .btn-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2><i class="fas fa-chart-line"></i> <%= request.getAttribute("reportTitle") %></h2>
        </div>
        
        <div class="description">
            <i class="fas fa-info-circle"></i> <%= request.getAttribute("reportDescription") %>
        </div>
        
        <form action="ReportServlet" method="post" class="form-content">
            <input type="hidden" name="reportType" value="<%= request.getAttribute("reportType") %>">
            
            <% Boolean requiresDateRange = (Boolean) request.getAttribute("requiresDateRange");
               if (requiresDateRange != null && requiresDateRange) { 
               LocalDate today = LocalDate.now();
               LocalDate firstDayOfMonth = today.withDayOfMonth(1);
            %>
            
            <div class="form-group">
                <label for="startDate"><i class="far fa-calendar-alt"></i> Start Date</label>
                <input type="date" id="startDate" name="startDate" 
                       value="<%= firstDayOfMonth %>" 
                       max="<%= today %>" required>
            </div>
            
            <div class="form-group">
                <label for="endDate"><i class="far fa-calendar-alt"></i> End Date</label>
                <input type="date" id="endDate" name="endDate" 
                       value="<%= today %>" 
                       max="<%= today %>" required>
            </div>
            
            <% } %>
            
            <div class="btn-group">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-file-export"></i> Generate Report
                </button>
                <a href="report_form.jsp" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back
                </a>
            </div>
        </form>
    </div>

    <script>
        // Set end date to match start date when start date changes
        document.getElementById('startDate')?.addEventListener('change', function() {
            const endDate = document.getElementById('endDate');
            if (this.value > endDate.value) {
                endDate.value = this.value;
            }
        });
    </script>
       
</body>
</html>