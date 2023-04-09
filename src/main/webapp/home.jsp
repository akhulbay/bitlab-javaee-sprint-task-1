<%@ page import="java.util.List" %>
<%@ page import="com.example.sprinttaskee1.entity.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%@include file="vendor/navbar.jsp" %>
    <div class="row mt-3">
        <div class="col-sm-12">
            <button type="button" class="btn btn mb-2" data-bs-toggle="modal" data-bs-target="#addTask"
                    style="background-color: #1f1962; color: white">
                + Добавить задание
            </button>
            <div class="modal fade" id="addTask" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/addTask" method="post">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Новое задание</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Наименование</label>
                                    <input type="text" class="form-control" id="name" name="name"
                                           placeholder="Наименование">
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label">Описание</label>
                                    <textarea class="form-control" id="description" name="description" rows="6"
                                              placeholder="Описание"></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="deadline" class="form-label">Наименование</label>
                                    <input type="date" class="form-control" id="deadline" name="deadline">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Наименование</th>
                    <th scope="col">Крайний срок</th>
                    <th scope="col">Выполнено</th>
                    <th scope="col">Детали</th>
                </tr>
                </thead>
                <tbody>


                </tbody>
                <%
                    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                    if (tasks != null) {
                        for (Task task : tasks) {

                %>
                <tr>
                    <th scope="row"><%=task.getId()%>
                    </th>
                    <td><%=task.getName()%>
                    </td>
                    <td><%=task.getDeadlineDate()%>
                    </td>
                    <td><%=task.isFinished() ? "Да" : "Нет"%></td>
                    <td><a class="btn btn" href="/details?task_id=<%=task.getId()%>" role="button"
                           style="background-color: #1f1962; color: white">Детали</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </div>
</div>
</body>
</html>
