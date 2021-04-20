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
import java.text.SimpleDateFormat;
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

        if (admin != null){
            List<ProductType> producttype= new ArrayList<>();
            producttype = productTypeService.findall();
            session.setAttribute("ip",ip);
            session.setAttribute("admin_in",strsystime);
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
        String index = request.getParameter("index");
        System.out.println(index);
        List<Order> OrderList = adminService.GetAllOrder(index);
        int osum = OrderList.size();
//        List<Example> example = exampleRepository.list();
        List<ProductType> ty = (List)session.getAttribute("ProductTypeList");
        if(index != null && null != ty&& ty.size() > 0){
            for(int t = 0 , length = ty.size() ; t < length ; t++){
                System.out.println(ty.get(t).getType());
                if(index.equals(ty.get(t).getType())){
                    ProductType temp = ty.get(0);
                    ty.set(0, ty.get(t));
                    ty.set(t, temp);
                    System.out.println("!!!");
                }
            }
        }
        session.setAttribute("ProductTypeList",ty);
        session.setAttribute("OrderList",OrderList);
        session.setAttribute("osum",osum);
        session.setAttribute("index",index);
        request.getRequestDispatcher("admin_order.jsp").forward(request,response);
    }
    public void DeleteOrderByOid(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Integer oid = Integer.valueOf(request.getParameter("oid"));
        adminService.DeleteOrderByOid(oid);
        String index = request.getParameter("index");
        List<Order> OrderList = adminService.GetAllOrder(index);
        int osum = 0;
        for(Order i :OrderList){
            osum++;
        }
        session.setAttribute("OrderList",OrderList);
        session.setAttribute("osum",osum);
        session.setAttribute("index",index);
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
    public void logout(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String ip = (String)session.getAttribute("ip");
        String intime = (String)session.getAttribute("admin_in");
        Admin admin = (Admin) session.getAttribute("admin");
        session.invalidate();
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String outtime = sf.format(System.currentTimeMillis());//系统当前时间
        adminService.timeset(admin.getName(),ip,intime,outtime);
        request.getRequestDispatcher("admin_index.jsp").forward(request,response);
    }


    public void ShowAllMerchant(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        List<Merchant> MerchantList = adminService.GetAllMerchant();
        int merchantsum = 0;
        for(Merchant i :MerchantList){
            merchantsum++;
        }
        session.setAttribute("MerchantList",MerchantList);
        session.setAttribute("merchantsum",merchantsum);
        request.getRequestDispatcher("admin_merchant.jsp").forward(request,response);
    }
    public void DeleteMerchantByName(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Integer mid = Integer.valueOf(request.getParameter("mid"));
        adminService.DeleteMerchantByMid(mid);
        List<Merchant> MerchantList = adminService.GetAllMerchant();
        int merchantsum = 0;
        for(Merchant i :MerchantList){
            merchantsum++;
        }
        session.setAttribute("UserList",MerchantList);
        session.setAttribute("usersum",merchantsum);
        request.getRequestDispatcher("admin_merchant.jsp").forward(request,response);
    }


}
