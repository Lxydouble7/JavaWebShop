package com.unvs.controller;

import com.unvs.entity.Cart;
import com.unvs.entity.Product;
import com.unvs.entity.User;
import com.unvs.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/cart")
public class CartServlet extends BaseServlet{
    private CartService service = new CartService();
    public void AddCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Integer pid = Integer.parseInt(request.getParameter("pid"));
        User user = (User) session.getAttribute("user");
        if (user == null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        Integer uid = user.getUid();
        Integer number = Integer.parseInt(request.getParameter("number"));
        Double price = Double.valueOf(request.getParameter("total_price"));
        String type = request.getParameter("type");
        String merchant = request.getParameter("merchant");
        service.AddCart(uid,pid,number,price,type,merchant);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
    public void CheckOut(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        Integer uid = user.getUid();
        List<Cart> checkout = service.checkout(uid);
        session.setAttribute("checkout",checkout);
        Double sum = 0.0;
        Integer psum = 0;
        for (Cart i : checkout){
            sum += i.getTotal_price();
            psum++;
        }
        session.setAttribute("sum",sum);
        session.setAttribute("psum",psum);
        request.getRequestDispatcher("check_out.jsp").forward(request,response);
    }
    public void DeleteCart(HttpServletRequest request,HttpServletResponse response) throws SQLException,IOException,ServletException{
        HttpSession session = request.getSession();
        Integer uid= Integer.valueOf(request.getParameter("uid"));
        Integer pid = Integer.valueOf(request.getParameter("pid"));
        service.DeleteCart(uid,pid);
        List<Cart> checkout = service.checkout(uid);
        session.setAttribute("checkout",checkout);
        Double sum = 0.0;
        Integer psum = 0;
        for (Cart i : checkout){
            sum += i.getTotal_price();
            psum++;
        }
        session.setAttribute("sum",sum);
        session.setAttribute("psum",psum);
        request.getRequestDispatcher("check_out.jsp").forward(request,response);
    }
    public void CheckOutUpdateCart(HttpServletRequest request,HttpServletResponse response) throws ServletException,SQLException,IOException{
        HttpSession session = request.getSession();
        Integer uid= Integer.valueOf(request.getParameter("uid"));
        Integer pid = Integer.valueOf(request.getParameter("pid"));
        Integer op = Integer.valueOf(request.getParameter("op"));
        Double price = Double.valueOf(request.getParameter("price"));
        Integer nownumber = Integer.valueOf(request.getParameter("nownumber"));
        if (op==-1 && nownumber==1){

        }
        else{
            service.CheckOutUpdateCart(uid,pid,op,price);
        }
        List<Cart> checkout = service.checkout(uid);
        session.setAttribute("checkout",checkout);
        Double sum = 0.0;
        Integer psum = 0;
        for (Cart i : checkout){
            sum += i.getTotal_price();
            psum++;
        }
        session.setAttribute("sum",sum);
        session.setAttribute("psum",psum);
        request.getRequestDispatcher("check_out.jsp").forward(request,response);

    }
}
