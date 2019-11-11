<%-- 
    Document   : listaFabricantes
    Created on : 10/11/2019, 22:53:07
    Author     : luizv
--%>
<%@page import="br.com.fatecpg.db.Manufacturer"%>
<%@page import="br.com.fatecpg.db.Producao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/base.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/fontawesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Hind+Madurai&display=swap" rel="stylesheet">
        <title>Lista de Produtos</title>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/navbar.jspf"%>
        </div>
        <div class="container">
            <%if (request.getParameter("fabricante") != null) {%>
            <% int cod = Integer.parseInt(request.getParameter("fabricante"));%>
            <% Manufacturer fabricante = Manufacturer.tragaFabricante(cod);%>
            <p class="p1">Fabricante</p>
            <p class="p2"><%= fabricante.getName()%></p>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Produto</th>
                        <th>Valor Unt</th>
                    </tr>
                </thead>
                <% try { %>
                <% for (Producao c : Producao.getListProdutos(cod)) {%>
                <tbody>
                    <tr>
                        <td><%= c.getCodigoProduto()%></td>
                        <td><%= c.getNomeProduto()%></td>
                        <td><%= c.getValor()%></td>
                    </tr>
                </tbody>
                <% } %>
                <% } catch (Exception e) {%>
                <tr><td colspan="3"><%= e.getMessage()%></td></tr>
                    <% } %>
            </table>
            <% } else {%>
            Fabricante não encontrado
            <%}%>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>
