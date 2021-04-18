<%@ page import="com.unvs.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: UNVS
  Date: 2021/4/18
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%@
        include file="header.jsp"
%>
<body>
<%@
        include file="top.jsp"
%>
<%
    Product product = (Product)session.getAttribute("product") ;
%>
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">修改商品</h5>
            <a type="button" class="close" data-dismiss="modal" aria-label="Close" href="merchant_index.jsp">
                <span aria-hidden="true">&times;</span>
            </a>
        </div>
        <div class="modal-body">
            <div class="register-form">
                <form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/product?method=AlterProduct">
                    <div class="fields-grid">
                        <div class="styled-input">
                            <input type="text" placeholder="商品名称" name="pname" required="" value="<%=product.getPname()%>">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="价格" name="price" required="" value="<%=product.getPrice()%>">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="介绍" name="intro" required="" value="<%=product.getIntro()%>">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="库存" name="stock" required="" value="<%=product.getStock()%>">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="描述" name="description" required="" value="<%=product.getDescription()%>">
                        </div>
                        <div class="styled-input ">
                            <a style="color:#5a5656;font-size:16px" >类型</a>
                            <select name="type" required="" value="<%=product.getType()%>">
                                <c:forEach items="${ProductTypeList}" var ="pt">
                                    <option value = ${pt.type}>${pt.type}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="styled-input" style="margin-top: 10px">
                            <a style="color: #117a8b">封面</a>
                            <input type="file" placeholder="封面" name="image" accept=".jpg, .jpeg, .png"required="" value="<%=product.getImage()%>">
                        </div>
                        <div class="styled-input" style="margin-top: 10px">
                            <a style="color: #117a8b">图片</a>
                            <input type="file" placeholder="图片1" name="image1" accept=".jpg, .jpeg, .png"required="" value="<%=product.getImage1()%>">
                        </div>
                        <div class="styled-input" style="margin-top: 10px">
                            <a style="color: #117a8b">图片</a>
                            <input type="file" placeholder="图片2" name="image2" accept=".jpg, .jpeg, .png"required="" value="<%=product.getImage2()%>">
                        </div>
                        <c:if test="${msg!=null}">
                            <div class="form-group">
                                <div class="col-sm-6">
                                    <span style="color:red">${msg}</span>
                                </div>
                            </div>
                        </c:if>
                        <button type="submit" class="btn subscrib-btnn">提交</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <a type="button" class="btn btn-secondary" data-dismiss="modal" href="merchant_index.jsp">返回</a>
        </div>
    </div>
</div>
</body>
</html>


