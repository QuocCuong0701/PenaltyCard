<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-bill"/>
<c:url var="APIurl1" value="/api-admin-billDetail"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thanh toán</title>
</head>
<body>
<!-- Breadcurb AREA -->
<div class="breadcurb-area">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="<c:url value="/home"/>">Trang chủ</a></li>
            <li><a href="#">Trang</a></li>
            <li>Thanh toán</li>
        </ul>
    </div>
</div>
<!-- Checkout AREA -->
<c:set var="cart" value="${sessionScope.model}"/>
<div class="checkout-area">
    <div class="container">
        <form id="formSubmit">
            <div class="row">
                <div class="col-md-8 col-sm-7">
                    <div class="billing-address">
                        <div class="checkout-head">
                            <h2><i class="fa fa-map-marker"></i>   ĐỊA CHỈ VÀ THÔNG TIN NHẬN HÀNG</h2>
                            <p>Giao hàng tận tay. Ngay nơi bạn ở.</p>
                        </div>
                        <div class="checkout-form">
                            <div class="form-horizontal">
                                <input id="user_id" name="user_id" type="hidden" class="form-control" value="${USERMODEL.user_id}" />
                                <input name="user_name" type="hidden"  value="${USERMODEL.user_name}" />
                                <input name="user_full_name" type="hidden"  value="${USERMODEL.user_full_name}" />
                                <input name="user_email" type="hidden"  value="${USERMODEL.user_email}" />
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Họ Và Tên <sup>*</sup>
                                    </label>
                                    <div class="col-md-9">
                                        <input name="full_name" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Địa Chỉ Nhận Hàng <sup>*</sup>
                                    </label>
                                    <div class="col-md-9">
                                        <input name="address" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Email <sup>*</sup>
                                    </label>
                                    <div class="col-md-9">
                                        <input name="email" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Số Điện Thoại <sup>*</sup>
                                    </label>
                                    <div class="col-md-9">
                                        <input name="phone" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Ghi Chú
                                    </label>
                                    <div class="col-md-9">
                                        <textarea name="note" rows="9"></textarea>
                                    </div>
                                </div>
                                <input type="hidden" name="total" value="${sessionScope.totalPrice}"/>
                                <input id="created_date" type="hidden" name="created_date" value=""/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-5">
                    <div class="review-order">
                        <div class="checkout-head">
                            <h2>Thông Tin Hóa Đơn</h2>
                        </div>
                        <c:forEach var="rows" items="${cart}">
                            <input name="product_id" type="hidden" value="${rows.value.productModel.product_id}">
                            <input name="product_name" type="hidden" value="${rows.value.productModel.product_name}">
                            <input name="product_quantity" type="hidden" value="${rows.value.quantity}">
                            <input name="product_price" type="hidden" value="${rows.value.productModel.product_price}">
                            <div class="single-review">
                                <div class="single-review-img">
                                    <a href="#"><img style="width: 70px; height: 90px" src="<c:url value="${rows.value.productModel.product_image}"/>" alt="review"></a>
                                </div>
                                <div class="single-review-content fix">
                                    <h2><a href="#">${rows.value.productModel.product_name}</a></h2>
                                    <p><span>Số Lượng :</span> ${rows.value.quantity}</p>
                                    <h3><fmt:formatNumber pattern="###,###" value="${rows.value.productModel.product_price * rows.value.quantity}"/> đ</h3>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="subtotal-area">
                            <div class="subtotal-content fix">
                                <h2 class="floatleft">Tạm Tính</h2>
                                <h2 class="floatright"><fmt:formatNumber pattern="###,###" value="${sessionScope.totalPrice}"/> đ</h2>
                            </div>
                            <div class="subtotal-content fix">
                                <h2 class="floatleft">Tổng</h2>
                                <h2 class="floatright"><fmt:formatNumber pattern="###,###" value="${sessionScope.totalPrice}"/> đ</h2>
                            </div>
                        </div>
                        <div class="payment-method">
                            <h2>PHƯƠNG THỨC THANH TOÁN</h2>
                            <div class="payment-checkbox">
                                <input class="checkoutMethod" type="checkbox" name="checkoutMethod" value="direct"> Thanh toán trực tiếp <br>
                                <input class="checkoutMethod" type="checkbox" name="checkoutMethod" value="paypal"> Thanh toán qua Paypal
                            </div>
                            <%--<button type="button" class="btn">Đặt Hàng</button>--%>
                            <button id="btnCheckout" class="btn">Đặt Hàng</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    let paymentMethod;
    $(".checkoutMethod:checkbox").on('click', function() {
        let box = $(this);
        if (box.is(":checked")) {
            let group = "input:checkbox[name='" + box.attr("name") + "']";
            $(group).prop("checked", false);
            box.prop("checked", true);
            paymentMethod = $(this).val();
        } else {
            box.prop("checked", false);
            paymentMethod = "";
        }
    });

    $('#btnCheckout').click(function () {
        if (paymentMethod === 'direct' || paymentMethod === "paypal"){
            /*let data = {};
            let formData = $('#formSubmit').serializeArray();
            $.each(formData, function (i, v) {
                data["" + v.name + ""] = v.value;
            });
            data["created_date"] = Date.parse((new Date()).toISOString());

            addBill(data);*/
            $('#created_date').val(Date.parse((new Date()).toISOString()));
            $('#formSubmit').attr('action', 'authorize_payment');
            $('#formSubmit').attr('method', 'post');
            $('#formSubmit').submit();
        } else {
            alert("Vui lòng chọn phương thức thanh toán.");
        }
    });

    function addBill(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                console.log("addBill: "+result);
                let billDetail = {};
                <c:forEach var="cart" items="${cart}">
                billDetail["bill_id"] = result.bill_id;
                billDetail["product_id"] = ${cart.value.productModel.product_id};
                billDetail["quantity"] = ${cart.value.quantity};
                addBillDetail(billDetail);
                </c:forEach>
                window.location.href = "/checkout/order-received?bill_id=" + result.bill_id;
            },
            error: function (error) {
                console.log("ERROR" + error);
            }
        });
    }

    function addBillDetail(data) {
        $.ajax({
            url: '${APIurl1}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                console.log("addBillDetail: "+result);
            },
            error: function (error) {
                console.log("ERROR" + error);
            }
        });
    }
</script>
</body>
</html>
