<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Giỏ hàng</title>
</head>
<body>
    <!-- Breadcurb AREA -->
    <div class="breadcurb-area">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="<c:url value="/home"/>">Trang Chủ</a></li>
                <li>Giỏ Hàng</li>
            </ul>
        </div>
    </div>
    <!-- Chart AREA -->
    <c:set var="cart" value="${sessionScope.model}"/>
    <c:if test="${cart.size() > 0}">
        <div class="chart-area">
            <div class="container">
                <div class="row">
                    <form action="<c:url value="/cart?act=update"/>" method="post">
                        <div class="col-md-12">
                            <div class="chart-item table-responsive fix">
                                <table class="col-md-12">
                                    <thead>
                                    <tr>
                                        <th class="th-product">Hình Ảnh</th>
                                        <th class="th-details">Sản Phẩm</th>
                                        <th class="th-qty">Số Lượng</th>
                                        <th class="th-price">Giá</th>
                                        <th class="th-total">Tổng</th>
                                        <th class="th-delate">Xóa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="rows" items="${cart}">
                                        <input type="hidden" name="product_id" value="${rows.value.productModel.product_id}"/>
                                        <tr>
                                            <td class="th-product">
                                                <a href="<c:url value="/product-detail?product_id=${rows.value.productModel.product_id}"/>">
                                                    <img src="<c:url value="${rows.value.productModel.product_image}"/>" alt="cart">
                                                </a>
                                            </td>
                                            <td class="th-details">
                                                <h2><a href="<c:url value="/product-detail?product_id=${rows.value.productModel.product_id}"/>">
                                                        ${rows.value.productModel.product_name}</a>
                                                </h2>
                                                <div class="best-product-rating">
                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                    <a href="#"><i class="fa fa-star-o"></i></a>
                                                    <a href="#"><i class="fa fa-star-o"></i></a>
                                                </div>
                                            </td>
                                            <td class="th-qty">
                                                <input type="number" name="quantity" min="1" value="${rows.value.quantity}" placeholder="1"/>
                                            </td>
                                            <td class="th-price"><fmt:formatNumber pattern="###,###" value="${rows.value.productModel.product_price}"/> đ</td>
                                            <td class="th-total"><fmt:formatNumber pattern="###,###" value="${rows.value.productModel.product_price * rows.value.quantity}"/> đ</td>
                                            <td class="th-delate"><a href="<c:url value="/cart?act=remove&product_id=${rows.value.productModel.product_id}"/>"><i class="fa fa-trash"></i></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="cart-button">
                                <a href="<c:url value="/product?page=1"/>" class="btn"><i class="fa fa-arrow-left"></i> Tiếp Tục Mua Sắm</a>
                                <button type="submit" class="btn floatright"><i class="fa fa-refresh"></i> Cập Nhật Giỏ Hàng</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="row">
                    <div class="cart-shopping-area fix">
                        <div class="col-md-4 col-sm-4 floatright">
                            <div class="shopping-summary chart-all">
                                <div class="shopping-cost-area">
                                    <h2 style="width: 145px; float: right;">TỔNG GIỎ HÀNG</h2>
                                    <div class="shopping-cost">
                                        <div class="shopping-cost-left">
                                            <p>Tạm Tính </p>
                                            <p>Tổng </p>
                                        </div>
                                        <div class="shopping-cost-right">
                                            <p><fmt:formatNumber pattern="###,###" value="${sessionScope.totalPrice}"/> đ</p>
                                            <p><fmt:formatNumber pattern="###,###" value="${sessionScope.totalPrice}"/> đ</p>
                                        </div>
                                    </div>
                                    <a href="<c:url value="/checkout"/>" class="btn"><i class="fa fa-check"></i> Thanh Toán</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${cart.size() == 0 || cart == null}">
    <div class="chart-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <i>Không có sản phẩm nào trong giỏ.</i>
                    <div class="cart-button">
                        <a href="<c:url value="/product?page=1"/>" class="btn"><i class="fa fa-arrow-left"></i> Tiếp Tục Mua Sắm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>
</body>
</html>
