package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;
import com.model.FeePayment;

public class FeePaymentDAO {
    // Database configuration - UPDATE THESE VALUES FOR YOUR SETUP
    private String jdbcURL = "jdbc:mysql://localhost:3306/college_fee_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private String jdbcUsername = "root";
    private String jdbcPassword = ""; // Change this to your MySQL password
    
    // SQL Queries
    private static final String INSERT_FEE_SQL = 
        "INSERT INTO FeePayments (StudentID, StudentName, PaymentDate, Amount, Status) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_FEES = 
        "SELECT * FROM FeePayments ORDER BY PaymentDate DESC";
    private static final String SELECT_FEE_BY_ID = 
        "SELECT * FROM FeePayments WHERE PaymentID = ?";
    private static final String UPDATE_FEE_SQL = 
        "UPDATE FeePayments SET StudentID = ?, StudentName = ?, PaymentDate = ?, Amount = ?, Status = ? WHERE PaymentID = ?";
    private static final String DELETE_FEE_SQL = 
        "DELETE FROM FeePayments WHERE PaymentID = ?";
    private static final String SELECT_OVERDUE_PAYMENTS = 
        "SELECT * FROM FeePayments WHERE Status = 'Overdue' ORDER BY PaymentDate";
    private static final String SELECT_NO_PAYMENT_IN_PERIOD = 
    	"SELECT DISTINCT StudentID, StudentName FROM FeePayments WHERE PaymentDate BETWEEN ? AND ? AND Status = 'Pending'";
    private static final String SELECT_TOTAL_COLLECTION = 
        "SELECT SUM(Amount) as TotalCollection FROM FeePayments WHERE PaymentDate BETWEEN ? AND ? AND Status = 'Paid'";
    
    public FeePaymentDAO() {}
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Database connection successful!"); // Debug log
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database connection failed!");
            System.err.println("URL: " + jdbcURL);
            System.err.println("Username: " + jdbcUsername);
            e.printStackTrace();
        }
        return connection;
    }
    
    // Test database connection
    public boolean testConnection() {
        try (Connection connection = getConnection()) {
            return connection != null && !connection.isClosed();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Add new fee payment
    public void addFeePayment(FeePayment payment) throws SQLException {
        Connection connection = getConnection();
        if (connection == null) {
            throw new SQLException("Unable to establish database connection. Please check your database configuration.");
        }
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FEE_SQL)) {
            preparedStatement.setInt(1, payment.getStudentID());
            preparedStatement.setString(2, payment.getStudentName());
            preparedStatement.setDate(3, payment.getPaymentDate());
            preparedStatement.setBigDecimal(4, payment.getAmount());
            preparedStatement.setString(5, payment.getStatus());
            preparedStatement.executeUpdate();
            System.out.println("Fee payment added successfully!"); // Debug log
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }
    
    // Get all fee payments
    public List<FeePayment> getAllFeePayments() {
        List<FeePayment> payments = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FEES)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                payments.add(extractFeePaymentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
    
    // Get fee payment by ID
    public FeePayment getFeePaymentById(int id) {
        FeePayment payment = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FEE_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                payment = extractFeePaymentFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }
    
    // Update fee payment
    public boolean updateFeePayment(FeePayment payment) throws SQLException {
        boolean updated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FEE_SQL)) {
            preparedStatement.setInt(1, payment.getStudentID());
            preparedStatement.setString(2, payment.getStudentName());
            preparedStatement.setDate(3, payment.getPaymentDate());
            preparedStatement.setBigDecimal(4, payment.getAmount());
            preparedStatement.setString(5, payment.getStatus());
            preparedStatement.setInt(6, payment.getPaymentID());
            updated = preparedStatement.executeUpdate() > 0;
        }
        return updated;
    }
    
    // Delete fee payment
    public boolean deleteFeePayment(int id) throws SQLException {
        boolean deleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FEE_SQL)) {
            preparedStatement.setInt(1, id);
            deleted = preparedStatement.executeUpdate() > 0;
        }
        return deleted;
    }
    
    // Get overdue payments
    public List<FeePayment> getOverduePayments() {
        List<FeePayment> payments = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_OVERDUE_PAYMENTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                payments.add(extractFeePaymentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
    
    // Get students with no payment in period
    public List<FeePayment> getStudentsWithNoPaymentInPeriod(Date startDate, Date endDate) {
        List<FeePayment> students = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NO_PAYMENT_IN_PERIOD)) {
            preparedStatement.setDate(1, startDate);
            preparedStatement.setDate(2, endDate);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                FeePayment student = new FeePayment();
                student.setStudentID(rs.getInt("StudentID"));
                student.setStudentName(rs.getString("StudentName"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
    
    // Get total collection in period
    public BigDecimal getTotalCollectionInPeriod(Date startDate, Date endDate) {
        BigDecimal total = BigDecimal.ZERO;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TOTAL_COLLECTION)) {
            preparedStatement.setDate(1, startDate);
            preparedStatement.setDate(2, endDate);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                total = rs.getBigDecimal("TotalCollection");
                if (total == null) total = BigDecimal.ZERO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
    
    private FeePayment extractFeePaymentFromResultSet(ResultSet rs) throws SQLException {
        FeePayment payment = new FeePayment();
        payment.setPaymentID(rs.getInt("PaymentID"));
        payment.setStudentID(rs.getInt("StudentID"));
        payment.setStudentName(rs.getString("StudentName"));
        payment.setPaymentDate(rs.getDate("PaymentDate"));
        payment.setAmount(rs.getBigDecimal("Amount"));
        payment.setStatus(rs.getString("Status"));
        return payment;
    }
}