$(function () {

    $(window).load(getTotalPrice());

    function getTotalPrice() {
        var totalPrice = parseInt(0);
        var cartPricestr;
        $('.product-subtotal').map(function (index, item) {
            cartPricestr = $(item).html();
            var cartPriceNum = parseInt(cartPricestr);
            totalPrice = totalPrice + cartPriceNum;
        });
        $('#total').html(totalPrice);
    }

    $('.cart-row')
        .on(
            'click',
            'a',
            function (e) {
                var target = $(e.currentTarget);
                if (target.hasClass('removecart')) {
                    removeCart(e.currentTarget.dataset.id);
                }
            }
        );

    $('.tocheckout').on('click', function () {
        generateorder();
    });

});