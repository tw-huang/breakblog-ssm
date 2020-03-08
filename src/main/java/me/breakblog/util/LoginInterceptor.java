package me.breakblog.util;

import me.breakblog.entity.Admin;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) return true;
        request.setAttribute("msg", "Please login first!");
        request.getRequestDispatcher("/WEB-INF/views/blog/login.jsp").forward(request, response);
        return false;
    }
}

