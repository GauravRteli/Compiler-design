<%-- 
    Document   : Register
    Created on : Jan 31, 2023, 8:24:53 AM
    Author     : User1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*,java.sql.*,java.io.*,javax.servlet.http.*,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <style>
            th{
                font-weight: bolder;
            }
            table{
                border: 1px solid grey;
            }
            body{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            th,td{
                padding: 10px 40px;
                border: 1px solid grey;
            }
        </style>
    </head>
    <body style="width: 80vh; margin: auto">
        <sql:setDataSource var="user" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/user" user="user1" password="user" />
        <sql:update dataSource="${user}" var="count">
            insert into user1.UNTITLED(id,name,email) values('${param.id}','${param.name}','${param.email}')
        </sql:update>
        <sql:query dataSource="${user}" var="row">
            select * from user1.UNTITLED
        </sql:query>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                </tr>
                <c:forEach items="${row.rows}" var="i">
                    <tr>
                        <td>${i.id}</td>
                        <td>${i.name}</td>
                        <td>${i.email}</td>
                    </tr>
                </c:forEach>
            </table>

    </body>
</html>
