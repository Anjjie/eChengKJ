var js$ = function (id) {
    return document.getElementById(id);
}

//============加载用户页面数据================//
function LoadPageUserData(id,data,isLogin) {
    if (isLogin == "登录") {
        js$("thisUserName").innerHTML(data);
    } else {
        js$("thisUserName").html("登录");
    }
}
//============页面登录链接页面================//
function LoginUrl() {
    var $loginUrl = js$("thisUserName");
    $loginUrl.attributes
    $loginUrl.click(function () {
        var contene = $loginUrl.html();
        if (contene == "登录") {
            $loginUrl.eq(0).attr("href", "Front_Login.aspx");
        } else {
            $loginUrl.eq(0).attr("href", "Front_PansonelInfo.aspx");
        }
    });
}