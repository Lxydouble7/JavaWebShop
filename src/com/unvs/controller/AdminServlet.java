package com.unvs.controller;

import com.unvs.entity.*;
import com.unvs.service.*;
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
import java.util.Calendar;
import java.util.List;

@WebServlet(urlPatterns = "/admin")
public class AdminServlet extends BaseServlet{
    private AdminService adminService = new AdminService();
    private MerchantService merchantService = new MerchantService();
    private OrderService orderService = new OrderService();
    private ProductTypeService productTypeService = new ProductTypeService();
    private OperationService operationService = new OperationService();
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
            session.setAttribute("adminip",ip);
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
        int usersum = UserList.size();

        session.setAttribute("UserList",UserList);
        session.setAttribute("usersum",usersum);
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"查看用户");
        request.getRequestDispatcher("admin_user.jsp").forward(request,response);
    }
    public void DeleteUserByUid(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        Integer uid = Integer.valueOf(request.getParameter("uid"));
        adminService.DeleteUserByUid(uid);
        List<User> UserList = adminService.GetAllUser();
        int usersum = 0;
        for(User i :UserList){
            usersum++;
        }
        session.setAttribute("UserList",UserList);
        session.setAttribute("usersum",usersum);
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"删除用户："+request.getParameter("uid"));
        request.getRequestDispatcher("admin_user.jsp").forward(request,response);
    }
    public void ShowAllOrder(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("admin_login.jsp");
        }
        String index = request.getParameter("index");
        List<Order> OrderList = adminService.GetAllOrder(index);
        int osum = OrderList.size();
        List<ProductType> ty = (List)session.getAttribute("ProductTypeList");
        if(index != null && null != ty&& ty.size() > 0){
            for(int t = 0 , length = ty.size() ; t < length ; t++){
                if(index.equals(ty.get(t).getType())){
                    ProductType temp = ty.get(0);
                    ty.set(0, ty.get(t));
                    ty.set(t, temp);
                }
            }
        }
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"查看订单");
        session.setAttribute("ProductTypeList",ty);
        session.setAttribute("OrderList",OrderList);
        session.setAttribute("osum",osum);
        session.setAttribute("index",index);
        request.getRequestDispatcher("admin_order.jsp").forward(request,response);
    }
    public void DeleteOrderByOid(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("admin_login.jsp");
        }
        Integer oid = Integer.valueOf(request.getParameter("oid"));
        adminService.DeleteOrderByOid(oid);
        String index = request.getParameter("index");
        List<Order> OrderList = adminService.GetAllOrder(index);
        int osum = 0;
        for(Order i :OrderList){
            osum++;
        }
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"删除订单："+request.getParameter("oid"));
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
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"查看商品");
        session.setAttribute("ProductList",ProductList);
        session.setAttribute("psum",psum);
        request.getRequestDispatcher("admin_product.jsp").forward(request,response);
    }
    public void DeleteProductByPid(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        Integer pid = Integer.valueOf(request.getParameter("Pid"));
        adminService.DeleteProductByPid(pid);
        List<Product> ProductList = adminService.GetAllProduct();
        int psum = 0;
        for(Product i :ProductList){
            psum++;
        }
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"删除用户："+request.getParameter("uid"));
        session.setAttribute("ProductList",ProductList);
        session.setAttribute("psum",psum);
        request.getRequestDispatcher("admin_product.jsp").forward(request,response);
    }
    public void logout(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String ip = (String)session.getAttribute("adminip");
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
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"查看商户");
        session.setAttribute("MerchantList",MerchantList);
        session.setAttribute("merchantsum",merchantsum);
        request.getRequestDispatcher("admin_merchant.jsp").forward(request,response);
    }
    public void DeleteMerchantByName(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        Integer mid = Integer.valueOf(request.getParameter("mid"));
        adminService.DeleteMerchantByMid(mid);
        List<Merchant> MerchantList = adminService.GetAllMerchant();
        int merchantsum = 0;
        for(Merchant i :MerchantList){
            merchantsum++;
        }
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"删除商户："+request.getParameter("mid"));
        session.setAttribute("UserList",MerchantList);
        session.setAttribute("usersum",merchantsum);
        request.getRequestDispatcher("admin_merchant.jsp").forward(request,response);
    }
    public void NewMerchant(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        String merchantname = request.getParameter("merchantname");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        merchantService.NewMerchant(merchantname,password,name);
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"新建商户："+request.getParameter("merchantname"));
        request.getRequestDispatcher("admin_index.jsp").forward(request,response);
    }

    public void Statistics(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        System.out.println(System.getProperty("user.dir"));
        String parameter = "python C:\\Users\\UNVS\\Desktop\\test\\try.py ";
        List<Integer> forecast = new ArrayList<>();
        Integer temp = 0;
        for (int i = 14;i>0;i--){
            temp = orderService.GetOrderNum(i);
            forecast.add(temp);
            parameter += " " + String.valueOf(temp);
        }
        System.out.println(parameter);
        Process pr = null;
        try{
            pr = Runtime.getRuntime().exec(parameter);
            BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
            String line = null;
            while((line = in.readLine())!=null){
                forecast.add(Integer.valueOf(line));
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        String data_sell = "data:[";
        for (Integer i : forecast){
            data_sell += String.valueOf(i) + ",";
        }
        data_sell += "],";
        String data_date = "data:[";
        Calendar now = Calendar.getInstance();
        data_date = "\'" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DAY_OF_MONTH) +"\'";
        for (int i =0; i<14;i++){
            now.add(Calendar.DAY_OF_YEAR, -1);
            data_date = "\'" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DAY_OF_MONTH) +"\'," + data_date ;
        }
        now = Calendar.getInstance();
        for (int i = 0;i<2;i++){
            now.add(Calendar.DAY_OF_YEAR, 1);
            data_date = data_date+ ",\'" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DAY_OF_MONTH) +"\'";
        }
        data_date = "data:[" + data_date + "],";
        session.setAttribute("data_sell",data_sell);
        session.setAttribute("data_date",data_date);
        String merchant_turnover = orderService.GetMerchantTurnover();
        String type_turnover = orderService.GetTypeTurnOver();
        String merchant_num = orderService.GetMerchantNum();
        String type_num = orderService.GetTypeNum();
        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"查看统计数据");
        session.setAttribute("merchant_turnover",merchant_turnover);
        session.setAttribute("type_turnover",type_turnover);
        session.setAttribute("merchant_num",merchant_num);
        session.setAttribute("type_num",type_num);
        request.getRequestDispatcher("admin_statistics.jsp").forward(request,response);
    }
    public void TypeAdjust(HttpServletRequest request,HttpServletResponse response) throws SQLException,ServletException,IOException{
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null){
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        List<ProductType> producttype= new ArrayList<>();
        producttype = productTypeService.findall();
        session.setAttribute("TypeList",producttype);
        request.getRequestDispatcher("admin_typeadjust.jsp").forward(request,response);
    }
    public void DeleteType(HttpServletRequest request,HttpServletResponse response) throws SQLException,IOException,ServletException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("admin_login.jsp");
        }
        String type = request.getParameter("Type");
        productTypeService.DeleteProductType(type);
        List<ProductType> producttype= new ArrayList<>();
        producttype = productTypeService.findall();

        String ip = (String)session.getAttribute("adminip");
        operationService.NewOperation("管理员："+admin.getName(),ip,"删除商品类型："+request.getParameter("type"));
        session.setAttribute("TypeList",producttype);
        request.getRequestDispatcher("admin_typeadjust.jsp").forward(request,response);
    }
    public void NewType(HttpServletRequest request,HttpServletResponse response) throws SQLException,IOException,ServletException{
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("admin_login.jsp");
        }
        String type = request.getParameter("type");
        Boolean result = productTypeService.NewProductType(type);
        if (result == true){
            List<ProductType> producttype= new ArrayList<>();
            producttype = productTypeService.findall();

            String ip = (String)session.getAttribute("adminip");
            operationService.NewOperation("管理员："+admin.getName(),ip,"新建商品类型"+request.getParameter("type"));
            session.setAttribute("TypeList",producttype);
            request.getRequestDispatcher("admin_typeadjust.jsp").forward(request,response);
        }
        else{
            request.setAttribute("msg","类型已存在");
            request.getRequestDispatcher("admin_typeadjust.jsp").forward(request,response);
        }
    }
    public void OperationLog(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null){
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        List<Operation> operationList = operationService.ShowAllOperation();
        Integer logsum = operationList.size();
        session.setAttribute("OperationList",operationList);
        session.setAttribute("logsum",logsum);
        request.getRequestDispatcher("admin_operation.jsp").forward(request,response);
    }
    public void Warning(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException,SQLException{
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null){
            request.getRequestDispatcher("admin_login.jsp").forward(request,response);
        }
        List<Order> warningList = orderService.Warning();
        Integer warningsum = warningList.size();
        System.out.println(warningsum);
        session.setAttribute("WarningList",warningList);
        session.setAttribute("warningsum",warningsum);
        request.getRequestDispatcher("admin_warning.jsp").forward(request,response);
    }
}
