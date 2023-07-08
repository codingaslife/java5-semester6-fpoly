<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Payment</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="../../../assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color: #f7f7f7">
<%@include file="../../../common/customer/header.jsp" %>
<div class="wrap_cart mt-5 pt-2 container">
  <div class="__redirect mt-2">
    <a href="/customer/home" class="text-decoration-none text-secondary" style="font-size: 15px;">Trang chủ</a>
    <small class="text-secondary ms-1"> / </small>
    <a href="/customer/cart" class="text-decoration-none text-dark ms-1">Giỏ hàng</a>
  </div>
  <div class="text-center mt-1 __wrap-header-cart">
    <span class="fw-bold __header-cart fs-2">Thông tin đặt hàng</span>
  </div>
  <div class="row mt-5" style="margin-left: 2px">
    <div class="col-8 __cart-total-item p-3 mt-4"
         style="border: 1px solid #ddd;width: 800px; height: 700px; background-color: #fff;">
      <div class="ms-2">
        <span class="text-uppercase fw-bold" style="font-size: 20px;">Thông tin thanh toán</span>
      </div>
      <form:form action="/customer/order-success" class="form_login mt-3 ms-2" method="post" name="MyForm"
                 modelAttribute="invoice">
      <div class="row">
        <div class="col-12" style="margin-left: 2px;">
            <span class="__label">Họ và tên
              <span style="color: red;">*</span></span>
          <div class="-w-50">
            <form:input required="true" type="text" path="recipientName" class="form-control p-2"
                        placeholder="Họ và tên"
                        style="width: 750px;"/>
            <form:errors path="recipientName" cssClass="error"/>
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-12" style="margin-left: 2px;">
            <span class="__label">Số điện thoại
              <span style="color: red;">*</span></span>
          <div class="-w-50">
            <form:input required="true" type="text" path="recipientPhoneNumber" class="form-control p-2"
                        placeholder="Số điện thoại"
                        style="width: 750px;"/>
            <form:errors path="recipientPhoneNumber"/>
          </div>
        </div>
      </div>
      <div class="row mt-3 pt-1 d-flex">
            <span class="__label">Thành/Phố
              <span style="color: red;">*</span></span>
        <div style="position: absolute; left: 500px">
          <span class="__label">Quận/Huyện
              <span style="color: red;">*</span></span>
        </div>
        <div class="col-5 custom-select mt-2 ms-1">
          <select required name="city" id="city" style="width: 358px;">
            <option selected value="" hidden>Thành phố</option>
            <c:forEach items="${citys}" var="c">
              <option value="${c.getCode()}">${c.getName()}</option>
            </c:forEach>
          </select>
        </div>
        <div class="col-5 custom-select mt-2 ms-5">
          <select name="district" id="district" style="width: 358px;">
            <option value="" hidden>Quận huyện</option>
          </select>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-12 mt-1" style="margin-left: 2px;">
            <span class="__label">Địa chỉ
              <span style="color: red;">*</span></span>
          <div class="-w-50">
            <form:input required="true" type="text" path="receiveAddress" class="form-control p-2" placeholder="Địa chỉ"
                        style="width: 750px;"/>
            <form:errors path="receiveAddress"/>
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-12 mt-1" style="margin-left: 2px;">
            <span class="__label">Địa chỉ Email
              <span style="color: red;">*</span></span>
          <div class="-w-50">
            <input required type="text" name="email" class="form-control p-2" placeholder="Địa chỉ email"
                   style="width: 750px;"/>
          </div>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-12" style="margin-left: 2px;">
            <span class="__label">Ghi chú
              <span style="color: red;">*</span></span>
          <div class="-w-50">
            <input type="text" name="note" class="form-control p-2"
                   placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa điểm giao hàng chi tiết hơn."
                   style="width: 750px; height: 120px;"/>
          </div>
        </div>
      </div>

    </div>
    <div class="col-4 p-1"
         style="border: 1px solid #ddd; margin-top: 24px; margin-left: 50px; background-color: #fff; height: 340px; box-shadow: 0 0.05rem 0.3rem #00000080; height: auto;">
      <div class="p-1 mt-2 ms-3">
        <p class="fw-bold __cart-total-money" style="font-size: 25px;">Đơn hàng của bạn</p>
        <div class="__border-bottom-cart-item" style="margin-top: 3px; color: #eee;">
        </div>
        <div class="d-flex justify-content-between mt-2">
          <span class="fw-bold __cart-total-money mt-3" style="font-size: 16px;">Sản phẩm:</span>
          <span class="fw-bold __cart-total-money me-2 mt-3" style="font-size: 16px; color: red;">TẠM TÍNH
          </span>
        </div>
        <div class="__border-bottom-cart-item mt-2" style="margin-top: 1px; color: #eee; border: 2px solid #ddd;">
        </div>
        <c:forEach items="${cartDetail}" var="p">
          <div class="d-flex justify-content-between mt-2">
          <span class="mt-3" style="font-size: 13.5px; width: 300px;">
            ${p.productName} × ${p.quantity}</span>
            <span id="product-price2-${p.id}" class="fw-bold __cart-total-money me-2 mt-4"
                  style="font-size: 16px; color: red;">
                ${ConvertCurrency.FormatCurrencyVND(p.totalPrice)}
            </span>
          </div>
          <div class="__border-bottom-cart-item mt-2" style="margin-top: 1px; color: #eee; border: 2px solid #ddd;">
          </div>
        </c:forEach>
        <div class="d-flex justify-content-between mt-2">
          <span class="mt-3" style="font-size: 13.5px; width: 300px;">
            Giao hàng</span>
          <span class="fw-bold __cart-total-money me-2 mt-3" style="font-size: 16px; color: red;">30,000
          </span>
        </div>
        <div class="__border-bottom-cart-item mt-2" style="margin-top: 1px; color: #eee; border: 2px solid #ddd;">
        </div>
        <div class="d-flex justify-content-between mt-2">
          <p class="fw-bold __cart-total-money mt-3" style="font-size: 18px;">Tổng tiền:
          </p>
          <p id="result2" class="fw-bold __cart-total-money me-3 mt-2" style="font-size: 28px; color: red;">
            <c:if test="${empty cartDetail}">
              0 <small>₫</small>
            </c:if>
            <c:if test="${not empty cartDetail}">
              ${ConvertCurrency.FormatCurrencyVND(total + 30000)}
            </c:if>
          </p>
        </div>
        <div class="__border-bottom-cart-item" style="margin-top: 0px; color: #eee;">
        </div>
      </div>
      <div class="mt-3 text-center">
        <c:if test="${empty cartDetail}">
          <div class="alert alert-danger ms-3" style="width: 93.5%" role="alert">
            Giỏ hàng chưa có sản phẩm! Không thể thanh toán!
          </div>
        </c:if>
        <c:if test="${not empty cartDetail}">
          <button type="submit" class="__payment" style="height: 60px; width: 91%;">
            <span class="fw-bold">
              Đặt hàng
            </span>
          </button>
        </c:if>
      </div>
      </form:form>
      <div class="mt-3 text-center">
        <a href="/customer/cart" class="text-decoration-none">
          <i class="fas fa-arrow-left" style="color: #cc0000;"></i>
          <span class="ms-1" style="font-size: 15px; color: #cc0000;">Quay lại giỏ hàng</span>
        </a>
      </div>
    </div>

  </div>
</div>
<%@include file="../../../common/customer/footer.jsp" %>
<script>
    var citySelect = $("#city");
    var districtSelect = $("#district");

    citySelect.change(function () {
        var code = $(this).val();
        $.ajax({
            url: "/customer/district",
            method: "GET",
            data: {code: code},
            success: function (data) {
                districtSelect.empty();
                $.each(data, function (index, district) {
                    var option = $('<option>').val(district.code).text(district.name);
                    districtSelect.append(option);
                });
            }
        });
    });
    // var citySelect = $("#city");
    // citySelect.change(function () {
    //     var code = $(this).val();
    //     $.ajax({
    //         url: "/customer/district",
    //         method: "GET",
    //         data: {code: code},
    //         success: function (data) {
    //             $('#district').html('');
    //             $.each(data, function (index, p) {
    //                 var option =
    //                     '<option value="' + p.code + '" hidden>' + p.name + '</option>'
    //                 $('#district').append(option);
    //             });
    //         }
    //     });
    // });
</script>
</body>
</html>
