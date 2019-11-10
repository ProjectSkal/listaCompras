<%@page import="br.com.fatecpg.db.Manufacturer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fabricantes - JavaDB</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf"%>
        <h1>Fabricantes</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Cidade</th>
                <th>Estado</th>
                <th>E-mail</th>
            </tr>
            <% try { %>
                <% for (Manufacturer m: Manufacturer.getList()) { %>
                <tr>
                    <td><%= m.getId() %></td>
                    <td><%= m.getName() %></td>
                    <td><%= m.getCity() %></td>
                    <td><%= m.getState() %></td>
                    <td><%= m.getEmail() %></td>
                </tr>
                <% } %>
            <% } catch (Exception e) { %>
            <tr><td colspan="3"><%= e.getMessage() %></td></tr>
            <% } %>
        </table>
    </body>
</html>
