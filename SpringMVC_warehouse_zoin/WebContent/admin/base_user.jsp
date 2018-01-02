<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

            <div class="menu-right">
                <ul class="notification-menu">
                                <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img src="${pageContext.request.contextPath}/admin/images/photos/qq.png" alt="" />
                            	${user.userName }
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                            <li><a href="${pageContext.request.contextPath}/admin/user/profile.jsp"><i class="fa fa-user"></i>用户信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/logout"><i class="fa fa-sign-out"></i>退出</a></li>
                        </ul>
                    </li>
                                    </ul>
            </div>