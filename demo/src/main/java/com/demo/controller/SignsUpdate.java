package com.demo.controller;

import com.demo.model.Booking;
import com.demo.model.Sign;
import com.demo.repository.BookingRepository;
import com.demo.repository.SignRepository;

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

@WebServlet(name = "Update sign", value = "/signs/signs_update")
public class SignsUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1: get id from edit-button of signs.jsp
        int id = Integer.parseInt(req.getParameter("id"));

        //step 2: get booking by id from BookingRepository.getBookingById
        SignRepository signRepository = new SignRepository();
        Sign sign = signRepository.getSignByID(id);

        //step 3: push the info of booking to bookings_update.jsp through "booking"
        req.setAttribute("sign", sign);
        req.getRequestDispatcher("/signs_update.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1: get info from booking_update.jsp
        int id = Integer.parseInt(req.getParameter("id"));
        int booking_id = Integer.parseInt(req.getParameter("booking_id"));
        int contact_id = Integer.parseInt(req.getParameter("contact_id"));
        int type = Integer.parseInt(req.getParameter("type"));

        String stringSign_time = req.getParameter("sign_time");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("hh:mm");
        long ms = 0;
        try {
            ms = simpleDateFormat.parse(stringSign_time).getTime();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Time sign_time = new Time(ms);


        String signature = req.getParameter("signature");
        LocalDateTime modified_date = LocalDateTime.now();

        //step 2: push all info into BookingRepository.updateBooking((int child_id, int room, Date booked_date, Time booked_time_from, Time booked_time_to, LocalDateTime modified_date, int id)
        SignRepository signRepository = new SignRepository();
        signRepository.updateSign(booking_id, contact_id, type, sign_time, signature, modified_date, id);

        //step 3: show all booking at bookings.jsp
        resp.sendRedirect("/signs");
    }
}