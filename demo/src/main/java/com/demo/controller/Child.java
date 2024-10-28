package com.demo.controller;


import com.demo.repository.ChildRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="Child", value="/child")
public class Child extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1:
        ChildRepository childRepository = new ChildRepository();
        List<com.demo.model.Child> list = childRepository.getAllChild();

        //step 2
        req.setAttribute("list", list);
        req.getRequestDispatcher("child.jsp").forward(req,resp);
    }
}
