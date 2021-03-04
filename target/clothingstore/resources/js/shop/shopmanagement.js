$(function () {
    var shopId = getQueryString('shopId');
    var shopInfoUrl = '/clothingstore/shopadmin/getshopmanagementinfo?shopId=' + shopId;
    $.getJSON(shopInfoUrl,function (data) {
        if (data.redirect) {
            window.location.href = data.url;
        } else {
            if (data.shopId != undefined && data.shopId != null) {
                shopId = data.shopId;
            }
            $('#shopInfo')
                .attr('href', '/clothingstore/shopadmin/shopoperation?shopId=' + shopId);
            $('#productCategory')
                .attr('href', '/clothingstore/shopadmin/productcategorymanagement?shopId=' + shopId);

        }

    });
    
});