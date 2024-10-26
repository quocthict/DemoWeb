package com.demo.controller;

import com.demo.model.Booking;
import com.demo.repository.BookingRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="Booking list page", value="/bookings")
public class Bookings extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step1: get data from BookingRepository.getAllBooking
        BookingRepository bookingRepository = new BookingRepository();
        List<Booking> list = bookingRepository.getAllBooking();

        //step2: push list of bookings to bookings.jsp
        req.setAttribute("listBookings", list);
        req.getRequestDispatcher("bookings.jsp").forward(req, resp);
    }
}
