$(function () {
    $('.order-row').on(
        'click',
        'a',
        function (e) {
            var target = $(e.currentTarget);
            if (target.hasClass('pay')||target.hasClass('cancelorder')
                ||target.hasClass('refund')||target.hasClass('confirmorder')) {
                modifyorderstatus(target.parent().parent().find('.orderid').val(), target.attr('class'));
            }
        }
    );
});