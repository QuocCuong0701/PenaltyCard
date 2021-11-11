<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sản phẩm</title>
</head>
<body>
<form action="<c:url value='/product'/>" id="formListProducts" method="get">
    <!-- Breadcurb AREA -->
    <div class="breadcurb-area">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="<c:url value="/admin-home"/> ">Trang Chủ</a></li>
                <li>Sản Phẩm</li>
            </ul>
        </div>
    </div>
    <!-- Product Item AREA -->
    <div class="product-item-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4">
                <div class="product-item-categori">
                    <div class="product-type">
                        <h2>Thể Loại</h2>
                        <ul>
                            <c:forEach var="categories" items="${categories.listResult}">
                                <li><a href="<c:url value="/product?category_id=${categories.category_id}"/>"><i class="fa fa-angle-right"></i><span style="text-transform: capitalize;">${categories.category_name}</span></a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <%--<div class="add-shop">
                    <div class="add-kids single-add">
                        <a href="#"><img src="<c:url value="/template/web/img/banner/kids-ad.jpg/"/>" alt="add"></a>
                    </div>
                    <div class="add-dress single-add">
                        <a href="#"><img src="<c:url value="/template/web/img/banner/kids-ad-2.jpg"/>" alt="add"></a>
                    </div>
                </div>--%>
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="product-item-list">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="product-item-heading">
                                <div class="item-heading-title">
                                    <h2>Danh Sách Sản Phẩm</h2>
                                </div>
                                <div class="result-short-view">
                                    <div class="result-short">
                                        <div class="result-short-selection">
                                            <select value="Sắp xếp" id="sort-selection">
                                                <option value="/product?page=1">Mặc định</option>
                                                <option value="/product?page=1&sortName=product_price&sortBy=desc">Giá cao</option>
                                                <option value="/product?page=1&sortName=product_price&sortBy=asc">Giá thấp</option>
                                                <option value="/product?page=1&sortName=buy&sortBy=desc">Độ phổ biến</option>
                                            </select>
                                            <i class="fa fa-sort-alpha-asc"></i>
                                        </div>
                                    </div>
                                    <div class="view-mode">
                                        <a href="<c:url value="/product?page=1"/>" class="active" title="Dạng lưới"><i class="fa fa-th-large"></i></a>
                                        <a href="<c:url value="/single-shop?page=1"/>" title="Dạng danh sách"><i class="fa fa-th-list"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="listProducts" items="${model.listResult}">
                            <div class="col-md-4 col-sm-6">
                                <div class="single-item-area">
                                    <div class="single-item">
                                        <div class="product-item-img">
                                            <a href="<c:url value="/product-detail?product_id=${listProducts.product_id}"/>">
                                                <c:if test="${listProducts.product_image != null}">
                                                    <img class="primary-img" src="<c:url value="${listProducts.product_image}"/>" alt="item" style="width: 264px;height: 230px;" />
                                                    <img class="secondary-img" src="<c:url value="${listProducts.product_image}"/>" alt="item" style="width: 264px; height: 230px;" />
                                                </c:if>
                                                <c:if test="${listProducts.product_image == null}">
                                                    <img class="primary-img" src="<c:url value="/template/web/img/notfound.png"/>" alt="item" style="width: 264px;height: 230px;" />
                                                </c:if>
                                            </a>
                                            <div class="product-item-action">
                                                <a href="<c:url value="/product-detail?product_id=${listProducts.product_id}"/>"><i class="fa fa-external-link"></i></a>
                                                <a href="<c:url value="/cart?act=add&product_id=${listProducts.product_id}"/>"><i class="fa fa-shopping-cart"></i></a>
                                            </div>
                                        </div>
                                        <div class="single-item-content">
                                            <h2><a href="<c:url value="/product-detail?product_id=${listProducts.product_id}"/>">${listProducts.product_name}</a></h2>
                                            <div class="best-product-rating">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <h3><fmt:formatNumber type="number" pattern="###,###" value="${listProducts.product_price}"/> đ</h3>
                                        </div>
                                    </div>
                                    <div class="item-action-button fix">
                                        <a href="<c:url value="/cart?act=add&product_id=${listProducts.product_id}"/>">Thêm Vào Giỏ</a>
                                        <div class="item-action-icon">
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-signal"></i></a>
                                            <a href="#"><i class="fa fa-search"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="shop-pagination floatright">
                    <ul class="pagination" id="pagination"></ul>
                    <input type="hidden" value="" id="page" name="page"/>
                    <input type="hidden" value="${model.sortName}" id="sortName" name="sortName"/>
                    <input type="hidden" value="${model.sortBy}" id="sortBy" name="sortBy"/>
                </div>
            </div>
        </div>
    </div>
</div>
</form>

    <script>
        let totalPages = ${model.totalPage};
        let currentPage = ${model.page};
        jQuery(document).ready(function ($) {
            window.pagObj = $('#pagination').twbsPagination({
                totalPages: totalPages,
                visiblePages: 9,
                startPage: currentPage,
                onPageClick: function (event, page) {
                    if (currentPage !== page) {
                        $('#page').val(page);
                        $('#formListProducts').submit();
                    }
                }
            });
        });

        $('#sort-selection').change(function (e) {
           e.preventDefault();
           window.location.href = $('#sort-selection').val();
        });
    </script>
</body>
</html>
