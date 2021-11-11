<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>404</title>
</head>
<body>
<!-- Breadcurb AREA -->
<div class="breadcurb-area">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="<c:url value="/home"/>">Trang chủ</a></li>
            <li>Lỗi 404</li>
        </ul>
    </div>
</div>
<!-- 404 AREA -->
<div class="not-found-area fix">
    <div class="container">
        <div class="not-found">
            <h1>Xin lỗi vì sự cố này.</h1>
            <img src="<c:url value="/template/web/img/404.png"/>" alt="404">
            <h2>${errorMessage}</h2>
            <%--<p>Nhấn nút <a href="" class="a-refresh" onclick="location.reload()"><i class="fa fa-refresh"></i> Làm mới</a> để tiếp tục!</p>
            <p>Hoặc</p>--%>
            <a href="<c:url value="/home"/>">Quay về Trang chủ</a>
        </div>
    </div>
</div>
</body>
</html>
