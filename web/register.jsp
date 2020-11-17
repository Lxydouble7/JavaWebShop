<%--
  Created by IntelliJ IDEA.
  User: 86438
  Date: 2020/11/4
  Time: 19:39
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
            <h5 class="modal-title" id="exampleModalLabel">注册</h5>
            <a type="button" class="close" data-dismiss="modal" aria-label="Close" href="index.jsp">
                <span aria-hidden="true">&times;</span>
            </a>
        </div>
        <div class="modal-body">
            <div class="register-form">
                <form method="post" action="${pageContext.request.contextPath}/user?method=register">
                    <div class="fields-grid">
                        <div class="styled-input">
                            <input type="text" placeholder="用户名" name="username" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="密码" name="password" required="">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="姓名" name="name" required="">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="邮箱" name="email" required="">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="手机号" name="telephone" required="">
                        </div>
                        <div class="styled-input" >
                            <input type="text" placeholder="地址" name="address" required="">
                        </div>
                        <div class="styled-input"style="margin-bottom: 30px">
                            <a style="color:#5a5656;font-size:16px">生日</a>
                            <input type="date" placeholder="生日" name="birthday" required="">
                        </div>

                        <div class="styled-input ">
                            <a style="color:#5a5656;font-size:16px">性别</a>
                            <select name="gender" required="">
                                <option value ="男">男</option>
                                <option value ="女">女</option>
                            </select>
                        </div>
                        <c:if test="${msg!=null}">
                            <div class="form-group">
                                <div class="col-sm-6">
                                    <span style="color:red">${msg}</span>
                                </div>
                            </div>
                        </c:if>
                        <button type="submit" class="btn subscrib-btnn">注册</button>
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
