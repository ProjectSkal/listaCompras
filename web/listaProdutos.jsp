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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% int cod = Integer.parseInt(request.getParameter("fabricante"));%>
        <% Manufacturer fabricante = Manufacturer.tragaFabricante(cod);%>
        <h1>Cliente: <%= fabricante.getName() %></h1>
        
        <table border="1">
            <tr>
                <td>#</td>
                <td>Produto</td>
                <td>Valor Unt</td>
            </tr>
            <% try { %>
                <% for (Producao c: Producao.getListProdutos(cod)) { %>
                <tr>
                    <td><%= c.getCodigoProduto() %></td>
                    <td><%= c.getNomeProduto() %></td>
                    <td><%= c.getValor() %></td>
                </tr>
                <% } %>
            <% } catch (Exception e) { %>
            <tr><td colspan="3"><%= e.getMessage() %></td></tr>
            <% } %>
            
        </table>
    </body>
</html>
