package com.demo.repository;

import com.demo.config.MysqlConnection;
import com.demo.model.Booking;
import com.demo.model.Child;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class BookingRepository {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public List<Booking> getAllBooking() {
        List<Booking> list = new ArrayList<>();
        String query = "select * from booking;";

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(new Booking(resultSet.getInt(1),
                        resultSet.getInt(2),
                        resultSet.getInt(3),
                        resultSet.getDate(4).toLocalDate(),
                        Time.valueOf(resultSet.getObject(5, LocalTime.class)),
                        Time.valueOf(resultSet.getObject(6, LocalTime.class)),
                        resultSet.getObject(7, LocalDateTime.class),
                        resultSet.getObject(8, LocalDateTime.class)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public void createBooking(int child_id, int room, Date booked_date, Time booked_time_from, Time booked_time_to, LocalDateTime created_date, LocalDateTime modified_date) {
        String query = "insert into booking(child_id, room, booked_date, booked_time_from, booked_time_to, created_date, modified_date)" +
                "values (?,?,?,?,?,?,?);";

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,child_id);
            preparedStatement.setInt(2,room);
            preparedStatement.setDate(3, booked_date);
            preparedStatement.setTime(4,booked_time_from);
            preparedStatement.setTime(5,booked_time_to);
            preparedStatement.setTimestamp(6, Timestamp.valueOf(created_date));
            preparedStatement.setTimestamp(7, Timestamp.valueOf(modified_date));

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteBooking(int id) {
        String query = "delete from booking where id = ?;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Booking getBookingByID (int id) {
        String query = "select * from booking where id = ?;";

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Booking(resultSet.getInt(1),
                        resultSet.getInt(2),
                        resultSet.getInt(3),
                        resultSet.getDate(4).toLocalDate(),
                        resultSet.getTime(5),
                        resultSet.getTime(6),
                        resultSet.getObject(7, LocalDateTime.class),
                        resultSet.getObject(8, LocalDateTime.class));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void updateBooking (int child_id, int room, Date booked_date, Time booked_time_from, Time booked_time_to, LocalDateTime modified_date, int id) {
        String query = "update `booking`" +
                "set child_id = ?, room = ?, booked_date = ?, booked_time_from = ?, booked_time_to = ?, modified_date = ?" +
                "where id = ?;";
        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,child_id);
            preparedStatement.setInt(2,room);
            preparedStatement.setDate(3, booked_date);
            preparedStatement.setTime(4,booked_time_from);
            preparedStatement.setTime(5,booked_time_to);
            preparedStatement.setTimestamp(6, Timestamp.valueOf(modified_date));
            preparedStatement.setInt(7,id);

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//    public static void main(String[] args) {
//        List<Booking> list = new BookingRepository().getAllBooking();
//        for (Booking b: list){
//            System.out.println(b);
//        }
//    }
}
