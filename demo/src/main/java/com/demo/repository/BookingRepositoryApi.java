package com.demo.repository;

import com.demo.config.MysqlConnection;
import com.demo.model.Booking;
import com.demo.model.BookingApi;
import com.demo.model.ChildApi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class BookingRepositoryApi {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public List<BookingApi> getAllBookingByChildID(int id) {
        List<BookingApi> list = new ArrayList<>();
        String query = "select\n" +
                "\tid,\n" +
                "    child_id as childId,\n" +
                "    room,\n" +
                "    booked_date as bookedDate,\n" +
                "    booked_time_from as bookedTimeFrom,\n" +
                "    booked_time_to as bookedTimeTo,\n" +
                "    created_date as createdDate,\n" +
                "    modified_date as modifiedDate\n" +
                "from booking\n" +
                "where child_id = ?;";

        try {
            connection = new MysqlConnection().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                BookingApi object = new BookingApi();

                object.setId(resultSet.getInt("id"));
                object.setChildId(resultSet.getInt("childId"));
                object.setRoom(resultSet.getInt("room"));
                object.setBookedDate(resultSet.getDate("bookedDate"));
                object.setBookedTimeTo(Time.valueOf(resultSet.getObject("bookedTimeFrom", LocalTime.class)));
                object.setBookedTimeTo(Time.valueOf(resultSet.getObject("bookedTimeTo", LocalTime.class)));
                object.setCreatedDate(resultSet.getObject("createdDate", LocalDateTime.class));
                object.setModifiedDate(resultSet.getObject("modifiedDate", LocalDateTime.class));

                list.add(object);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
