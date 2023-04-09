<%@ page import="com.example.sprinttaskee1.entity.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%@include file="vendor/navbar.jsp" %>
    <div class="row mt-3 d-flex align-items-center justify-content-center">
        <div class="col-sm-8">
            <%
                Task task = (Task) request.getAttribute("task");
                if (task != null) {
            %>
            <input type="hidden" value="<%=task.getId()%>" name="task_id">
            <div class="mb-3">
                <label for="name" class="form-label">Наименование</label>
                <input type="text" class="form-control"
                       placeholder="Наименование" value="<%=task.getName()%>">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Описание</label>
                <textarea class="form-control" rows="6"
                          placeholder="Описание"><%=task.getDescription()%></textarea>
            </div>
            <div class="mb-3">
                <label for="deadline" class="form-label">Крайний Срок</label>
                <input type="date" class="form-control"
                       value="<%=task.getDeadlineDate()%>">
            </div>
            <select class="form-select mb-3" aria-label="Пример выбора по умолчанию">
                <option value="0" <%=task.isFinished() ? "selected" : null%>>Нет</option>
                <option value="1" <%=task.isFinished() ? "selected" : null%>>Да</option>
            </select>
            <div class="mb-3">
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#updateTask">
                    Сохранить
                </button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteTask">
                    Удалить
                </button>
            </div>
            <div class="modal fade" id="updateTask" tabindex="-1" aria-labelledby="exampleModalLabel2"
                 aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/saveTask" method="post">
                            <input type="hidden" name="task_id" value="<%=task.getId()%>">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel2">Подтвердите Изменение</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" value="<%=task.getId()%>" name="task_id">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Наименование</label>
                                    <input type="text" class="form-control" id="name" name="name"
                                           placeholder="Наименование" value="<%=task.getName()%>">
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label">Описание</label>
                                    <textarea class="form-control" id="description" name="description" rows="6"
                                              placeholder="Описание"><%=task.getDescription()%></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="deadline" class="form-label">Наименование</label>
                                    <input type="date" class="form-control" id="deadline" name="deadline"
                                           value="<%=task.getDeadlineDate()%>">
                                </div>
                                <select class="form-select mb-3" aria-label="Пример выбора по умолчанию"
                                        name="task_status">
                                    <option value="0" <%=task.isFinished() ? "selected" : null%>>Нет</option>
                                    <option value="1" <%=task.isFinished() ? "selected" : null%>>Да</option>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                                <button class="btn btn-danger">Изменить</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="deleteTask" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/deleteTask" method="post">
                            <input type="hidden" name="task_id" value="<%=task.getId()%>">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Подтвердите Удаление</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="text-center">
                                    <h4>Вы уверены?</h4>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                                <button class="btn btn-danger">Да</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <%
            } else {
            %>
            <h3 class="text-center">Task Not Found</h3>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
