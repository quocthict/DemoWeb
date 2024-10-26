package com.demo.controller;

import com.demo.repository.BookingRepository;
import com.demo.repository.SignRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Delete sign", value = "/signs/signs_delete")
public class SignsDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1: get id from signs.jsp
        int id = Integer.parseInt(req.getParameter("id"));

        //step 2: push id into BookingRepository.deleteBooking
        SignRepository signRepository = new SignRepository();
        signRepository.deleteSign(id);

        //step 3: show list of bookings on bookings.jsp
        resp.sendRedirect("/signs");
    }
}
