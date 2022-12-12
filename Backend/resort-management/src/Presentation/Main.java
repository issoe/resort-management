package Presentation;

import DataAccess.ConfigConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) throws SQLException {
        ConfigConnection configcc = new ConfigConnection();
        Connection conn = configcc.getCon();
        if (conn == null){
            System.out.println("Connection to database fail");
        } else {
            System.out.println("Connected database successfully...");
            Statement stm = conn.createStatement();
        }
    }
}