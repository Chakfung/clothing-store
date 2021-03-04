$(function () {
    var addBrandUrl = '/shopadmin/addproductbrand';
    var removeBrandUrl = '/shopadmin/removebrand';

    $('#submit').click(function () {
        var productBrand = {};
        productBrand.productBrandName = $('#brand-name').val();
        productBrand.priority = $('#priority').val();
        $.ajax({
            url: addBrandUrl,
            type:'POST',
            data: {
                brandStr: JSON.stringify(productBrand)
            },
            datatype:'json',
            success:function (data) {
                if (data.success) {
                    alert('提交成功！');
                    window.location.href='/shopadmin/getproductBrandlist';
                } else {
                    alert('提交失败!'+data.errMsg);
                }
            }
        });
    });

    $('.text-danger').click(function (e) {
        var target = $(e.currentTarget);
        $.ajax({
            url: removeBrandUrl,
            type: 'POST',
            data:{brandId: e.currentTarget.dataset.id},
            dataType:'json',
            success: function (data) {
                if (data.success) {
                    alert('操作成功!');
                } else {
                    alert('操作失败!');
                }
            }
        });
    });

});