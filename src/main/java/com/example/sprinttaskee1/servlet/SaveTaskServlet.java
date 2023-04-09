package com.example.sprinttaskee1.servlet;

import com.example.sprinttaskee1.db.DBManager;
import com.example.sprinttaskee1.entity.Task;
import com.example.sprinttaskee1.util.StringUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/saveTask")
public class SaveTaskServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("task_id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String deadline = request.getParameter("deadline");
        boolean isFinished = request.getParameter("task_status").equals("1");

        Task task = DBManager.getTask(id);
        if (task != null) {
            task.setName(name);
            task.setDescription(description);
            task.setDeadlineDate(deadline);
            task.setFinished(isFinished);

            DBManager.updateTask(task);

            response.sendRedirect("/details?task_id=" + id);
        } else {
            response.sendRedirect("/home");
        }
    }
}
