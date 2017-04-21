package com.utd.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// found here: http://stackoverflow.com/documentation/servlets/2857/getting-started-with-servlets/9958/hello-world-with-dopost#t=201704210417150548408

@WebServlet("/helloServlet")
public class HelloServletController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Preprocess request: we actually don't need to do any business stuff, so just display JSP.
        request.getRequestDispatcher("/WEB-INF/views/helloServlet.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Postprocess request: gather and validate submitted data and display the result in the same JSP.

        // Prepare messages.
        Map<String, String> messages = new HashMap<String, String>();
        request.setAttribute("messages", messages);

        // Get and validate name.
        String name = request.getParameter("name");
        if (name == null || name.trim().isEmpty()) {
            messages.put("name", "Please enter name");
        } else if (!name.matches("\\p{Alnum}+")) { //here is regex info: http://www.vogella.com/tutorials/JavaRegularExpressions/article.html
            messages.put("name", "Please enter alphanumeric characters only");
        }

        // Get and validate age.
        String age = request.getParameter("age");
        if (age == null || age.trim().isEmpty()) {
            messages.put("age", "Please enter age");
        } else if (!age.matches("\\d+")) {
            messages.put("age", "Please enter digits only");
        }

        // No validation errors? Do the business job!
        if (messages.isEmpty()) {
            messages.put("success", String.format("Hello, your name is %s and your age is %s!", name, age));
        }

        request.getRequestDispatcher("/WEB-INF/views/helloServlet.jsp").forward(request, response);
    }
    
}