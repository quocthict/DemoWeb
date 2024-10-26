package com.demo.repository;

import com.demo.config.MysqlConnection;
import com.demo.model.Contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContactsRepository {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    // using for thymeleaf
    private List<Contact> contacts = new ArrayList<>();
    private int currentId = 1;

    public List<Contact> findAll() {
        return contacts;
    }
    //


    public List<Contact> getAllContact() {
        List<Contact> list = new ArrayList<>();
        String query = "select * from contact;";

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                list.add(new Contact(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public void createContact(String first_name, String last_name, String relationship){
        String query = "insert into contact(first_name, last_name, relationship) values (?,?,?);";
        try{
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, first_name);
            preparedStatement.setString(2, last_name);
            preparedStatement.setString(3, relationship);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteContact(Integer id){
        String query = "delete from contact where id = ?;";
        try{
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Contact getContactById(int id){
        String query = "select * from contact where id = ?;";
        try{
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return new Contact(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void updateContact(String first_name, String last_name, String relationship, int id){
        String query = "update contact set first_name = ?, last_name = ?, relationship = ? where id = ?;";
        try{
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,first_name);
            preparedStatement.setString(2,last_name);
            preparedStatement.setString(3,relationship);
            preparedStatement.setInt(4,id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }



}
