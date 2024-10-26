package com.demo.controller;

import com.demo.model.StyleType;
import com.demo.repository.SignRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLType;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Signs Add", value = "/signs/signs_add")
public class SingsAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<StyleType> list = new ArrayList<>();
        list.add(new StyleType(1,"Sign in"));
        list.add(new StyleType(0, "Sign out"));

        req.setAttribute("typeList",list);
        req.getRequestDispatcher("/signs_add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1: get data from signs_add.jsp
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

        String signature = req.getParameter("signture");
        LocalDateTime created_date = LocalDateTime.now();
        LocalDateTime modified_date = LocalDateTime.now();

        //step 2: push data into SignRepository.createSign(int booking_id, int contact_id, int type, Time sign_time, String signature, LocalDateTime created_date, LocalDateTime modified_date)
        SignRepository signRepository = new SignRepository();
        signRepository.createSign(booking_id, contact_id, type, sign_time, signature, created_date, modified_date);

        //step 3: show list of signs from signs.jsp
        resp.sendRedirect("/signs");
    }

}
