function addcart(id) {
    var addCartUrl = '/local/addcart';
    var cart = {};
    cart.num = 1;
    cart.product = {
        productId: id
    };
    var formdata = new FormData();
    formdata.append("cartStr", JSON.stringify(cart));
    $.ajax({
        url: addCartUrl,
        type: 'POST',
        data: formdata,
        contentType:false,
        processData:false,
        cache:false,
        datatype: 'json',
        success: function (data) {
            if (data.success) {
                alert('加入购物车成功!');
            } else {
                alert('加入购物车失败!' + data.errMsg);
            }
        },
        error: function () {
            window.location.href = "/local/to_login";
        }
    });
}

function removeCart(id) {
    var removeCartUrl='/local/removecart'
    $.ajax({
        url: removeCartUrl,
        type:'POST',
        data:{cartId: id},
        dataType:'json',
        success: function (data) {
            if (data.success) {
                window.location.reload();
            } else {
                alert("删除购物车异常" + data.errMsg);
            }
        }
    });

}
