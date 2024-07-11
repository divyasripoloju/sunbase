<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.jsp_employee.EmployeeDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Save Employee Profile</title>
</head>
<body>
    <%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String workingDays = request.getParameter("workingDays");
    String absentDays = request.getParameter("absentDays");
    String totalSales = request.getParameter("totalSales");
    String position = request.getParameter("position");

        EmployeeDAO employeeDAO = new EmployeeDAO();

        if (id != null && !id.isEmpty() &&
        		workingDays != null && !workingDays.isEmpty() &&
            absentDays != null && !absentDays.isEmpty() &&
            totalSales != null && !totalSales.isEmpty()) {
            
            boolean success = employeeDAO.createEmployee(id, name, email, workingDays, absentDays, totalSales, position);
            if (success) {
                out.println("Profile created successfully! <a href='employeeList.jsp'>Back to Employee List</a>");
            } else {
                out.println("Failed to create profile.");
            }
        } else {
            out.println("Invalid data provided. Please ensure all required fields are filled.");
        }
    %>
</body>
</html>
