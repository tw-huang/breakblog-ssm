<%--
  Created by IntelliJ IDEA.
  User: twhua
  Date: 2020/3/1
  Time: 23:43
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
    <title>${requestScope.admin.blog_title} - post</title>
</head>
<body>
<div id="Top">
    <nav class="navbar navbar-expand-sm navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">${requestScope.admin.blog_title}</a>
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
                    <c:if test="${sessionScope.admin != null}">
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">New <span class="caret"></span></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/admin/post/new">Post</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/category/new">Category</a>
                                <a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/admin/link/new">Link</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">Manage <span class="caret"></span></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/post/manage">Post</a>
                                <a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/admin/category/manage">Category</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/link/manage">Link</a>
                            </div>
                        </li>
                        <a class="nav-item nav-link "
                           href="${pageContext.request.contextPath}/admin/settings">Settings</a>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</div
<div id="Wrapper" class="bg-gary">
    <div class="content py-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-12 p-3 bg-white">
                    <h2>${requestScope.post.title}</h2>
                    <h6 class="text-muted">Category: <a
                            href="${pageContext.request.contextPath}/category/${requestScope.post.category_id}">${requestScope.post.category.name}</a>
                        <span class="moment" data-timestamp="${requestScope.post.getTimestampFormat()}"
                              data-format="format('LLL')"></span>
                    </h6>
                    <c:if test="${sessionScope.admin != null}">
                        <div class="btn-group btn-group-sm float-right">
                            <a href="${pageContext.request.contextPath}/admin/post/edit/${requestScope.post.id}">
                                <button type="button" class="btn btn-info btn-sm p-1">Edit Post</button>
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.admin == null}">
                        <div class="float-right text-muted">-- ${requestScope.admin.name}</div>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-9 col-12 p-3 bg-white mt-3">
                    <article>
                        ${requestScope.post.body}
                    </article>
                </div>
                <div class="col-lg-3 col-12 pr-lg-0 mt-3">
                    <div class="card mb-3">
                        <div class="card-header"><span class="oi oi-list"></span> Categories</div>
                        <ul class="list-group list-group-flush">
                            <c:forEach items="${requestScope.categories}" var="category">
                                <li class="list-group-item  list-group-item-action d-flex justify-content-between align-items-center">
                                    <div>
                                        <span class="oi oi-tags tex"></span>
                                        <a href="${pageContext.request.contextPath}/category/${category.id}">${category.name}</a>
                                    </div>
                                    <span class="badge bg-light badge-pill"> ${category.posts.size()}</span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="card">
                        <div class="card-header"><span class="oi oi-link-intact"></span> Links</div>
                        <ul class="list-group list-group-flush">
                            <c:forEach items="${requestScope.links}" var="link">
                                <li class="list-group-item  list-group-item-action d-flex justify-content-between align-items-center">
                                    <div>
                                        <span class="oi oi-external-link"></span>
                                        <a href="https://github.com/tw-huang" target="_blank"> ${link.name}</a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
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
                    <c:if test="${sessionScope.admin != null}">
                        <span class="oi oi-account-logout"></span>
                        <a href="${pageContext.request.contextPath}/admin/logout">Logout</a>
                    </c:if>
                    <c:if test="${sessionScope.admin == null}">
                        <span class="oi oi-account-login"></span>
                        <a href="${pageContext.request.contextPath}/admin/login">Login</a>
                    </c:if>
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

