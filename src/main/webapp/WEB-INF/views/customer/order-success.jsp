<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>OK</title>
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
  <div class="mt-4 text-start">
    <a href="/customer/home" class="text-decoration-none">
      <i class="fas fa-arrow-left" style="color: #cc0000;"></i>
      <span class="ms-1" style="font-size: 15px; color: #cc0000;">Tiếp tục mua hàng</span>
    </a>
  </div>
  <c:if test="${not empty invoice}">
    <div class="text-center mt-1 __wrap-header-cart">
      <span class="fw-bold __header-cart fs-2">Đặt hàng thành công</span>
    </div>
    <div class="text-center mt-5" style="margin-left: 175px;">
      <div class="p-3"
           style="border: 1px solid #ddd; margin-top: 24px; margin-left: 50px; background-color: #fff; box-shadow: 0 0.05rem 0.3rem #00000080; height: 230px; width: 850px;">
        <p class="fw-bold text-success">Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đang được xử lý.</p>
        <p>Mã đơn hàng:
          <span class="fw-bold">${invoice.code}</span>
        </p>
        <p>Ngày đặt hàng:
          <span class="fw-bold">${invoice.createdDate}</span>
        </p>
        <p>Tổng cộng:
          <span class="fw-bold">
                ${ConvertCurrency.FormatCurrencyVND(invoice.totalMoney)}
        </span>
        </p>
        <p>Hình thức thanh toán:
          <span class="fw-bold">Thanh toán khi nhận hàng</span>
        </p>
        <div class="mt-3">
          <a href="/customer/order/search?code=${invoice.code}" class="text-decoration-none">
            <span class="text-success" style="font-size: 15px;">Xem đơn hàng</span>
            <i class="fas fa-arrow-right text-success"></i>
          </a>
        </div>
      </div>
    </div>
  </c:if>
</div>
<c:if test="${empty invoice}">
  <div class="alert alert-danger mt-5 text-center" role="alert" style="margin-top: 130px">
    Không có gì!
  </div>
</c:if>

<%@include file="../../../common/customer/footer.jsp" %>
</body>
</html>
