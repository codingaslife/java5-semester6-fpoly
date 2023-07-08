<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Order detail</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%--  <link href="../../../assets/css/style.css" rel="stylesheet" type="text/css">--%>
</head>
<style>
    caption {
        font-size: 1.5rem;
        margin-bottom: 1.2rem;
    }

    table {
        border: 1px solid #aaa;
        width: 100%;
        margin: 40px auto;
    }

    table th,
    table td {
        border: 1px solid #aaa;
        vertical-align: top;
    }

    table th {
        background-color: #eee;
    }

    .wrapper {
        background-color: mediumseagreen;
        font-family: "Open Sans", sans-serif;
        font-weight: bold;
    }
</style>
<body style="background-color: #f7f7f7">
<%@include file="../../../common/customer/header.jsp" %>
<div class="container">
  <div class="__redirect mt-5">
    <a href="/customer/home" class="text-decoration-none text-secondary" style="font-size: 15px;">Trang chủ</a>
    <small class="text-secondary ms-1"> / </small>
    <a href="/customer/order" class="text-decoration-none text-secondary ms-1">Đơn hàng</a>
    <small class="text-secondary ms-1"> / </small>
    <a class="text-decoration-none text-dark ms-1">Chi tiết đơn hàng</a>
  </div>
  <div class="mt-4 text-start">
    <a href="/customer/home" class="text-decoration-none">
      <i class="fas fa-arrow-left" style="color: #cc0000;"></i>
      <span class="ms-1" style="font-size: 15px; color: #cc0000;">Tiếp tục mua hàng</span>
    </a>
  </div>
  <div class="text-center mt-2 __wrap-header-cart">
    <span class="fw-bold __header-cart fs-2">Chi tiết đơn hàng</span>
  </div>
  <div class="mt-5">
    <table border="3" cellpadding="10" cellspacing="0" class="">
      <thead>
      <tr>
        <th>STT</th>
        <th>Hình ảnh</th>
        <th>Tên sản phẩm</th>
        <th>Số lượng mua</th>
        <th>Thành tiền</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${orderDetails}" var="c" varStatus="k">
        <tr>
          <td>${k.index + 1}</td>
          <td class="text-center bg-white">
            <img width="180px" height="120px" src="${c.getProduct().getImage()}">
          </td>
          <td>${c.getProduct().getName()}</td>
          <td>
              ${c.quantity}
          </td>
          <td>
              ${ConvertCurrency.FormatCurrencyVND(c.price)}
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<%@include file="../../../common/customer/footer.jsp" %>
</body>
</html>
