package model.bean;

import model.service.CustomerService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ConnectDB {
    public static void main(String[] arg) throws SQLException, ClassNotFoundException {
//        Connection connection = getMyConnect();
//        if (connection != null){
//            System.out.println("Thanh Cong");
//            CustomerService customerService = new CustomerService();
//            List<Customer> customerList = customerService.getCustomer();
//            System.out.println(customerList.toString());
//        }
//        else {
//            System.out.println("that bai");
//        }
        CustomerService service = new CustomerService();
        Customer customer = service.getCustomerById("11");
        System.out.println(customer);


    }

    public static Connection getMyConnect() throws SQLException, ClassNotFoundException {
        String dbUrl = "jdbc:mysql://localhost:3306/furama_servlet";
        String userName = "root";
        String password = "Mung5@thang10";
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbUrl, userName, password);

        return connection;
    }

}

