package com.demo.controller;


import com.demo.model.Contact;
import com.demo.repository.ContactsRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="Update a contact", value="/contacts/contacts_update")
public class ContactsUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Step1: get contact id from update button of contacts.jsp
        int id = Integer.parseInt(req.getParameter("id"));

        //Step 2: push id into ContactsRepository.getContactById
        ContactsRepository contactsRepository = new ContactsRepository();
        Contact contact = contactsRepository.getContactById(id);

        //Step 3: Push contact with id into contacts_update.jsp form
        req.setAttribute("contact", contact);
        req.getRequestDispatcher("/contacts_update.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Step1: get contact id from contacts_update.jsp
        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String relationship = req.getParameter("relationship");
        int id = Integer.parseInt(req.getParameter("id"));

        //Step 2: push id into ContactsRepository.updateContact
        ContactsRepository contactsRepository = new ContactsRepository();
        contactsRepository.updateContact(first_name, last_name, relationship, id);

        //Step 3: show all contacts at contacts.jsp
        resp.sendRedirect("/contacts");
    }
}
