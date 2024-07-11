<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.jsp_employee.LoginDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (LoginDAO.validateUser(username, password)) {
            response.sendRedirect("employeeList.jsp");
        } else {
            out.println("Invalid username or password. Please try again.");
        }
    %>
</body>
</html>
