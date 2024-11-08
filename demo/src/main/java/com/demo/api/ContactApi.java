package com.demo.api;

import com.demo.common.ContactConstant;
import com.demo.dto.ContactDTO;
import com.demo.payload.ResponseData;
import com.demo.service.ContactServiceApi;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "contact", urlPatterns = {ContactConstant.DISPLAY_CONTACT,
                                            ContactConstant.DISPLAY_CONTACT_CHILD,
                                            ContactConstant.DISPLAY_CONTACT_CHILD_BOOKING})

public class ContactApi extends HttpServlet {
    private final ContactServiceApi contactServiceApi = new ContactServiceApi();
    private final Gson gson = new Gson();
    ResponseData responseData = new ResponseData();
    boolean isSuccess = true;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String urlPath = request.getServletPath();
        switch (urlPath) {
            case ContactConstant.DISPLAY_CONTACT:
                getAllContactApi(request, response);
            break;

            case ContactConstant.DISPLAY_CONTACT_CHILD:
                getChildrenByContactApi(request, response);
            break;

            case ContactConstant.DISPLAY_CONTACT_CHILD_BOOKING:
                getChildrenBookingByContactApi(request, response);
            break;
        }
    }

    private void getAllContactApi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ContactDTO> list = contactServiceApi.getAllContactApi();
        isSuccess = contactServiceApi.getAllContactIsSuccessApi();

//        ResponseData responseData = new ResponseData();
        responseData.setSuccess(isSuccess);
        responseData.setData(list);
        responseData.setDescription("");

        String json = gson.toJson(responseData);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(json);
        printWriter.flush();
    }

    private void getChildrenByContactApi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ContactDTO object = contactServiceApi.getChildrenByContactApi(id);
        responseData.setSuccess(isSuccess);
        responseData.setData(object);
        responseData.setDescription("");

        String json = gson.toJson(responseData);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(json);
        printWriter.flush();
    }

    private void getChildrenBookingByContactApi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ContactDTO object = contactServiceApi.getBookingChildrenByContactApi(id);
        isSuccess = true;

//        ResponseData responseData = new ResponseData();
        responseData.setSuccess(isSuccess);
        responseData.setData(object);
        responseData.setDescription("");

        String json = gson.toJson(responseData);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(json);
        printWriter.flush();
    }

}
