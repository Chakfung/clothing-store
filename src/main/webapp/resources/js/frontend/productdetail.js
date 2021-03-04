$(function () {
    $('#addcart').on('click', function () {
        addcart($('#addcart').attr('pid'));
    });
});