<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp_employee.EmployeeDAO"%>
<%@ page import="com.jsp_employee.Employee"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee List</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
body{
background-color: #D9AFD9;
background-image: linear-gradient(0deg, #D9AFD9 0%, #97D9E1 100%);

}
header {
	box-shadow: 0 0.8rem 1rem rgba(0, 0, 0, 0.1);
}

.header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	padding: 1rem 4%;
	z-index: 1000;
	background: white;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 2rem;
}

.header h1 {
	font-size: 2rem;
	color: #FF3FA4;
	padding-left: 20rem;
}
.header i{
color:#2E0249;
}
.header a{
	margin-left: 8rem;
	font-size: 1rem;
	text-decoration: none;
	color: white;
	padding: 1rem;
	background: #4CAF50;
	border-radius: 2rem;
}

.header a:hover {
	background: #FF3FA4;
}

.fancy-table {
border-radius:2rem;
    margin-top:5rem;
    margin-left: 25rem;
	width: 50%;
	border-collapse: collapse;
	background-color: #f5f5f5;
	font-family: 'Poppins', sans-serif;
}

fancy-table th {
	background-color: #333;
	color: #fff;
	font-weight: bold;
	font-size: 3rem;
	margin-right: 2rem;
	border: 1px solid #ddd;
	padding-top: 1rem;
}

.fancy-table tr {
	background-color: #fff;
}

.fancy-table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.fancy-table td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: center;
}
</style>
</head>
<body>
	<header class="header">
		<h1><i class="fa-solid fa-list-check"></i> Employee Management System</h1>
		<a href="createprofile.jsp"> Create Profile</a>
	</header>
	<h1>Employee List</h1>
	<table class="fancy-table">
		<tr>
			<th>Employee ID</th>
			<th>Employee Name</th>
			<th>View Profile</th>
			<th>Delete Profile</th>
		</tr>
		<% 
            EmployeeDAO employeeDAO = new EmployeeDAO();
            List<Employee> employees = employeeDAO.getAllEmployees();
            for (Employee employee : employees) {
        %>
		<tr>
			<td><%= employee.getId() %></td>
			<td><%= employee.getName() %></td>
			<td><a href="employeeProfile.jsp?id=<%= employee.getId() %>">View
					Profile</a></td>
			<td><a href="deleteprofile.jsp?id=<%= employee.getId() %>">Delete</a></td>
		</tr>
		<% } %>
	</table>
</body>
</html>
