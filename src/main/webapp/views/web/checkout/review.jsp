<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-billDetail"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết hóa đơn</title>
</head>
<body>
<!-- Breadcurb AREA -->
<div class="breadcurb-area">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="<c:url value="/home"/>">Trang Chủ</a></li>
            <li>Thanh Toán</li>
            <li>Xem Trước</li>
        </ul>
    </div>
</div>
<c:set var="cart" value="${sessionScope.model}"/>
<div class="Single-blog-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-8">
                <div class="single-blog-post-area fix">
                    <div class="single-blog-post fix">
                        <div class="single-blog-content fix">
                            <div class="blog-heading-title fix">
                                <h1>Vui lòng xem lại thông tin trước khi thanh toán.</h1>
                            </div>
                            <form id="submitForm" action="<c:url value="/execute_payment"/>" method="post">
                                <div class="blog-main-content fix">
                                    <h3 style="width: 1078px">Chi tiết giao dịch</h3>
                                    <table class="table table-bordered tableOrderReceived">
                                        <input type="hidden" name="paymentId" value="${param.paymentId}"/>
                                        <input type="hidden" name="PayerID" value="${param.PayerID}"/>
                                        <tbody>
                                        <tr>
                                            <td width="40%">Ghi chú</td>
                                            <td>${transaction.description}</td>
                                        </tr>
                                        <tr>
                                            <td>Tạm tính</td>
                                            <td><fmt:formatNumber pattern="###,###" value="${transaction.amount.details.subtotal}"/> đ
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tổng</td>
                                            <td><fmt:formatNumber pattern="###,###" value="${transaction.amount.total}"/> đ
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <h3>Thông tin người thanh toán</h3>
                                    <table class="table table-bordered tableOrderReceived">
                                        <tbody>
                                        <tr>
                                            <td width="40%">Họ và tên</td>
                                            <td>${payer.firstName} ${payer.lastName}</td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td>${payer.email}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <h3>Địa chỉ nhận hàng</h3>
                                    <address>${shippingAddress.recipientName} <br/>
                                        ${shippingAddress.line1}, ${shippingAddress.city}, ${shippingAddress.state}, ${shippingAddress.countryCode}<br/>
                                        Mã bưu điện: ${shippingAddress.postalCode}
                                    </address>
                                    <input type="hidden" name="user_id" value="${USERMODEL.user_id}"/>
                                    <input type="hidden" name="created_date" id="created_date" value=""/>
                                    <c:forEach var="rows" items="${cartModels}">
                                        <input name="product_id" type="hidden" value="${rows.value.productModel.product_id}">
                                    </c:forEach>
                                    <button id="btnSub" type="submit" class="btn">Đặt Hàng</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="single-blog-pagination shop-pagination"></div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#btnSub').click(function (e) {
        e.preventDefault();
        $('#created_date').val(Date.parse((new Date()).toISOString()));
        $('#submitForm').submit();
    });
</script>
</body>
</html>
