<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><dec:title default="Trang Chủ"/></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/template/web/img/favicon.jpg"/>">

    <!-- Fonts
    ============================================
    <link href='https://fonts.googleapis.com/css?family=Raleway:400,700,600,500,300,800,900' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,400italic,500,300,300italic,500italic,700' rel='stylesheet' type='text/css'>
    -->

    <!-- CSS  -->

    <!-- Bootstrap CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/bootstrap.min.css"/>">

    <!-- font-awesome.min CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/font-awesome.min.css"/>">

    <!-- Mean Menu CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/meanmenu.min.css"/>">

    <!-- owl.carousel CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/owl.carousel.css"/>">

    <!-- owl.theme CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/owl.theme.css"/>">

    <!-- owl.transitions CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/owl.transitions.css"/>">

    <!-- Price Filter CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/jquery-ui.min.css"/>">

    <!-- nivo-slider css
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/nivo-slider.css"/>">

    <!-- animate CSS
   ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/animate.css"/>">

    <!-- jquery-ui-slider CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/jquery-ui-slider.css"/>">

    <!-- normalize CSS
   ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/normalize.css"/>">

    <!-- main CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/main.css"/>">

    <!-- style CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/style.css"/>">

    <!-- responsive CSS
    ============================================ -->
    <link rel="stylesheet" href="<c:url value="/template/web/css/responsive.css"/>">

    <!-- jquery
   ============================================ -->
    <script src="<c:url value="/template/web/js/vendor/jquery.3.2.1.min.js"/>"></script>

    <!-- bootstrap js
   ============================================ -->
    <script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>

    <script src="<c:url value="/template/web/js/vendor/modernizr-2.8.3.min.js"/>"></script>
    <script src="<c:url value="/template/paging/jquery.twbsPagination.js"/>"></script>
</head>
<body class="home-one">
    <!-- header -->
    <%@include file="/common/web/header.jsp" %>
    <!-- header -->

    <dec:body/>

    <!-- footer -->
    <%@include file="/common/web/footer.jsp" %>
    <!-- footer -->

    <!-- toTop -->
    <div id="totop" class="btn btn-info" style="display: none;">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </div>

<!-- Placed at the end of the document so the pages load faster -->
    <!-- JS -->

    <!-- nivo slider js
    ============================================ -->
    <script src="<c:url value="/template/web/js/jquery.nivo.slider.pack.js"/>"></script>

    <!-- Mean Menu js
   ============================================ -->
    <script src="<c:url value="/template/web/js/jquery.meanmenu.min.js"/>"></script>

    <!-- owl.carousel.min js
 ============================================ -->
    <script src="<c:url value="/template/web/js/owl.carousel.min.js"/>"></script>

    <!-- jquery price slider js
    ============================================ -->
    <script src="<c:url value="/template/web/js/jquery-price-slider.js"/>"></script>

    <!-- wow.js
    ============================================ -->
    <script src="<c:url value="/template/web/js/wow.js"/>"></script>
    <script>
        new WOW().init();
    </script>

    <!-- plugins js
 ============================================ -->
    <script src="<c:url value="/template/web/js/plugins.js"/>"></script>

    <!-- main js
 ============================================ -->
    <script src="<c:url value="/template/web/js/main.js"/>"></script>

</body>
</html>