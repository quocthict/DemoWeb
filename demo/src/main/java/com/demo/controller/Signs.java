package com.demo.controller;

import com.demo.config.MysqlConnection;
import com.demo.model.Sign;
import com.demo.repository.SignRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Signs", value = "/signs")
public class Signs extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1: get list of signs
        SignRepository signRepository = new SignRepository();
        List<Sign> list = signRepository.getAllSigns();

        //step 2: push list of signs into signs.jsp
        req.setAttribute("list", list);
        req.getRequestDispatcher("signs.jsp").forward(req, resp);
    }
}
