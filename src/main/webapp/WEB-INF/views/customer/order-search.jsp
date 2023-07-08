<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Search Order</title>
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
    <a class="text-decoration-none text-dark ms-1">Đơn hàng</a>
  </div>
  <div class="mt-4 text-start">
    <a href="/customer/home" class="text-decoration-none">
      <i class="fas fa-arrow-left" style="color: #cc0000;"></i>
      <span class="ms-1" style="font-size: 15px; color: #cc0000;">Tiếp tục mua hàng</span>
    </a>
  </div>
  <div class="text-center mt-2 __wrap-header-cart">
    <div>
      <span class="fw-bold __header-cart fs-2">Tìm kiếm đơn hàng</span>
    </div>
    <div class="-w-50 d-flex justify-content-center mt-5 pt-2">
      <form method="get" action="/customer/order/search">
        <input type="text" required name="code" class="form-control p-2" placeholder="Nhập vào mã đơn hàng cần tìm.."
               style="width: 600px;"/>
        <c:if test="${not empty errorMessage}">
          <div class="alert alert-danger mt-3 text-center" role="alert">
              ${errorMessage}
          </div>
        </c:if>
        <c:if test="${not empty notFound}">
          <div class="alert alert-danger mt-3 text-center" role="alert">
              ${notFound}
          </div>
        </c:if>
        <div class="mt-4 text-center">
          <button type="submit" class="__payment" style="height: 60px; width: 30%;">
            <span class="fw-bold">
              Tìm kiếm
            </span>
          </button>
        </div>
      </form>
    </div>
  </div>
  <c:if test="${not empty invoice}">
    <div class="mt-5">
      <table border="3" cellpadding="10" cellspacing="0" class="">
        <thead>
        <tr>
          <th>Mã đơn hàng</th>
          <th>Ngày tạo</th>
          <th>Trạng thái</th>
          <th>Tổng số sản phẩm</th>
          <th>Tổng tiền</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>
            <a href="/customer/order-detail?id=${invoice.id}">
                ${invoice.code}
            </a>
          </td>
          <td>${invoice.createdDate}</td>
          <td class="wrapper text-white" style="height: 27px">
              ${invoice.state == 0 ? 'Chờ xác nhận' : 'Đang xử lý'}
          </td>
          <td>
              ${invoice.totalQuantity}
          </td>
          <td>
              ${ConvertCurrency.FormatCurrencyVND(invoice.totalMoney)}
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </c:if>
</div>
<%@include file="../../../common/customer/footer.jsp" %>
</body>
</html>
