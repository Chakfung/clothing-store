$(function () {
    $('.ordertr').on(
        'click',
        'a',
        function (e) {
            var target = $(e.currentTarget);
            if (target.hasClass('ship')) {
                modifyorderstatus(target.parent().parent().find('.orderid').text(), 'ship');
            } else if (target.hasClass('detail')) {
                window.location.href = '/shopadmin/getorderbyId?' + target.parent().parent().find('.orderid').text();
            }
        }
    );

});