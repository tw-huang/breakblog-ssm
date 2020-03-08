<%--<%@page import="me.beakblog.bean.Post" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: twhua
  Date: 2020/1/13
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" type="text/css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/iconic/font/css/open-iconic-bootstrap.css" type="text/css">
    <title>${sessionScope.admin.blog_title} - Post Manage</title>
</head>
<body>
<div id="Top">
    <nav class="navbar navbar-expand-sm navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">${sessionScope.admin.blog_title}</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor"
                    aria-controls="navbarColor" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">New <span class="caret"></span></a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/post/new">Post</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/category/new">Category</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/link/new">Link</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">Manage <span class="caret"></span></a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/admin/post/manage">Post</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/category/manage">Category</a>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/admin/link/manage">Link</a>
                        </div>
                    </li>
                    <a class="nav-item nav-link " href="${pageContext.request.contextPath}/admin/settings">Settings</a>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div id="Wrapper" class="bg-gary">
    <div class="content py-3">
        <div class="container">
            <c:if test="${requestScope.msg != null}">
                <div class="row">
                    <div class="col-lg-12 col-12 px-lg-4 alert alert-info" role="alert">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                            ${requestScope.msg}
                    </div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-lg-12 col-12 p-3 bg-white">
                    <h2>Post Manage</h2>
                    <h6 class="text-muted">${sessionScope.admin.blog_subtitle}</h6>
                    <div class="btn-group btn-group-sm float-right">
                        <a href="${pageContext.request.contextPath}/admin/post/new">
                            <button type="button" class="btn btn-info btn-sm p-1">New Post</button>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-12 p-3 bg-white mt-3">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>Title</th>
                            <th>Category</th>
                            <th>Date</th>
                            <th>Pageview</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <c:forEach items="${requestScope.posts}" var="post">
                            <tr>
                                <td>${post.id}</td>
                                <td><a href="${pageContext.request.contextPath}/post/${post.id}">${post.title}</a></td>
                                <td>${post.category.name}</td>
                                <td><span class="moment" data-timestamp="${post.getTimestampFormat()}"
                                          data-format="format('LL')"></span></td>
                                <td>${post.pageview}</td>
                                <td>
                                    <div class="btn-group">
                                        <a href="${pageContext.request.contextPath}/admin/post/edit/${post.id}">
                                            <button type="submit" class="btn btn-info btn-sm p-1">Edit</button>
                                        </a>
                                        <form class="inline" method="post"
                                              action="${pageContext.request.contextPath}/admin/post/delete/${post.id}">
                                            <button type="submit" class="btn btn-danger btn-sm p-1"
                                                    onclick="return confirm('Are you sure?')">
                                                Delete
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <c:if test="${requestScope.page.hasPreviousPage || requestScope.page.hasNextPage}">
                        <div class="pag">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li class="page-item <c:if test="${!requestScope.page.hasPreviousPage}">disabled</c:if>">
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/admin/post/manage?page=${requestScope.page.pageNum - 1}">
                                            <span aria-hidden="true">←</span> Previous
                                        </a>
                                    </li>
                                    <li class="page-item <c:if test="${!requestScope.page.hasNextPage}">disabled</c:if>">
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/admin/post/manage?page=${requestScope.page.pageNum + 1}">
                                            Next <span aria-hidden="true">→</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="Bottom">
    <div class="container bg-white">
        <div class="d-flex justify-content-between">
            <p>
                <small>
                    <span class="oi oi-heart"></span>
                    <a href="https://github.com/tw-huang/breakblog-ssm" title="Written by tw.huang">GitHub</a>
                </small>
            </p>
            <p>
                <small id="runtime" class="oi oi-timer"></small>
            </p>
            <p>
                <small>
                    <span class="oi oi-account-logout"></span>
                    <a href="${pageContext.request.contextPath}/admin/logout">Logout</a>
                </small>
            </p>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.slim.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/script.js"></script>
</body>
</html>
