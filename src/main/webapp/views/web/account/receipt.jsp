<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var ="AccountURL" value="/account"/>
<c:url var="BillDetailURL" value="/api-admin-billDetail"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh Sách Hóa Đơn</title>
</head>
<body>
<!-- Breadcurb AREA -->
<div class="breadcurb-area">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="<c:url value="/home"/>">Trang Chủ</a></li>
            <li>Danh Sách Hóa Đơn</li>
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
                        <div><p>${USERMODEL.user_full_name}</p><a href="/">Chỉnh sửa tài khoản</a></div>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" width="1024" height="1024">
                            <path d="M265.312 347.872h537.504c19.456 0 35.264-16.096 35.264-35.936s-15.776-35.936-35.264-35.936h-537.504c-19.456 0-35.264 16.096-35.264 35.936s15.808 35.936 35.264 35.936zM802.816 496.128h-537.504c-19.456 0-35.264 16.096-35.264 35.936 0 19.872 15.776 35.936 35.264 35.936h537.504c19.456 0 35.264-16.064 35.264-35.936-0.032-19.84-15.808-35.936-35.264-35.936zM802.816 716.256h-537.504c-19.456 0-35.264 16.128-35.264 35.936 0 19.872 15.776 35.936 35.264 35.936h537.504c19.456 0 35.264-16.064 35.264-35.936-0.032-19.808-15.808-35.936-35.264-35.936z"></path>
                        </svg>
                    </div>
                    <div class="sideBarContent_vQ1Z">
                        <div class="sideBarPanel_3BUR">
                            <div class="panelTitle_y05s"><strong>Quản lý giao dịch</strong></div>
                            <div class="panelContent_1JeO">
                                <ul class="panelFirst_OwZP">
                                    <li class="nav_CdSO activeNav_1nXW"><a href="<c:url value="/account/receipt?user_id=${USERMODEL.user_id}"/>">Đơn hàng</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="sideBarPanel_3BUR">
                            <div class="panelTitle_y05s"><strong>Quản lý tài khoản</strong></div>
                            <div class="panelContent_1JeO">
                                <ul class="panelSecond_18Od">
                                    <li class="nav_CdSO"><a class="active" aria-current="page" href="<c:url value="/account/profile"/>">Thông tin tài khoản</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightContainer_1UxO" style="float: left;width: 80%">
                <div class="title_B9r-"><p>Quản lý đơn hàng</p></div>
                <div class="orderTabWrap_1k2o">
                    <div id="orderTab" class="orderTab_3B7S">
                        <div class="tab-content">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#waitConfirm">Chờ Xác Nhận</a></li>
                                <li><a data-toggle="tab" href="#confirmed">Đã Xác Nhận</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="waitConfirm" class="tab-pane fade in active">
                                    <c:forEach var="notConfirmed" items="${notConfirmed.listResult}">
                                        <div class="orderItem_32vz">
                                            <div class="itemSummary_1BmN">
                                                <div class="summaryCol_15G0 summaryOrder_1SfR">
                                                    <div>Mã đơn hàng:&nbsp;
                                                        <a class="summaryLink_2tGf seeDetail" data-toggle="modal" data-target="#seeDetailModal"
                                                           href="${BillDetailURL}?type=list&bill_id=${notConfirmed.bill_id}">
                                                        #${notConfirmed.bill_id}</a>
                                                        <a class="summaryLink_2tGf summaryLinkDetail_-5xx seeDetail" data-toggle="modal"
                                                           data-target="#seeDetailModal" href="${BillDetailURL}?bill_id=${notConfirmed.bill_id}">
                                                            Chi tiết</a>
                                                    </div>
                                                    <div>Đặt ngày:&nbsp;<span>${notConfirmed.created_date}</span></div>
                                                </div>
                                                <div class="summaryCol_15G0 summaryShipping_V2WN">
                                                    <div>Người nhận:</div>
                                                    <div>
                                                        <span data-toggle="tooltip" data-placement="bottom" title="<strong>Địa chỉ:</strong> ${notConfirmed.address} <br><strong>Số điện thoại:</strong> ${notConfirmed.phone}">${notConfirmed.full_name}</span>
                                                    </div>
                                                </div>
                                                <div class="summaryCol_15G0 summaryPrice_2CIJ">
                                                    <div>Tổng tiền:</div>
                                                    <div><fmt:formatNumber pattern="###,###" value="${notConfirmed.total}"/> đ</div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div id="confirmed" class="tab-pane fade">
                                    <c:forEach var="billModel" items="${listBillModel.listResult}">
                                        <div class="orderItem_32vz">
                                            <div class="itemSummary_1BmN">
                                                <div class="summaryCol_15G0 summaryOrder_1SfR">
                                                    <div>Mã đơn hàng:&nbsp;
                                                        <a class="summaryLink_2tGf seeDetail" data-toggle="modal" data-target="#seeDetailModal"
                                                           href="${BillDetailURL}?bill_id=${billModel.bill_id}">
                                                        #${billModel.bill_id}</a>
                                                        <a class="summaryLink_2tGf summaryLinkDetail_-5xx seeDetail" data-toggle="modal" data-target="#seeDetailModal"
                                                           href="${BillDetailURL}?bill_id=${billModel.bill_id}">
                                                            Chi tiết</a>
                                                        <a class="summaryLink_2tGf summaryLinkDetail_-5xx downloadBill" href="<c:url value="/billExport?bill_id=${billModel.bill_id}"/>">
                                                           <i class="fa fa-print"></i> In hóa đơn</a>
                                                    </div>
                                                    <div>Đặt ngày:&nbsp;<span>${billModel.created_date}</span></div>
                                                </div>
                                                <div class="summaryCol_15G0 summaryShipping_V2WN">
                                                    <div>Người nhận:</div>
                                                    <div>
                                                        <div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div></div>
                                                        <span data-toggle="tooltip" data-placement="bottom" title="<strong>Địa chỉ:</strong> ${billModel.address} <br><strong>Số điện thoại:</strong> ${billModel.phone}">${billModel.full_name}</span>
                                                    </div>
                                                </div>
                                                <div class="summaryCol_15G0 summaryPrice_2CIJ">
                                                    <div>Tổng tiền:</div>
                                                    <div><fmt:formatNumber pattern="###,###" value="${billModel.total}"/> đ</div>
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
<!-- Modal -->
<div class="modal fade" id="seeDetailModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
        </div>
    </div>
</div>

<script>
   $(document).ready(function () {
       $(document).ready(function(){
           $('[data-toggle="tooltip"]').tooltip({
               template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner tooltip_1Cr6"></div></div>',
               html: true,
           });
       });

       $('#formUpdateAcc').submit(function (e) {
           e.preventDefault();
           let userEmail = $('#inputEmail').val();
           let oldPassword = $('#oldPassword').val();
           let newPassword = $('#newPassword').val();
           let rePassword = $('#rePassword').val();
           $('.error').remove();
           if (userEmail.length < 1) {
               $('#inputEmail').after('<span class="error"> Điền địa chỉ email.</span>');
           } else {
               var regEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
               var validEmail = regEx.test(userEmail);
               if (!validEmail) {
                   $('#inputEmail').after('<span class="error"> Email không hợp lệ.</span>');
               }
           }
           if(!oldPassword.match(${USERMODEL.user_pass})){
               $('#oldPassword').after('<span class="error"> Mật khẩu không đúng.</span>');
           }
           if (newPassword.length <= 4 || newPassword.length > 20) {
               $('#newPassword').after('<span class="error"> Mật khẩu phải từ 5 - 20 ký tự.</span>');
           }
           if (rePassword.length < 1) {
               $('#rePassword').after('<span class="error"> Nhập lại mật khẩu.</span>');
           } else if (!rePassword.match(newPassword)) {
               $('#rePassword').after('<span class="error"> Mật khẩu không khớp.</span>');
           }
           let error = $('form span').map(function () {
               return $(this).val();
           }).get();
           if (error.length === 0) {
               let data = {};
               let formData = $('#formUpdateAcc').serializeArray();
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

   $('.seeDetail').click(function () {
       $('.modal-content').empty();
       $('#bodyDetail').empty();
       let url = $(this).attr('href');
       $('.modal-content').append("<div class=\"modal-header\">\n" +
           "                <h5 class=\"modal-title\">\n" +
           "                    <span class=\"fw-light\">Chi tiết hóa đơn</span>\n" +
           "                </h5>\n" +
           "                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n" +
           "                    <span aria-hidden=\"true\">&times;</span>\n" +
           "                </button>\n" +
           "            </div>\n" +
           "            <div class=\"modal-body\">\n" +
           "                <table class=\"table table-responsive table-bordered\">\n" +
           "                    <thead>\n" +
           "                        <tr>\n" +
           "                            <th>Hình Ảnh</th>\n" +
           "                            <th>Tên Sản Phẩm</th>\n" +
           "                            <th>Giá</th>\n" +
           "                            <th>Số Lượng</th>\n" +
           "                            <th>Tổng</th>\n" +
           "                        </tr>\n" +
           "                    </thead>\n" +
           "                    <tbody class=\"bodyDetail\" id=\"bodyDetail\">\n" +
           "                    </tbody>\n" +
           "                </table>\n" +
           "            </div>");
       $.get(url, function (item) {
           item.map(data=>{
               $('#bodyDetail').append("<tr>\n" +
                   "<td style='width: 15%;'><img src=\""+data.product_image+"\"></td>\n" +
                   "<td>"+data.product_name+"</td>\n" +
                   "<td>"+data.product_price.toLocaleString()+" đ</td>\n" +
                   "<td>"+data.quantity+"</td>\n" +
                   "<td>"+parseInt(data.product_price * data.quantity).toLocaleString()+" đ</td>\n" +
                   "</tr>");
           });
       });
   });
</script>
</body>
</html>
