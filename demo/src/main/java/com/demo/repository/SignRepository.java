package com.demo.repository;

import com.demo.config.MysqlConnection;
import com.demo.model.Booking;
import com.demo.model.Sign;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class SignRepository {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public List<Sign> getAllSigns () {
        List<Sign> list = new ArrayList<>();
        String query = "select * from sign;";

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(new Sign(resultSet.getInt(1),
                        resultSet.getInt(2),
                        resultSet.getInt(3),
                        resultSet.getInt(4),
                        resultSet.getTime(5).toLocalTime(),
                        resultSet.getString(6),
                        resultSet.getObject(7, LocalDateTime.class),
                        resultSet.getObject(8, LocalDateTime.class)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public void createSign(int booking_id, int contact_id, int type, Time sign_time, String signature, LocalDateTime created_date, LocalDateTime modified_date) {
        String query = "insert into sign(booking_id, contact_id, type, sign_time, signature, created_date, modified_date)" +
                "values (?,?,?,?,?,?,?);";

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,booking_id);
            preparedStatement.setInt(2,contact_id);
            preparedStatement.setInt(3, type);
            preparedStatement.setTime(4,sign_time);
            preparedStatement.setString(5,signature);
            preparedStatement.setTimestamp(6, Timestamp.valueOf(created_date));
            preparedStatement.setTimestamp(7, Timestamp.valueOf(modified_date));

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteSign(int id) {
        String query = "delete from sign where id = ?;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Sign getSignByID (int id) {
        String query = "select * from sign where id = ?;";

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Sign(resultSet.getInt(1),
                        resultSet.getInt(2),
                        resultSet.getInt(3),
                        resultSet.getInt(4),
                        resultSet.getTime(5).toLocalTime(),
                        resultSet.getString(6),
                        resultSet.getObject(7, LocalDateTime.class),
                        resultSet.getObject(8, LocalDateTime.class));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void updateSign (int booking_id, int contact_id, int type, Time sign_time, String signature, LocalDateTime modified_date, int id) {
        String query = "update `sign`" +
                "set booking_id = ?, contact_id = ?, type = ?, sign_time = ?, signature = ?, modified_date = ?" +
                "where id = ?;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,booking_id);
            preparedStatement.setInt(2,contact_id);
            preparedStatement.setInt(3, type);
            preparedStatement.setTime(4,sign_time);
            preparedStatement.setString(5,signature);
            preparedStatement.setTimestamp(6, Timestamp.valueOf(modified_date));
            preparedStatement.setInt(7,id);

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
