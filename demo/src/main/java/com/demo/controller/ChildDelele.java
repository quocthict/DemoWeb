package com.demo.controller;

import com.demo.repository.ChildRepository;
import com.demo.repository.ContactChildRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="Delete child", value="/child/child_delete")
public class ChildDelele extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //step 1: get id from delete-button of child.jsp
        int id = Integer.parseInt(req.getParameter("id"));

        //step 3: push id of child that needing to delete from contact_child table
        ContactChildRepository contactChildRepository = new ContactChildRepository();
        contactChildRepository.deleteContactChildByChildID(id);

        //Step 2: push id of child that needing to delete from child table and return child_id
        ChildRepository childRepository = new ChildRepository();
        childRepository.deleteChild(id);

        //step 4: show list of children
        resp.sendRedirect("/child");
    }
}
