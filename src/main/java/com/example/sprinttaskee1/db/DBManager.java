package com.example.sprinttaskee1.db;

import com.example.sprinttaskee1.entity.Task;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class DBManager {

    private static List<Task> tasks = new ArrayList<>();
    private static Long id = 6L;

    static {
        tasks.add(new Task(1L, "Создать Веб приложение на Java EE", "Не использовать сторонние библиотеки", "23.10.2021", true));
        tasks.add(new Task(2L, "Убраться дома и закупить продукты", "Не использовать сторонние библиотеки", "25.10.2021", true));
        tasks.add(new Task(3L, "Выполнить все домашние задания", "Не использовать сторонние библиотеки", "28.10.2021", false));
        tasks.add(new Task(4L, "Записаться на качку", "Не использовать сторонние библиотеки", "12.12.2021", false));
        tasks.add(new Task(5L, "Учить Итальянский", "Не использовать сторонние библиотеки", "01.05.2021", false));
    }

    public static void addTask(Task task) {
        task.setId(id++);
        tasks.add(task);
    }

    public static Task getTask(Long id) {
        return tasks.stream()
                .filter(task -> Objects.equals(task.getId(), id))
                .findFirst()
                .orElse(null);
    }

    public static List<Task> getAllTasks() {
        return tasks;
    }

    public static void deleteTask(Long id) {
        for (int i = 0; i < tasks.size(); i++) {
            if (Objects.equals(tasks.get(i).getId(), id)) {
                tasks.remove(i);
                break;
            }
        }
    }

    public static void updateTask(Task udatedTask) {
        for (int i = 0; i < tasks.size(); i++) {
            if (Objects.equals(tasks.get(i).getId(), udatedTask.getId())) {
                tasks.set(i, udatedTask);
                break;
            }
        }
    }
}
