function search(pageIndex, pageSize, pcid, pn, parentid) {
    window.location.href = '/frontend/search?pageIndex=' + pageIndex + '&pageSize=' + pageSize
        + '&pcid=' + pcid + '&pn=' + pn + '&parentid=' + parentid;
}