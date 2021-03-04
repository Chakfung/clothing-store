function generateorder() {
    var addUrl='/local/generateorder'
    var formdata = new FormData();
    $('.cart-row').map(function (index, item) {
        var order = {};
        order.count = $(item).find('.count').val();
        order.product = {
            productId: $(item).find('.productid').attr("data-id")
        };
        order.status = 0;
        formdata.append('orderStr'+index, JSON.stringify(order));
    });
    $.ajax({
        url: addUrl,
        type: 'POST',
        data: formdata,
        contentType: false,
        processData: false,
        success: function (data) {
            if (data.success) {
                window.location.href = '/local/getorderlist';
            } else {
                alert('提交失败!');
            }
        }
    });
}

function modifyorderstatus(id,status) {
    var modifyorderUrl = '/local/modifyorderstatus';
    var order = {};
    order.orderId = id;
    if (status == 'pay') {
        order.status = 1;
    }else if (status == 'cancelorder') {
        order.status = 1000;
    }else if (status == 'refund') {
        order.status = 3;
    } else if (status == 'confirmorder') {
        order.status = 5;
    } else if (status=='ship'){
        order.status = 2;
    }
    var formdata = new FormData();
    formdata.append('orderStr', JSON.stringify(order));
    $.ajax({
        url: modifyorderUrl,
        type: 'POST',
        data: formdata,
        contentType: false,
        processData: false,
        cache: false,
        datatype: 'json',
        success: function (data) {
            if (data.success) {
                window.location.reload();
            } else {
                alert('操作失败！！！' + data.errMsg);
            }
        }
    });
}