package com.unvs.controller;

import com.unvs.entity.Cart;
import com.unvs.entity.Merchant;
import com.unvs.entity.Product;
import com.unvs.entity.User;
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
import java.time.Instant;
import java.util.List;

@WebServlet(urlPatterns = "/product")
public class ProductServlet extends BaseServlet{
    private ProductService service = new ProductService();
    private ProductTypeService productTypeService = new ProductTypeService();
    public void ViewAllProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        HttpSession session = request.getSession();
        List<Product> list = service.findall();
        session.setAttribute("list",list);
        request.getRequestDispatcher("shop.jsp").forward(request,response);
    }
    public void ViewDetail(HttpServletRequest request,HttpServletResponse response) throws ServletException,SQLException,IOException{
        HttpSession session = request.getSession();
        User temp = (User)session.getAttribute("user");
        Instant start = Instant.now();
        session.setAttribute("begin_view",start);
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String strsystime = sf.format(System.currentTimeMillis());//系统当前时间
        session.setAttribute("begin_view1",strsystime);

//        if(temp != null){
//            Instant start = Instant.now();
//            session.setAttribute("begin_view",start);
//            SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            String strsystime = sf.format(System.currentTimeMillis());//系统当前时间
//            session.setAttribute("begin_view1",strsystime);
//        }
        int pid = Integer.parseInt(request.getParameter("pid"));
        Product product = service.FindOne(pid);
        session.setAttribute("product",product);
        request.getRequestDispatcher("product_detail.jsp").forward(request,response);
    }
    public void AlterProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException,SQLException,IOException{
        HttpSession session = request.getSession();
        //Integer pid = Integer.valueOf(request.getParameter("Pid"));
        Product product = (Product) session.getAttribute("product");
        Integer pid = product.getPid();
        MerchantService merchantService = new MerchantService();
        Merchant merchant = (Merchant) session.getAttribute("merchant");
        if (merchant == null) {
            response.sendRedirect("admin_login.jsp");
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
        merchantService.AlterProductByPid(pid,pname,price,image,image1,image2,type,intro,stock,description, merchant.getName());
        List<Product> ProductList = merchantService.GetYourProduct(merchant.getName());
        int psum = 0;
        for(Product ttt :ProductList){
            psum++;
        }
        session.setAttribute("ProductList",ProductList);
        session.setAttribute("psum",psum);
        request.getRequestDispatcher("merchant_product.jsp").forward(request,response);
    }
    public void Recommend(HttpServletRequest request, HttpServletResponse response) throws SQLException,ServletException,IOException{
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        List<Product> recommend = service.recommend(user.getUid());
        session.setAttribute("recommend",recommend);
        request.getRequestDispatcher("recommend.jsp").forward(request,response);
    }

}
