<%@include file="/common/taglib.jsp"%>
<c:url var ="ProductURL" value="/admin-thong-ke"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Thống Kê Thẻ Phạt</title>
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
					<a href="<c:url value="/admin-thong-ke?type=list"/> ">Thống Kê Thẻ Phạt</a>
				</li>
				<li class="separator">
					<i class="flaticon-right-arrow"></i>
				</li>
				<li class="nav-item">
					<a href="#">Danh Sách Thẻ Phạt</a>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<div class="d-flex align-items-center">
							<h4 class="card-title">Danh Sách Thẻ Phạt</h4>
							<c:url var="editURL" value="/admin-thong-ke">
								<c:param name="type" value="menu"/>
							</c:url>
							<a href="${editURL}" data-toggle="tooltip" title=""class="btn btn-primary btn-round ml-auto btn-danger btnDelete" data-original-title="Quay Lại">
								<i class="fa fa-arrow-circle-left"></i> Quay Lại
							</a>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="add-row" class="display table table-striped table-hover" >
								<thead>
								<tr>
									<th><input type="checkbox" class="checkAll" id="checkAll"></th>
									<th>Mã đội</th>
									<th>Tên đội</th>
                                    <th>Số thẻ đỏ</th>
									<th>Số thẻ vàng</th>
									<th>Số pha phạm lỗi</th>
									<th>Ghi chú</th>
									<th>Hành động</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="tddb" items="${model.listResult}">
									<tr>
										<td><input type="checkbox" id="checkbox_${tddb.id}" value="${tddb.id}"></td>
										<td>${tddb.maDoi}</td>
										<td>${tddb.tenDoi}</td>
                                        <td>${tddb.soTheDo}</td>
										<td>${tddb.soTheVang}</td>
										<td>${tddb.soPhaPhamLoi}</td>
										<td>${tddb.ghiChu}</td>
										<td>
											<c:url var="editURL" value="/admin-thong-ke">
												<c:param name="type" value="edit"/>
												<c:param name="id" value="${tddb.id}"/>
												<c:param name="tranDauId" value="${tddb.tranDauId}"/>
											</c:url>
											<a href="${editURL}" data-toggle="tooltip" title=""class="btn btn-link btn-primary" data-original-title="Xem Chi Tiết">
												<i class="fa fa-edit"></i>
											</a>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width: 1000px; height: 95%; overflow: auto;">
		<div class="modal-content">
			<div class="modal-header no-bd">
				<h5 class="modal-title">
					<span class="fw-light">Thêm sản Phẩm</span>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="large">Thông tin sản phẩm</p>
				<form id="addProductForm">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group form-group-default" style="height: 46px;">
								<select class="form-control" id="category_id" name="category_id" style="text-transform: capitalize;">
									<option value="">Chọn loại sản phẩm</option>
									<%--<c:forEach var="item" items="${categories}">
										<option value="${item.category_id}">${item.category_name}</option>
									</c:forEach>--%>
								</select>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="form-group form-group-default">
								<label>Tên sản phẩm</label>
								<input name="product_name" type="text" class="form-control" placeholder="Điền tên sản phẩm">
							</div>
						</div>
						<div class="col-md-6 pr-0">
							<div class="form-group form-group-default">
								<label>Hình ảnh</label>
								<input type="file" value="" id="add_product_image" name="product_image" onchange="chooseImage(event)" accept=".png, .jpg, .jpeg"
									   size="50" style="width: 200px; display: inline"/>
								<img id="show_image" src="" alt="" style="width: 80px;" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group form-group-default">
								<label>Giá</label>
								<input name="product_price" type="text" class="form-control" placeholder="Điền giá">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group form-group-default">
								<label>Mô tả</label>
								<textarea rows="" cols="" name="product_description" style="width: 820px;height: 175px"></textarea>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group form-group-default">
								<label>Chi tiết</label>
								<textarea rows="" cols="" name="product_detail" style="width: 820px;height: 175px"></textarea>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer no-bd">
				<button type="button" id="addProductButton" class="btn btn-primary">Thêm</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function (e) {
		$('#add-row').dataTable();
	});

	// Add Product
	let editor = '';
	let editor1 = '';
	$(document).ready(function(){
		editor = CKEDITOR.replace( 'product_description');
	});
	$(document).ready(function(){
		editor1 = CKEDITOR.replace( 'product_detail');
	});

	$('#addProductButton').click(function (e) {
		e.preventDefault();
		let data = {};
		let formData = $('#addProductForm').serializeArray();
		$.each(formData, function (i, v) {
			data[""+v.name+""] = v.value;
		});
		$('#product_image').attr('value', document.getElementById('add_product_image').defaultValue);
		data["product_image"] = document.getElementById('add_product_image').defaultValue;
		data["product_description"] = editor.getData();
		data["product_detail"] = editor1.getData();
		data["created_date"] = Date.parse((new Date()).toISOString());
		addProduct(data);
	});

	function addProduct(data) {
		$.ajax({
			url: '${APIurl}',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(data),
			success: function (result) {
				window.location.href = "${ProductURL}?type=list&message=insert_success";
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
			let myImg = document.getElementById("add_product_image");
			$('#show_image').attr('src', progressEvent.target.result);
			$('#add_product_image').attr('value', url);
			myImg.src = url;
		};
		fileReader.readAsDataURL(file);
	}

	// Delete Product
	$('.btnDelete').click(function () {
		let data={};
		let ids = $('tbody input[type=checkbox]:checked').map(function () {
			return $(this).val();
		}).get();
		data['ids'] = ids;
		deleteProduct(data);
	});

</script>
</body>
</html>