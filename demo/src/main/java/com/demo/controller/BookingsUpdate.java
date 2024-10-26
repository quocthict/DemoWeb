package com.demo.controller;


import com.demo.model.Booking;
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

@WebServlet(name = "Update booking page", value = "/bookings/bookings_update")
public class BookingsUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1: get id from edit-button of bookings.jsp
        int id = Integer.parseInt(req.getParameter("id"));

        //step 2: get booking by id from BookingRepository.getBookingById
        BookingRepository bookingRepository = new BookingRepository();
        Booking booking = bookingRepository.getBookingByID(id);

        //step 3: push the info of booking to bookings_update.jsp through "booking"
        req.setAttribute("booking", booking);
        req.getRequestDispatcher("/bookings_update.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1: get info from booking_update.jsp
        int id = Integer.parseInt(req.getParameter("id"));
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

        LocalDateTime modified_date = LocalDateTime.now();

        //step 2: push all info into BookingRepository.updateBooking((int child_id, int room, Date booked_date, Time booked_time_from, Time booked_time_to, LocalDateTime modified_date, int id)
        BookingRepository bookingRepository = new BookingRepository();
        bookingRepository.updateBooking(child_id, room, booked_date, booked_time_from, booked_time_to, modified_date, id);

        //step 3: show all booking at bookings.jsp
        resp.sendRedirect("/bookings");
    }
}
