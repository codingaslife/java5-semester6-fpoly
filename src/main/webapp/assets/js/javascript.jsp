<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/taglib.jsp" %>
<script type="text/javascript">
    $('.dropdown-cart').on('hide.bs.dropdown', function (e) {
        if (e.clickEvent && e.clickEvent.target.className != "btn-close") {
            e.preventDefault();
        }
    });
    $(function () {
        $('.__add-cart').click(function () {
            var productCode = $(this).data('product-code');
            var cartDetailId = $(this).data('product-id');
            var quantity = document.getElementById('quantity-' + cartDetailId).value;
            $.ajax({
                url: '/customer/add-to-cart-by-quantity',
                type: 'GET',
                dataType: 'json',
                data: {
                    productCode: productCode,
                    quantity: quantity,
                },
                success: function (data) {
                    $('#menu-cart').html('');
                    $('#wrap-cart').find("#menu-cart").remove();
                    var totalPrice = 0;
                    $.each(data, function (index, p) {
                        totalPrice += p.totalPrice;
                    });
                    var result = totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                    var menuCart =
                        '<div id="menu-cart">' +
                        '<div class="total-money-cart d-flex mt-3">' +
                        '<span class="fw-bold ms-auto" style="font-size: 17px;">Tổng tiền: </span>' +
                        '<span id="result" class="product-price ms-3 fw-bold me-4" style="font-size: 17px; color: red;">' + result + '</span>' +
                        '</div>' +
                        '<div class="text-center mt-2 p-2">' +
                        '<a href="/customer/cart" class="text-decoration-none">' +
                        '<button type="button" class="button-view-details-cart " style="border-radius: 30px; width: 340px;">' +
                        '<span class="fw-bold">Xem giỏ hàng</span>' +
                        '</button>' +
                        '</a>' +
                        '</div>' +
                        '</div>';
                    $('#wrap-cart').append(menuCart);
                    $('#cart').html('');
                    $.each(data, function (index, c) {
                        var cartDetail =
                            '<div class="product-in-cart" id="product-in-cart-' + c.id + '" style="background-color: white; height: 120px;">' +
                            '<div class="__wrap-inside d-flex mt-2" id="wrap-inside">' +
                            '<a href="/customer/product/detail/' + c.productCode + '" class="text-decoration-none text-dark">' +
                            '<div class="product-img">' +
                            '<img src="' + c.productImage + '" width="155px" height="100px">' +
                            '</div>' +
                            '<div class="row product-info">' +
                            '<div class="wrap-product-name">' +
                            '<span id="product-name" class="text-start product-name fw-bold" style="font-family: "Roboto", sans-serif;">' + c.productName + '</span>' +
                            '</div>' +
                            '</a>' +
                            '<div class="d-flex justify-content-around custom-amount-product mt-4">' +
                            '<div class="me-auto">' +
                            '<span class="product-price fw-bold" id="product-price-' + c.id + '" style="font-size: 15px; color: #18a0c6;">' + c.totalPriceVND + '</span>' +
                            '</div>' +
                            '<div class="number-input1 ms-auto">' +
                            '<button data-cart-code="' + c.id + '" onclick="this.parentNode.querySelector(\'input[type=number]\').stepDown()" class="minus">-</button>' +
                            '<input data-cart-code="' + c.id + '" class="quantity" min="1" max="1000" id="quantity-' + c.id + '" name="quantity" value="' + c.quantity + '" type="number">' +
                            '<button data-cart-code="' + c.id + '" onclick="this.parentNode.querySelector(\'input[type=number]\').stepUp()" class="plus">+</button>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                        $('#cart').append(cartDetail);
                    });
                    var totalItems = 0;
                    $.each(data, function (index, p) {
                        totalItems += p.quantity;
                    });
                    $('#cartLength').text(totalItems);
                    // $.each(data, function (index, c) {
                    //     $('#product-price-' + c.id).text(c.totalPriceVND);
                    //     $('#quantity-' + c.id).val(c.quantity);
                    // });
                    // var totalPrice = 0;
                    // $.each(data, function (index, p) {
                    //     totalPrice += p.totalPrice;
                    // });
                    // var result = totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                    // $('#result').html(result);
                }
            });
        });
    });

    $(function () {
        $('.add-to-cart').click(function () {
            var productCode = $(this).data('product-code');
            $.ajax({
                url: '/customer/add-to-cart',
                type: 'GET',
                dataType: 'json',
                data: {
                    productCode: productCode,
                },
                success: function (data) {
                    $('#menu-cart').html('');
                    $('#wrap-cart').find("#menu-cart").remove();
                    var totalPrice = 0;
                    $.each(data, function (index, p) {
                        totalPrice += p.totalPrice;
                    });
                    var result = totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                    var menuCart =
                        '<div id="menu-cart">' +
                        '<div class="total-money-cart d-flex mt-3">' +
                        '<span class="fw-bold ms-auto" style="font-size: 17px;">Tổng tiền: </span>' +
                        '<span id="result" class="product-price ms-3 fw-bold me-4" style="font-size: 17px; color: red;">' + result + '</span>' +
                        '</div>' +
                        '<div class="text-center mt-2 p-2">' +
                        '<a href="/customer/cart" class="text-decoration-none">' +
                        '<button type="button" class="button-view-details-cart " style="border-radius: 30px; width: 340px;">' +
                        '<span class="fw-bold">Xem giỏ hàng</span>' +
                        '</button>' +
                        '</a>' +
                        '</div>' +
                        '</div>';
                    $('#wrap-cart').append(menuCart);
                    $('#cart').html('');
                    $.each(data, function (index, c) {
                        var cartDetail =
                            '<div class="product-in-cart" id="product-in-cart-' + c.id + '" style="background-color: white; height: 120px;">' +
                            '<div class="__wrap-inside d-flex mt-2" id="wrap-inside">' +
                            '<a href="/customer/product/detail/' + c.productCode + '" class="text-decoration-none text-dark">' +
                            '<div class="product-img">' +
                            '<img src="' + c.productImage + '" width="155px" height="100px">' +
                            '</div>' +
                            '<div class="row product-info">' +
                            '<div class="wrap-product-name">' +
                            '<span id="product-name" class="text-start product-name fw-bold" style="font-family: "Roboto", sans-serif;">' + c.productName + '</span>' +
                            '</div>' +
                            '</a>' +
                            '<div class="d-flex justify-content-around custom-amount-product mt-4">' +
                            '<div class="me-auto">' +
                            '<span class="product-price fw-bold" id="product-price-' + c.id + '" style="font-size: 15px; color: #18a0c6;">' + c.totalPriceVND + '</span>' +
                            '</div>' +
                            '<div class="number-input1 ms-auto">' +
                            '<button data-cart-code="' + c.id + '" onclick="this.parentNode.querySelector(\'input[type=number]\').stepDown()" class="minus">-</button>' +
                            '<input data-cart-code="' + c.id + '" class="quantity" min="1" max="1000" id="quantity-' + c.id + '" name="quantity" value="' + c.quantity + '" type="number">' +
                            '<button data-cart-code="' + c.id + '" onclick="this.parentNode.querySelector(\'input[type=number]\').stepUp()" class="plus">+</button>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                        $('#cart').append(cartDetail);
                    });
                    var totalItems = 0;
                    $.each(data, function (index, p) {
                        totalItems += p.quantity;
                    });
                    $('#cartLength').text(totalItems);
                    // $.each(data, function (index, c) {
                    //     $('#product-price-' + c.id).text(c.totalPriceVND);
                    //     $('#quantity-' + c.id).val(c.quantity);
                    // });
                    // var totalPrice = 0;
                    // $.each(data, function (index, p) {
                    //     totalPrice += p.totalPrice;
                    // });
                    // var result = totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                    // $('#result').html(result);
                }
            });
        });
    });
    $(document).on('click', '.plus1, .minus1', function () {
        var isPlus = $(this).hasClass("plus1");
        var cartDetailId = $(this).attr('data-cart-code');
        var quantity = document.getElementById('quantity1-' + cartDetailId).value;
        $.ajax({
            url: '/customer/change-quantity-by-button/cart-item',
            type: 'GET',
            dataType: 'json',
            data: {
                quantity: quantity,
                cartDetailId: cartDetailId,
                isPlus: isPlus,
            },
            success: function (data) {
                var list = data.cartItems;
                var totalItems = 0;
                var totalPrice = 0;
                $.each(list, function (index, p) {
                    totalPrice += p.totalPrice;
                });
                $.each(list, function (index, p) {
                    totalItems += p.quantity;
                });
                var result = totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                $('#quantity-' + cartDetailId).val(data.quantity);
                $('#product-price1-' + cartDetailId).html(data.totalPriceVND);
                $('#result1').html(result);
                $('#product-price-' + cartDetailId).html(data.totalPriceVND);
                $('#result').html(result);
                $('#cartLength').text(totalItems);
            }
        });
    });
    $(document).on('click', '.plus, .minus', function () {
        var isPlus = $(this).hasClass("plus");
        var cartDetailId = $(this).attr('data-cart-code');
        var quantity = document.getElementById('quantity-' + cartDetailId).value;
        $.ajax({
            url: '/customer/change-quantity-by-button/cart-item',
            type: 'GET',
            dataType: 'json',
            data: {
                quantity: quantity,
                cartDetailId: cartDetailId,
                isPlus: isPlus,
            },
            success: function (data) {
                var list = data.cartItems;
                var totalItems = 0;
                var totalPrice = 0;
                $.each(list, function (index, p) {
                    totalPrice += p.totalPrice;
                });
                $.each(list, function (index, p) {
                    totalItems += p.quantity;
                });
                var result = totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                var totalPricePayment = totalPrice + 30000;
                totalPricePayment = totalPricePayment.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                $('#result2').html(totalPricePayment);
                $('#quantity-' + cartDetailId).val(data.quantity);
                $('#quantity1-' + cartDetailId).val(data.quantity);
                $('#product-price1-' + cartDetailId).html(data.totalPriceVND);
                $('#result1').html(result);
                $('#product-price-' + cartDetailId).html(data.totalPriceVND);
                $('#result').html(result);
                $('#product-price2-' + cartDetailId).html(data.totalPriceVND);
                $('#cartLength').text(totalItems);
            }
        });
    });
    $(document).on('input', '.quantity', function () {
        var cartDetailId = $(this).data('cart-code');
        var quantity = document.getElementById('quantity-' + cartDetailId).value;
        $.ajax({
            url: '/customer/change-quantity-by-input/cart-item',
            type: 'GET',
            dataType: 'json',
            data: {
                quantity: quantity,
                cartDetailId: cartDetailId,
            },
            success: function (data) {
                var list = data.cartItems;
                var totalItems = 0;
                var totalPrice = 0;
                $.each(list, function (index, p) {
                    totalPrice += p.totalPrice;
                });
                $.each(list, function (index, p) {
                    totalItems += p.quantity;
                });
                var result = totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                var totalPricePayment = totalPrice + 30000;
                totalPricePayment = totalPricePayment.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                $('#result2').html(totalPricePayment);
                $('#quantity-' + cartDetailId).val(data.quantity);
                $('#quantity1-' + cartDetailId).val(data.quantity);
                $('#product-price1-' + cartDetailId).html(data.totalPriceVND);
                $('#result1').html(result);
                $('#product-price-' + cartDetailId).html(data.totalPriceVND);
                $('#result').html(result);
                $('#cartLength').text(totalItems);
                $('#product-price2-' + cartDetailId).html(data.totalPriceVND);
            }
        });
    });

    $(document).on('input', '.quantity1', function () {
        var cartDetailId = $(this).data('cart-code');
        var quantity = document.getElementById('quantity1-' + cartDetailId).value;
        $.ajax({
            url: '/customer/change-quantity-by-input/cart-item',
            type: 'GET',
            dataType: 'json',
            data: {
                quantity: quantity,
                cartDetailId: cartDetailId,
            },
            success: function (data) {
                var list = data.cartItems;
                var totalItems = 0;
                var totalPrice = 0;
                $.each(list, function (index, p) {
                    totalPrice += p.totalPrice;
                });
                $.each(list, function (index, p) {
                    totalItems += p.quantity;
                });
                var result = totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                $('#quantity-' + cartDetailId).val(data.quantity);
                $('#product-price1-' + cartDetailId).html(data.totalPriceVND);
                $('#result1').html(result);
                $('#product-price-' + cartDetailId).html(data.totalPriceVND);
                $('#result').html(result);
                $('#cartLength').text(totalItems);
            }
        });
    });

    // $(function () {
    //     $('.plus1').click(function () {
    //         var cartDetailId = $(this).data('cart-code');
    //         var quantity = document.getElementById('quantity1-' + cartDetailId).value;
    //         alert(cartDetailId)
    //         $.ajax({
    //             url: '/customer/increment-quantity/cart-item',
    //             type: 'GET',
    //             dataType: 'json',
    //             data: {
    //                 quantity: quantity,
    //                 cartDetailId: cartDetailId,
    //             },
    //             success: function (data) {
    //                 var list = data.cartItems;
    //                 var totalItems = 0;
    //                 var totalPrice = 0;
    //                 $.each(list, function (index, p) {
    //                     totalPrice += p.totalPrice;
    //                 });
    //                 $.each(list, function (index, p) {
    //                     totalItems += p.quantity;
    //                 });
    //                 var result = totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
    //                 $('#product-price1-' + cartDetailId).html(data.totalPriceVND);
    //                 $('#result1').html(result);
    //                 $('#cartLength').text(totalItems);
    //             }
    //         });
    //     });
    // });
</script>
