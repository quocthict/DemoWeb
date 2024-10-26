package com.demo.controller;

import com.demo.model.Booking;
import com.demo.repository.BookingRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="Booking delete page", value = "/bookings/bookings_delete")
public class BookingsDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1: get id from bookings.jsp
        int id = Integer.parseInt(req.getParameter("id"));

        //step 2: push id into BookingRepository.deleteBooking
        BookingRepository bookingRepository = new BookingRepository();
        bookingRepository.deleteBooking(id);

        //step 3: show list of bookings on bookings.jsp
        resp.sendRedirect("/bookings");
    }
}
