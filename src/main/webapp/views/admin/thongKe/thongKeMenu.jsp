<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var ="ProductURL" value="/admin-thong-ke"/>
<!DOCTYPE html>
<html>
<head>
    <title>Thống Kê Menu</title>
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
                    <a href="<c:url value="/admin-thong-ke?type=list"/> ">Thống Kê</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <h4 class="card-title">Thống Kê</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <c:url var="editURL" value="/admin-thong-ke">
                            <c:param name="type" value="list"/>
                        </c:url>
                        <a href="${editURL}" data-toggle="tooltip" title=""class="btn btn-primary btn-round ml-auto btn-success btnDelete" data-original-title="Thống Kê Thẻ Phạt">
                            <i class="fa flaticon-credit-card"></i> Thống Kê Thẻ Phạt
                        </a>
                        <p></p>
                        <a href="#" data-toggle="tooltip" title=""class="btn btn-primary btn-round ml-auto btn-warning btnDelete" data-original-title="Thống Kê Đội Bóng">
                            <i class="fa flaticon-user-2"></i> Thống Kê Đội Bóng
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	let editor = '';
	let editor1 = '';
	$(document).ready(function(){
		editor = CKEDITOR.replace( 'product_description');
	});
    $(document).ready(function(){
        editor1 = CKEDITOR.replace( 'product_detail');
    });

    $('#btnUpdateProduct').click(function (e) {
        e.preventDefault();
        let data = {};
        let formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        $('#product_image').attr('value', document.getElementById('product_image').defaultValue);
        data["product_image"] = document.getElementById('product_image').defaultValue;
        data["product_description"] = editor.getData();
        data["product_detail"] = editor1.getData();
        data["updated_date"] = Date.parse((new Date()).toISOString());
        updateProduct(data);
    });

    function chooseImage(evt) {
        evt.stopPropagation();
        evt.preventDefault();
        let files = evt.target.files;
        let file = files[0];
        let fileReader = new FileReader();

        fileReader.onload = function(progressEvent) {
            let url = fileReader.result;
            let myImg = document.getElementById("product_image");
            $('#show_image').attr('src', progressEvent.target.result);
            $('#product_image').attr('value', url);
            myImg.src = url;
        };
        fileReader.readAsDataURL(file);
    }
</script>
</body>
</html>
