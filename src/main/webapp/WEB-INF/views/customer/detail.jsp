<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Detail</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="../../../assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color: #f7f7f7">
<%@include file="../../../common/customer/header.jsp" %>
<div class="__wrap_detail container mt-5 pt-2">
  <div class="__redirect mt-2">
    <a href="/customer/home" class="text-decoration-none text-secondary" style="font-size: 15px;">Trang chủ</a>
    <small class="text-secondary ms-1"> / </small>
    <a class="text-decoration-none text-dark ms-1">Danh mục sản phẩm</a>
  </div>
  <div class="row mt-3">
    <div class="col-8 d-flex __product-detail" style="width: 1030px; height: 530px; margin-top: 12.9px;">
      <div class="" style="position: absolute; bottom: -125px;">
        <img class="__img-detail" src="${product.image}" alt="" width="121.8px" height="110px">
        <img class="__img-detail" src="${product.image}" alt="" width="121.8px" height="110px">
        <img class="__img-detail" src="${product.image}" alt="" width="121.8px" height="110px">
        <img class="__img-detail" src="${product.image}" alt="" width="121.8px" height="110px">
      </div>
      <div class="__thumbnail-detail" style="user-select: none; cursor: pointer;">
        <img class="__img-detail" src="${product.image}" alt="" width="500px" height="400px">
        <img class="__logo" src="../../../assets/img/logo1.jpg" alt="" width="80px"
             style="position: absolute; left: 110px; user-select: none;">
      </div>
      <div class="text-center __promotion" style="width: 70px; height: 40px; left: 110px; top: 430px;">
        <p class="text-white fw-bold mt-1" style="user-select: none; font-size: 20px">-16%
        </p>
      </div>
      <div class=" __wrap-product-detail" style="margin-left: 30px;">
        <div style="height: 100px">
          <span class="fw-bold __product-detail-name">${product.name}</span>
        </div>
        <div class="mt-2 __wrapNo1">
          <span>Mã SP:
            <span class="ms-1" style="color: red;">${product.code}</span>
          </span>
          <small class="ms-2 text-secondary">|</small>
          <span class="ms-2">Tình trạng:
            <span class="ms-1" style="color: red;">Có sẵn</span>
          </span>
        </div>
        <div class="__border-bottom mt-3">
        </div>
        <div class="__product-detail-price mt-4">
          <span class="__product-price-new fw-bold"
                style="font-size: 28px;">${ConvertCurrency.FormatCurrencyVND(product.price)}
          </span>
          <span class="ms-3 __product-price-old me-2 text-secondary text-decoration-line-through fw-bold"
                style="font-size: 17px;">369,000 ₫
          </span>
        </div>
        <div class="d-flex mt-2">
          <div class="number-input mt-3">
            <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus">-</button>
            <input class="quantity" id="quantity-${product.id}" max="1000" min="1" name="quantity" value="1"
                   type="number">
            <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus">+</button>
          </div>
          <div class="d-flex">
            <div class="ms-3" style="margin-top: 12px">
              <a href="#" class="text-decoration-none">
                <button data-product-code="${product.code}" data-bs-toggle="modal"
                        data-bs-target="#exampleModal${product.id}" data-product-id="${product.id}" type="button"
                        class="__add-cart mt-1" style="height: 40px;">
                  <span class="fw-bold">
                    <i class="fas fa-cart-arrow-down me-1"></i>
                    Thêm vào giỏ hàng
                  </span>
                </button>
              </a>
            </div>
          </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal${product.id}">
          <div class="modal-dialog">
            <div class="modal-content p-2">
              <div class="d-flex justify-content-between mt-1 me-1">
                <span></span>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body text-start">
                <span class="fs-4 fw-bold text-uppercase">${product.name}</span>
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
        <div class="mt-4">
          <a href="/customer/cart" class="text-decoration-none">
            <button type="button" class="__buy mt-3" style="height: 60px;">
              <span class="fw-bold">
                Mua ngay
              </span>
            </button>
          </a>
        </div>
        <div class="d-flex" style="margin-top: 39px;">
          <div class="d-flex">
            <img src="https://theme.hstatic.net/1000230347/1000782290/14/policy_product_image_1.png?v=9671" width="60px"
                 height="60px" alt="">
            <span class="mt-4 fw-bold" style="margin-left: 10px;">Giao hàng toàn quốc</span>
          </div>
          <div class="d-flex mt-2 ms-4">
            <img src="https://theme.hstatic.net/1000230347/1000782290/14/policy_product_image_2.png?v=9671" width="40px"
                 height="40px" alt="">
            <span class="fw-bold mt-3" style="margin-top: 9px; margin-left: 10px;">Sản phẩm chính hãng</span>
          </div>
        </div>
      </div>
    </div>
    <div class="col-4 ms-2" style="width: 200px;">
      <div class="__menu-filter-detail rounded" style="width: 350px">
        <div class="p-2">
          <span class="__category__filter-detail fw-bold cate text-uppercase" style="font-size: 18px;">Danh mục sản
            phẩm</span>
        </div>
        <div class="d-flex p-2 mt-2">
          <a href="#" class="text-decoration-none text-dark">
            <span>Sản phẩm</span>
          </a>
        </div>
        <div class="__border-left1-detail" style="margin-left: 10px;">
        </div>
        <div class="__category1-detail">
          <a href="#" class="text-decoration-none">
            <span class="__category__item-detail " style="margin-left: 33px">Mô hình Manga/Anime</span>
          </a>
        </div>
        <div class="__border-left2-detail mt-2" style="margin-left: 35px;">
        </div>
        <div class="mt-2 ms-4">
          <div>
            <a href="#" class="text-decoration-none">
              <span class="__category__item-detail" style="margin-left: 30px">Mô hình Dragon Ball</span>
            </a>
          </div>
          <div class="mt-1">
            <a href="#" class="text-decoration-none">
              <span class="__category__item-detail" style="margin-left: 30px">Mô hình One - Putch Man</span>
            </a>
          </div>
          <div class="mt-1">
            <a href="#" class="text-decoration-none">
              <span class="__category__item-detail" style="margin-left: 30px">Mô hình Gundam</span>
            </a>
          </div>
        </div>
        <div class="__category2 mt-4">
          <a href="#" class="text-decoration-none">
            <span class="__category__item-detail" style="margin-left: 33px">Mô hình Game/Movie</span>
          </a>
        </div>
        <div class="__border-left2-detail mt-2" style="margin-left: 35px;">
        </div>
        <div class="mt-2 ms-4">
          <div class="">
            <a href="#" class="text-decoration-none">
              <span class="__category__item-detail" style="margin-left: 30px">Mô hình League Of Lengend</span>
            </a>
          </div>
          <div class="mt-1">
            <a href="#" class="text-decoration-none">
              <span class="__category__item-detail" style="margin-left: 30px">Mô hình Marvel Commic</span>
            </a>
          </div>
          <div class="mt-1">
            <a href="#" class="text-decoration-none">
              <span class="__category__item-detail" style="margin-left: 30px">Mô hình Kamen Rider</span>
            </a>
          </div>
        </div>
        <div class="__menu-filter-detail1 rounded" style="width: 350px">
          <div class="p-2">
            <span class="__category__filter-detail fw-bold cate text-uppercase" style="font-size: 18px;">Sản phẩm vừa
              xem</span>
            <div class="mt-5">
              <span></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row mt-3" style="margin-left: 2px;">
    <div class="col-8 rounded __info-detail p-3"
         style="width: 978px; max-height: 1650px; margin-top: 12.9px; background-color: #ffffff;">
      <span class="fw-bold fs-4">Mô tả sản phẩm</span>
      <p class="fw-bold mt-3 fst-italic">Thông tin sản phẩm:</p>
      <div class="mt-2">
        <div class="mt-2">
          <span class="fw-bold">Thương hiệu: Japan Anime</span>
        </div>
        <div class="mt-2">
          <span class="fw-bold">Kích thước: Medium</span>
        </div>
        <div class="mt-2">
          <span class="fw-bold">Loại: Figure</span>
        </div>
        <div class="mt-3">
          <span class="">-- Đồ Chơi Mô Hình Beast Kingdom Deadpool Jump Out MEA-004D là mô hình thu nhỏ hoàn hảo của
            nhân
            vật anh hùng Deadpool trong các bộ phim nổi tiếng thế giới. Kiểu dáng nhân vật anh hùng đang chạy ra ngoài
            với sự vui vẻ và hài hước. Những chi tiết nhỏ đều được làm tỉ mỉ đến từng milimet cùng với hình ảnh nhân vật
            nổi tiếng càng tạo nên sự tinh tế sắc sảo. Mô hình Deadpool Maid Outfit chất lượng cao rất phù hợp với các
            bạn trẻ đam mê sưu tầm các nhân vật nổi tiếng để trưng bày tạo nên không gian sống động và lịch lãm.</span>
        </div>
        <div class="mt-3">
          <span class="">-- Lưu ý: Đồ chơi này không phù hợp cho trẻ em dưới 14 tuổi. Đồ chơi có những điểm và góc cạnh
            sắc nhọn, có những chi tiết nhỏ, không được bỏ vào miệng để tránh vô tình nuốt phải. Hãy cẩn thận trong quá
            trình mở hộp và lắp ráp. Việc hư hỏng có chủ ý sẽ không được xem là hàng hóa bị lỗi và sẽ không có linh kiện
            thay thế. Không để đồ chơi gần lửa hay những nơi có nguồn nhiệt cao để tránh làm hư hỏng hay biến dạng sản
            phẩm. Không dùng chất pha loãng, cồn hay những dung môi khác lên đồ chơi, vì có thể làm hư hỏng bề mặt và
            bong tróc lớp sơn.</span>
        </div>
        <div class="text-center collapse" id="collapseExample">
          <img src="${product.image}" width="700px" height="500px" alt="">
          <img src="${product.image}" width="700px" height="500px" alt="">
        </div>
        <div class="text-center mt-4">
          <button type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false"
                  aria-controls="collapseExample" class="__more mt-1 __button_collapse_expand">
            <span class="fw-bold __text_collapse_expand">
            </span>
          </button>
        </div>
      </div>
    </div>
  </div>
  <div class="separator mt-5">
    <span class="header-featured-product fs-3 p-3">SẢN PHẨM TƯƠNG TỰ</span>
  </div>
  <div class="row __wrap-product rounded mt-3 p-2">
    <!-- row -->
    <c:forEach items="${products}" var="p" begin="1" end="5">
      <div class="__product mt-3 col-3 rounded" style="width: 225px; height: 300px; margin-left: 30px;">
        <!-- __products-featured -->
        <a href="/customer/product/${p.code}" class="text-decoration-none">
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
          <a href="#detail" class="text-decoration-none">
            <div class="__product-name">
              <span class="fw-bold">${p.name}</span>
            </div>
          </a>
        </div>
        <div class="__price">
          <span class="__product-price-old me-2 text-secondary text-decoration-line-through fw-bold">369,000 ₫
          </span>
          <span class="__product-price-new fw-bold">${p.price}
            <small>₫</small>
          </span>
        </div>
        <div class="mt-2" style="border-top: 1px solid #ddd; width: 215px; margin-left: -11px;">
        </div>
        <div class="__product__link text-end mt-2">
          <div class="me-1 d-flex justify-content-between">
            <div class="mt-1">
              <span class="mt-1 fw-bold text-success">&#10003</span>
              <span class="mt-1 text-success" style="font-size: 14px;">Còn hàng</span>
              <!-- <span class="fw-bold text-success">&#10003</span> -->
              <!-- <span class="text-success" style="font-size: 14px;">Hết hàng</span> -->
            </div>
            <div class="ms-1">
              <a href="#" class="text-decoration-none">
                <button type="button" class="__add-cart0" style="height: 35px;">
                  <span class="fw-bold text-uppercase">
                    Thêm vào giỏ
                  </span>
                </button>
              </a>
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
</div>

<%@include file="../../../common/customer/footer.jsp" %>
</body>
</html>
