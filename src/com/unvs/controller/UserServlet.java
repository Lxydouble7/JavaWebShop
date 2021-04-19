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
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = "/user")
public class UserServlet extends BaseServlet {
    private UserService service = new UserService();
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = service.login(username, password);

        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("PRoxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String strsystime = sf.format(System.currentTimeMillis());//系统当前时间
        if (user != null){
            session.setAttribute("ip",ip);
            session.setAttribute("user_in",strsystime);
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
        String ip = (String)session.getAttribute("ip");
        String intime = (String)session.getAttribute("user_in");
        User user = (User) session.getAttribute("user");
        session.invalidate();
        Cookie usernamecookie = new Cookie("username","");
        Cookie userpasswordcookie = new Cookie("password","");
        usernamecookie.setMaxAge(0);
        userpasswordcookie.setMaxAge(0);
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String outtime = sf.format(System.currentTimeMillis());//系统当前时间
        service.timeset(user.getUsername(),ip,intime,outtime);
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
