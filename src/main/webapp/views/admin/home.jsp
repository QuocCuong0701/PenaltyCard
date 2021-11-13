<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang quản trị</title>
</head>
<body>
    <div class="content">
        <div class="panel-header bg-primary-gradient">
            <div class="page-inner py-5">
                <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                    <div>
                        <h2 class="text-white pb-2 fw-bold">Bảng điều khiển</h2>
                        <h5 class="text-white op-7 mb-2">Dành cho quản trị viên</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="display: none;">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <h4 class="card-title">Danh Sách Thẻ Phạt</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="usersTable" class="display table table-striped table-hover" >
                                <thead>
                                <tr>
                                    <th><input type="checkbox" class="checkAll" id="checkAll"></th>
                                    <th>Tên Đăng Nhập</th>
                                    <th>Email</th>
                                    <th>Mật Khẩu</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="sanDau" items="${sanDaus}">
                                        <tr>
                                            <td><input type="checkbox" id="checkbox_${sanDau.id}" value="${sanDau.id}"></td>
                                            <td>${sanDau.maSan}</td>
                                            <td>${sanDau.tenSan}</td>
                                            <td>${sanDau.diaChi}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>