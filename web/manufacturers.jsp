<%@page import="br.com.fatecpg.db.Manufacturer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/base.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/fontawesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Hind+Madurai&display=swap" rel="stylesheet">
        <title>Fabricantes</title>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/navbar.jspf"%>
        </div>
        <div class="container">
            <p class="p1">Fabricantes</p>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Cidade</th>
                        <th>Estado</th>
                        <th>E-mail</th>
                        <th>Detalhes</th>
                    </tr>
                </thead>
                <% try { %>
                <% for (Manufacturer m : Manufacturer.getList()) {%>
                <tbody>
                    <tr>
                        <td class="td-center"><%= m.getId()%></td>
                        <td><%= m.getName()%></td>
                        <td><%= m.getCity()%></td>
                        <td><%= m.getState()%></td>
                        <td><%= m.getEmail()%></td>                    
                        <td class="td-center"><a class="a" href="<%= "listaProdutos.jsp?fabricante=" + m.getId()%>">Produtos</a></td>
                    </tr>
                </tbody>
                <% } %>
                <% } catch (Exception e) {%>
                <tr><td colspan="3"><%= e.getMessage()%></td></tr>
                    <% }%>
            </table>
        </div>
   
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>
