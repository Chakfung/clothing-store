$(function () {
    var registShopUrl='/shopadmin/addproduct';

    $('#submit').click(
        function () {
            var product = {};
            product.productName = $('#product-name').val();
            product.productDesc = $('#product-desc').val();
            product.priority = $('#priority').val();
            product.normalPrice = $('#normal-price').val();
            product.promotionPrice = $('#promotion-price').val();
            product.productCategory = {
                productCategoryId: $('#category').find('option').not(
                    function () {
                        return !this.selected;
                    }).data('value')
            };

            product.productBrand = {
                productBrandId: $('#brand').find('option').not(
                    function () {
                        return !this.selected;
                    }).data('value')
            };

            var thumbnail = $('#small-img')[0].files[0];
            var formData = new FormData();
            formData.append('thumbnail', thumbnail);
            $('.detail-img').map(function (index, item) {
                if ($('.detail-img')[index].files.length > 0) {
                    formData.append('productImg' + index,
                        $('.detail-img')[index].files[0]);
                }
            });

            formData.append('productStr', JSON.stringify(product));

            var verifyCodeActual = $('#j_kaptcha').val();
            if (!verifyCodeActual) {
                alert('请输入验证码!');
                return;
            }
            formData.append('verifyCodeActual', verifyCodeActual);

            $.ajax({
                url: registShopUrl,
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                cache: false,
                success: function (data) {
                    if (data.success) {
                        alert('提交成功!');
                        $('#kaptcha_img').click();
                    } else {
                        alert('提交失败!'+data.errMsg);
                        $('#kaptcha_img').click();
                    }
                }
            });
        });
    $('.detail-img-div').on('change', '.detail-img:last-child', function () {
        if ($('.detail-img').length < 6) {
            $('#detail-img').append('<input type="file" class="detail-img">')
        }
    });

   /* shop.shopCategory={
        shopCategoryId: $('#shop-category').find('option').not(function () {
            return !this.selected;
        }).data('id')
    };*/
});