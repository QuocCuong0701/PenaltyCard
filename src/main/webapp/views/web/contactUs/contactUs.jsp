<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Liên hệ</title>
</head>
<body>
    <!-- Breadcurb AREA -->
    <div class="breadcurb-area">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="<c:url value="/home"/>">Home</a></li>
                <li>Liên hệ</li>
            </ul>
        </div>
    </div>
    <!-- Contact-us area -->
    <div class="contact-us-area">
    <div class="map-area">
        <div class="contact-map">
            <div id="googleMap"></div>
        </div>
    </div>
    <div class="contact-information">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="contact-details">
                        <div class="contact-head">
                            <h2>Liên hệ chi tiết</h2>
                            <p></p>
                        </div>
                        <div class="contact-bottom">
                            <p><span><i class="fa fa-phone"></i></span> Số điện thoại: +84 333 853 98</p>
                            <p><span><i class="fa fa-envelope"></i></span> E-mail: lanhuong@gmail.com</p>
                            <p><span><i class="fa fa-link"></i></span> Website: <a href="<c:url value="/home"/>">www.lanhuong.com</a></p>
                            <p><span><i class="fa fa-map-marker"></i></span> Đại chỉ: Minh Khai, Bắc Từ Liêm, Hà Nội, Việt Nam</p>
                        </div>
                        <div class="contact-social-icon footer-social-icon">
                            <ul class="list-inline">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="contact-leave-message">
                        <div class="contact-head">
                            <h2>Để lại tin nhắn</h2>
                        </div>
                        <form action="#" class="form-horizontal">
                            <div class="form-group col-md-6">
                                <label class="control-label">
                                    Tiêu đề
                                </label>
                                <input type="text" class="form-control">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">
                                    Họ và tên
                                </label>
                                <input type="text" class="form-control">
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">
                                    E-mail
                                </label>
                                <input type="text" class="form-control">
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">
                                    Tin nhắn
                                </label>
                                <textarea rows="5" class="form-control"></textarea>
                            </div>
                            <button class="btn">Gửi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Google Map js -->
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script>
        function initialize() {
            var mapOptions = {
                zoom: 15,
                scrollwheel: false,
                center: new google.maps.LatLng(40.663293, -73.956351)
            };

            var map = new google.maps.Map(document.getElementById('googleMap'),
                mapOptions);

            var marker = new google.maps.Marker({
                position: map.getCenter(),
                animation:google.maps.Animation.BOUNCE,
                icon: 'img/map-marker.png',
                map: map
            });
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</body>
</html>
