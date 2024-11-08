package com.demo.repository;

import com.demo.config.MysqlConnection;
import com.demo.model.ChildApi;
import com.demo.model.ContactApi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContactRepositoryApi {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<ContactApi> getAllContactApi() {
        List<ContactApi> list = new ArrayList<>();
        String query = "select * from contact;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                ContactApi contact = new ContactApi();
                contact.setId(resultSet.getInt("id"));
                contact.setFirstName(resultSet.getString("first_name"));
                contact.setLastName(resultSet.getString("last_name"));
                contact.setRelationship(resultSet.getString("relationship"));
                list.add(contact);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    // Get the list of children by contactId
    public List<ChildApi> getChildrenByContactApi(int id) {
        List<ChildApi> list = new ArrayList<>();
        String query = "select \n" +
                "\tcon.id as contactId, \n" +
                "    con.first_name as contactFirstName, \n" +
                "    con.last_name as contactLastName, \n" +
                "    con.relationship,   \n" +
                "    conchi.child_id as childId, \n" +
                "    chi.first_name as childFirstName,\n" +
                "    chi.last_name as childLastName,\n" +
                "    chi.gender,\n" +
                "    chi.birth_date as birthday    \n" +
                "from contact con join contact_child conchi on con.id = conchi.contact_id\n" +
                "\tleft join child chi on chi.id = conchi.child_id    \t\n" +
                "where con.id = ?;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                ChildApi object = new ChildApi();

                object.setId(resultSet.getInt("childId"));
                object.setFirstName(resultSet.getString("childFirstName"));
                object.setLastName(resultSet.getString("childLastName"));
                object.setGender(resultSet.getBoolean("gender"));
                object.setBirthday(resultSet.getDate("birthday"));

                list.add(object);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    // Get a contact by contactId
    public ContactApi getContactByIdApi (int id){
        ContactApi returnObject = new ContactApi();
        String query = "select * from contact where id = ?;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                returnObject.setId(resultSet.getInt("id"));
                returnObject.setFirstName(resultSet.getString("first_name"));
                returnObject.setLastName(resultSet.getString("last_name"));
                returnObject.setRelationship(resultSet.getString("relationship"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return returnObject;
    }


    public void deleteContactByIdApi(Integer id){
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


}
