<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Register success</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="../../../assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color: #f7f7f7">
<%@include file="../../../common/customer/header.jsp" %>
<div class="wrap_register">
  <section class="__register mt-5">
    <span>${message}</span>
    <span>${statusCode}</span>
    <span>${page}</span>
    <c:if test="${not empty customerUser}">
    <div class="__header-login text-center ms-3 mt-4">
      <span class="text-uppercase fs-2">Đăng ký thành công</span>
      <div class="d-flex justify-content-center">
        <a href="/customer/home" class="text-light text-decoration-none">
          <button type="submit" class="button_register" style="height: 49px;">
            <span class="text_login" style="font-size: 18px; margin-top: 3px;">Đi mua sắm ngay </span>
          </button>
        </a>
      </div>
    </div>
    </c:if>
</div>
</div>
<%@include file="../../../common/customer/footer.jsp" %>
</body>
</html>
