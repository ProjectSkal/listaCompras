<%-- 
    Document   : listaCompras
    Created on : 10/11/2019, 19:40:03
    Author     : luizv
--%>
<%@page import="br.com.fatecpg.db.Compras"%>
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
            <% int cod = Integer.parseInt(request.getParameter("cliente"));%>
            <% Customer cliente = Customer.getList().get(cod);%>
            <p class="p1">Cliente</p>
            <p class="p2"><%= cliente.getName()%></p>
            <table >
                <thead>
                    <tr>
                        <th class="th-padding">Compra</th>
                        <th class="th-padding">Produto</th>
                        <th class="th-padding">Valor Unt</th>
                        <th class="th-padding">Quantidade</th>
                        <th class="th-padding">Total</th>
                        <th class="th-padding">Data</th>
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
                        <td><%= c.getValor()%></td>
                        <td><%= c.getQuantidade()%></td>
                        <td><%= c.getData()%></td>
                        <td><%= c.getLoja()%></td>
                    </tr>
                </tbody>
                <% } %>
                <% } catch (Exception e) {%>
                <tr><td colspan="3"><%= e.getMessage()%></td></tr>
                    <% }%>
            </table>
        </div>
    </body>
</html>