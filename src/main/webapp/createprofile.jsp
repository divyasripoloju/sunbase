<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.jsp_employee.EmployeeDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Employee Profile</title>
    <link rel="stylesheet" href="createprofile.css">
</head>
<body>
     <h1>Create Employee Profile</h1>
    <form action="saveprofile.jsp" method="POST">
        <label for="id">ID:</label>
        <input type="text" name="id"><br>
        <label for="name">Name:</label>
        <input type="text" name="name"><br>
        <label for="email">Email:</label>
        <input type="email" name="email"><br>
        <label for="workingDays">Working Days:</label>
        <input type="text" name="workingDays"><br>
        <label for="absentDays">Absent Days:</label>
        <input type="text" name="absentDays"><br>
        <label for="totalSales">Total Sales:</label>
        <input type="text" name="totalSales"><br>
        <label for="position">Position:</label>
        <input type="text" name="position"><br>
        <input type="submit" value="Create Profile">
    </form>
</body>
</html>
