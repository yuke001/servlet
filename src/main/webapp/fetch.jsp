<%@page import="servlet_crud.Employee"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta charset="UTF-8">
<title>Fetch</title>
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

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px 20px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #3498db;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ecf0f1;
    }

    button {
        padding: 8px 15px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn-delete {
        background-color: #e74c3c;
        color: white;
    }

    .btn-edit {
        background-color: #2ecc71;
        color: white;
    }

    button:hover {
        opacity: 0.8;
    }
    

</style>
</head>
<body>

<div align="center">
    <h1>Employee Records</h1>

    <%
    List<Employee> records = (List<Employee>) request.getAttribute("records");
    %>

    <table>
        <tr>
            <th>Name</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Salary</th>
            <th>Delete</th>
            <th>Edit</th>
        </tr>

        <%
        for (Employee record : records) {
        %>
        <tr>
            <td><%= record.getName() %></td>
            <td><%= record.getMobile() %></td>
            <td><%= record.getEmail() %></td>
            <td><%= record.getSalary() %></td>
            
            
            
           <td> <a href="delete?id=<%=record.getId()%>"><button class="btn-delete">Delete</button></a></td>
            
            
            <td><a href="edit?id=<%= record.getId() %>"><button class="btn-edit">Edit</button></a></td>
        </tr>
        <%
        }
        %>
    </table>
    
     <a href="index.html">
        <button class="back-home-button">Back to Home</button>
    </a>
</div>

</body>
</html>
