package com.demo.repository;

import com.demo.config.MysqlConnection;
import com.demo.model.Child;


import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ChildRepository {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public List<Child> getAllChild(){
        List<Child> list = new ArrayList<>();
        String query = "select * from child;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                list.add(new Child(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getInt(4),
                        resultSet.getDate(5).toLocalDate(),
                        resultSet.getObject(6, LocalDateTime.class),
                        resultSet.getObject(7, LocalDateTime.class)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public int createChild(String first_name, String last_name, int gender, Date birth_date, LocalDateTime created_date, LocalDateTime modified_date){
        String query = "insert into child(first_name, last_name, gender, birth_date, created_date, modified_date) "+
                        "values (?,?,?,?,?,?);";
        int child_id = 0;

        // Tạo PreparedStatement và yêu cầu lấy khóa tự động sinh
        //Statement.RETURN_GENERATED_KEYS


        try{
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, first_name);
            preparedStatement.setString(2, last_name);
            preparedStatement.setInt(3, gender);
            preparedStatement.setDate(4, birth_date);
            preparedStatement.setTimestamp(5, Timestamp.valueOf(created_date));
            preparedStatement.setTimestamp(6, Timestamp.valueOf(modified_date));
            // preparedStatement.executeUpdate(); // tra ve so nguyen

            // execute query and return a number
            int affectedRows = preparedStatement.executeUpdate();

            // Kiểm tra nếu có hàng nào được thêm vào
            if (affectedRows > 0) {
                // Lấy khóa tự động sinh ra (ID)
                ResultSet rs = preparedStatement.getGeneratedKeys();
                if (rs.next()) {
                    child_id = rs.getInt(1);
                    //System.out.println("ID vừa được tạo là: " + generatedId);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return child_id;
    }

    public void deleteChild(int id){
        String query = "delete from child where id = ?;";
//        int child_id = id;

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
//        return child_id;
    }

    public Child getChildById (int id) {
        String query = "select * from child where id = ?;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Child(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getInt(4),
                        resultSet.getDate(5).toLocalDate(),
                        resultSet.getObject(6,LocalDateTime.class),
                        resultSet.getObject(7, LocalDateTime.class));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void updateChild(String first_name, String last_name, int gender, Date birth_date, LocalDateTime modified_date, int id){
        String query = "update child " +
                "set first_name = ?, last_name = ?, gender = ?, birth_date = ?, modified_date = ?" +
                " where id = ?;";
        try{
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,first_name);
            preparedStatement.setString(2,last_name);
            preparedStatement.setInt(3,gender);
            preparedStatement.setDate(4, birth_date);
            preparedStatement.setTimestamp(5, Timestamp.valueOf(modified_date));
            preparedStatement.setInt(6,id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//    public static void main(String[] args) {
//        List<Child> list = new ChildRepository().getAllChild();
//        for (Child c: list){
//            System.out.println(c);
//        }
//    }
}
