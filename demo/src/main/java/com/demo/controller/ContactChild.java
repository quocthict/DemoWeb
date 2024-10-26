package com.demo.controller;

import com.demo.config.MysqlConnection;
import com.demo.repository.ContactChildRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="Contact-Child list", value="/contactchild")

public class ContactChild extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ContactChildRepository contactChildRepository = new ContactChildRepository();
        List<com.demo.model.ContactChild> listContactChild = contactChildRepository.getAllContactChild();

        req.setAttribute("listContactChild", listContactChild);
        req.getRequestDispatcher("contactchild.jsp").forward(req, resp);
    }
}
