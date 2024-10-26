package com.demo.controller;


import com.demo.repository.BookingRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet(name = "Booking add", value = "/bookings/bookings_add")
public class BookingsAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int child_id = Integer.parseInt(req.getParameter("child_id"));
        int room = Integer.parseInt(req.getParameter("room"));

        String stringBooked_date = req.getParameter("booked_date");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date booked_date = null;
        try {
            booked_date = new Date(dateFormat.parse(stringBooked_date).getTime());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        String stringBooked_time_from = req.getParameter("booked_time_from");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("hh:mm");
        long ms_from = 0;
        try {
            ms_from = simpleDateFormat.parse(stringBooked_time_from).getTime();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Time booked_time_from = new Time(ms_from);


        String stringBooked_time_to = req.getParameter("booked_time_to");
//      SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm");
        long ms_to = 0;
        try {
            ms_to = simpleDateFormat.parse(stringBooked_time_to).getTime();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Time booked_time_to = new Time(ms_to);

        LocalDateTime created_date = LocalDateTime.now();
        LocalDateTime modified_date = LocalDateTime.now();

        //step 2: push data into BookingRepository.createBooking(child_id, room, booked_date, booked_time_from, booked_time_to, created_date, modified_date)
        BookingRepository bookingRepository = new BookingRepository();
        bookingRepository.createBooking(child_id, room, booked_date, booked_time_from, booked_time_to,created_date, modified_date);

        //step 3: show list booking at bookings.jsp
        resp.sendRedirect("/bookings");
    }
}
