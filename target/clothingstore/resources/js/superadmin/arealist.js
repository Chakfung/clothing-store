$(function () {
    var addUrl = "/superadmin/addarea";
    var deleteUrl = "/superadmin/removearea";

    /*$('#new')
        .click(
            function () {
                var tempHtml='<div class="row row-product-category temp">'
                +'<div class="col-33"><input class="category-input category" type="text" placeholder="区域名"></div>'
                +'<div class="col-33"><input class="category-input priority" type="number" placeholder="优先级"></div>'
                +'<div class="col-33"><a href="#" class="button delete">删除</a></div>'
                +'</div>'
                $('.product-category-wrap').append(tempHtml);
    });*/

    $('#new')
        .click(
            function () {
                var tempHtml='<tr class="ordertr  row-product-category temp">'
                    +'<td><input type="text" class="category" placeholder="子分类名"></td>'
                    +'<td><input type="number" class="priority" placeholder="优先级"></td>'
                    +'<td><a href="#" class="button delete"><i class="ti ti-trash"></i></a></td>'
                    +'</tr>'
                $('.product-category-wrap').append(tempHtml);
            });

    $('#submit').click(function () {
        var tempArr = $('.temp');
        var areaList = [];
        tempArr.map(function (index,item) {
            var tempObj = {};
            tempObj.areaName = $(item).find('.category').val();
            tempObj.priority = $(item).find('.priority').val();
            if (tempObj.areaName && tempObj.priority) {
                areaList.push(tempObj);
            }
        });
        $.ajax({
            url: addUrl,
            type:'POST',
            data: JSON.stringify(areaList),
            contentType:'application/json',
            success:function (data) {
                if (data.success) {
                    alert('添加成功！');
                    window.location.reload();
                } else {
                    alert('添加失败!'+data.errMsg);
                }
            }
        });
    });

    $('.product-category-wrap').on('click','.row-product-category.temp .delete',
        function (e) {
            console.log($(this).parent().parent());
            $(this).parent().parent().remove();
    });

    $('.product-category-wrap').on('click','.row-product-category.now .delete',
        function (e) {
            var target = e.currentTarget;
            var c = confirm('确定么?');
            if (c == true) {
                $.ajax({
                    url: deleteUrl,
                    type: 'POST',
                    data: {
                        areaId: target.dataset.id
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.success) {
                            alert('删除成功!');
                            window.location.reload();
                        } else {
                            alert('删除失败!'+data.errMsg);
                        }
                    }
                });
            } else {
                return;
            }
        });
});