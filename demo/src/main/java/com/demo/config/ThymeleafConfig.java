package com.demo.config;
//
//import org.thymeleaf.TemplateEngine;
//import org.thymeleaf.templateresolver.ServletContextTemplateResolver;
//
//import javax.servlet.ServletContext;
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;

//public class ThymeleafConfig implements ServletContextListener {
//
//    // Phương thức này được gọi khi ứng dụng khởi động
//    @Override
//    public void contextInitialized(ServletContextEvent sce) {
//        ServletContext servletContext = sce.getServletContext();
//
//        // Cấu hình TemplateResolver của Thymeleaf
//        ServletContextTemplateResolver templateResolver = new ServletContextTemplateResolver(servletContext);
//        templateResolver.setTemplateMode("HTML"); // Thiết lập chế độ HTML cho Thymeleaf
//        templateResolver.setPrefix("/WEB-INF/templates/"); // Đường dẫn đến thư mục chứa file HTML
//        templateResolver.setSuffix(".html"); // Định dạng của file là .html
//
//        // Khởi tạo TemplateEngine
//        TemplateEngine templateEngine = new TemplateEngine();
//        templateEngine.setTemplateResolver(templateResolver);
//
//        // Đặt TemplateEngine vào ServletContext để có thể dùng ở các Servlet khác
//        servletContext.setAttribute("templateEngine", templateEngine);
//    }
//
//    @Override
//    public void contextDestroyed(ServletContextEvent sce) {
//        // Xử lý khi ứng dụng bị hủy (nếu cần)
//    }
//}


