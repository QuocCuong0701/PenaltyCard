<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var="UserURL" value="/admin-user"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách tài khoản</title>
</head>

<body>
<div class="content">
    <div class="page-inner">
        <div class="page-header">
            <ul class="breadcrumbs" style="margin-left: 0;">
                <li class="nav-home">
                    <a href="<c:url value="/admin-home"/> ">
                        <i class="flaticon-home"></i>
                    </a>
                </li>
                <li class="separator">
                    <i class="flaticon-right-arrow"></i>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/admin-user?type=list"/>">Quản Lý Tài Khoản</a>
                </li>
                <li class="separator">
                    <i class="flaticon-right-arrow"></i>
                </li>
                <li class="nav-item">
                    <a href="#">Danh Sách Người Dùng</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <h4 class="card-title">Danh Sách Tài Khoản</h4>
                            <button id="btnDelete" class="btn btn-primary btn-round ml-auto btn-danger">
                                <i class="fa fa-trash-alt"></i> Xóa Tài Khoản
                            </button>
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
                                    <th>Ngày Đăng Ký</th>
                                    <th>Ngày Cập Nhật</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="tddb" items="${model.listResult}">
                                    <tr>
                                        <td><input type="checkbox" id="checkbox_${tddb.user_id}" value="${tddb.user_id}"></td>
                                        <td>${tddb.user_name}</td>
                                        <td>${tddb.user_email}</td>
                                        <td>${tddb.user_pass}</td>
                                        <td>${tddb.created_date}</td>
                                        <td>${tddb.updated_date}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th></th>
                                    <th>Tên Đăng Nhập</th>
                                    <th>Email</th>
                                    <th>Mật Khẩu</th>
                                    <th>Ngày Đăng Ký</th>
                                    <th>Ngày Cập Nhật</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
       $('#usersTable').dataTable();
    });
    $("#btnDelete").click(function () {
        var data = {};
        var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['ids'] = ids;
        deleteUser(data);
    });

    function deleteUser(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${UserURL}?type=list&message=delete_success";
            },
            error: function (error) {
                window.location.href = "${UserURL}?type=list&message=error_system";
            }
        });
    }
</script>
</body>

</html>