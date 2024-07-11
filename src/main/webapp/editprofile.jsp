<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp_employee.EmployeeDAO"%>
<%@ page import="com.jsp_employee.Employee"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Employee Profile</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
	<h1>Edit Employee Profile</h1>
	<%
        String employeeId = request.getParameter("id");
        if (employeeId != null) {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            Employee employee = employeeDAO.getEmployeeById(Integer.parseInt(employeeId));
    %>
	<div class="container">
		<div class="form-container">
			<form action="updateprofile.jsp" method="POST">
				<input type="hidden" name="id" value="<%=employee.getId()%>">
				<label for="name">Name:</label> 
				<input type="text" name="name" value="<%=employee.getName()%>"><br>
				<label for="email">Email:</label> 
				<input type="email" name="email" value="<%=employee.getEmail()%>"><br>
				<label for="position">Position:</label> 
				<input type="text" name="position" value="<%=employee.getPosition()%>"><br>
				<label for="working_days">Working_days:</label> 
				<input type="text" name="working_days" value="<%=employee.getWorkingDays()%>"><br>
				<label for="absent_days">Absent_days:</label> 
				<input type="text" name="absent_days" value="<%=employee.getAbsentDays()%>"><br>
				<label for="Total_sales">Total_sales:</label> 
				<input type="text" name="Total_sales" value="<%=employee.getTotal_sales()%>"><br>
				<input type="submit" value="Save Changes">
			</form>
		</div>
		<div class="image-container">
			<img src="menvector.png" alt="Employee Image">
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
