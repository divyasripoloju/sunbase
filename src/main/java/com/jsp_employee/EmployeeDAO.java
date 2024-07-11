package com.jsp_employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/nandu";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Nandu@2004";

    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            String query = "SELECT id,name FROM employees";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                Employee employee = new Employee();
                employee.setId(resultSet.getInt("id"));
                employee.setName(resultSet.getString("name"));
                employees.add(employee);
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employees;
    }
    private static final String GET_EMPLOYEE_BY_ID_QUERY = "SELECT * FROM employees WHERE id = ?";

    public Employee getEmployeeById(int id) {
        Employee employee = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            
            PreparedStatement preparedStatement = connection.prepareStatement(GET_EMPLOYEE_BY_ID_QUERY);
            preparedStatement.setInt(1, id);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                employee = new Employee();
                employee.setId(resultSet.getInt("id"));
                employee.setName(resultSet.getString("name"));
                employee.setEmail(resultSet.getString("email"));
                employee.setWorkingDays(resultSet.getInt("working_days"));
                employee.setAbsentDays(resultSet.getInt("absent_days"));
                employee.setTotal_sales(resultSet.getInt("Total_sales"));
                employee.setPosition(resultSet.getString("position"));
            }
            
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        return employee;
    }
    private static final String UPDATE_EMPLOYEE_QUERY = "UPDATE employees SET name = ?,email = ?,working_days=?,absent_days=?,Total_sales=?,position=? WHERE id = ?";

    public boolean updateEmployee(int id, String name, String email,int working_days,int absent_days,int Total_sales,String position) {
        boolean success = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_QUERY);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setInt(3, working_days);
            preparedStatement.setInt(4, absent_days);
            preparedStatement.setInt(5, Total_sales);
            preparedStatement.setString(6, position);
            preparedStatement.setInt(7, id);

            int rowsUpdated = preparedStatement.executeUpdate();

            if (rowsUpdated > 0) {
                success = true;
            }

            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return success;
    }
    public boolean createEmployee(String id, String name, String email, String workingDays, String absentDays, String totalSales, String position) {
        boolean success = false;
        try {
        	int idInt = (id != null && !id.isEmpty()) ? Integer.parseInt(id) : 0;
            int workingDaysInt = (workingDays != null && !workingDays.isEmpty()) ? Integer.parseInt(workingDays) : 0;
            int absentDaysInt = (absentDays != null && !absentDays.isEmpty()) ? Integer.parseInt(absentDays) : 0;
            int totalSalesInt = (totalSales != null && !totalSales.isEmpty()) ? Integer.parseInt(totalSales) : 0;
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            String insertQuery = "INSERT INTO employees (id, name, email, working_days, absent_days, total_sales, position) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            
            preparedStatement.setInt(1, idInt);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, email);
            preparedStatement.setInt(4, workingDaysInt);
            preparedStatement.setInt(5, absentDaysInt);
            preparedStatement.setInt(6, totalSalesInt);
            preparedStatement.setString(7, position);

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                success = true;
            }

            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
    public boolean deleteEmployee(int id) {
        boolean success = false;
        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            String deleteQuery = "DELETE FROM employees WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, id);
            int rowsDeleted = preparedStatement.executeUpdate();
            if (rowsDeleted > 0) {
                success = true;
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
}
