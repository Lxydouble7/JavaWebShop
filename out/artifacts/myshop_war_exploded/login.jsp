<%--
  Created by IntelliJ IDEA.
  User: 86438
  Date: 2020/11/2
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@
        include file="header.jsp"
%>
<body>
<%@
        include file="top.jsp"
%>
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Login</h5>
            <a type="button" class="close" data-dismiss="modal" aria-label="Close" href="index.jsp">
                <span aria-hidden="true">&times;</span>
            </a>
        </div>
        <div class="modal-body">
            <div class="register-form">
                <form method="post" action="${pageContext.request.contextPath}/user?method=login">
                    <div class="fields-grid">
                        <div class="styled-input">
                            <input type="text" placeholder="Your Name" name="username" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="password" name="password" required="">
                        </div>
                        <c:if test="${msg!=null}">
                            <div class="form-group">
                                <div class="col-sm-6">
                                    <span style="color:red">${msg}</span>
                                </div>
                            </div>
                        </c:if>
                        <button type="submit" class="btn subscrib-btnn">登录</button>
                        <a href="register.jsp" class="btn subscrib-btnn">注册</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <a type="button" class="btn btn-secondary" data-dismiss="modal" href="index.jsp">返回</a>
        </div>
    </div>
</div>
</body>
</html>
