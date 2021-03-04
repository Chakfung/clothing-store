var pcid = getQueryString('pcid');
var pn = getQueryString('pn');
$(function () {
    var count = $('#count').html();
    var pageIndex = $('#pageIndex').val();
    var pageSize = $('#psize').val();
    var end = count % pageSize == 0 ? parseInt(count / pageSize) :parseInt(count / pageSize + 1) ;
    getpage(pageIndex,end);

    $('.pageSize').map(function (index, item) {
        if ($(item).val() == pageSize) {
            $(item).attr("selected", "selected");
        }
    });

    $('.product-action')
        .on('click',
            'a',
            function (e) {
                var target = $(e.currentTarget);
                if (target.hasClass('carta')) {
                    addcart(e.currentTarget.dataset.id);
                } else if (target.hasClass('detail')){
                    window.location.href = '/frontend/getproductbyid?productId=' + e.currentTarget.dataset.id;
                }
            });
    $('#pageul')
        .on('click',
            'a',
            function (e) {
                var target = $(e.currentTarget);
                if (target.hasClass('pageIndex')) {
                    search(target.html(), pageSize, pcid, pn,'');
                } else if (target.hasClass('lastpage')) {
                    var lastindex = pageIndex == 1 ? 1 : pageIndex - 1;
                    search(lastindex, pageSize, pcid, pn,'');
                }else if (target.hasClass('nextpage')) {
                    var nextindex = pageIndex == end ? pageIndex : parseInt(pageIndex) + 1;
                    search(nextindex, pageSize, pcid, pn,'');
                }
            });

    $('#headul')
        .on('click',
            'a',
            function (e) {
                var target = $(e.currentTarget);
                if (target.hasClass('ppca')) {
                    search(1, 9, '', pn,e.currentTarget.dataset.id);
                } else if (target.hasClass('pcca')) {
                    search(1, 6, e.currentTarget.dataset.id, pn,'');
                }
            });


    $('.button-search').on('click', function () {
        var productname = $('#pn').val();
        if (pageSize == undefined) {
            pageSize = 3;
        }
        search(1, pageSize, pcid, productname,'');
    });
});





function getpage(pageIndex,end) {
    var html = '<li><a href="#" class="lastpage"><i class="fa fa-angle-left"></i></a></li>';
    for (i = 1; i <= end; i++) {
        if (i == pageIndex) {
            html += '<li class="active"><a href="#" class="pageIndex">' + i + '</a></li>';
        } else {
            html += '<li><a href="#" class="pageIndex">' + i + '</a></li>';
        }
    }
    html += '<li><a href="#" class="nextpage"><i class="fa fa-angle-right"></i></a></li>';
    $('#pageul').html(html);
}

$('#pageSize').change(function () {
    var newpageSize = $('#pageSize').find('option').not(function () {
        return !this.selected;
    }).val();
    search(1, newpageSize, pcid, pn);
});




