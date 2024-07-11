<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.jsp_employee.EmployeeDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee Profile</title>
</head>
<body>
    <%
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            boolean success = employeeDAO.deleteEmployee(Integer.parseInt(id));
            if (success) {
                out.println("Profile deleted successfully! <a href='employeeList.jsp'>Back to Employee List</a>");
            } else {
                out.println("Failed to delete profile.");
            }
        } else {
            out.println("Invalid ID. Please provide a valid ID.");
        }
    %>
</body>
</html>
