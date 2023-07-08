<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="../../../assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color: #f7f7f7">
<%@include file="../../../common/customer/header.jsp" %>
<div class="wrap_login">
  <section class="__login mt-5">
    <div class="__header-login text-center ms-3">
      <span class="text-uppercase fs-4">Đăng nhập tài khoản</span>
      <div class="d-flex justify-content-center">
        <span class="">Bạn chưa có tài khoản ?</span>
        <a href="/customer/register" class="text-decoration-none text-dark">
          <span class="ms-2 text-decoration-underline">Đăng ký tại đây</span>
        </a>
      </div>
    </div>
    <div class="container d-flex justify-content-center mt-4">
      <form:form class="form_login ms-4" action="/customer/login" name="MyForm" method="post">
        <!-- form_login -->
        <c:if test="${not empty ERROR_MESSAGE}">
          <div class="alert alert-danger" role="alert">
              ${ERROR_MESSAGE}
          </div>
        </c:if>
        <div style="margin-left: 2px;">
          <span class="__label">Email
            <span style="color: red;">*</span></span>
        </div>
        <div class="input-group input-username mb-3 w-auto mt-2">
          <!-- input_username -->
          <span class="input-group-text">
            <i class="fas fa-user"></i>
          </span>
          <input type="text" value="${email}" required name="email" class="form-control p-2" placeholder="Email" style="width: 400px;"/>
        </div>
        <!-- input-username -->
        <div style="margin-left: 2px;">
          <span class="__label">Mật khẩu
            <span style="color: red;">*</span></span>
        </div>
        <div class="input-group input-password mb-3 mt-2">
          <!-- input-password -->
          <span class="input-group-text">
            <i class="fas fa-lock"></i>
          </span>
          <input type="password" value="${password}" required name="password" class="form-control p-2" placeholder="Mật khẩu"
                 style="width: 400px;"/>
        </div>
        <!-- input-password -->
        <div class="mb-3 d-flex" style="font-size: 16px;">
          <!-- renember and forgot pw -->
          <input class="__checkbox" id="wp-comment-cookies-consent" ${remember == true ? 'checked' : ''} name="wp-comment-cookies-consent" type="checkbox"
                 style="margin-top: 1px;">
          <label for="wp-comment-cookies-consent" class="text-black">Ghi nhớ mật khẩu</label>
          <div class="ps-5 ms-5">
            <!-- forgot_password -->
            <span> Quên mật khẩu? </span>
            <span> Nhấn vào </span>
            <a href="#" class="text-decoration-none text-primary">
              <span class=""> đây </span>
            </a>
          </div>
          <!-- forgot_password -->
        </div>
        <!-- renember and forgot pw -->
        <button type="submit" class="button_login w-100" style="height: 49px;">
          <span class="text_login" style="font-size: 18px; margin-top: 3px;">Đăng nhập</span>
        </button>
        <div class="login_other d-flex justify-content-center">
          <span class="mt-3">Hoặc đăng nhập bằng</span>
        </div>
        <div class="group_login d-flex justify-content-center mt-3">
          <div class="btn btn-primary d-flex">
            <a href="#">
              <i class="fab fa-facebook fs-4 text-light float-start"></i>
            </a>
          </div>
          <div class="btn btn-danger d-flex ms-2">
            <a href="#">
              <i class="fab fa-google fs-4 text-light float-start"></i>
            </a>
          </div>
        </div>
        <!-- resgister -->
      </form:form>
      <!-- form_login -->
    </div>
  </section>
</div>
<%@include file="../../../common/customer/footer.jsp" %>
</body>
</html>
