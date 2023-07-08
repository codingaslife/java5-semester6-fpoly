<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Danh mục sản phẩm</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="../../../assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color: #f7f7f7">
<%@include file="../../../common/customer/header.jsp" %>
<div class="container mt-5" style="height: 1300px;">
  <div class="row">
    <div class="p-2 d-flex justify-content-between">
      <div class="__redirect mt-2">
        <a href="/admin/home" class="text-decoration-none text-secondary" style="font-size: 15px;">Trang chủ</a>
        <small class="text-secondary ms-1"> / </small>
        <a href="/admin/cua-hang/show-all" class="text-decoration-none text-dark ms-1">Danh mục sản phẩm</a>
      </div>
      <div class="custom-select me-1">
        <select name="Country" id="country">
          <option value="" hidden>Sắp xếp</option>
          <option value="1">Thứ tự theo giá: thấp đến cao</option>
          <option value="1">Thứ tự theo giá: cao xuống thấp</option>
        </select>
        <span class="custom-arrow"></span>
      </div>
    </div>
    <div class="col-3 mt-2 __menu-filter rounded" style="width: 350px">
      <div class="p-2">
        <span class="__category__filter fw-bold cate text-uppercase" style="font-size: 18px;">Danh mục sản phẩm</span>
      </div>
      <div class="d-flex p-2 justify-content-between mt-2">
        <a href="#" class="text-decoration-none text-dark">
          <span>Sản phẩm</span>
        </a>
        <small class="text-secondary mt-1">(${products.size()})</small>
      </div>
      <div class="__border-left1" style="margin-left: 10px;">
      </div>
      <div class="__category1">
        <a href="#" class="text-decoration-none">
          <span class="__category__item " style="margin-left: 33px">Mô hình Manga/Anime</span>
        </a>
      </div>
      <div class="__border-left2 mt-2" style="margin-left: 35px;">
      </div>
      <div class="mt-2 ms-4">
        <div>
          <a href="#" class="text-decoration-none">
            <span class="__category__item" style="margin-left: 30px">Mô hình Dragon Ball</span>
          </a>
        </div>
        <div class="mt-1">
          <a href="#" class="text-decoration-none">
            <span class="__category__item" style="margin-left: 30px">Mô hình One - Putch Man</span>
          </a>
        </div>
        <div class="mt-1">
          <a href="#" class="text-decoration-none">
            <span class="__category__item" style="margin-left: 30px">Mô hình Gundam</span>
          </a>
        </div>
      </div>
      <div class="__category2 mt-4">
        <a href="#" class="text-decoration-none">
          <span class="__category__item " style="margin-left: 33px">Mô hình Game/Movie</span>
        </a>
      </div>
      <div class="__border-left2 mt-2" style="margin-left: 35px;">
      </div>
      <div class="mt-2 ms-4">
        <div class="">
          <a href="#" class="text-decoration-none">
            <span class="__category__item" style="margin-left: 30px">Mô hình League Of Lengend</span>
          </a>
        </div>
        <div class="mt-1">
          <a href="#" class="text-decoration-none">
            <span class="__category__item" style="margin-left: 30px">Mô hình Marvel Commic</span>
          </a>
        </div>
        <div class="mt-1">
          <a href="#" class="text-decoration-none">
            <span class="__category__item" style="margin-left: 30px">Mô hình Kamen Rider</span>
          </a>
        </div>
      </div>
      <div class="p-2 mt-5 __menu-filter1">
        <span class="__category__filter1 fw-bold cate text-uppercase" style="font-size: 18px;">Bộ lọc</span>
      </div>
      <div class="p-2">
        <div class="mt-4">
          <span class="__category__filter1 fw-bold cate" style="font-size: 15.5px;">Loại sản phẩm</span>
        </div>
        <div class="mt-2 d-flex __filter0">
          <div class="__wrap__checkbox" style="cursor: pointer;">
            <input class="__checkbox" id="wp-comment-cookies-consent" name="wp-comment-cookies-consent" type="checkbox"
                   value="yes">
            <label for="wp-comment-cookies-consent">Có sẵn</label>
          </div>
          <div class="ms-4 __wrap__checkbox" style="cursor: pointer;">
            <input class="__checkbox" id="wp-comment-cookies-consent1" name="wp-comment-cookies-consent" type="checkbox"
                   value="yes">
            <label for="wp-comment-cookies-consent1">Order</label>
          </div>
        </div>
        <div class="__border-bottom mt-3">
        </div>
        <div class="mt-4">
          <span class="__category__filter1 fw-bold cate" style="font-size: 15.5px;">Kích thước</span>
        </div>
        <div class="custom-select mt-2">
          <select name="Country" class="country">
            <option value="" hidden>Chọn kích thước</option>
            <option value="1">Nhỏ (2cm - 12cm)</option>
            <option value="1">Trung bình (12cm - 30cm)</option>
            <option value="1">Lớn (31cm trở lên)</option>
          </select>
          <span class="custom-arrow"></span>
        </div>
        <div class="__border-bottom mt-4">
        </div>
        <div class="mt-4">
          <span class="__category__filter1 fw-bold cate" style="font-size: 15.5px;">Thương hiệu</span>
        </div>
        <div class="custom-select mt-2">
          <select name="Country" class="country">
            <option value="" hidden>Chọn thương hiệu</option>
            <option value="1">Nhỏ</option>
            <option value="1">Trung bình</option>
            <option value="1">Lớn</option>
          </select>
          <span class="custom-arrow"></span>
        </div>
        <div class="__border-bottom mt-4">
        </div>
      </div>
      <div class="p-2">
        <div class="mt-1">
          <span class="__category__filter1 fw-bold cate" style="font-size: 15.5px;">Giá</span>
        </div>
        <div class="wrapper mt-3">
          <fieldset class="filter-price">
            <div class="price-field">
              <input type="range" min="100" max="500" value="100" id="lower">
              <input type="range" min="100" max="500" value="500" id="upper">
            </div>
            <div class="price-wrap mt-3">
              <span class="price-title">Giá</span>
              <div class="price-wrap-1">
                <input id="one">
                <label for="one" class="fw-bold" style="color: red;">₫</label>
              </div>
              <div class="price-wrap_line">-</div>
              <div class="price-wrap-2">
                <input id="two">
                <label for="two" class="fw-bold" style="color: red;">₫</label>
              </div>
            </div>
          </fieldset>
        </div>
        <div class="mt-4">
          <a href="#" class="text-decoration-none">
            <button type="button" class="__button-filter rounded mt-1">
              <span class="fw-bold">Lọc
              </span>
            </button>
          </a>
        </div>
      </div>
    </div>
    <div class="col-9 ms-4" style="width: 940px;">
      <div class="row __wrap__products rounded">
        <!-- row -->
        <c:forEach items="${products}" var="p" varStatus="k">
          <div class="__product mt-3 col-3 ms-3 rounded" style="width: 218px; height: 300px;">
            <!-- __products-featured -->
            <a href="/customer/product/detail/${p.code}" class="text-decoration-none">
              <div class="__wrap-img text-center">
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
                  <span id="product-name-${p.id}">${p.name}</span>
                </div>
              </a>
            </div>
            <div class="__price mt-2">
            <span class="__product-price-old me-2 text-secondary text-decoration-line-through fw-bold">369,000 ₫
            </span>
              <span class="__product-price-new fw-bold">${ConvertCurrency.FormatCurrencyVND(p.price)}
              </span>
            </div>
            <div class="mt-2" style="border-top: 1px solid #ddd; width: 215px; margin-left: -11px;">
            </div>
            <div class="__product__link mt-2">
              <div class="d-flex">
                <div class="mt-1 me-1">
                  <span class="mt-1 fw-bold text-success">&#10003</span>
                  <span class="mt-1 text-success" style="font-size: 13.5px;">Còn hàng</span>
                  <!-- <span class="fw-bold text-success">&#10003</span> -->
                  <!-- <span class="text-success" style="font-size: 14px;">Hết hàng</span> -->
                </div>
                <div class="ms-3">
                  <button data-product-code="${p.code}" data-product-id="${p.id}" data-bs-toggle="modal"
                          data-bs-target="#exampleModal${p.id}"
                          type="button" class="__add-cart0 add-to-cart trigger"
                          style="height: 30px; width: 100px">
                  <span class="fw-bold text-uppercase">
                    Thêm vào giỏ
                  </span>
                  </button>
                  <!-- Modal -->
                  <div class="modal fade" id="exampleModal${p.id}" role="dialog">
                    <div class="modal-dialog">
                      <div class="modal-content p-2">
                        <div class="d-flex justify-content-between mt-1 me-1">
                          <span></span>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-start">
                          <span class="fs-4 fw-bold text-uppercase" id="modal-product-name-${p.id}">${p.name}</span>
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
    </div>
    <div class="d-flex justify-content-center" style="margin-top: 590px; margin-left: 175px">
      <nav aria-label="...">
        <ul class="pagination">
          <li class="page-item ${currentPage > 1 ? "" : "disabled"}">
            <a class="page-link" href="/customer/products?currentPage=${currentPage - 1}" tabindex="-1"
               aria-disabled="true">Previous</a>
          </li>
          <c:forEach var="i" begin="1" end="${totalPages}">
            <li class="page-item ${currentPage == i ? "active" : ""} ">
              <a class="page-link" href="/customer/products?currentPage=${i}">${i}</a>
            </li>
          </c:forEach>
          <li class="page-item ${currentPage < totalPages ? "" : "disabled"}">
            <a class="page-link" href="/customer/products?currentPage=${currentPage + 1}">Next</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
</div>
<%@include file="../../../common/customer/footer.jsp" %>
</body>
</html>
