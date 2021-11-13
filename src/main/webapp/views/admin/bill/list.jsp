<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-bill"/>
<c:url var="BillURL" value="/admin-bill"/>
<c:url var="BillDetailURL" value="/api-admin-billDetail"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách đơn hàng</title>
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
                    <a href="<c:url value="/admin-bill?type=list"/>">Quản Lý Đơn Hàng</a>
                </li>
                <li class="separator">
                    <i class="flaticon-right-arrow"></i>
                </li>
                <li class="nav-item">
                    <a href="#">Danh Sách Đơn Hàng</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <h4 class="card-title">Danh Sách Đơn Hàng</h4>
                            <%--<button id="btnDelete" class="btn btn-primary btn-round ml-auto btn-danger">
                                <i class="fa fa-trash-alt"></i> Xóa Tài Khoản
                            </button>--%>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="billsTable" class="display table table-striped table-hover" >
                                <thead>
                                <tr>
                                    <%--<th><input type="checkbox" class="checkAll" id="checkAll"></th>--%>
                                    <th>Mã đơn hàng</th>
                                    <th>Tên người nhận</th>
                                    <th>Địa chỉ nhân hàng</th>
                                    <th>Số điện thoại</th>
                                    <th>Ghi chú</th>
                                    <th>Ngày đặt đơn</th>
                                    <th>Ngày cập nhật</th>
                                    <th>Tình trạng</th>
                                    <th>Xem chi tiết</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="tddb" items="${model.listResult}">
                                    <tr>
                                        <%--<td><input type="checkbox" id="checkbox_${listProducts.user_id}" value="${listProducts.user_id}"></td>--%>
                                        <td>${tddb.bill_id }</td>
                                        <td>${tddb.full_name}</td>
                                        <td>${tddb.address}</td>
                                        <td>${tddb.phone}</td>
                                        <td>${tddb.note}</td>
                                        <td>${tddb.created_date}</td>
                                        <td>${tddb.updated_date}</td>
                                        <td>
                                            <c:if test="${tddb.confirmed == true}">
                                                <button class="btn btn-success" style="width: 156px;">
                                                    <span class="btn-label"><i class="fa fa-check"></i></span> Đã xác nhận
                                                </button>
                                            </c:if>
                                            <c:if test="${tddb.confirmed == false}">
                                                <button class="btn btn-danger" style="width: 156px;">
                                                    <span class="btn-label"><i class="fa fa-times"></i></span> Chưa xác nhận
                                                </button>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="${BillDetailURL}?type=list&bill_id=${tddb.bill_id}" class="btn btn-primary billDetails" data-toggle="modal" data-target="#billDetailModal">
                                                <i class="fa fa-info"></i>
                                            </a>
                                            <!-- Modal -->
                                            <div class="modal fade" id="billDetailModal" tabindex="-1" role="dialog" aria-hidden="true">
                                                <div class="modal-dialog" role="document" style="max-width: 1000px;">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">
                                                                <span class="fw-light">Thêm sản Phẩm</span>
                                                            </h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p class="large">Thông tin sản phẩm</p>
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Tên sản phẩm</th>
                                                                        <th>Giá(VND)</th>
                                                                        <th>Số lượng</th>
                                                                        <th>Tổng(VND)</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyBillDetail"></tbody>
                                                            </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <a href="<c:url value="${APIurl}?bill_id=${tddb.bill_id}"/>" id="btnConfirm" class="btn btn-primary btnConfirm"><i class="fa fa-check"></i> Xác nhận</a>
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Đóng</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>Tên người nhận</th>
                                    <th>Địa chỉ nhân hàng</th>
                                    <th>Số điện thoại</th>
                                    <th>Ghi chú</th>
                                    <th>Ngày đặt đơn</th>
                                    <th>Ngày cập nhật</th>
                                    <th>Tình trạng</th>
                                    <th>Xem chi tiết</th>
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
	    $('#billsTable').dataTable();
	});

	// See Bill Detail
    $('.billDetails').click(function (e) {
        e.preventDefault();
        $('#tbodyBillDetail').empty();
        let url = $(this).attr("href");
        $.get(url, function (data) {
            data.map(item=>{
                $('#tbodyBillDetail').append("<tr>" +
                    "<td>"+item.product_name+"</td>" +
                    "<td>"+parseInt(item.product_price).toLocaleString()+" đ</td>" +
                    "<td>"+item.quantity+"</td>" +
                    "<td>"+parseInt(item.product_price * item.quantity).toLocaleString()+" đ</td>" +
                    "</tr>");
                $('.btnConfirm').attr('href', "${APIurl}?bill_id="+item.bill_id+"");
            });
        });
    });

    $("#btnDelete").click(function () {
        let data = {};
        data['ids'] = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteBill(data);
    });

    function deleteBill(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${BillURL}?type=list&maxPageItem=10&page=1&message=delete_success";
            },
            error: function (error) {
                window.location.href = "${BillURL}?type=list&maxPageItem=10&page=1&message=error_system";
            }
        });
    }


    $('.btnConfirm').click(function (e) {
        e.preventDefault();
        let url = $(this).attr("href");
        updateBill(url);
    });

    function updateBill(url) {
        $.ajax({
            url: url,
            type: 'PUT',
            contentType: 'application/json',
            success: function (result) {
                window.location.href = "${BillURL}?type=list&message=update_success";
            },
            error: function (error) {
                window.location.href = "${BillURL}?type=list&message=error_system";
            }
        });
    }

</script>
</body>
</html>