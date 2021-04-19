package com.unvs.controller;

import com.unvs.entity.*;
import com.unvs.service.MerchantService;
import com.unvs.service.ProductService;
import com.unvs.service.ProductTypeService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/merchant")
public class MerchantServlet extends BaseServlet{
    private  MerchantService merchantService = new MerchantService();
    private ProductTypeService productTypeService = new ProductTypeService();
    public void MerchantLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session =request.getSession();
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        Merchant merchant = merchantService.login(username, password);
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
        if (merchant != null){
            List<ProductType> producttype= new ArrayList<>();
            producttype = productTypeService.findall();
            session.setAttribute("ip",ip);
            session.setAttribute("merchant_in",strsystime);
            session.setAttribute("merchant",merchant);
            session.setAttribute("ProductTypeList",producttype);
            response.sendRedirect("merchant_index.jsp");
        }
        else{
            request.setAttribute("msg","用户名与密码不匹配");
            request.getRequestDispatcher("merchant_login.jsp").forward(request,response);
        }
    }
    public void logout(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String ip = (String)session.getAttribute("ip");
        String intime = (String)session.getAttribute("merchant_in");
        Merchant merchant = (Merchant) session.getAttribute("merchant");
        session.invalidate();
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String outtime = sf.format(System.currentTimeMillis());//系统当前时间
        merchantService.timeset(merchant.getName(),ip,intime,outtime);
        request.getRequestDispatcher("merchant_index.jsp").forward(request,response);
    }
    public void ShowYourOrder(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Merchant merchant = (Merchant)session.getAttribute("merchant");
        if (merchant == null) {
            response.sendRedirect("merchant_login.jsp");
        }
        List<Order> OrderList = merchantService.GetAllOrder(merchant.getName());
        int osum = 0;
        for(Order i :OrderList){
            osum++;
        }
        session.setAttribute("OrderList",OrderList);
        session.setAttribute("osum",osum);
        request.getRequestDispatcher("merchant_order.jsp").forward(request,response);
    }

    public void DeleteOrderByOid(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Merchant merchant = (Merchant)session.getAttribute("merchant");
        if (merchant == null) {
            response.sendRedirect("merchant_login.jsp");
        }
        Integer oid = Integer.valueOf(request.getParameter("oid"));
        merchantService.DeleteOrderByOid(oid);
        List<Order> OrderList = merchantService.GetAllOrder(merchant.getName());
        int osum = 0;
        for(Order i :OrderList){
            osum++;
        }
        session.setAttribute("OrderList",OrderList);
        session.setAttribute("osum",osum);
        request.getRequestDispatcher("admin_order.jsp").forward(request,response);
    }

    public void NewProduct(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException, SQLException, ServletException {
        HttpSession session = request.getSession();
        Merchant merchant = (Merchant) session.getAttribute("merchant");
        if (merchant == null) {
            response.sendRedirect("merchant_login.jsp");
        }
        String pname = null;
        Double price = null;
        String intro = null;
        String type = null;
        Integer stock = null;
        String description = null;
        int i = 0;
        String image = null;
        String image1 = null;
        String image2 = null;
        try {
            DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
            List<FileItem> list = servletFileUpload.parseRequest(request);
            for(FileItem fileItem : list) {
                if(fileItem.isFormField()) {
                    switch(fileItem.getFieldName()){
                        case "pname": pname =fileItem.getString("UTF-8"); break;
                        case "price": price = Double.valueOf(fileItem.getString("UTF-8")); break;
                        case "intro": intro = fileItem.getString("UTF-8"); break;
                        case "type": type = fileItem.getString("UTF-8"); break;
                        case "stock": stock = Integer.valueOf(fileItem.getString("UTF-8")); break;
                        case "description": description = fileItem.getString("UTF-8"); break;
                    }
                } else {
                    String fileName = fileItem.getName();
                    long size = fileItem.getSize();
                    System.out.println(fileName+":"+size+"Byte");
                    InputStream inputStream = fileItem.getInputStream();
                    String path = request.getServletContext().getRealPath("images/product/"+fileName);
                    switch(i){
                        case 0:image = "images/product/"+fileName;
                        case 1:image1 = "images/product/"+fileName;
                        case 2:image2 = "images/product/"+fileName;
                    }
                    i++;
                    OutputStream outputStream = new FileOutputStream(path);
                    int temp = 0;
                    while((temp = inputStream.read())!=-1){
                        outputStream.write(temp);
                    }
                    outputStream.close();
                    inputStream.close();
                    System.out.println("上传成功");
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        merchantService.NewProduct(pname,price,image,image1,image2,type,intro,stock,description);
        request.getRequestDispatcher("admin_index.jsp").forward(request,response);
    }

    public void ShowYourProduct(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Merchant merchant = (Merchant)session.getAttribute("merchant");
        if (merchant == null) {
            response.sendRedirect("merchant_login.jsp");
        }
        List<Product> ProductList = merchantService.GetYourProduct(merchant.getName());
        int psum = 0;
        for(Product i :ProductList){
            psum++;
        }
        session.setAttribute("ProductList",ProductList);
        session.setAttribute("psum",psum);
        request.getRequestDispatcher("merchant_product.jsp").forward(request,response);
    }

    public void AlterProductByPid(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Merchant merchant = (Merchant)session.getAttribute("merchant");
        Integer pid = Integer.valueOf(request.getParameter("Pid"));
        System.out.println("!!!!!!!!!!");
        System.out.println(pid);
        ProductService service = new ProductService();
        Product product = service.FindOne(pid);
        session.setAttribute("product",product);
        request.getRequestDispatcher("AlterProduct.jsp").forward(request,response);
//        merchantService.AlterProductByPid(pid);
//        List<Product> ProductList = merchantService.GetYourProduct(merchant.getName());
//        int psum = 0;
//        for(Product i :ProductList){
//            psum++;
//        }
//        session.setAttribute("ProductList",ProductList);
//        session.setAttribute("psum",psum);
//        request.getRequestDispatcher("admin_product.jsp").forward(request,response);
    }
}
