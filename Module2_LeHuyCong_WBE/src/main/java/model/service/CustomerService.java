package model.service;

import model.bean.ConnectDB;
import model.bean.Customer;

import java.sql.*;
import java.util.ArrayList;

public class CustomerService extends ConnectDB {
    private final String sqlFindAll = "SELECT * FROM furama_servlet.customer";
    Connection connection;
    Statement statement;
    ResultSet result;
    PreparedStatement preparedStatement;
    public ArrayList<Customer>  getCustomer() throws SQLException, ClassNotFoundException {

        connection = getMyConnect();

        statement = connection.createStatement();
        result = statement.executeQuery(sqlFindAll);

        ArrayList<Customer> list = new ArrayList<>();

        while (result.next()){
            int customerId = result.getInt("customer_id");
            String customerName = result.getString("customer_name");
            Date customerBirthday = result.getDate("customer_brithday");
            int customerGender = result.getInt("customer_gender");
            String customerIdCard = result.getString("customer_id_card");
            String customerPhone =result.getString("customer_phone");
            String customerEmail = result.getString("customer_email");
            String customerAddress = result.getString("customer_address");

            Customer customer = new Customer(customerId, customerName, customerBirthday, customerGender, customerIdCard, customerPhone, customerEmail, customerAddress);

            list.add(customer);
        }

        return list;

    }

    public void deleteCustomer(String id){
        String query = "delete from customer where customer_id = ?";
        try {
            connection = getMyConnect();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
        }
        catch (Exception e){

        }
    }

    public void insertCustomer(String customerName, String customerBirthday, int customerGender, String customerIdCard, String customerPhone, String customerEmail, String customerAddress){
        String query = "insert into customer(`customer_name`, `customer_brithday`, `customer_gender`, `customer_id_card`, `customer_phone`, `customer_email`, `customer_address`) value (?,?,?,?,?,?,?)";
        try{
            connection = getMyConnect();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, customerName);
            preparedStatement.setString(2, customerBirthday);
            preparedStatement.setInt(3, customerGender);
            preparedStatement.setString(4, customerIdCard);
            preparedStatement.setString(5, customerPhone);
            preparedStatement.setString(6, customerEmail);
            preparedStatement.setString(7, customerAddress);
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    public Customer getCustomerById(String id){
        String query = "SELECT * FROM furama_servlet.customer where customer_id = ?";
        try {
            connection = getMyConnect();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            result = preparedStatement.executeQuery();
            while (result.next()){
                return new Customer(result.getInt("customer_id"),
                                    result.getString("customer_name"),
                                    result.getDate("customer_brithday"),
                                    result.getInt("customer_gender"),
                                    result.getString("customer_id_card"),
                                    result.getString("customer_phone"),
                                    result.getString("customer_email"),
                                    result.getString("customer_address"));
            }

        }catch (Exception e){
        }
        return null;
    }

    public void updateCustomer(String id, String customerName, String customerBirthday, int customerGender, String customerIdCard, String customerPhone, String customerEmail, String customerAddress ){

        String query =
                "UPDATE `furama_servlet`.`customer` \n" +
                "SET `customer_name` = ?, `customer_brithday` = ?, `customer_gender` = ?, `customer_id_card` = ?, `customer_phone` = ?, `customer_email` = ?, `customer_address` = ? " +
                "WHERE `customer_id` = ?";
        try {
            connection = getMyConnect();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, customerName);
            preparedStatement.setString(2, customerBirthday);
            preparedStatement.setInt(3, customerGender);
            preparedStatement.setString(4, customerIdCard);
            preparedStatement.setString(5, customerPhone);
            preparedStatement.setString(6, customerEmail);
            preparedStatement.setString(7, customerAddress);
            preparedStatement.setString(8, id);
            preparedStatement.executeUpdate();
        }catch (Exception e){

        }


    }



}
