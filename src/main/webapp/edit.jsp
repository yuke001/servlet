<%@page import="servlet_crud.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee Record</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        color: #333;
    }

    h1 {
        color: #2c3e50;
        margin-top: 40px;
        text-align: center;
    }

    .container {
        width: 60%;
        margin: 0 auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin-bottom: 8px;
        font-size: 16px;
        color: #34495e;
    }

    input {
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 16px;
    }

    input[type="number"], input[type="text"], input[type="email"] {
        width: 100%;
        box-sizing: border-box;
    }

    button {
        padding: 12px 20px;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover {
        background-color: #2980b9;
    }

    .back-button {
        text-align: center;
        margin-top: 20px;
    }

    .back-button a {
        text-decoration: none;
        color: #3498db;
        font-size: 16px;
    }

    .back-button a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<%
Employee emp = (Employee) request.getAttribute("emp");
%>

<div class="container">
    <h1>Edit Employee Record</h1>
    <form action="update" method="post">
        <input type="text" name="id" value="<%= emp.getId() %>" hidden>
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= emp.getName() %>" >
        
        <label for="mobile">Mobile:</label>
        <input type="number" name="mobile" value="<%= emp.getMobile() %>" >
        
        <label for="email">Email:</label>
        <input type="email" name="email" value="<%= emp.getEmail() %>" >
        
        <label for="salary">Salary:</label>
        <input type="number" name="salary" value="<%= emp.getSalary() %>" >
        
        <button type="submit">Update</button>
    </form>

    <div class="back-button">
        <a href="fetch">Back to Records</a>
    </div>
</div>

</body>
</html>
