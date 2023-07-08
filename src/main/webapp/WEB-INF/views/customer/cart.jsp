<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Cart</title>
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
    <a class="text-decoration-none text-dark ms-1">Giỏ hàng</a>
  </div>
  <div class="text-center mt-1 __wrap-header-cart">
    <span class="fw-bold __header-cart fs-2">Giỏ hàng của bạn</span>
  </div>
  <c:if test="${not empty cartDetail}">
    <div class="" style="position: absolute; top: 410px">
      <a href="/customer/cart/delete-all" class="text-decoration-none text-light">
        <button class="btn btn-danger" style="height: 40px">
        <span class="delete-all fw-bold" style="font-size: 17.5px;">
        Xóa toàn bộ giỏ hàng
        </span>
          <i class="ms-1 mt-2 fas fa-trash-alt"></i>
        </button>
      </a>
    </div>
  </c:if>
  <div class="row mt-5 pt-2" style="margin-left: 2px">
    <div class="col-8 __cart-total-item mt-4"
         style="border: 1px solid #ddd;width: 800px; height: auto; background-color: #fff;">
      <c:if test="${empty cartDetail}">
        <div id="cart-null" class="text-center">
          <div class="mt-4">
            <img src="//bizweb.dktcdn.net/100/418/981/themes/854485/assets/cart_empty_background.png?1678507984338"
                 alt="">
          </div>
          <div class="mt-3">
            <span class="fw-bold fs-5">"Giỏ hàng" của bạn đang trống</span>
            <p class="mt-2 text-secondary">Về trang cửa hàng để chọn mua sản phẩm bạn nhé!!</p>
          </div>
          <div class="mt-2">
            <a href="/customer/home" class="text-decoration-none">
              <button type="button" class="__more" style="height: 50px;">
              <span class="fw-bold">
                Mua sắm ngay
              </span>
              </button>
            </a>
          </div>
        </div>
      </c:if>
      <c:if test="${not empty cartDetail}">
        <c:forEach items="${cartDetail}" var="p">
          <div id="cart-not-null" class="__cart-item d-flex mt-2" style="height: 135px;">
            <a href="/customer/product/detail/${p.productCode}" class="text-decoration-none __cart-link-item"
               style="margin-top: 3px;">
              <div class="__wrap-img text-center">
                <img class="__img rounded" src="${p.productImage}" alt="" width="150px" height="130px">
                <img class="__logo" src="../../../assets/img/logo1.jpg" alt="" width="40px"
                     style="position: absolute; left: 1px;">
              </div>
            </a>
            <div class="ms-4">
              <div class="__product-name-cart" style="height: 60px;">
                <a href="/customer/product/detail/${p.productCode}" class="text-decoration-none text-dark">
                  <span class="__name-product-cart">${p.productName}</span>
                </a>
              </div>
              <div class="__price mt-2" style="cursor:auto;">
                          <span class="__product-price-new fw-bold" id="product-price1-${p.id}"
                                style="cursor: pointer; font-size: 18px;">
                              ${ConvertCurrency.FormatCurrencyVND(p.totalPrice)}
                          </span>
              </div>
              <div class="d-flex justify-content-between">
                <div class="number-input1 mt-3">
                  <button id="minus1" data-cart-code="${p.id}"
                          onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                          class="minus1">-
                  </button>
                  <input data-cart-code="${p.id}" value="${p.quantity}" min="1" max="1000" id="quantity1-${p.id}"
                         name="quantity" class="quantity1"
                         type="number">
                  <button data-cart-code="${p.id}" id="plus1"
                          onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                          class="plus1">+
                  </button>
                </div>
                <span id="hello"></span>
                <div style="position: absolute; left: 850px">
                  <a href="/customer/cart/delete/${p.id}">
                    <div class="triangle triangle-0" style="margin-top: 5.5px;">
                      <button data-cart-code="${p.id}" type="button"
                              style="position: absolute; border: none; outline: none; background: none; cursor: pointer;"
                              class="delete-cartItem">
                        <i class="fas fa-trash-alt text-white"></i>
                      </button>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div class="__border-bottom-cart-item" style="margin-top: 13px;">
          </div>
        </c:forEach>
      </c:if>
    </div>
    <div class="col-4 p-1"
         style="border: 1px solid #ddd; margin-top: 22.5px; margin-left: 50px; background-color: #fff; height: 340px; box-shadow: 0 0.05rem 0.3rem #00000080;">
      <div class="p-1 mt-2 ms-3">
        <p class="fw-bold __cart-total-money" style="font-size: 25px;">Thông tin giỏ hàng</p>
        <div class="__border-bottom-cart-item" style="margin-top: 3px; color: #eee;">
        </div>
        <div class="d-flex justify-content-between mt-2">
          <p class="fw-bold __cart-total-money mt-3" style="font-size: 18px;">Tổng tiền:</p>
          <p id="result1" class="fw-bold __cart-total-money me-3 mt-2" style="font-size: 28px; color: red;">
            <c:if test="${empty cartDetail}">
              0 <small>₫</small>
            </c:if>
            <c:if test="${not empty cartDetail}">
              ${ConvertCurrency.FormatCurrencyVND(total)}
            </c:if>
          </p>
        </div>
        <div class="__border-bottom-cart-item" style="margin-top: 0px; color: #eee;">
        </div>
        <div class="mt-2">
          <span style="font-size: 15px; color: #444;">Phí vận chuyển sẽ được tính ở trang thanh toán.
          </span>
        </div>
        <div>
          <span style="font-size: 15px; color: #444;">Bạn cũng có thể nhập mã giảm giá ở trang thanh toán.
          </span>
        </div>
      </div>
      <div class="mt-3 text-center">
        <c:if test="${empty cartDetail}">
          <div class="alert alert-danger ms-3" style="width: 93.5%" role="alert">
            Giỏ hàng chưa có sản phẩm! Không thể thanh toán!
          </div>
        </c:if>
        <c:if test="${not empty cartDetail}">
          <a href="/customer/payment" class="text-decoration-none">
            <button disabled type="button" class="__payment" style="height: 60px; width: 91%;">
            <span class="fw-bold">
              Tiến hành thanh toán
            </span>
            </button>
          </a>
        </c:if>
      </div>
      <div class="mt-3 text-center">
        <a href="/customer/home" class="text-decoration-none">
          <i class="fas fa-arrow-left" style="color: #cc0000;"></i>
          <span class="ms-1" style="font-size: 15px; color: #cc0000;">Tiếp tục mua hàng</span>
        </a>
      </div>
    </div>
  </div>
</div>
<%@include file="../../../common/customer/footer.jsp" %>
</body>
</html>
