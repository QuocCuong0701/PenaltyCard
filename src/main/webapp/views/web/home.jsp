<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang chủ</title>
</head>
<body>
<!-- SUPPORT AREA -->
<div class="support-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-12">
                <div class="single-support">
                    <div class="sigle-support-icon">
                        <p><i class="fa fa-plane"></i></p>
                    </div>
                    <div class="sigle-support-content">
                        <h2>MIỄN PHÍ GIAO HÀNG </h2>
                        <p>Cho Hóa Đơn Trên 500k</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-12">
                <div class="single-support">
                    <div class="sigle-support-icon">
                        <p><i class="fa fa-dollar"></i></p>
                    </div>
                    <div class="sigle-support-content">
                        <h2>MIỄN PHÍ GIAO HÀNG </h2>
                        <p>Đăm Bảo Hoàn Lại Tiền</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-12">
                <div class="single-support">
                    <div class="sigle-support-icon">
                        <p><i class="fa fa-clock-o"></i></p>
                    </div>
                    <div class="sigle-support-content">
                        <h2>HỖ TRỢ 24/7</h2>
                        <p>Tư Vấn Trực Tuyến</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 hidden-sm col-xs-12">
                <div class="single-support">
                    <div class="sigle-support-icon">
                        <p><i class="fa fa-umbrella"></i></p>
                    </div>
                    <div class="sigle-support-content">
                        <h2>MUA SẮM AN TOÀN</h2>
                        <p>Đảm Bảo An Toàn Khi Mua Sắm</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Slider AREA -->
<div class="slider-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3">
                <div class="slider-left">
                    <h2>Đề Xuất Hôm Nay</h2>
                    <div id="owl-slider-left" class="owl-carousel">
                        <c:forEach var="twoLatestProduct" items="${twoLatestProduct.listResult}">
                            <div class="slider-left-carousel">
                                <div class="slider-left-product">
                                    <a href="<c:url value="/product-detail?product_id=${twoLatestProduct.product_id}"/>">
                                        <img style="width: 242px;height: 269px;" src="<c:url value="${twoLatestProduct.product_image}"/>" alt="product" />
                                    </a>
                                    <div class="slider-product-button">
                                        <p class="add-chart"><a href="<c:url value="cart?act=add&product_id=${twoLatestProduct.product_id}"/>">Thêm Vào Giỏ</a></p>
                                    </div>
                                </div>
                                <p class="view-details"><a href="<c:url value="/product-detail?product_id=${twoLatestProduct.product_id}"/>">Xem Chi Tiết</a></p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-9">
                <!-- Main Slider -->
                <div class="main-slider">
                    <div class="slider">
                        <div id="mainSlider" class="nivoSlider slider-image">
                            <img src="<c:url value="/template/web/img/slider/slider-image-3.jpg"/>" alt="main slider" title="#htmlcaption1"/>
                            <img src="<c:url value="/template/web/img/slider/sliser-image-2.1.png"/>" alt="main slider" title="#htmlcaption2"/>
                        </div>
                        <div id="htmlcaption1" class="nivo-html-caption slider-caption-1">
                            <div class="slider-progress"></div>
                            <div class="slide-text">
                                <div class="middle-text">
                                    <div class="cap-title wow slideInRight" data-wow-duration=".9s" data-wow-delay="0s">
                                        <h2>Dòng Sản Phẩm Mới</h2>
                                    </div>
                                    <div class="cap-dec wow slideInRight" data-wow-duration="1.1s" data-wow-delay="0s">
                                        <p>Được Chiết Xuất</p>
                                        <h1>Tự Nhiên</h1>
                                    </div>
                                    <div class="cap-readmore animated bounceIn" data-wow-duration="1.5s" data-wow-delay=".5s">
                                        <a href="<c:url value="/product?category_id=3"/>">Xem chi tiết</a>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-image">
                                <img class="wow slideInUp"  data-wow-duration="1.5s" data-wow-delay="0s" src="<c:url value="/template/web/img/slider/hiclipart.png"/>" alt="slider caption" />
                            </div>
                        </div>
                        <div id="htmlcaption2" class="nivo-html-caption slider-caption-2">
                            <div class="slider-progress"></div>
                            <div class="slide-text">
                                <div class="middle-text">
                                    <div class="cap-title wow slideInRight" data-wow-duration=".9s" data-wow-delay="0s">
                                        <h2>Sản Phẩm Làm Đẹp Da</h2>
                                    </div>
                                    <div class="cap-dec wow slideInRight" data-wow-duration="1.1s" data-wow-delay="0s">
                                        <p>Nhập Khẩu Từ</p>
                                        <h1>Hàn Quốc</h1>
                                    </div>
                                    <div class="cap-readmore animated bounceIn" data-wow-duration="1.5s" data-wow-delay=".5s">
                                        <a href="<c:url value="/product?page=1"/>">Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                            <div class="slide-image slide2-image">
                                <img class="wow slideInUp"  data-wow-duration="1.5s" data-wow-delay="0s" src="<c:url value="/template/web/img/slider/hiclipart1.png"/>" alt="slider caption" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Product AREA -->
<div class="product-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4">
                <div class="product-catagori-area">
                    <div class="product-categeries">
                        <h2>Thể Loại</h2>
                        <div class="panel-group" id="accrodian">
                            <c:forEach var="categories" items="${categories.listResult}">
                                <div class="panel panel-default">
                                    <a href="<c:url value="/product?category_id=${categories.category_id}"/>" class="panel-heading">
                                        <h4 class="panel-title" style="text-transform: capitalize;">
                                            <i class="fa fa-heart"></i> ${categories.category_name}
                                        </h4>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="best-seller-area">
                        <h2 class="header-title">Bán Chạy Nhất</h2>
                        <c:forEach var="bestSeller" items="${bestSeller.listResult}">
                            <div class="best-sell-product" >
                                <div class="best-product-img" style="width: 75px; height: 100px">
                                    <a href="<c:url value="/product-detail?product_id=${bestSeller.product_id}"/>">
                                        <img src="<c:url value="${bestSeller.product_image}"/>" alt="Best Seller">
                                    </a>
                                </div>
                                <div class="best-product-content">
                                    <h2><a href="<c:url value="/product-detail?product_id=${bestSeller.product_id}"/>">${bestSeller.product_name}</a></h2>
                                    <h3><fmt:formatNumber pattern="###,###" value="${bestSeller.product_price}"/> đ</h3>
                                    <div class="best-product-rating">
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star"></i></a>
                                        <a href="#"><i class="fa fa-star-o"></i></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <p class="view-details">
                            <a href="<c:url value="/product?page=1"/>">Xem Chi Tiết</a>
                        </p>
                    </div>
                    <%--<div class="add-kids single-add">
                        <a href="#"><img src="<c:url value="/template/web/img/banner/kids-ad.jpg"/>" alt="add"></a>
                    </div>--%>
                    <div class="subscribe-area">
                        <h2>Đăng Ký Để Nhận Thông Tin Mới Nhất</h2>
                        <form action="#">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="E-mail">
                                <button type="button" class="btn"><i class="fa fa-envelope-o"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="product-items-area">
                    <div class="product-items">
                        <h2 class="product-header">${category1.category_name}</h2>
                        <div class="row">
                            <div id="product-slider" class="owl-carousel">
                                <c:forEach var="list1" items="${list1.listResult}">
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <div class="single-product-img">
                                                <a href="<c:url value="/product-detail?product_id=${list1.product_id}"/>">
                                                    <img class="primary-img" src="<c:url value="${list1.product_image}"/>" alt="product">
                                                    <img class="secondary-img" src="<c:url value="${list1.product_image}"/>" alt="product">
                                                </a>
                                                <div class="single-product-action">
                                                    <a href="<c:url value="/product-detail?product_id=${list1.product_id}"/>"><i class="fa fa-external-link"></i></a>
                                                    <a href="<c:url value="/cart?act=add&product_id=${list1.product_id}"/>"><i class="fa fa-shopping-cart"></i></a>
                                                </div>
                                            </div>
                                            <div class="single-product-content">
                                                <div class="product-content-left">
                                                    <h2>${category1.category_name}</h2>
                                                    <p><a href="<c:url value="/product-detail?product_id=${list1.product_id}"/>">${list1.product_name}</a></p>
                                                </div>
                                                <div class="product-content-right">
                                                    <h3><fmt:formatNumber pattern="###,###" value="${list1.product_price}"/> đ</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="product-items">
                        <h2 class="product-header">${category2.category_name}</h2>
                        <div class="row">
                            <div id="product-slider-two" class="owl-carousel">
                                <c:forEach var="list2" items="${list2.listResult}">
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <div class="single-product-img">
                                                <a href="<c:url value="/product-detail?product_id=${list2.product_id}"/>">
                                                    <img class="primary-img" src="<c:url value="${list2.product_image}"/>" alt="product">
                                                    <img class="secondary-img" src="<c:url value="${list2.product_image}"/>" alt="product">
                                                </a>
                                                <div class="single-product-action">
                                                    <a href="<c:url value="/product-detail?product_id=${list2.product_id}"/>"><i class="fa fa-external-link"></i></a>
                                                    <a href="<c:url value="/cart?act=add&product_id=${list2.product_id}"/>"><i class="fa fa-shopping-cart"></i></a>
                                                </div>
                                            </div>
                                            <div class="single-product-content">
                                                <div class="product-content-left">
                                                    <h2>${category2.category_name}</h2>
                                                    <p><a href="<c:url value="/product-detail?product_id=${list2.product_id}"/>">${list2.product_name}</a></p>
                                                </div>
                                                <div class="product-content-right">
                                                    <h3><fmt:formatNumber pattern="###,###" value="${list2.product_price}"/> đ</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="arrivals-area single-add">
                        <a href="#"> <img src="<c:url value="/template/web/img/banner/banner.jpg"/>" alt="arrivals"> </a>
                    </div>
                    <div class="product-items">
                        <h2 class="product-header">${category3.category_name}</h2>
                        <div class="row">
                            <div id="product-slider-women" class="owl-carousel">
                                <c:forEach var="list3" items="${list3.listResult}">
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <div class="single-product-img">
                                                <a href="<c:url value="/product-detail?product_id=${list3.product_id}"/>">
                                                    <img class="primary-img" src="<c:url value="${list3.product_image}"/>" alt="product">
                                                    <img class="secondary-img" src="<c:url value="${list3.product_image}"/>" alt="product">
                                                </a>
                                                <div class="single-product-action">
                                                    <a href="<c:url value="/product-detail?product_id=${list3.product_id}"/>"><i class="fa fa-external-link"></i></a>
                                                    <a href="<c:url value="/cart?act=add&product_id=${list3.product_id}"/>"><i class="fa fa-shopping-cart"></i></a>
                                                </div>
                                            </div>
                                            <div class="single-product-content">
                                                <div class="product-content-left">
                                                    <h2>${category3.category_name}</h2>
                                                    <p><a href="<c:url value="/product-detail?product_id=${list3.product_id}"/>">${list3.product_name}</a></p>
                                                </div>
                                                <div class="product-content-right">
                                                    <h3><fmt:formatNumber pattern="###,###" value="${list3.product_price}"/> đ</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="product-items">
                        <h2 class="product-header">${category4.category_name}</h2>
                        <div class="row">
                            <div id="product-slider-kids" class="owl-carousel">
                                <c:forEach var="list4" items="${list4.listResult}">
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <div class="single-product-img">
                                                <a href="<c:url value="/product-detail?product_id=${list4.product_id}"/>">
                                                    <img class="primary-img" src="<c:url value="${list4.product_image}"/>" alt="product">
                                                    <img class="secondary-img" src="<c:url value="${list4.product_image}"/>" alt="product">
                                                </a>
                                                <div class="single-product-action">
                                                    <a href="<c:url value="/product-detail?product_id=${list4.product_id}"/>"><i class="fa fa-external-link"></i></a>
                                                    <a href="<c:url value="/cart?act=add&product_id=${list4.product_id}"/>"><i class="fa fa-shopping-cart"></i></a>
                                                </div>
                                            </div>
                                            <div class="single-product-content">
                                                <div class="product-content-left">
                                                    <h2>${category4.category_name}</h2>
                                                    <p><a href="<c:url value="/product-detail?product_id=${list4.product_id}"/>">${list4.product_name}</a></p>
                                                </div>
                                                <div class="product-content-right">
                                                    <h3><fmt:formatNumber pattern="###,###" value="${list4.product_price}"/> đ</h3>
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
</body>
</html>
