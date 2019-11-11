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
public class Producao {
    private int codigoProduto;
    private String nomeProduto;
    private float valor;
    
    public static ArrayList<Producao> getListProdutos(int cod) throws Exception {
        ArrayList<Producao> list = new ArrayList<>();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String pass = "app";
        Connection con = DriverManager.getConnection(url, user, pass);
        Statement stmt = con.createStatement();
        String query = "SELECT\n" +
        "    produto.PRODUCT_ID codigo_produto,\n" +
        "    produto.DESCRIPTION nome_produto,\n" +
        "    produto.PURCHASE_COST valor\n" +
        "FROM\n" +
        "    MANUFACTURER fabricante\n" +
        "INNER JOIN\n" +
        "    PRODUCT produto ON fabricante.MANUFACTURER_ID = produto.MANUFACTURER_ID\n" +
        "WHERE\n" +
        "    fabricante.MANUFACTURER_ID = " + cod;        
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            Producao comp = new Producao (
                    rs.getInt("codigo_produto"),                    
                    rs.getString("nome_produto"),
                    rs.getFloat("valor")                  
            );
            list.add(comp);
        }
        
        return list;
    }

    public Producao(int codigoProduto, String nomeProduto, float valor) {
        this.codigoProduto = codigoProduto;
        this.nomeProduto = nomeProduto;
        this.valor = valor;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public int getCodigoProduto() {
        return codigoProduto;
    }

    public void setCodigoProduto(int codigoProduto) {
        this.codigoProduto = codigoProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }
    
    
}
