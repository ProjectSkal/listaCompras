/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author luizv
 */
public class Compras {
    private String codigoProduto;
    private String nomeProduto;
    private float valor;
    private int codigoCompra;
    private int quantidade;
    private String loja;
    
    public static ArrayList<Compras> getListCompras(int cod) throws Exception {
        ArrayList<Compras> list = new ArrayList<>();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String pass = "app";
        Connection con = DriverManager.getConnection(url, user, pass);
        Statement stmt = con.createStatement();
        String query = "SELECT \n" +
        "    produto.PRODUCT_CODE codigo_produto,\n" +
        "    produto.DESCRIPTION nome_produto,\n" +
        "    produto.PURCHASE_COST valor,\n" +
        "    compra.ORDER_NUM codigo_compra,\n" +
        "    compra.QUANTITY quantidade,\n" +
        "    compra.FREIGHT_COMPANY loja\n" +
        "FROM \n" +
        "    CUSTOMER cliente\n" +
        "INNER JOIN\n" +
        "    PURCHASE_ORDER compra ON cliente.CUSTOMER_ID = compra.CUSTOMER_ID\n" +
        "INNER JOIN\n" +
        "    PRODUCT produto ON compra.PRODUCT_ID = produto.PRODUCT_ID\n" +
        "WHERE\n" +
        "    compra.CUSTOMER_ID = " + cod;        
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            Compras comp = new Compras (
                    rs.getString("codigo_produto"),
                    rs.getString("nome_produto"),
                    rs.getFloat("valor"),
                    rs.getInt("codigo_compra"),
                    rs.getInt("quantidade"),
                    rs.getString("loja")                    
            );
            list.add(comp);
        }
        
        return list;
    }

    public Compras(String codigoProduto, String nomeProduto, float valor, int codigoCompra, int quantidade, String loja) {
        this.codigoProduto = codigoProduto;
        this.nomeProduto = nomeProduto;
        this.valor = valor;
        this.codigoCompra = codigoCompra;
        this.quantidade = quantidade;
        this.loja = loja;
    }

    public String getCodigoProduto() {
        return codigoProduto;
    }

    public void setCodigoProduto(String codigoProduto) {
        this.codigoProduto = codigoProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public String getLoja() {
        return loja;
    }

    public void setLoja(String loja) {
        this.loja = loja;
    }
    
}
