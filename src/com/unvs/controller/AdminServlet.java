package com.unvs.controller;

import com.unvs.entity.*;
import com.unvs.service.AdminService;
import com.unvs.service.OrderService;
import com.unvs.service.ProductTypeService;
import com.unvs.service.UserService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/admin")
public class AdminServlet extends BaseServlet{
    private AdminService adminService = new AdminService();
    private ProductTypeService productTypeService = new ProductTypeService();
    public void AdminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session =request.getSession();
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        Admin admin = adminService.login(username, password);
        if (admin != null){
            List<ProductType> producttype= new ArrayList<>();
            producttype = productTypeService.findall();
            session.setAttribute("admin",admin);
            session.setAttribute("ProductTypeList",producttype);
            response.sendRedirect("admin_index.jsp");
        }
        else{
            request.setAttribute("msg","用户名与密码不匹配");
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
    }
    public void ShowAllUser(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        List<User> UserList = adminService.GetAllUser();
        int usersum = 0;
        for(User i :UserList){
            usersum++;
        }
        session.setAttribute("UserList",UserList);
        session.setAttribute("usersum",usersum);
        request.getRequestDispatcher("admin_user.jsp").forward(request,response);
    }
    public void DeleteUserByUid(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Integer uid = Integer.valueOf(request.getParameter("uid"));
        adminService.DeleteUserByUid(uid);
        List<User> UserList = adminService.GetAllUser();
        int usersum = 0;
        for(User i :UserList){
            usersum++;
        }
        session.setAttribute("UserList",UserList);
        session.setAttribute("usersum",usersum);
        request.getRequestDispatcher("admin_user.jsp").forward(request,response);
    }
    public void ShowAllOrder(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("admin_login.jsp");
        }
        List<Order> OrderList = adminService.GetAllOrder();
        int osum = 0;
        for(Order i :OrderList){
            osum++;
        }
        session.setAttribute("OrderList",OrderList);
        session.setAttribute("osum",osum);
        request.getRequestDispatcher("admin_order.jsp").forward(request,response);
    }
    public void DeleteOrderByOid(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Integer oid = Integer.valueOf(request.getParameter("oid"));
        adminService.DeleteOrderByOid(oid);
        List<Order> OrderList = adminService.GetAllOrder();
        int osum = 0;
        for(Order i :OrderList){
            osum++;
        }
        session.setAttribute("OrderList",OrderList);
        session.setAttribute("osum",osum);
        request.getRequestDispatcher("admin_order.jsp").forward(request,response);
    }
    public void ShowAllProduct(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("admin_login.jsp");
        }
        List<Product> ProductList = adminService.GetAllProduct();
        int psum = 0;
        for(Product i :ProductList){
            psum++;
        }
        session.setAttribute("ProductList",ProductList);
        session.setAttribute("psum",psum);
        request.getRequestDispatcher("admin_product.jsp").forward(request,response);
    }
    public void DeleteProductByPid(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Integer pid = Integer.valueOf(request.getParameter("Pid"));
        adminService.DeleteProductByPid(pid);
        List<Product> ProductList = adminService.GetAllProduct();
        int psum = 0;
        for(Product i :ProductList){
            psum++;
        }
        session.setAttribute("ProductList",ProductList);
        session.setAttribute("psum",psum);
        request.getRequestDispatcher("admin_product.jsp").forward(request,response);
    }

//    public void NewProduct(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, SQLException, ServletException {
//        HttpSession session = request.getSession();
//        Admin admin = (Admin)session.getAttribute("admin");
//        Merchant merchant = (Merchant) session.getAttribute("merchant");
//        if (admin == null && merchant == null) {
//            response.sendRedirect("admin_login.jsp");
//        }
//        String pname = null;
//        Double price = null;
//        String intro = null;
//        String type = null;
//        Integer stock = null;
//        String description = null;
//        int i = 0;
//        String image = null;
//        String image1 = null;
//        String image2 = null;
//        try {
//            DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
//            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
//            List<FileItem> list = servletFileUpload.parseRequest(request);
//            for(FileItem fileItem : list) {
//                if(fileItem.isFormField()) {
//                    switch(fileItem.getFieldName()){
//                        case "pname": pname =fileItem.getString("UTF-8"); break;
//                        case "price": price = Double.valueOf(fileItem.getString("UTF-8")); break;
//                        case "intro": intro = fileItem.getString("UTF-8"); break;
//                        case "type": type = fileItem.getString("UTF-8"); break;
//                        case "stock": stock = Integer.valueOf(fileItem.getString("UTF-8")); break;
//                        case "description": description = fileItem.getString("UTF-8"); break;
//                    }
//                } else {
//                    String fileName = fileItem.getName();
//                    long size = fileItem.getSize();
//                    System.out.println(fileName+":"+size+"Byte");
//                    InputStream inputStream = fileItem.getInputStream();
//                    String path = request.getServletContext().getRealPath("images/product/"+fileName);
//                    switch(i){
//                        case 0:image = "images/product/"+fileName;
//                        case 1:image1 = "images/product/"+fileName;
//                        case 2:image2 = "images/product/"+fileName;
//                    }
//                    OutputStream outputStream = new FileOutputStream(path);
//                    int temp = 0;
//                    while((temp = inputStream.read())!=-1){
//                        outputStream.write(temp);
//                    }
//                    outputStream.close();
//                    inputStream.close();
//                    System.out.println("上传成功");
//                }
//            }
//        } catch (FileUploadException e) {
//            e.printStackTrace();
//        }
//        adminService.NewProduct(pname,price,image,image1,image2,type,intro,stock,description);
//        request.getRequestDispatcher("admin_index.jsp").forward(request,response);
//    }
    public void logout(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
//        Cookie usernamecookie = new Cookie("username","");
//        Cookie userpasswordcookie = new Cookie("password","");
//        usernamecookie.setMaxAge(0);
//        userpasswordcookie.setMaxAge(0);
        request.getRequestDispatcher("admin_index.jsp").forward(request,response);
    }


}
