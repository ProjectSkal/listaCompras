<%-- 
    Document   : listaCompras
    Created on : 10/11/2019, 19:40:03
    Author     : luizv
--%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="br.com.fatecpg.db.Compras"%>
<%@page import="br.com.fatecpg.db.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/base.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/fontawesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Hind+Madurai&display=swap" rel="stylesheet">
        <title>Lista de Compras</title>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/navbar.jspf"%>
        </div>
        <div class="container">
            <% int cod = Integer.parseInt(request.getParameter("cliente"));%>
            <% Customer cliente = Customer.getList().get(cod);%>
            <% NumberFormat valor = NumberFormat.getCurrencyInstance(); %>
            <p class="p1">Cliente</p>
            <p class="p2"><%= cliente.getName()%></p>
            <table >
                <thead>
                    <tr>
                        <th class="th-padding">ID</th>
                        <th class="th-padding">Produto</th>
                        <th class="th-padding">Valor Unt</th>
                        <th class="th-padding">Quantidade</th>
                        <th class="th-padding">Total</th>
                        <th class="th-padding">Loja</th>
                    </tr>
                </thead>
                <% try { %>
                <% for (Compras c : Compras.getListCompras(cod)) {%>
                <tbody>
                    <tr>
                        <td><%= c.getCodigoCompra()%></td>
                        <td><%= c.getNomeProduto()%></td>
                        <td><%= c.getValor()%></td>
                        <td><%= c.getQuantidade()%></td>
                        <td><%= valor.format(c.getQuantidade() * c.getValor())%></td>
                        <td><%= c.getLoja()%></td>
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