package model.bean;

import java.sql.*;

public class ConnectDB {
    public static void main(String[] arg) throws SQLException {
        Connection connection = getMyConnect();
        if (connection != null){
            System.out.println("Thanh Cong");
        }
        else {
            System.out.println("that bai");
        }
    }

    public static Connection getMyConnect() throws SQLException {
        String dbUrl = "jdbc:mysql://localhost:3306/furama_servlet";
        String userName = "root";
        String password = "Mung5@thang10";
        Connection connection = DriverManager.getConnection(dbUrl, userName, password);
        return connection;
    }

}

