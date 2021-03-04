$(function () {
    var lineId = $('#headline').attr('data-id');
    var isEdit = lineId ? true : false;
    var addHeadLineUrl = '/superadmin/addheadline';
    var editHeadLineUrl = '/superadmin/editheadline';
    var removeHeadLineUrl = '/superadmin/removeheadline';

    $('#submit').click(function () {
        var headLine = {};
        if (isEdit) {
            headLine.lineId = lineId;
        } else {
            var shopId = $('#shop').find('option').not(function () {
                return !this.selected;
            }).data('id');
            headLine.shop = {
                shopId: shopId
            };
            headLine.lineLink = '/frontend/search?shopId='+shopId;
        }
            headLine.priority = $('#priority').val();
            headLine.poster1 = $('#poster1').val();
            headLine.poster2 = $('#poster2').val();
            var lineImg = $('#lineImg')[0].files[0];
        var formData = new FormData();
        formData.append('lineImg', lineImg);
        formData.append('headLineStr',JSON.stringify(headLine));
        var verifyCodeActual = $('#j_kaptcha').val();
        if (!verifyCodeActual) {
            $.toast('请输入验证码');
            return;
        }
        formData.append('verifyCodeActual', verifyCodeActual);
        $.ajax({
            url: (isEdit ? editHeadLineUrl : addHeadLineUrl),
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            cache: false,
            success: function (data) {
                if (data.success) {
                    alert('提交成功!');
                    window.location.href = '/superadmin/getheadlinelist';
                } else {
                    alert('提交失败!' + data.errMsg);
                }
                $('#kaptcha_img').click();
            }
        });
    });

    $('.shop-wrap').on(
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
        var headLine = {};
        headLine.lineId = id;
        headLine.enableStatus = status;
        $.ajax({
            url:editHeadLineUrl,
            type:'POST',
            data:{
                headLineStr: JSON.stringify(headLine),
                statusChange:true
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