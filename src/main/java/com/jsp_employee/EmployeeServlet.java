package com.jsp_employee;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; 
        }

        switch (action) {

            case "profile":
                int employeeId = Integer.parseInt(request.getParameter("id"));
                Employee employee = getEmployeeProfileData(employeeId);
                request.setAttribute("employee", employee);
                request.getRequestDispatcher("employeeProfile.jsp").forward(request, response);
                break;
            case "editProfile":
                // Display the edit profile form
                int editEmployeeId = Integer.parseInt(request.getParameter("id"));
                Employee editEmployee = getEmployeeProfileData(editEmployeeId);
                request.setAttribute("employee", editEmployee);
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                break;
            default:
                listEmployees(request, response);
        }
    }
    private Employee getEmployeeProfileData(int employeeId) {
        Employee employee = new Employee();
        String jdbcUrl = "jdbc:mysql://localhost:3306/nandu";
        String dbUser = "root";
        String dbPassword = "Nandu@2004";

        try {
        	Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            String sql = "SELECT * FROM employees WHERE id=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, employeeId);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()) {
                employee.setId(resultSet.getInt("id"));
                employee.setName(resultSet.getString("name"));
                employee.setEmail(resultSet.getString("email"));
                employee.setWorkingDays(resultSet.getInt("working_days"));
                employee.setAbsentDays(resultSet.getInt("absent_days"));
                employee.setTotal_sales(resultSet.getInt("Total_sales"));
                employee.setPosition(resultSet.getString("position"));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return employee;
    }
    @SuppressWarnings("unused")
	private List<Employee> retrieveEmployeeAttendance(List<Employee> employees) {
        for (Employee employee : employees) {
            int employeeId = employee.getId();
            int working_days = getWorkingDaysForEmployee(employeeId); 
            int absent_days = getAbsentDaysForEmployee(employeeId);   
            employee.setWorkingDays(working_days);
            employee.setAbsentDays(absent_days);
        }
        return employees;
    }

	private int getAbsentDaysForEmployee(int employeeId) {
		
		return 0;
	}

	private int getWorkingDaysForEmployee(int employeeId) {
		
		return 0;
	}

	private void listEmployees(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Employee> employees = new ArrayList<>();
        String jdbcUrl = "jdbc:mysql://localhost:3306/nandu";
        String dbUser = "root";
        String dbPassword = "Nandu@2004";
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            String sql = "SELECT id, name FROM employees";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Employee employee = new Employee();
                employee.setId(resultSet.getInt("id"));
                employee.setName(resultSet.getString("name"));
                employee.setEmail(resultSet.getString("email"));
                employee.setWorkingDays(resultSet.getInt("working_days"));
                employee.setAbsentDays(resultSet.getInt("absent_days"));
                employee.setTotal_sales(resultSet.getInt("Total_sales"));
                employee.setPosition(resultSet.getString("position"));
                employees.add(employee);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            int employeeId = Integer.parseInt(request.getParameter("id"));
            Employee employee = getEmployeeProfileData(employeeId);
            request.setAttribute("employee", employee);
            request.getRequestDispatcher("employeeProfile.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace(); 
        }

    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            int employeeId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            int working_days= Integer.parseInt(request.getParameter("working_days"));
            int absent_days= Integer.parseInt(request.getParameter("absent_days"));
            int Total_sales= Integer.parseInt(request.getParameter("Total_sales"));
            String position = request.getParameter("position");
     
            boolean success = updateEmployeeProfile(employeeId, name, email,working_days,absent_days,Total_sales,position);

            if (success) {
                response.sendRedirect("EmployeeServlet?action=profile&id=" + employeeId);
            } else {
                
            }
        }
	}
	private boolean updateEmployeeProfile(int employeeId, String name, String email, int working_days, int absent_days, int total_Sales, String position) {
		// TODO Auto-generated method stub
		return false;
	}
}

