$(function () {
    var editShopUrl='/shopadmin/modifyshop';

    $('#submit').click(function () {
        var shop = {};
        shop.shopId = $('#shop-id').val();
        shop.shopName = $('#shop-name').val();
        shop.shopAddr = $('#shop-addr').val();
        shop.phone = $('#shop-phone').val();
        shop.shopDesc = $('#shop-desc').val();
        shop.area = {
            areaId: $('#area').find('option').not(function () {
                return !this.selected;
            }).data('id')
        };
        var shopImg = $('#shop-img')[0].files[0];
        var formData = new FormData();
        formData.append('shopImg', shopImg);
        formData.append('shopStr', JSON.stringify(shop));
        var verifyCodeActual = $('#j_kaptcha').val();
        if (!verifyCodeActual) {
            alert('请输入验证码');
            return;
        }
        formData.append('verifyCodeActual', verifyCodeActual);
        $.ajax({
            url: editShopUrl,
            type: 'POST',
            data:formData,
            contentType:false,
            processData:false,
            cache:false,
            success:function (data) {
                if (data.success) {
                    alert('提交成功!');
                } else {
                    alert('提交失败!' + data.errMsg);
                }
                window.location.href = "/shopadmin/getshopbyid?shopId="+shop.shopId;
            }
        });
    });

});