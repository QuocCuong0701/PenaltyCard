<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="<c:url value="/template/web/img/img-01.png"/>" alt="IMG">
            </div>

            <form action="<c:url value="/login"/>" method="post" class="login100-form validate-form">
                <span class="login100-form-title">
                    Đăng Nhập
                </span>

                <c:if test="${not empty message}">
                    <div class="alert alert-${alert}" style="border-radius: 25px;">
                            ${message}
                    </div>
                </c:if>

                <div class="wrap-input100 validate-input" data-validate = "Tên đăng nhập sai hoặc không tồn tại">
                    <input class="input100" type="text" name="user_name" placeholder="Tên đăng nhập">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input" data-validate = "Nhập mật khẩu">
                    <input class="input100" type="password" name="user_pass" placeholder="Mật khẩu">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                </div>

                <div class="container-login100-form-btn">
                    <input type="hidden" value="login" name="action"/>
                    <button type="submit" class="login100-form-btn">
                        Đăng Nhập
                    </button>
                </div>

                <%--<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
                    <a class="txt2" href="#">
                        Username / Password?
                    </a>
                </div>--%>

                <div class="text-center p-t-100">
                    <a class="txt2" href="<c:url value="/registration"/> ">
                        Tạo Tài Khoản
                        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </a>
                    <a class="txt2" href="<c:url value="/home"/> ">
                        <i class="fa fa-long-arrow-left m-l-5" aria-hidden="true"></i>
                        Trang Chủ
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>