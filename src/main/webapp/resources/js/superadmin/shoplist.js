$(function () {
    $('.content').on(
        'click',
        'a',
        function (e) {
            var target = $(e.currentTarget);
            if (target.hasClass('lock')) {
                changeShopStatus(e.currentTarget.dataset.id,0);
            } else if (target.hasClass('unlock')) {
                changeShopStatus(e.currentTarget.dataset.id,1);
            }
        }
    );

    function changeShopStatus(id, status) {
        var statusUrl = '/superadmin/changeshopstatus';
        var shop = {};
        shop.shopId = id;
        shop.enableStatus = status;
        $.ajax({
            url:statusUrl,
            type:'POST',
            data:{
                shopStr: JSON.stringify(shop),
            },
            dataType:'json',
            success: function (data) {
                if (data.success) {
                    alert('操作成功!');
                    window.location.reload();
                } else {
                    alert('操作失败!' + data.errMsg);
                }
            }
        });
    }
});