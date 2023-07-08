<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Trang chủ</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="../../../assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<body id="container" style="background-color: #f7f7f7">
<%@include file="../../../common/customer/header.jsp" %>
<section class="wrap_content">
  <!-- wrap_content -->
  <div class="container-full"> <!-- container-full -->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"> <!-- carousel -->
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item" data-bs-interval="7000">
          <img src="../../../assets/img/main1.jpg" class="d-block w-100" alt="..." height="700px" width="100%"/>
        </div>
        <div class="carousel-item active" data-bs-interval="7000">
          <img src="../../../assets/img/main2.jpg" class="d-block w-100" alt="..." height="700px" width="100%"/>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
              data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
              data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div> <!-- carousel -->
  </div> <!-- container full-->
</section><!-- wrap_content -->
<section class="wrap_content1 mt-4"> <!-- wrap_content1 -->
  <div class="container"> <!-- container -->
    <div class="separator">
      <span class="header-featured-product fs-3 p-3">SẢN PHẨM NỔI BẬT</span>
    </div>
    <div class="row __wrap-product rounded mt-3 p-2">
      <!-- row -->
      <c:forEach items="${products}" var="p" begin="1" end="5">
        <div class="__product mt-3 col-3 rounded" style="width: 225px; height: 300px; margin-left: 30px;">
          <!-- __products-featured -->
          <a href="/customer/product/detail/${p.code}" class="text-decoration-none">
            <div class="__wrap-img text-center">
                <%--              <img class="__img rounded mt-2" src="../../../assets/img/f1.png" alt="" width="180px" height="150px">--%>
              <img class="__img rounded mt-2" src="${p.image}" alt="" width="180px" height="150px">
              <img class="__logo" src="../../../assets/img/logo1.jpg" alt="" width="45px"
                   style="position: absolute; left: -10px;">
            </div>
            <div class="text-center __promotion">
              <p class="text-white fw-bold mt-1" style="user-select: none; font-size: 13px;">-16%</p>
            </div>
          </a>
          <div class="mt-2" style="height: 50px;">
            <a href="/customer/product/detail/${p.code}" class="text-decoration-none">
              <div class="__product-name">
                <span class="fw-bold">${p.name}</span>
              </div>
            </a>
          </div>
          <div class="__price">
          <span class="__product-price-old me-2 text-secondary text-decoration-line-through fw-bold">369,000 ₫
          </span>
            <span class="__product-price-new fw-bold">${ConvertCurrency.FormatCurrencyVND(p.price)}
            </span>
          </div>
          <div class="mt-2" style="border-top: 1px solid #ddd; width: 215px; margin-left: -11px;">
          </div>
          <div class="__product__link text-end mt-2">
            <div class="d-flex justify-content-between">
              <div class="mt-1">
                <span class="mt-1 fw-bold text-success">&#10003</span>
                <span class="mt-1 text-success" style="font-size: 14px;">Còn hàng</span>
                <!-- <span class="fw-bold text-success">&#10003</span> -->
                <!-- <span class="text-success" style="font-size: 14px;">Hết hàng</span> -->
              </div>
              <div class="ms-1">
                <button data-product-code="${p.code}" data-product-id="${p.id}" data-bs-toggle="modal"
                        data-bs-target="#exampleModal${p.id}"
                        type="button" class="__add-cart0 add-to-cart trigger"
                        style="height: 35px;">
                  <span class="fw-bold text-uppercase">
                    Thêm vào giỏ
                  </span>
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal${p.id}">
                  <div class="modal-dialog">
                    <div class="modal-content p-2">
                      <div class="d-flex justify-content-between mt-1 me-1">
                        <span></span>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body text-start">
                        <span class="fs-4 fw-bold text-uppercase">${p.name}</span>
                        <div class="alert alert-success mt-2" role="alert">
                          <span class="mt-1 fw-bold text-success">&#10003</span>
                          <span>
                            Sản phẩm đã được thêm vào giỏ hàng
                            </span>
                        </div>
                      </div>
                      <div class="modal-footer d-flex justify-content-between">
                        <div>
                          <a href="/customer/cart" class="text-decoration-none">
                            <button type="button" class="__more1" style="height: 40px">
                          <span class="fw-bold">Xem giỏ hàng
                          </span>
                            </button>
                          </a>
                          <span class="ms-3">hoặc</span>
                          <button data-bs-dismiss="modal" type="button" class="__more1 ms-3" style="height: 40px">
                          <span class="fw-bold">Tiếp tục mua hàng
                          </span>
                          </button>
                        </div>
                        <span></span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Modal -->
              </div>
            </div>
          </div>
        </div>
        <!-- __product-featured -->
      </c:forEach>
    </div> <!-- row -->
    <div class="text-center mt-4">
      <a href="#" class="text-decoration-none">
        <button type="button" class="__more mt-1">
          <span class="fw-bold">Xem thêm
            <i class="fas fa-plus-circle ms-1"></i>
          </span>
        </button>
      </a>
    </div>
  </div> <!-- container -->

</section> <!-- wrap_content1 -->
<section class="wrap_content2 mt-5 pt-3">
  <!-- wrap_content2 -->
  <div class="container-fluid">
    <!-- container, container-fluid -->
    <div class="content_inside">
      <!-- content_inside -->
      <div class="container banner">
        <div class="row">
          <div class="col-8">
            <img src="../../../assets/img/banner1.png" height="550px" width="860px" alt="">
          </div>
          <div class="col-2">
            <img src="../../../assets/img/banner2.png" height="260px" width="430px" alt="">
            <img class="mt-3" src="../../../assets/img/slmain4.png" height="274px" width="430px" alt="">
          </div>
        </div>
      </div>
      <div class="container separator mt-5">
        <span class="header-featured-product fs-3 p-3">TẤT CẢ SẢN PHẨM</span>
      </div>
      <div class="warpper mt-4"> <!-- wrapper -->
        <input class="radio" id="one" name="group" type="radio" checked>
        <input class="radio" id="two" name="group" type="radio">
        <input class="radio" id="three" name="group" type="radio">
        <div class="tabs">
          <label class="tab" id="one-tab" for="one">Sản phẩm mới</label>
          <label class="tab" id="two-tab" for="two">Top bán chạy</label>
<%--          <label class="tab" id="three-tab" for="three">Top khuyến mãi</label>--%>
        </div>
        <div class="panels"> <!-- panels -->
          <div class="panel" style="height: 648px;" id="one-panel"> <!-- one-panel -->
            <div class="row rounded p-0">
              <!-- row -->
              <c:forEach items="${products}" var="p" begin="1" end="10">
                <div class="__product mt-3 col-3 rounded" style="width: 225px; height: 300px; margin-left: 30px;">
                  <!-- __products-featured -->
                  <a href="/customer/product/detail/${p.code}" class="text-decoration-none">
                    <div class="__wrap-img text-center">
                        <%--              <img class="__img rounded mt-2" src="../../../assets/img/f1.png" alt="" width="180px" height="150px">--%>
                      <img class="__img rounded mt-2" src="${p.image}" alt="" width="180px" height="150px">
                      <img class="__logo" src="../../../assets/img/logo1.jpg" alt="" width="45px"
                           style="position: absolute; left: -10px;">
                    </div>
                    <div class="text-center __promotion">
                      <p class="text-white fw-bold mt-1" style="user-select: none; font-size: 13px;">-16%</p>
                    </div>
                  </a>
                  <div class="mt-2" style="height: 50px;">
                    <a href="/customer/product/detail/${p.code}" class="text-decoration-none">
                      <div class="__product-name">
                        <span class="fw-bold">${p.name}</span>
                      </div>
                    </a>
                  </div>
                  <div class="__price">
          <span class="__product-price-old me-2 text-secondary text-decoration-line-through fw-bold">369,000 ₫
          </span>
                    <span class="__product-price-new fw-bold">${ConvertCurrency.FormatCurrencyVND(p.price)}
                    </span>
                  </div>
                  <div class="mt-2" style="border-top: 1px solid #ddd; width: 215px; margin-left: -11px;">
                  </div>
                  <div class="__product__link text-end mt-2">
                    <div class="d-flex justify-content-between">
                      <div class="mt-1">
                        <span class="mt-1 fw-bold text-success">&#10003</span>
                        <span class="mt-1 text-success" style="font-size: 14px;">Còn hàng</span>
                        <!-- <span class="fw-bold text-success">&#10003</span> -->
                        <!-- <span class="text-success" style="font-size: 14px;">Hết hàng</span> -->
                      </div>
                      <div class="ms-1">
                        <button data-product-code="${p.code}" data-product-id="${p.id}" data-bs-toggle="modal"
                                data-bs-target="#exampleModal${p.id}"
                                type="button" class="__add-cart0 add-to-cart trigger"
                                style="height: 35px;">
                  <span class="fw-bold text-uppercase">
                    Thêm vào giỏ
                  </span>
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal${p.id}">
                          <div class="modal-dialog">
                            <div class="modal-content p-2">
                              <div class="d-flex justify-content-between mt-1 me-1">
                                <span></span>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                              </div>
                              <div class="modal-body text-start">
                                <span class="fs-4 fw-bold text-uppercase">${p.name}</span>
                                <div class="alert alert-success mt-2" role="alert">
                                  <span class="mt-1 fw-bold text-success">&#10003</span>
                                  <span>
                            Sản phẩm đã được thêm vào giỏ hàng
                            </span>
                                </div>
                              </div>
                              <div class="modal-footer d-flex justify-content-between">
                                <div>
                                  <a href="/customer/cart" class="text-decoration-none">
                                    <button type="button" class="__more1" style="height: 40px">
                          <span class="fw-bold">Xem giỏ hàng
                          </span>
                                    </button>
                                  </a>
                                  <span class="ms-3">hoặc</span>
                                  <button data-bs-dismiss="modal" type="button" class="__more1 ms-3"
                                          style="height: 40px">
                          <span class="fw-bold">Tiếp tục mua hàng
                          </span>
                                  </button>
                                </div>
                                <span></span>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Modal -->
                      </div>
                    </div>
                  </div>
                </div>
                <!-- __product-featured -->
              </c:forEach>
            </div> <!-- row -->
          </div> <!-- one-panel -->
          <div class="panel" style="height: 648px;" id="two-panel"> <!-- two-panel -->
            <div class="row rounded p-0">
              <!-- row -->
              <c:forEach items="${products}" var="p" begin="11" end="20">
                <div class="__product mt-3 col-3 rounded" style="width: 225px; height: 300px; margin-left: 30px;">
                  <!-- __products-featured -->
                  <a href="/customer/product/detail/${p.code}" class="text-decoration-none">
                    <div class="__wrap-img text-center">
                        <%--              <img class="__img rounded mt-2" src="../../../assets/img/f1.png" alt="" width="180px" height="150px">--%>
                      <img class="__img rounded mt-2" src="${p.image}" alt="" width="180px" height="150px">
                      <img class="__logo" src="../../../assets/img/logo1.jpg" alt="" width="45px"
                           style="position: absolute; left: -10px;">
                    </div>
                    <div class="text-center __promotion">
                      <p class="text-white fw-bold mt-1" style="user-select: none; font-size: 13px;">-16%</p>
                    </div>
                  </a>
                  <div class="mt-2" style="height: 50px;">
                    <a href="/customer/product/detail/${p.code}" class="text-decoration-none">
                      <div class="__product-name">
                        <span class="fw-bold">${p.name}</span>
                      </div>
                    </a>
                  </div>
                  <div class="__price">
          <span class="__product-price-old me-2 text-secondary text-decoration-line-through fw-bold">369,000 ₫
          </span>
                    <span class="__product-price-new fw-bold">${ConvertCurrency.FormatCurrencyVND(p.price)}
                    </span>
                  </div>
                  <div class="mt-2" style="border-top: 1px solid #ddd; width: 215px; margin-left: -11px;">
                  </div>
                  <div class="__product__link text-end mt-2">
                    <div class="d-flex justify-content-between">
                      <div class="mt-1">
                        <span class="mt-1 fw-bold text-success">&#10003</span>
                        <span class="mt-1 text-success" style="font-size: 14px;">Còn hàng</span>
                        <!-- <span class="fw-bold text-success">&#10003</span> -->
                        <!-- <span class="text-success" style="font-size: 14px;">Hết hàng</span> -->
                      </div>
                      <div class="ms-1">
                        <button data-product-code="${p.code}" data-product-id="${p.id}" data-bs-toggle="modal"
                                data-bs-target="#exampleModal${p.id}"
                                type="button" class="__add-cart0 add-to-cart trigger"
                                style="height: 35px;">
                  <span class="fw-bold text-uppercase">
                    Thêm vào giỏ
                  </span>
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal${p.id}">
                          <div class="modal-dialog">
                            <div class="modal-content p-2">
                              <div class="d-flex justify-content-between mt-1 me-1">
                                <span></span>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                              </div>
                              <div class="modal-body text-start">
                                <span class="fs-4 fw-bold text-uppercase">${p.name}</span>
                                <div class="alert alert-success mt-2" role="alert">
                                  <span class="mt-1 fw-bold text-success">&#10003</span>
                                  <span>
                            Sản phẩm đã được thêm vào giỏ hàng
                            </span>
                                </div>
                              </div>
                              <div class="modal-footer d-flex justify-content-between">
                                <div>
                                  <a href="/customer/cart" class="text-decoration-none">
                                    <button type="button" class="__more1" style="height: 40px">
                          <span class="fw-bold">Xem giỏ hàng
                          </span>
                                    </button>
                                  </a>
                                  <span class="ms-3">hoặc</span>
                                  <button data-bs-dismiss="modal" type="button" class="__more1 ms-3"
                                          style="height: 40px">
                          <span class="fw-bold">Tiếp tục mua hàng
                          </span>
                                  </button>
                                </div>
                                <span></span>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Modal -->
                      </div>
                    </div>
                  </div>
                </div>
                <!-- __product-featured -->
              </c:forEach>
            </div> <!-- row -->
          </div> <!-- two-panel -->
<%--          <div class="panel" style="height: 648px;" id="three-panel"> <!-- three-panel -->--%>
<%--            <div class="row rounded p-0">--%>
<%--              <!-- row -->--%>
<%--            </div> <!-- row -->--%>
<%--          </div> <!-- three-panel -->--%>
        </div> <!-- panels -->
        <div class="text-center pt-4">
          <a href="#" class="text-decoration-none">
            <button type="button mt-5 pt-5" class="__more mt-1">
              <span class="fw-bold">Xem tất cả
                <i class="fas fa-arrow-right ms-1"></i>
              </span>
            </button>
          </a>
        </div>
      </div> <!-- wrapper -->
      <div class="container-fluid separator mt-5" style="width: 88%;">
        <span class="header-featured-product fs-4 p-3">Tin tức mới nhất</span>
      </div>
      <div class="__wrap-news container" style="height: 320px">
        <div class="row">
          <div class="col-6 rounded d-flex" style="background-color: #ffffff; width: 640px;">
            <img class="__news-img" src="../../../assets/img/banner2.png" height="150px" width="270px" alt="">
            <div class="mt-2 ms-3">
              <span class="fw-bold" style="font-size: 13px; color: #18a0c6;">19/5/2023</span>
              <p class="__news-name fw-bold text-dark">MÁY XỊN QUÀ XINH - HÈ VUI CỰC ĐỈNH</p>
              <p class="__news-des" style="font-size: 14px; color: grey;">Mùa hè đã đến cùng với những chuyến du
                lịch
                bất tận, hãy
                để
                AMD
                và
                Techzones khiến mùa hè của bạn
                thêm phần hứng khởi với những phần quà cực COOL khi chọn mua sản phẩm laptop được trang bị bộ xử lý
                AMD Ryzen™ được liệt kê trong chương trình “MÁY XỊN QUÀ XINH - HÈ VUI CỰC ĐỈNH”.</p>
            </div>
          </div>
          <div class="col-6 ms-3 rounded d-flex" style="background-color: #ffffff;">
            <img class="__news-img" src="../../../assets/img/banner2.png" height="150px" width="270px" alt="">
            <div class="mt-2 ms-3">
              <span class=" mb-5 fw-bold" style="font-size: 13px; color: #18a0c6;">19/5/2023</span>
              <p class="__news-name fw-bold text-dark">MÁY XỊN QUÀ XINH - HÈ VUI CỰC ĐỈNH</p>
              <p class="__news-des" style="font-size: 14px; color: grey;">Mùa hè đã đến cùng với những chuyến du
                lịch
                bất tận, hãy
                để
                AMD
                và
                Techzones khiến mùa hè của bạn
                thêm phần hứng khởi với những phần quà cực COOL khi chọn mua sản phẩm laptop được trang bị bộ xử lý
                AMD Ryzen™ được liệt kê trong chương trình “MÁY XỊN QUÀ XINH - HÈ VUI CỰC ĐỈNH”.</p>
            </div>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-6 rounded d-flex" style="background-color: #ffffff; width: 640px;">
            <img class="__news-img" src="../../../assets/img/banner1.png" height="150px" width="270px" alt="">
            <div class="mt-2 ms-3">
              <span class="fw-bold" style="font-size: 13px; color: #18a0c6;">19/5/2023</span>
              <p class="__news-name fw-bold text-dark">MÁY XỊN QUÀ XINH - HÈ VUI CỰC ĐỈNH</p>
              <p class="__news-des" style="font-size: 14px; color: grey;">Mùa hè đã đến cùng với những chuyến du
                lịch
                bất tận, hãy
                để
                AMD
                và
                Techzones khiến mùa hè của bạn
                thêm phần hứng khởi với những phần quà cực COOL khi chọn mua sản phẩm laptop được trang bị bộ xử lý
                AMD Ryzen™ được liệt kê trong chương trình “MÁY XỊN QUÀ XINH - HÈ VUI CỰC ĐỈNH”.</p>
            </div>
          </div>
          <div class="col-6 ms-3 rounded d-flex" style="background-color: #ffffff;">
            <img class="__news-img" src="../../../assets/img/banner1.png" height="150px" width="270px" alt="">
            <div class="mt-2 ms-3">
              <span class=" mb-5 fw-bold" style="font-size: 13px; color: #18a0c6;">19/5/2023</span>
              <p class="__news-name fw-bold text-dark">MÁY XỊN QUÀ XINH - HÈ VUI CỰC ĐỈNH</p>
              <p class="__news-des" style="font-size: 14px; color: grey;">Mùa hè đã đến cùng với những chuyến du
                lịch
                bất tận, hãy
                để
                AMD
                và
                Techzones khiến mùa hè của bạn
                thêm phần hứng khởi với những phần quà cực COOL khi chọn mua sản phẩm laptop được trang bị bộ xử lý
                AMD Ryzen™ được liệt kê trong chương trình “MÁY XỊN QUÀ XINH - HÈ VUI CỰC ĐỈNH”.</p>
            </div>
          </div>
        </div>
      </div>
      <div class="text-center pt-4">
        <a href="#" class="text-decoration-none">
          <button type="button mt-5 pt-5" class="__more mt-1">
            <span class="fw-bold">Xem thêm
              <i class="fas fa-arrow-right ms-1"></i>
            </span>
          </button>
        </a>
      </div>
    </div> <!-- content_inside -->
  </div> <!-- container-fluid -->
</section>
<!-- wrap_content2 -->
<%@include file="../../../common/customer/footer.jsp" %>

</body>
</html>
