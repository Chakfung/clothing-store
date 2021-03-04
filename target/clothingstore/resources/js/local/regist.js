$(function () {
    var registUrl = '/local/register';

    $('#submit').click(function () {
        var username = $('#username').val();

        var name = $('#name').val();

        var email = $('#email').val();

        var gender = $('#address').val();

        var password = $('#password1').val();

        var confirmpsw = $('#password2').val();

        var personInfo = {};

        var localAuth = {};

        var formdata = new FormData();

        if (password == confirmpsw) {
            personInfo.name = name;
            personInfo.email = email;
            personInfo.gender = gender;
            localAuth.userName = username;
            localAuth.password = password;
            formdata.append('password', password);
            formdata.append('confirmpsw', confirmpsw);
            formdata.append('personInfoStr', JSON.stringify(personInfo));
            formdata.append('localAuthStr', JSON.stringify(localAuth));
            $.ajax({
                url: registUrl,
                type: 'POST',
                data: formdata,
                contentType: false,
                processData: false,
                cache: false,
                datatype: 'json',
                success: function (data) {
                    if (data.success) {
                        alert('注册成功');
                        window.location.href = '/local/to_login';
                    } else {
                        alert('操作失败'+data.errMsg);
                    }
                }
            })
        } else {
            alert('两次密码输入不一致！');
            return;
        }

    });
});