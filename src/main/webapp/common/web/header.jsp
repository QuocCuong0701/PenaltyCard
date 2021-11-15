<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!-- HEADER AREA -->
<c:set var="cart" value="${sessionScope.model}"/>
<div class="header-area">
    <div class="header-top-bar">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="header-top-left">
                        <div class="header-top-menu">
                            <ul class="list-inline">
                                <li><img src="<c:url value="/template/web/img/vietnam16.png"/>" alt="flag"></li>
                                <li class="dropdown"><a href="#" data-toggle="dropdown">Tiếng Việt</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Enlish</a></li>
                                        <li><a href="#">Spanish</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#" data-toggle="dropdown">VND</a>
                                    <ul class="dropdown-menu usd-dropdown">
                                        <li><a href="#">VND</a></li>
                                        <li><a href="#">USD</a></li>
                                        <li><a href="#">EUR</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <c:if test="${empty USERMODEL}">
                            <p>Chào mừng quý khách!</p>
                        </c:if>
                        <c:if test="${not empty USERMODEL}">
                            <p>Xin chào <span style="font-weight: bold">${USERMODEL.user_full_name}</span>!</p>
                        </c:if>
                    </div>
                </div>
                    <div class="col-md-8 col-sm-8 col-xs-12">
                    <div class="header-top-right">
                        <ul class="list-inline">
                            <c:if test="${not empty USERMODEL}">
                                <li><a id="accountPopup" data-trigger="focus" data-toggle="popover" href="#"><i class="fa fa-user"></i>Tài Khoản</a></li>
                                <c:if test="${cart.size() == 0 || cart == null}">
                                    <li><a href="<c:url value="/cart"/>"><i class="fa fa-check-square-o"></i>Thanh Toán</a> </li>
                                </c:if>
                                <c:if test="${cart.size()> 0}">
                                    <li><a href="<c:url value="/checkout"/>"><i class="fa fa-check-square-o"></i>Thanh Toán</a> </li>
                                </c:if>
                            </c:if>
                            <c:if test="${empty USERMODEL}">
                                <li><a href="<c:url value="#"/>"><i class="fa fa-lock"></i>Đăng Nhập</a></li>
                            </c:if>
                            <c:if test="${not empty USERMODEL}">
                                <li><a href="<c:url value="#"/>"><i class="fa fa-unlock"></i>Đăng Xuất</a></li>
                            </c:if>
                            <li><a href="<c:url value="/registration"/>"><i class="fa fa-pencil-square-o"></i>Đăng Ký</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-2 col-sm-2 col-xs-12">
                    <div class="header-logo">
                        <a href="<c:url value="/home"/>"><img src="<c:url value="/template/web/img/logo.png"/>" alt="logo"></a>
                    </div>
                </div>
                <div class="col-md-10 col-sm-10 col-xs-12">
                    <div class="search-chart-list">
                        <div class="catagori-menu">
                            <ul class="list-inline">
                                <li><i class="fa fa-search"></i></li>
                                <li>
                                    <select name="category_id" id="category-selection">
                                        <option value="">Thể Loại</option>
                                        <c:forEach var="categories" items="${categories.listResult}">
                                            <option value="${categories.category_id}">${categories.category_name}</option>
                                        </c:forEach>
                                    </select>
                                </li>
                            </ul>
                        </div>
                        <div class="header-search">
                            <form id="formSearch" action="<c:url value="/product?act=search"/>" method="post"></form>
                                <input id="searchProduct" name="product_name" type="text" placeholder="Tìm Kiếm Sản Phẩm"/>
                                <a href="" id="search"><i class="fa fa-search"></i></a>
                                <%--<button type="button"><i class="fa fa-search"></i></button>--%>
                        </div>
                        <div class="header-chart">
                            <ul class="list-inline">
                                <li><a href="<c:url value="/cart"/>"><i class="fa fa-cart-arrow-down"></i></a></li>
                                <li class="chart-li"><a href="<c:url value="/cart"/>">Giỏ Hàng</a>
                                    <ul>
                                        <li>
                                            <div class="header-chart-dropdown">
                                                <c:if test="${cart.size() == 0 || cart == null}">
                                                    <div class="header-chart-dropdown-list">
                                                        <i>Không có sản phẩm nào trong giỏ.</i>
                                                    </div>
                                                </c:if>
                                                <c:if test="${cart.size() > 0}">
                                                    <c:forEach var="rows" items="${cart}">
                                                        <div class="header-chart-dropdown-list">
                                                            <div class="dropdown-chart-left floatleft">
                                                                <a href="<c:url value="/product-detail?product_id=${rows.value.productModel.product_id}"/>">
                                                                    <img style="width: 70px; height: 83px;" src="<c:url value="${rows.value.productModel.product_image}"/>" alt="list">
                                                                </a>
                                                            </div>
                                                            <div class="dropdown-chart-right">
                                                                <h2><a href="<c:url value="/product-detail?product_id=${rows.value.productModel.product_id}"/>">${rows.value.productModel.product_name}</a></h2>
                                                                <h3>Số lượng: ${rows.value.quantity}</h3>
                                                                <h4><fmt:formatNumber pattern="###,###" value="${rows.value.quantity * rows.value.productModel.product_price}"/> đ</h4>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                                <div class="chart-checkout">
                                                    <c:set var="totalPrice" value="${sessionScope.totalPrice}"/>
                                                    <p>Tổng
                                                        <span>
                                                            <c:if test="${totalPrice !=0 }">
                                                                <fmt:formatNumber pattern="###,###" value="${totalPrice}"/>
                                                            </c:if>
                                                             <c:if test="${totalPrice == 0 || totalPrice == null}">
                                                                 0
                                                             </c:if>
                                                            đ</span>
                                                    </p>
                                                    <c:if test="${cart.size() == 0 || cart == null}">
                                                        <a href="<c:url value="/cart"/>" class="btn btn-default">Thanh Toán</a>
                                                    </c:if>
                                                    <c:if test="${cart.size()> 0}">
                                                        <a href="<c:url value="/checkout"/>" class="btn btn-default">Thanh Toán</a>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="#">
                                    <c:if test="${totalQuantity == 0 || totalQuantity == null}">
                                        0
                                    </c:if>
                                    <c:if test="${totalQuantity > 0}">
                                        ${totalQuantity}
                                    </c:if>
                                      sản phẩm</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- MAIN MENU AREA -->
<div class="main-menu-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main-menu hidden-xs">
                    <nav>
                        <ul>
                            <li><a href="<c:url value="/home"/>">Trang Chủ</a></li>
                            <li><a href="<c:url value="/product?page=1"/>">Sản Phẩm</a></li>
                            <li><a href="<c:url value="/product?category_id=9"/>">Nước Hoa Hồng</a></li>
                            <li><a href="<c:url value="/product?category_id=2"/>">Sữa Tắm</a></li>
                            <li><a href="<c:url value="/product?category_id=10"/>">Dưỡng Tay</a></li>
                            <li><a href="#">Trang</a>
                                <ul class="sub-menu">
                                    <li><a href="<c:url value="/contact"/>">Liên Hệ</a></li>
                                    <li><a href="<c:url value="/cart"/>">Giỏ Hàng</a></li>
                                </ul>
                            </li>
                            <li><a href="<c:url value="/about-us"/>">Giới Thiệu</a></li>
                        </ul>
                    </nav>
                </div>
                <!-- Mobile MENU AREA -->
                <div class="mobile-menu hidden-sm hidden-md hidden-lg">
                    <nav>
                        <ul>
                            <li><a href="<c:url value="/home"/>">Trang Chủ</a></li>
                            <li><a href="<c:url value="/product?page=1"/>">Sản Phẩm</a>
                                <ul>
                                    <li><a href="#">Shop Layouts</a>
                                        <ul>
                                            <li><a href="#">Full Width</a></li>
                                            <li><a href="#">Sidebar Left</a></li>
                                            <li><a href="#">Sidebar Right</a></li>
                                            <li><a href="#">List View</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Shop Pages</a>
                                        <ul>
                                            <li><a href="#">Category</a></li>
                                            <li><a href="#">My Account</a></li>
                                            <li><a href="#">Wishlist</a></li>
                                            <li><a href="#">Shopping Cart</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Product Types</a>
                                        <ul>
                                            <li><a href="#">Simple Product</a></li>
                                            <li><a href="#">Variable Product</a></li>
                                            <li><a href="#">Grouped Product</a></li>
                                            <li><a href="#">Downloadable</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="shop.html">Men</a></li>
                            <li><a href="shop.html">Women</a></li>
                            <li><a href="shop.html">Kids</a></li>
                            <li><a href="shop.html">gift</a></li>
                            <li><a href="blog-left-sidebar.html">Blog</a>
                                <ul>
                                    <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                                    <li><a href="blog-single.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Pages</a>
                                <ul>
                                    <li><a href="shop.html">Shop</a></li>
                                    <li><a href="shop.html">Men</a></li>
                                    <li><a href="shop.html">Women</a></li>
                                    <li><a href="shop.html">Kids</a></li>
                                    <li><a href="shop.html">Gift</a></li>
                                    <li><a href="about-us.html">About Us</a></li>
                                    <li><a href="single-product.html">Single Product</a></li>
                                    <li><a href="cart.html">Cart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="look-book.html">Look Book</a></li>
                                    <li><a href="404.html">Error 404</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#search').attr('href', "/product?page=1");
        $('#accountPopup').popover({
           placement: 'bottom',
            html: true,
            content: '<div class="account-popup"><ul>' +
                '<li><a href="<c:url value='/account/profile'/>"><i class="fa fa-user"></i> Thông Tin Tài Khoản</a></li>' +
                '<li><a href="<c:url value='/account/receipt?user_id=${USERMODEL.user_id}'/>"><i class="fa fa-paper-plane-o"></i> Theo Dõi Đơn Hàng</a></li>' +
                '</ul></div>'
        });
    });

    let link;
    let category_id = '';
    let product_name = '';

    $('#category-selection').change(function (e) {
        e.preventDefault();
        category_id = $('#category-selection').val();
    });
    $('#searchProduct').change(function (e) {
        e.preventDefault();
        product_name = $('#searchProduct').val();
    });
    $(document).change(function (e) {
        e.preventDefault();
        link = "/product?act=search&product_name=" + product_name + "&category_id=" + category_id;
        $('#search').attr('href', link);
    });
</script>