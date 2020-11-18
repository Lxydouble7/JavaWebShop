package com.unvs.controller;

import com.unvs.entity.Cart;
import com.unvs.entity.Order;
import com.unvs.entity.Product;
import com.unvs.entity.User;
import com.unvs.service.CartService;
import com.unvs.service.OrderService;
import com.unvs.service.ProductService;
import com.unvs.utils.MailUtils;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/order")
public class OrderServlet extends BaseServlet{
    private OrderService service = new OrderService();
    private ProductService productService = new ProductService();
    private CartService cartService = new CartService();
    public void SubmitOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, SecurityException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        String uname = request.getParameter("name");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String pay = request.getParameter("payment");
        List<Cart> CartList = (List<Cart>)session.getAttribute("checkout");
        Date date = new Date();
        for (Cart i :CartList){
            Product product = (Product)productService.FindOne(i.getPid());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String dateTime = df.format(date); // Formats a Date into a date/time string.
            service.NewOrder(user.getUid(),uname,address,telephone,i.getPid(),product.getPname(),i.getNumber(),i.getTotal_price(),dateTime,pay,email);
        }
        //删除购物车
        for(Cart i:CartList){
            cartService.DeleteCart(i.getUid(), i.getPid());
        }
        try {
            MailUtils.sendMail(email,"订单确认","您已成功下单，感谢您的支持！");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        response.sendRedirect("SubmitOrder.jsp");
    }
    public void ShowMyOrder(HttpServletRequest request,HttpServletResponse response)throws SQLException, ServletException,IOException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if (user == null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        List<Order> OrderList = service.QueryOrderByUid(user.getUid());
        Integer osum = 0;
        for (Order i : OrderList){
            osum++;
        }
        session.setAttribute("osum",osum);
        session.setAttribute("OrderList",OrderList);
        request.getRequestDispatcher("MyOrder.jsp").forward(request,response);
    }
}
