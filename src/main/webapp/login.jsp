<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="container">
        <div class="form-wrapper">
            <h3>Admin Login</h3>
            <div class="logo">
                <img src="menvector.png" alt="Logo">
            </div>
            <center>
                <form action="LoginAction.jsp" method="post">
                    <div class="input-container">
                        <label for="username">Username</label>
                        <center><input type="text" id="username" name="username" required></center>
                    </div>
                    <div class="input-container">
                        <label for="password">Password</label>
                        <center><input type="password" id="password" name="password" required></center>
                    </div>
                    <button type="submit">Login</button>
                </form>
            </center>
        </div>
    </div>
</body>
</html>
