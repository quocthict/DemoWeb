package com.demo.controller;

import com.demo.model.Child;
import com.demo.model.Contact;
import com.demo.repository.ChildRepository;
import com.demo.repository.ContactsRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;


@WebServlet(name="Update a child", value="/child/child_update")
public class ChildUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Step1: get contact id from update button of child.jsp
        int id = Integer.parseInt(req.getParameter("id"));

        //Step 2: push id into ContactsRepository.getContactById
        ChildRepository childRepository = new ChildRepository();
        Child child = childRepository.getChildById(id);

        //Step 3: Push contact with id into contacts_update.jsp form
        req.setAttribute("child", child);
        req.getRequestDispatcher("/child_update.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //Step1: get contact id from contacts_update.jsp
        int id = Integer.parseInt(req.getParameter("id"));
        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        int gender = Integer.parseInt(req.getParameter("gender"));

        //process for birth_date with Date
        String stringBirth_date = req.getParameter("birth_date");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birth_date = null;
        try {
            birth_date = new Date(dateFormat.parse(stringBirth_date).getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        LocalDateTime modified_date = LocalDateTime.now();


        //Step 2: push id into ContactsRepository.updateContact
        ChildRepository childRepository = new ChildRepository();
        childRepository.updateChild(first_name, last_name, gender, birth_date, modified_date, id);

        //Step 3: show all contacts at contacts.jsp
        resp.sendRedirect("/child");
    }
}
