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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf"%>
        <% int cod = Integer.parseInt(request.getParameter("cliente"));%>
        <% Customer cliente = Customer.getList().get(cod);%>
        <h1>Cliente: <%= cliente.getName() %></h1>
        
        <table border="1">
            <tr>
                <td>Compra</td>
                <td>Produto</td>
                <td>Valor Unt</td>
                <td>Quantidade</td>
                <td>Total</td>
                <td>Data</td>
                <td>Loja</td>
            </tr>
            <% try { %>
                <% for (Compras c: Compras.getListCompras(cod)) { %>
                <tr>
                    <td><%= c.getCodigoCompra() %></td>
                    <td><%= c.getNomeProduto() %></td>
                    <td><%= c.getValor() %></td>
                    <td><%= c.getValor() %></td>
                    <td><%= c.getQuantidade() %></td>
                    <td><%= c.getData() %></td>
                    <td><%= c.getLoja() %></td>
                </tr>
                <% } %>
            <% } catch (Exception e) { %>
            <tr><td colspan="3"><%= e.getMessage() %></td></tr>
            <% } %>
            
        </table>
        
        
    </body>
</html>
