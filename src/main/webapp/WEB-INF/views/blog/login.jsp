<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page import="me.beakblog.bean.Post" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: twhua
  Date: 2020/1/13
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" type="text/css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/iconic/font/css/open-iconic-bootstrap.css" type="text/css">
    <title>BreakBlog - Login</title>
</head>
<body>
<div id="Top">
    <nav class="navbar navbar-expand-sm navbar-dark bg-primary">
        <div class="container">
            <a href="#" class="navbar-brand">BreakBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div id="Wrapper" class="bg-gary h-100">
    <div class="content py-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 p-5 bg-white" style="height: 800px">
                    <div class="row justify-content-center align-items-center py-5">
                        <h1>Login</h1>
                    </div>
                    <div>
                        <c:if test="${requestScope.msg!=null}">
                            <p class="row justify-content-center align-items-center text-warning">${requestScope.msg}</p>
                        </c:if>
                    </div>
                    <div class="row justify-content-center align-items-center pb-5">
                        <form action="${pageContext.request.contextPath}/admin/login" method="post"
                              class="form col-lg-4" role="form">
                            <div class="form-group required"><label class="form-control-label"
                                                                    for="username">Username</label>
                                <input class="form-control" id="username" name="username" required type="text"
                                       value="">
                            </div>
                            <div class="form-group required"><label class="form-control-label"
                                                                    for="password">Password</label>
                                <input class="form-control" id="password" name="password" required type="password"
                                       value="">
                            </div>
                            <input class="btn btn-secondary" id="submit" name="submit" type="submit" value="Login">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.slim.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/script.js"></script>
</body>
</html>

