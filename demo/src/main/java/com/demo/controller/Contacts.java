package com.demo.controller;

import com.demo.model.Contact;
import com.demo.repository.ContactsRepository;
import com.demo.service.ContactService;
import com.demo.service.imp.ContactServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Contact management", value = "/contacts")
public class Contacts extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        //step 1: get a list of contacts from ContactsRepository
        ContactsRepository contactsRepository = new ContactsRepository();
        List<Contact> list = contactsRepository.getAllContact();

//        ContactService contactService = new ContactService();
//        List<Contact> list = contactService.getContactList();

        //step 2: send data into contacts.jsp
        req.setAttribute("listContacts", list);
        req.getRequestDispatcher("contacts.jsp").forward(req, resp);
    }

//    private ContactService contactService = new ContactService();
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String action = req.getParameter("action");
//        if ("new".equals(action)) {
//            req.getRequestDispatcher("/WEB-INF/templates/user-form.html").forward(req, resp);
//        } else if ("edit".equals(action)) {
//            int id = Integer.parseInt(req.getParameter("id"));
//            User user = userService.findById(id);
//            req.setAttribute("user", user);
//            req.getRequestDispatcher("/WEB-INF/templates/user-form.html").forward(req, resp);
//        } else {
//            req.setAttribute("users", userService.findAll());
//            req.getRequestDispatcher("/WEB-INF/templates/user-list.html").forward(req, resp);
//        }
//    }
}