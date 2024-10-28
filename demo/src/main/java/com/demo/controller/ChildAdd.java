package com.demo.controller;


import com.demo.repository.ChildRepository;
import com.demo.repository.ContactChildRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.sql.Date;

@WebServlet(name="Child add", value="/child/child_add")
public class ChildAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Step 1: Get data from name attribute of child_add.jsp
        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");

        int gender = Integer.parseInt(req.getParameter("gender"));

        String stringBirth_date = req.getParameter("birth_date");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birth_date = null;
        try {
            birth_date = new Date(dateFormat.parse(stringBirth_date).getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        int contact_id = Integer.parseInt(req.getParameter("contact_id"));
        LocalDateTime created_date = LocalDateTime.now();
        LocalDateTime modified_date = LocalDateTime.now();

        //Step 2: push new child into database and return its id
        ChildRepository childRepository = new ChildRepository();
        int child_id = childRepository.createChild(first_name, last_name, gender, birth_date, created_date, modified_date);

        //step 3: push new contact_child into database
        ContactChildRepository contactChildRepository = new ContactChildRepository();
        contactChildRepository.createContactChild(contact_id,child_id,created_date,modified_date);

        //Step 4: show all of children on child.jsp
        resp.sendRedirect("/child");
    }
}
