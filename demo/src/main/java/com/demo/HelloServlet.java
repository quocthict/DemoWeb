//package com.demo;
////import org.thymeleaf.context.WebContext;
////import org.thymeleaf.TemplateEngine;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet("/hello")
//public class HelloServlet extends HttpServlet {
////
////    @Override
////    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        // Lấy TemplateEngine từ ServletContext
////        TemplateEngine templateEngine = (TemplateEngine) getServletContext().getAttribute("templateEngine");
////
////        // Tạo ngữ cảnh WebContext
////        WebContext context = new WebContext(request, response, getServletContext());
////        context.setVariable("name", "Thymeleaf User");
////
////        // Render template và gửi đến client
////        templateEngine.process("hello", context, response.getWriter());
////    }
//}
//

package com.demo;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}
