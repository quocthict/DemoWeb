package com.demo.repository;

import com.demo.config.MysqlConnection;
import com.demo.model.ContactChild;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ContactChildRepository {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public List<ContactChild> getAllContactChild() {
        List<ContactChild> list = new ArrayList<>();
        String query = "select * from contact_child;";

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(new ContactChild(resultSet.getInt(1),
                        resultSet.getInt(2),
                        resultSet.getInt(3),
                        resultSet.getObject(4, LocalDateTime.class),
                        resultSet.getObject(5, LocalDateTime.class)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public void createContactChild(int contact_id, int child_id, LocalDateTime created_date, LocalDateTime modified_date){
        String query = "insert into contact_child(contact_id, child_id, created_date, modified_date) values (?,?,?,?);";
        try{
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, contact_id);
            preparedStatement.setInt(2, child_id);
            preparedStatement.setTimestamp(3, Timestamp.valueOf(created_date));
            preparedStatement.setTimestamp(4, Timestamp.valueOf(modified_date));
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteContactChildByChildID (int child_id) {
        String query = "delete from contact_child where child_id = ?;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, child_id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}

