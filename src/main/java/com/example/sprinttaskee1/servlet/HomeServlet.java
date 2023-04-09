package com.example.sprinttaskee1.servlet;

import com.example.sprinttaskee1.db.DBManager;
import com.example.sprinttaskee1.entity.Task;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Task> tasks = DBManager.getAllTasks();
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
