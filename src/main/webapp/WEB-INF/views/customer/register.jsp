<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Register</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="../../../assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color: #f7f7f7">
<%@include file="../../../common/customer/header.jsp" %>
<div class="wrap_register">
  <section class="__register mt-5">
    <div class="__header-login text-center ms-3">
      <span class="text-uppercase fs-4">Đăng ký tài khoản</span>
      <div class="d-flex justify-content-center">
        <span class="">Bạn đã có tài khoản ?</span>
        <a href="/customer/login" class="text-decoration-none text-dark">
          <span class="ms-2 text-decoration-underline">Đăng nhập tại đây</span>
        </a>
      </div>
    </div>
    <div class="container d-flex mt-4 justify-content-center">
      <form:form class="form_register ms-4" action="/customer/register" name="myForm" method="post"
                 modelAttribute="UserRegister">
        <!-- form_register -->
        <div style="margin-left: 2px;">
          <span class="__label">Họ và tên
            <span style="color: red;">*</span></span>
        </div>
        <div class="input-group input-fullname mb-3 mt-2">
          <!-- input_fullname -->
          <span class="input-group-text">
            <i class="far fa-user"></i>
          </span>
          <form:input required="true" type="text" path="fullName" class="form-control p-2" placeholder="Họ và tên"
                      style="width: 400px;"/>
        </div>
        <div class="mb-2">
          <form:errors path="fullName" cssClass="error"/>
        </div>
        <!-- input-fullname -->
        <div style="margin-left: 2px;">
          <span class="__label">Email
            <span style="color: red;">*</span></span>
        </div>
        <div class="input-group input-email mb-3 w-auto mt-2">
          <!-- input_email -->
          <span class="input-group-text">
            <i class="fas fa-envelope"></i>
          </span>
          <form:input required="true" type="email" path="email" class="form-control p-2" placeholder="Email"/>
        </div>
        <div class="mb-2">
          <form:errors path="email" cssClass="error"/>
        </div>
        <!-- input-email -->
        <div style="margin-left: 2px;">
          <span class="__label">Mật khẩu
            <span style="color: red;">*</span></span>
        </div>
        <div class="input-group input-password mb-3 mt-2">
          <!-- input-password -->
          <span class="input-group-text">
            <i class="fas fa-lock"></i>
          </span>
          <form:input required="true" type="password" path="password" class="form-control" placeholder="Mật khẩu"
                      ng-required="true"/>
        </div>
        <div class="mb-2">
          <form:errors path="password" cssClass="error"/>
        </div>
        <!-- input-password -->
        <div style="margin-left: 2px;">
          <span class="__label">Số điện thoại
            <span style="color: red;">*</span></span>
        </div>
        <div class="input-group input-username mb-3 w-auto mt-2">
          <!-- input_phone -->
          <span class="input-group-text">
            <i class="fas fa-phone"></i>
          </span>
          <form:input required="true" type="text" path="phone" class="form-control p-2" placeholder="Số điện thoại"/>
        </div>
        <div class="mb-2">
          <form:errors path="phone" cssClass="error"/>
        </div>
        <!-- input-phone -->
        <div class="mb-3 d-flex">
          <!-- requirement -->
          <input required="true" class="__checkbox" id="wp-comment-cookies-consent" name="wp-comment-cookies-consent"
                 type="checkbox"
                 style="margin-top: 1px;">
          <label for="wp-comment-cookies-consent" class="text-black">Tôi đồng ý với các điều khoản</label>
        </div>
        <!-- requirement -->
        <button type="submit" class="button_register w-100" style="height: 49px;">
          <span class="text_login" style="font-size: 18px; margin-top: 3px;">Đăng ký </span>
          <!-- <a href="#login" class="text-light text-decoration-none">
          </a> -->
        </button>
        <div class="login_other d-flex justify-content-center">
          <span class="mt-3 text-dark">Hoặc đăng ký bằng</span>
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
      <!-- form_register -->
    </div>
  </section>
</div>
</div>
<%@include file="../../../common/customer/footer.jsp" %>
</body>
</html>
