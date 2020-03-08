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
    <title>${requestScope.admin.blog_title} - category</title>
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
</div>
<div id="Wrapper" class="bg-gary">
    <div class="content py-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-12 p-3 bg-white">
                    <h2>Category: ${requestScope.categoryById.name}</h2>
                    <h6 class="text-muted">${requestScope.admin.blog_subtitle}</h6>
                    <div class="float-right text-muted">-- ${requestScope.admin.name}</div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-9 col-12 p-3 bg-white mt-3">
                    <c:if test="${requestScope.posts.isEmpty()}">
                        <div>
                            <h4>There are no articles in this category!</h4>
                            <p class="text-muted my-2">Please login and write...</p>
                        </div>
                    </c:if>
                    <c:forEach items="${requestScope.posts}" var="post">
                        <div>
                            <h4 class="text-primary"><a
                                    href="${pageContext.request.contextPath}/post/${post.id}">${post.title}</a>
                            </h4>
                            <p class="text-muted my-2">
                                    ${post.subtitle}
                                <small>...<a href="#">Read More</a></small>
                            </p>
                            <div>
                                <small>
                                    <span class="oi oi-eye"></span>
                                        ${post.pageview}&nbsp;&nbsp;
                                    <span class="oi oi-book "></span>
                                    <a href="${pageContext.request.contextPath}/category/${post.category_id}">${post.getCategory().getName()}</a>
                                </small>
                                <small class="float-right">
                                    <span class="oi oi-clock"></span>
                                    <span class="moment" data-timestamp="${post.getTimestampFormat()}"
                                          data-format="format('LL')"></span>
                                </small>
                            </div>
                            <hr>
                        </div>
                    </c:forEach>
                    <c:if test="${requestScope.page.hasPreviousPage || requestScope.page.hasNextPage}">
                        <div class="pag">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">

                                    <li class="page-item <c:if test="${!requestScope.page.hasPreviousPage}">disabled</c:if>">
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/?page=${requestScope.page.pageNum - 1}">
                                            <span aria-hidden="true">←</span> Previous
                                        </a>
                                    </li>
                                    <li class="page-item <c:if test="${!requestScope.page.hasNextPage}">disabled</c:if>">
                                        <a class="page-link"
                                           href="${pageContext.request.contextPath}/?page=${requestScope.page.pageNum + 1}">
                                            Next <span aria-hidden="true">→</span>
                                        </a>
                                    </li>

                                </ul>
                            </nav>
                        </div>
                    </c:if>
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
                    <a href="https://github.com/tw-huang/breakblog" title="Written by tw.huang">GitHub</a>
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

