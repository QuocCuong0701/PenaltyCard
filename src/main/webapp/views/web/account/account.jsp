<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var ="AccountURL" value="/account/profile"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thông Tin Tài Khoản</title>
</head>
<body>
<!-- Breadcurb AREA -->
<div class="breadcurb-area">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="<c:url value="/home"/>">Trang Chủ</a></li>
            <li>Thông Tin Tài Khoản</li>
        </ul>
    </div>
</div>

<!-- Chart AREA -->
<div class="chart-area">
    <div class="container">
        <div class="row">
            <div class="leftContainer_1UGN" style="float: left;width: 20%">
                <div class="sideBarWrap_2l2b">
                    <div class="userInfo_8bQD"><img src="//media3.scdn.vn/img4/2020/03_30/VLsL5cLGxJmK2vZvxnFP.jpg">
                        <div><p>${USERMODEL.user_name}</p><a href="<c:url value="/account/profile"/>">Chỉnh sửa tài khoản</a></div>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" width="1024" height="1024">
                            <path d="M265.312 347.872h537.504c19.456 0 35.264-16.096 35.264-35.936s-15.776-35.936-35.264-35.936h-537.504c-19.456 0-35.264 16.096-35.264 35.936s15.808 35.936 35.264 35.936zM802.816 496.128h-537.504c-19.456 0-35.264 16.096-35.264 35.936 0 19.872 15.776 35.936 35.264 35.936h537.504c19.456 0 35.264-16.064 35.264-35.936-0.032-19.84-15.808-35.936-35.264-35.936zM802.816 716.256h-537.504c-19.456 0-35.264 16.128-35.264 35.936 0 19.872 15.776 35.936 35.264 35.936h537.504c19.456 0 35.264-16.064 35.264-35.936-0.032-19.808-15.808-35.936-35.264-35.936z"></path>
                        </svg>
                    </div>
                    <div class="sideBarContent_vQ1Z">
                        <div class="sideBarPanel_3BUR">
                            <div class="panelTitle_y05s"><strong>Quản lý giao dịch</strong></div>
                            <div class="panelContent_1JeO">
                                <ul class="panelFirst_OwZP">
                                    <li class="nav_CdSO"><a href="<c:url value="/account/receipt?user_id=${USERMODEL.user_id}"/>">Đơn hàng</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="sideBarPanel_3BUR">
                            <div class="panelTitle_y05s"><strong>Quản lý tài khoản</strong></div>
                            <div class="panelContent_1JeO">
                                <ul class="panelSecond_18Od">
                                    <li class="nav_CdSO activeNav_1nXW"><a class="active" aria-current="page" href="<c:url value="/account/profile"/>">Thông tin tài khoản</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightContainer_1UxO" style="float: left;width: 80%">
                <div class="topTitleWrap_1YN0">
                    <div class="topTitle_3Yaq"><h2>Thông báo ngừng tích lũy điểm</h2></div>
                </div>
                <div class="notification_3mz-"><p>Chào bạn <strong>${USERMODEL.user_name}</strong>,</p>
                    <p>Bạn vui lòng sử dụng điểm thanh toán đơn hàng tới hết ngày 16/12/2019. Sau thời gian này,
                        điểm sẽ được quy đổi và cộng vào Ví Khuyến mãi trong Ví liên kết với tài khoản mua
                        hàng của bạn.</p>
                    <p>Thời gian điểm quy đổi và cộng vào Ví diễn ra từ 24/12/2019 tới hết 31/12/2019.</p>
                </div>
                <div class="topTitleWrap_1YN0">
                    <div class="topTitle_3Yaq"><h2>Thông tin tài khoản</h2></div>
                </div>
                <div class="accountPage_2lsd">
                    <div class="row pageInner_1FHx">
                        <div class="col-sm-12 col-md-10 col-lg-10" style="margin-left: 150px;">
                            <div class="accountFormWrap_2oXG">
                                <div class="form-group row">
                                    <label for="phonee" class="col-sm-3 col-form-label phoneLabel_3lBr"><span>Tên đăng nhập:</span></label>
                                    <div class="col-sm-10 col-md-6 col-lg-6">
                                        <div class=""><input id="phonee" name="phonee" class="form-control" type="text" tabindex="2" placeholder="" readonly="" value="${USERMODEL.user_name}"></div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-sm-3 col-md-2 col-lg-3 col-form-label">Email</label>
                                    <div class="col-sm-10 col-md-6 col-lg-6"><input id="email" class="form-control" type="email" tabindex="1" readonly="" value="${USERMODEL.user_email}">
                                        <div class="__react_component_tooltip place-bottom type-dark " data-id="tooltip"></div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-sm-3 col-form-label"></label>
                                    <div class="col-sm-8">
                                        <a class="changePasswordLink_2sez" href="#" rel="noopener" data-toggle="modal" data-target="#changePassword">Thay đổi mật khẩu</a>
                                    </div>
                                    <div class="modal fade" id="changePassword" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">
                                                        <span class="fw-light">Thay đổi mật khẩu</span>
                                                    </h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form id="formChangePass"></form>
                                                    <div class="modal-body">
                                                        <input id="user_id" type="hidden" value="${USERMODEL.user_id}"/>
                                                        <div class="row change-pass-body">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Mật khẩu cũ</label>
                                                                    <input id="oldPass" type="password" class="form-control" placeholder="Nhập mật khẩu cũ">
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Mật khẩu mới</label>
                                                                    <input id="newPass" type="password" class="form-control" placeholder="Nhập mật khẩu mới">
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Nhập lại mật khẩu mới</label>
                                                                    <input id="rePass" type="password" class="form-control" placeholder="Nhập lại mật khẩu mới">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer no-bd">
                                                        <button id="changePass" class="btn btn-primary">Cập Nhật</button>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
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
        </div>
    </div>
</div>

<script>
   $(document).ready(function () {
       $('#changePass').click(function () {
           let oldPass = $('#oldPass').val();
           let newPass = $('#newPass').val();
           let rePass = $('#rePass').val();
           $('.alert-check').remove();
           if (!oldPass.match(${USERMODEL.user_pass})) {
               $('#oldPass').after('<span class="alert-check"> Mật khẩu không đúng.</span>');
           }
           if (newPass.length <= 4 || newPass.length > 20) {
               $('#newPass').after('<span class="alert-check"> Mật khẩu phải từ 5 - 20 ký tự.</span>');
           }
           if (rePass.length < 1) {
               $('#rePass').after('<span class="alert-check"> Nhập lại mật khẩu.</span>');
           } else if (!rePass.match(newPass)) {
               $('#rePass').after('<span class="alert-check"> Mật khẩu không khớp.</span>');
           }

           let error = $('span.alert-check').map(function () {
               return $(this).val();
           }).get();
           if (error.length === 0) {
               let data = {};
               data['user_id']=$('#user_id').val();
               data['user_pass']=$('#newPass').val();
               let formData = $('#formChangePass').serializeArray();
               $.each(formData, function (i, v) {
                   data["" + v.name + ""] = v.value;
               });
               updateAccount(data);
           }
       });

   });

   function updateAccount(data) {
       $.ajax({
           url: '${APIurl}',
           type: 'PUT',
           contentType: 'application/json',
           data: JSON.stringify(data),
           dataType: 'json',
           success: function (result) {
               if (result != null) {
                   window.location.href = "${AccountURL}?message=update_success";
               } else {
                   window.location.href = "${AccountURL}?message=error_system";
               }
           },
           error: function (error) {
               window.location.href = "${AccountURL}?message=error_system";
           }
       });
   }
</script>
</body>
</html>
