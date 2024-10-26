package com.demo.controller;


import com.demo.repository.ContactsRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Add a new contact", value = "/contacts/contacts_add")
public class ContactsAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Step 1: get data from contacts_add.jsp
        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String relationship = req.getParameter("relationship");

        //Step 2: push data into ContactsRepository.createContact
        ContactsRepository contactsRepository = new ContactsRepository();
        contactsRepository.createContact(first_name, last_name, relationship);

        //Step 3: show all contacts at contacts.jsp
        resp.sendRedirect("/contacts");
    }
}
