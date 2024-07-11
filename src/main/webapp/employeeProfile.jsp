<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.jsp_employee.EmployeeDAO" %>
<%@ page import="com.jsp_employee.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Profile</title>
<link rel="stylesheet" href="style.css">
<style>
body{
background-color: #8BC6EC;
background-image: linear-gradient(135deg, #8BC6EC 0%, #9599E2 100%);
height: 100vh;
}
</style>
</head>
<body>
<%
        String employeeId = request.getParameter("id");
        if (employeeId != null) {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            Employee employee = employeeDAO.getEmployeeById(Integer.parseInt(employeeId));
    %>
	<div class="container">
        <div class="content">
            <h1>Employee Profile</h1>
            <h2>Dashboard</h2>
            <p>Employee ID: <span><%=employee.getId()%></span></p>
            <p>Name:  <span><%= employee.getName() %></span></p>
            <p>Email:  <span><%= employee.getEmail() %></span></p>
            <p>Position:  <span><%= employee.getPosition() %></span></p>
            <p>Working Days:  <span><%= employee.getWorkingDays() %></span></p>
            <p>Absent Days:  <span><%= employee.getAbsentDays() %></span></p>
            <h3>Total sales:  <span><%= employee.getTotal_sales() %></span></h3>
            <div class="alinks">
                <a href="editprofile.jsp?id=<%= request.getParameter("id") %>">Edit Profile >></a>
                <a href="employeeList.jsp"><< Employee List</a>
            </div>
        </div>
        <div class="image">
            <img src="registration.png" alt="Registration Image" class="registration-image">
        </div>
    </div>
    <%
        } else {
            // Handle the case when no employee ID is provided.
            out.println("Invalid Employee ID.");
        }
    %>
</body>
</html>

