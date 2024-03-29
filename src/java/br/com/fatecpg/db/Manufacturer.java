package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Manufacturer {
    
    private int id;
    private String name;
    private String city;
    private String state;
    private String email;

    public static ArrayList<Manufacturer> getList() throws Exception {
        ArrayList<Manufacturer> list = new ArrayList<>();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String pass = "app";
        Connection con = DriverManager.getConnection(url, user, pass);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT MANUFACTURER_ID, NAME, CITY, STATE, EMAIL FROM MANUFACTURER");
        while (rs.next()) {
            Manufacturer m = new Manufacturer (
                    rs.getInt("MANUFACTURER_ID"),
                    rs.getString("NAME"),
                    rs.getString("CITY"),
                    rs.getString("STATE"),
                    rs.getString("EMAIL")
            );
            list.add(m);
        } 
        
        return list;
    }

    public Manufacturer(int id, String name, String city, String state, String email) {
        this.id = id;
        this.name = name;
        this.city = city;
        this.state = state;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    public static Manufacturer tragaFabricante(int codigo) throws Exception {
        for (Manufacturer m: Manufacturer.getList()) {
            if (m.getId() == codigo) {
                return m;
            }
        }
        return null;
    }    
}
