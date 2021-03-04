$(function () {
    var stautsUrl = '/shopadmin/modifyproduct';
    $('.product-a')
        .on(
            'click',
            'a',
            function (e) {
                var target = $(e.currentTarget);
                if (target.hasClass('text-info pr-10')) {
                    window.location.href = '/shopadmin/getproductbyid?productId='
                        + e.currentTarget.dataset.id;
                } else if (target.hasClass('text-danger')) {
                    changeItemStatus(e.currentTarget.dataset.id,
                        e.currentTarget.dataset.status);
                }
            });

    function changeItemStatus(id, enableStatus) {
        var product = {};
        product.productId = id;
        product.enableStatus = enableStatus;
            $.ajax({
                url: stautsUrl,
                type:'POST',
                data:{
                    productStr: JSON.stringify(product),
                    statusChange:true
                },
                dataType:'json',
                success: function (data) {
                    if (data.success) {
                        alert('操作成功!');
                        window.location.reload();
                    } else {
                        alert('操作失败!');
                    }
                }
            });
    }
});