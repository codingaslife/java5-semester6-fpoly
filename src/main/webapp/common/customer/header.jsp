<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../taglib.jsp" %>
<%@ page import="com.fpoly.utils.ConvertCurrency" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="../../assets/css/style.css" rel="stylesheet" type="text/css">
  <%@ include file="../lib/user-interface.jsp" %>
</head>
<body>
<div class="wrap_header"> <!-- wrap_header -->
  <header class="main_header1" style="background-color: #f7f7f7"> <!-- main_header1 -->
    <div class="container d-flex justify-content-between" style="height: 36px;"> <!-- container -->
      <div class="header_left mt-1 ms-1 d-flex"> <!-- header_left -->
        <div class="hotline">
          <i class="fas fa-phone-alt" style="font-size: 12px;"></i>
          <span class="fw-bold ms-1" style="font-size: 13px;">Hotline:</span>
          <small class="" style="font-size: 13.5px;">0989.089.998 - 099.6789.555</small>
        </div>
        <div class="email ms-4">
          <a href="#" class="text-decoration-none text-dark">
            <i class="fas fa-envelope" style="font-size: 12px;"></i>
            <span class="fw-bold ms-1" style="font-size: 13px;">Email:</span>
            <small class="email-contact" style="font-size: 13.5px;">mohinhfigure@fpoly.vn</small>
          </a>
        </div>
      </div> <!-- header_left -->
      <div class="header_right mt-1 ms-1 d-flex"> <!-- header_right -->
        <div class="map">
          <a href="/customer/order" class="text-decoration-none text-dark">
            <div class="__login" style="margin-top: 5px;">
              <span class="fw-bold ms-1 __text-user link-login" style="font-size: 13px;">
                <i class="fas fa-bookmark me-1"></i>
              Đơn đặt hàng
            </span>
              <small class="text-secondary ms-3" style="font-size: 13px;">|</small>
            </div>
          </a>
        </div>
        <div class="__redirect-user ms-4 d-flex" style="margin-top: 3px">
          <c:if test="${customerUser != null}">
            <a href="#" class="text-decoration-none text-dark">
              <div class="__login" style="margin-top: 0.5px">
                <i class="fas fa-user" style="font-size: 12px;"></i>
                <span class="fw-bold ms-1 __text-user link-login" style="font-size: 13px;">
                   Xin chào,  ${customerUser.fullName}
                </span>
                <small class="text-secondary ms-1" style="font-size: 13px;">|</small>
              </div>
            </a>
            <a href="/customer/logout" class="text-decoration-none text-dark">
              <div class="__register" style="margin-top: 2.5px">
                <span class="fw-bold link-register ms-2" style="font-size: 13px;">Đăng xuất</span>
              </div>
            </a>
          </c:if>
          <c:if test="${customerUser == null}">
            <a href="/customer/login" class="text-decoration-none text-dark">
              <div class="__login" style="cursor: pointer;">
                <i class="fas fa-user" style="font-size: 12px;"></i>
                <span class="fw-bold ms-1 link-login" style="font-size: 13px;">Đăng nhập</span>
              </div>
            </a>
            <small class="text-secondary ms-2" style="font-size: 13px;">|</small>
            <a href="/customer/register" class="text-decoration-none text-dark">
              <div class="ms-2 __register" style="cursor: pointer; margin-top: 2.5px">
                <span class="fw-bold link-register" style="font-size: 13px;">Đăng ký</span>
              </div>
            </a>
          </c:if>
        </div>
      </div> <!-- header_right -->
    </div> <!-- container -->
  </header> <!-- main_header1 -->
  <header class="main_header2 bg-white"> <!-- main_header2 -->
    <div class="container-fluid d-flex justify-content-between" style="height: 150px;"> <!-- container-fluid -->
      <div class="header-left ms-5 ps-4">
        <a class="navbar-brand ms-2" href="#home">
          <img src="../../../assets/img/logo1.jpg" width="175px">
        </a>
      </div>
      <div class="mt-5 wrap-header-center" style="width: 500px;">
        <div class="header-center ms-2">
          <input type="text" class="form-control" placeholder="Nhập từ khóa">
          <a href="#" class="text-decoration-none text-dark">
            <i class="fas fa-search"></i>
          </a>
        </div>
      </div>
      <div class="header-right me-5 pe-4 dropdown" style="margin-top: 40px;">
        <a href="#" class="text-decoration-none text-dark">
          <i class="fas fa-heart me-1" style="font-size: 30px;">
            <!-- <span class="num rounded-circle">2</span> -->
          </i>
        </a>
        <button class="dropdown-cart mt-2 bg-white border border-0 me-4" type="button" id="dropdownMenuButton1"
                data-bs-toggle="dropdown" data-bs-auto-close="inside" data-bs-target="#dropdownMenu"
                aria-expanded="false">
          <i class="bi bi-handbag-fill fs-1 me-3">
            <span class="num fst-normal rounded-circle ms-2" id="cartLength">
                <c:forEach items="${cartDetail}" var="c">
                  <c:set var="totalItems"
                         value="${totalItems + c.quantity}"/>
                </c:forEach>
                ${totalItems == null ? 0 : totalItems}
            </span>
          </i>
        </button>
        <ul class="dropdown-menu dropdown-menu-end mt-3" aria-labelledby="dropdownMenuButton1"
            style="width: 435px; height: auto; background-color: white; user-select: none">
          <div class="header-cart p-1 mt-1 d-flex justify-content-between">
            <span class="__header-cart-drop fw-bold text-center ms-3" style="font-size: 16px;">
              <i class="fas fa-shopping-cart me-1" style="font-size: 18px;"></i>
              GIỎ HÀNG</span>
            <div class="me-4">
              <button class="btn-close"></button>
            </div>
          </div>
          <div id="wrap-cart" class="text-center" style="user-select: none;">
            <div id="cart" class="wrap-product-in-cart p-3" style="max-height: 380px; overflow-x: auto;">
              <c:if test="${empty cartDetail}">
                <div id="cart1">
                  <div class="mt-4">
                    <img src="//bizweb.dktcdn.net/100/418/981/themes/854485/assets/cart_empty_background.png?1678507984338"
                         alt="">
                  </div>
                  <div class="mt-3">
                    <span class="fw-bold fs-5">"Giỏ hàng" của bạn đang trống</span>
                    <p class="mt-2 text-secondary">Về trang cửa hàng để chọn mua sản phẩm bạn nhé!!</p>
                  </div>
                </div>
              </c:if>
              <!-- wrap-product-in-cart -->
              <c:if test="${not empty cartDetail}">
              <c:forEach items="${cartDetail}" var="c">
              <div class="product-in-cart" id="product-in-cart-${c.id}" style="background-color: white; height: 120px;">
                <!-- product-in-cart -->
                <div class="__wrap-inside d-flex mt-2" id="wrap-inside">
                  <a href="/customer/product/detail/${c.productCode}" class="text-decoration-none text-dark">
                    <div class="product-img">
                      <img src="${c.productImage}" width="155px" height="100px">
                    </div>
                    <div class="row product-info"> <!-- product-info -->
                      <div class="wrap-product-name">
                                    <span class="text-start product-name fw-bold">
                                        ${c.productName}
                                    </span>
                      </div>
                  </a>
                  <div class="d-flex custom-amount-product mt-4">
                    <!-- custom-amount-product -->
                    <div class="me-auto">
                                <span class="product-price fw-bold" id="product-price-${c.id}"
                                      style="font-size: 15px; color: #18a0c6;">${ConvertCurrency.FormatCurrencyVND(c.totalPrice)}</span>
                    </div>
                    <div class="number-input1 ms-auto">
                      <button id="minus" data-cart-code="${c.id}"
                              onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                              class="minus">-
                      </button>
                      <input data-cart-code="${c.id}" value="${c.quantity}" min="1" max="1000" id="quantity-${c.id}"
                             name="quantity" class="quantity"
                             type="number">
                      <button data-cart-code="${c.id}"
                              onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                              class="plus">+
                      </button>
                    </div>
                  </div> <!-- custom-amount-product -->
                </div> <!-- product-info -->
              </div>
            </div> <!-- product-in-cart -->
            </c:forEach>
          </div> <!-- wrap-product-in-cart -->
          <div id="menu-cart">
            <div class="total-money-cart d-flex mt-3">
              <span class="fw-bold ms-auto" style="font-size: 17px;">Tổng tiền: </span>
              <span id="result" class="product-price ms-3 fw-bold me-4" style="font-size: 17px; color: red;">
                <c:forEach items="${cartDetail}" var="c">
                  <c:set var="total"
                         value="${total + c.totalPrice}"/>
                </c:forEach>
                ${ConvertCurrency.FormatCurrencyVND(total)}
              </span>
            </div>
            <div class="text-center mt-2 p-2">
              <a href="/customer/cart" class="text-decoration-none">
                <button type="button" class="button-view-details-cart " style="border-radius: 30px; width: 340px;">
                  <span class="fw-bold">Xem giỏ hàng</span>
                </button>
              </a>
            </div>
          </div>
          </c:if>
      </div>
      </ul>
    </div>
  </header>
</div>
<nav class="navbar navbar-expand-md navbar-black bg-black">
  <!-- nav -->
  <div class="container-lg container-fluid" style="height: 55px;"> <!-- container -->
    <div class="wrap_btn_navCollapse">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-top: 15px;">
      <!--  navbar-collapse -->
      <ul class="nav navbar-nav mx-auto mt-md-0" style="font-size: 17px;"> <!-- ul navbar -->
        <li class="nav-item">
          <a class="nav-link" href="/customer/home">TRANG CHỦ</a>
        </li>
        <li class="nav-item dropdown ms-3"> <!-- li dropdown -->
          <a class="nav-link nochange" aria-haspopup="true" role="button" href="/customer/products"
             aria-expanded="false"
             data-bs-toggle="">
            DANH MỤC SẢN PHẨM <span class="arrow down ms-2 mb-1"></span>
          </a>
          <div class="dropdown-center" style="margin-top: 14px;"> <!-- dropdown-center -->
            <ul class="dropdown-menu bg-black" aria-labelledby="navbarDropdown" style="font-size: 18px; width: 535px;">
              <!-- dropdown-menu -->
              <div class="d-flex dropdown-child"> <!-- dropdown-child -->
                <li class="list-category"> <!-- list-category -->
                  <div class="category-name">
                    <a class="dropdown-item dropdown-main ms-3" data-bs-toggle="dropdown" href="#products1">
                      Manga/Anime
                    </a>
                    <div class="line-bottom">
                    </div>
                  </div>
                  <div class="ms-3 mt-2 list-category-child">
                    <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình
                      Dragon Ball
                    </a>
                    <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình
                      One - Putch Man
                    </a>
                    <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình
                      Gundam
                    </a>
                    <!-- <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình -->
                    <!--   One Piece -->
                    <!-- </a> -->
                    <!-- <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình -->
                    <!--   Naruto -->
                    <!-- </a> -->
                    <!-- <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình -->
                    <!--   Attack On Titan -->
                    <!-- </a> -->
                  </div>
                </li> <!-- list-category -->
                <li class="list-category1 ms-2"> <!-- list-category1 -->
                  <div class="category-name1">
                    <a class="dropdown-item me-3" href="#products3">Game/Movie</a>
                    <div class="line-bottom1">
                    </div>
                  </div>
                  <div class="list-category-child1 mt-2">
                    <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình
                      League Of Lengend
                    </a>
                    <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình
                      Marvel Commic
                    </a>
                    <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình
                      Kamen Rider
                    </a>
                    <!-- <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình -->
                    <!--   LEGO Creator Expert -->
                    <!-- </a> -->
                    <!-- <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình -->
                    <!--   Transformers -->
                    <!-- </a> -->
                    <!-- <a class="dropdown-item child" data-bs-toggle="dropdown" href="#products1">Mô hình -->
                    <!--   Samurai -->
                    <!-- </a> -->
                  </div>
                </li> <!-- list-category1 -->
              </div> <!-- dropdown-child -->
            </ul> <!-- dropdown-menu -->
          </div> <!-- dropdown-center -->
        </li>
        <li class="nav-item ms-3">
          <a href="#news" class="nav-link">TIN TỨC</a>
        </li>
        <li class="nav-item ms-3">
          <a href="#contact" class="nav-link">GIỚI THIỆU</a>
        </li>
        <li class="nav-item ms-3">
          <a class="nav-link" href="#guide">LIÊN HỆ</a>
        </li>
        <li class="nav-item ms-3">
          <a class="nav-link" href="#guide">KHUYẾN MÃI</a>
        </li>
      </ul> <!-- ul navbar -->
    </div> <!-- navbar-collapse -->
  </div> <!-- container -->
</nav>
<%@include file="../../assets/js/javascript.jsp" %>
</body>
</html>
