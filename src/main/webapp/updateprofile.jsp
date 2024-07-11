<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp_employee.EmployeeDAO"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Employee Profile</title>
</head>
<body>
	<%
        String employeeId = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String position = request.getParameter("position");
        String workingdays = request.getParameter("working_days");
        String absentdays = request.getParameter("absent_days");
        String Totalsales = request.getParameter("Total_sales");

        if (employeeId != null) {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            int id = Integer.parseInt(employeeId);
            int working_days=Integer.parseInt(workingdays);
            int absent_days=Integer.parseInt(absentdays);
            int Total_sales=Integer.parseInt(Totalsales);
            boolean success = employeeDAO.updateEmployee(id,name,email,working_days,absent_days,Total_sales,position);
            if (success) {
                out.println("Profile updated successfully!"); 
                %>
	                <a href="employeeProfile.jsp?id=<%= id %>">View Updated Profile</a>
	                <a href="employeeList.jsp">View EmployeeList</a>
	            <%

            } else {
                out.println("Failed to update profile.");
            }
        } else {
            out.println("Invalid Employee ID.");
        }
    %>
</body>
</html>
