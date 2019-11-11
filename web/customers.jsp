<%@page import="br.com.fatecpg.db.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/base.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Hind+Madurai&display=swap" rel="stylesheet">
        <title></title>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/navbar.jspf"%>
        </div>
        <div class="container">
            <p class="p1">Clientes</p>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>E-mail</th>
                        <th>Detalhes</th>
                    </tr>
                </thead>
                <% try { %>
                <% for (Customer c : Customer.getList()) {%>
                <tbody>
                    <tr>
                        <td class="td-center"><%= c.getId()%></td>
                        <td><%= c.getName()%></td>
                        <td><%= c.getEmail()%></td>
                        <td class="td-center"><a style="color: white; text-decoration: none" href="<%= "listaCompras.jsp?cliente=" + c.getId()%>">Compras</a></td>
                    </tr>
                </tbody>
                <% } %>
                <% } catch (Exception e) {%>
                <tr><td colspan="3"><%= e.getMessage()%></td></tr>
                    <% }%>
            </table>
        </div>
        <script src="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>