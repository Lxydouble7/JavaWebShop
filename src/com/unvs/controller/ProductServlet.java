package com.unvs.controller;

import com.unvs.entity.Cart;
import com.unvs.entity.Product;
import com.unvs.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/product")
public class ProductServlet extends BaseServlet{
    private ProductService service = new ProductService();

    public void ViewAllProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        HttpSession session = request.getSession();
        List<Product> list = service.findall();
        session.setAttribute("list",list);
        request.getRequestDispatcher("shop.jsp").forward(request,response);
    }
    public void ViewDetail(HttpServletRequest request,HttpServletResponse response) throws ServletException,SQLException,IOException{
        HttpSession session = request.getSession();
        int pid = Integer.parseInt(request.getParameter("pid"));
        Product product = service.FindOne(pid);
        session.setAttribute("product",product);
        request.getRequestDispatcher("product_detail.jsp").forward(request,response);
    }
}
