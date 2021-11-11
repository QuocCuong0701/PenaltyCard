<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết sản phẩm</title>
</head>
<body>
    <!-- Breadcurb AREA -->
    <div class="breadcurb-area">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="<c:url value="/admin-home"/> ">Trang Chủ</a></li>
                <li><a href="<c:url value="/product?page=1"/>">Sản Phẩm</a></li>
                <li>Xem Chi Tiết Sản Phẩm</li>
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
                <div class="row">
                    <div class="col-md-5 col-sm-5">
                        <div class="product-item-tab">
                            <!-- Tab panes -->
                            <div class="single-tab-content">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="img-one"><img src="<c:url value="${model.product_image}"/>" alt="tab-img"></div>
                                    <div role="tabpanel" class="tab-pane" id="img-two"><img src="<c:url value="/template/web/img/single-product/single-product-2.jpg"/>" alt="tab-img"></div>
                                    <div role="tabpanel" class="tab-pane" id="img-three"><img src="<c:url value="/template/web/img/single-product/single-product-1.jpg"/>" alt="tab-img"></div>
                                </div>
                            </div>
                            <!-- Nav tabs -->
                            <div class="single-tab-img"></div>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-7">
                        <div class="product-tab-content">
                            <div class="product-tab-header">
                                <h1>${model.product_name}</h1>
                                <div class="best-product-rating">
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <p>(3 khách hàng đánh giá)</p>
                                </div>
                                <h3><fmt:formatNumber type="number" pattern="###,###" value="${model.product_price}"/> đ</h3>
                            </div>
                            <div class="product-item-code">
                                <p>Tình trạng :   Còn hàng</p>
                            </div>
                            <div class="product-item-details">
                                <p>${model.product_description}</p>
                            </div>
                            <div class="available-option">
                                <div class="wishlist-icon">
                                    <div class="single-wishlist">
                                        <a href="#"><i class="fa fa-heart"></i></a>
                                        <p>Ưa Thích</p>
                                    </div>
                                    <div class="single-wishlist">
                                        <a href="#"><i class="fa fa-signal"></i></a>
                                        <p>So Sánh</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 product-details">
                            <a href="<c:url value="/cart?act=add&product_id=${model.product_id}"/>">Thêm Vào Giỏ</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="description-tab">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#description" role="tab" data-toggle="tab">Mô Tả</a></li>
                                <li role="presentation"><a href="#information" role="tab" data-toggle="tab">Chi Tiết</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="description">
                                    ${model.product_description}
                                </div>
                                <div role="tabpanel" class="tab-pane" id="information">
                                    ${model.product_detail}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="single-product-slider similar-product">
                            <div class="product-items">
                                <h2 class="product-header">Sản Phẩm Tương Tự</h2>
                                <div class="row">
                                    <div id="singleproduct-slider" class="owl-carousel">
                                        <c:forEach var="similarProduct" items="${similarProducts.listResult}">
                                            <div class="col-md-4">
                                                <div class="single-product">
                                                    <div class="single-product-img">
                                                        <a href="<c:url value="/product-detail?product_id=${similarProduct.product_id}"/>">
                                                            <img class="primary-img" src="<c:url value="${similarProduct.product_image}"/>" alt="product">
                                                            <img class="secondary-img" src="<c:url value="${similarProduct.product_image}"/>" alt="product">
                                                        </a>
                                                        <div class="single-product-action">
                                                            <a href="<c:url value="/product-detail?product_id=${similarProduct.product_id}"/>"><i class="fa fa-external-link"></i></a>
                                                            <a href="<c:url value="/cart?act=add&product_id=${similarProduct.product_id}"/>"><i class="fa fa-shopping-cart"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="single-product-content">
                                                        <div class="product-content-left">
                                                            <p><a href="<c:url value="/product-detail?product_id=${similarProduct.product_id}"/>">${similarProduct.product_name}</a></p>
                                                        </div>
                                                        <div class="product-content-right">
                                                            <h3><fmt:formatNumber pattern="###,###" value="${similarProduct.product_price}"/> đ</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
