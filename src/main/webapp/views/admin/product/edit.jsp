<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product"/>
<c:url var ="ProductURL" value="/admin-product"/>
<html>
<head>
    <title>Cập nhật sản phẩm</title>
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
                    <a href="<c:url value="/admin-product?type=list"/> ">Quản Lý Sản Phẩm</a>
                </li>
                <li class="separator">
                    <i class="flaticon-right-arrow"></i>
                </li>
                <li class="nav-item">
                    <a href="#">Cập Nhật Sản Phẩm</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <h4 class="card-title">Cập Nhật Sản Phẩm</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <form id="formSubmit">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="hidden" value="${model.product_id}" id="product_id" name="product_id"/>
                                    <div class="form-group form-group-default" style="height: 46px;">
                                        <select class="form-control" id="category_id" name="category_id">
                                            <c:if test="${empty model.category_id}">
                                                <option value="">Chọn loại sản phẩm</option>
                                                <c:forEach var="item" items="${categories}">
                                                    <option value="${item.category_id}">${item.category_name}</option>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${not empty model.category_id}">
                                                <option value="">Chọn loại sản phẩm</option>
                                                <c:forEach var="item" items="${categories}">
                                                    <option value="${item.category_id}" <c:if test="${item.category_id == model.category_id}">selected="selected"</c:if>>
                                                            ${item.category_name}
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="form-group form-group-default">
                                        <label>Tên sản phẩm</label>
                                        <input id="addName" type="text" class="form-control" name="product_name" value="${model.product_name}" placeholder="Điền tên sản phẩm">
                                    </div>
                                </div>
                                <div class="col-md-6 pr-0">
                                    <div class="form-group form-group-default">
                                        <label>Hình ảnh</label>
                                        <input type="file" value="${model.product_image}" id="product_image" name="product_image" onchange="chooseImage(event)" accept=".png, .jpg, .jpeg"
                                               size="50" style="width: 200px; display: inline"/>
                                        <img id="show_image" src="${model.product_image}" alt=""  style="width: 80px; border: solid 1px #d5d5d5" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-group-default">
                                        <label>Giá</label>
                                        <c:if test="${model.product_id != 0}">
                                            <input type="text" class="form-control" id="product_price" name="product_price" value="<fmt:formatNumber pattern="###" value="${model.product_price}"/>"/>
                                        </c:if>
                                        <c:if test="${model.product_id == 0}">
                                            <input type="text" class="form-control" id="product_price" name="product_price" value=""/>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group form-group-default">
                                        <label>Mô tả</label>
                                        <textarea rows="" cols="" id="product_description" name="product_description" style="width: 820px;height: 175px">${model.product_description}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group form-group-default">
                                        <label>Chi tiết</label>
                                        <textarea rows="" cols="" id="product_detail" name="product_detail" style="width: 820px;height: 175px">${model.product_detail}</textarea>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex align-items-center">
                            <button type="submit" id="btnUpdateProduct" class="btn btn-primary btn-warning btn-round">
                                <i class="fa fa-edit"></i>
                                Cập Nhật Sản Phẩm
                            </button>
                        </div>
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
    function updateProduct(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                //window.location.href = "${ProductURL}?type=edit&product_id="+result.product_id+"&message=update_success";
                window.location.href = "${ProductURL}?type=list";
            },
            error: function (error) {
                window.location.href = "${ProductURL}?type=list&message=error_system";
            }
        });
    }

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
