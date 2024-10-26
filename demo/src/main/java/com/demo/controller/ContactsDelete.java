package com.demo.controller;


import com.demo.repository.ContactsRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="Delete Contract", value="/contacts/contacts_delete")
public class ContactsDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Step1: get contact id from delete button of contacts.jsp
        int id = Integer.parseInt(req.getParameter("id"));

        //Step 2: push id into ContactsRepository.createContact
        ContactsRepository contactsRepository = new ContactsRepository();
        contactsRepository.deleteContact(id);

        //Step 3: show rest contacts at contacts.jsp
        resp.sendRedirect("/contacts");
    }
}
