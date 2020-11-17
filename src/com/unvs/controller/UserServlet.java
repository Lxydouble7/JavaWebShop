package com.unvs.controller;

import com.unvs.controller.BaseServlet;
import com.unvs.entity.User;
import com.unvs.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/user")
public class UserServlet extends BaseServlet {
    private UserService service = new UserService();

    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = service.login(username, password);
        if (user != null){
            session.setAttribute("user",user);
            response.sendRedirect("index.jsp");
        }
        else{
            request.setAttribute("msg","用户名与密码不匹配");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }

    public void logout(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        Cookie usernamecookie = new Cookie("username","");
        Cookie userpasswordcookie = new Cookie("password","");
        usernamecookie.setMaxAge(0);
        userpasswordcookie.setMaxAge(0);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
    public void register(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        User user = new User(null,username,password,name,email,telephone,birthday,gender,address);
        if (service.checking(username)==true)
        {
            request.setAttribute("msg","用户名以存在");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
        else{
            if (service.register(user)){
                response.sendRedirect("registSuccess.jsp");
            }
            else{
                request.setAttribute("msg","注册失败");
                request.getRequestDispatcher("register.jsp").forward(request,response);
            }
        }
    }
    public void ViewUserDetail(HttpServletRequest request,HttpServletResponse response) throws SQLException,IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)request.getAttribute("user");
        if (user == null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        request.getRequestDispatcher("user_detail.jsp").forward(request,response);
    }
}
