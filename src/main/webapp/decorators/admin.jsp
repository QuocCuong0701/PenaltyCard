<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title><dec:title default="Trang Chủ"/></title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<link rel="icon" href="<c:url value="/template/admin/img/icon.ico"/>" type="image/x-icon"/>

	<!-- Fonts and icons -->
	<script src="<c:url value="/template/admin/js/plugin/webfont/webfont.min.js"/>"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['<c:url value="/template/admin/css/fonts.min.css"/>']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>

	<!-- CSS Files -->
	<link rel="stylesheet" href="<c:url value="/template/admin/css/bootstrap.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/template/admin/css/atlantis.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/template/admin/css/fonts.min.css"/>" />

	<!--   Core JS Files   -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<%--<script src="<c:url value="/template/admin/js/core/jquery.js" />"></script>--%>
	<script src="<c:url value="/template/admin/js/core/jquery.3.2.1.min.js"/>"></script>
	<script src="<c:url value="/template/admin/js/core/popper.min.js"/>"></script>
	<script src="<c:url value="/template/admin/js/core/bootstrap.min.js"/>"></script>

	<!-- jQuery UI -->
	<script src="<c:url value="/template/admin/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"/>"></script>
	<script src="<c:url value="/template/admin/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"/>"></script>
	<!-- Datatables -->
	<script src="<c:url value="/template/admin/js/plugin/datatables/datatables.min.js"/>"></script>

	<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
</head>
<body>

	<div class="wrapper">

		<!-- header -->
    	<%@ include file="/common/admin/header.jsp" %>
    	<!-- header -->

		<%@ include file="/common/admin/menu-left.jsp" %>

		<div class="main-panel">
			<dec:body/>

			<!-- footer -->
			<%@ include file="/common/admin/footer.jsp" %>
			<!-- footer -->
		</div>

	</div>

	<!-- JavaScript -->

	<script src="<c:url value="/template/admin/js/global.js"/>"></script>
	<!-- jQuery Scrollbar -->
	<script src="<c:url value="/template/admin/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"/>"></script>


	<!-- Chart JS -->
	<script src="<c:url value="/template/admin/js/plugin/chart.js/chart.min.js"/>"></script>

	<!-- jQuery Sparkline -->
	<script src="<c:url value="/template/admin/js/plugin/jquery.sparkline/jquery.sparkline.min.js"/>"></script>

	<!-- Chart Circle -->
	<script src="<c:url value="/template/admin/js/plugin/chart-circle/circles.min.js"/>"></script>



	<!-- Bootstrap Notify -->
	<script src="<c:url value="/template/admin/js/plugin/bootstrap-notify/bootstrap-notify.min.js"/>"></script>

	<!-- Sweet Alert -->
	<script src="<c:url value="/template/admin/js/plugin/sweetalert/sweetalert.min.js"/>"></script>

	<!-- Atlantis JS -->
	<script src="<c:url value="/template/admin/js/atlantis.min.js"/>"></script>
</body>
</html>