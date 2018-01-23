/// <reference path="JQ_File/jquery-3.2.1.min.js" />
function defaultShow() {
    $("#Info").show();
    $("#btnNext").show();
    $("#btnNext").show();
    $(".step").eq(3).addClass("stepBorder_Bottom");
    $("#div_Hint").hide();
}

var step = 3;

var verify = "e诚科技";

var setTimeoutTime = 60;

var setDelectTime = 180;

function lbCheckPhone_val(phone) {
    $("#lbCheckPhone").data("phone", phone);
    var frontNum = phone.substring(0, 3);
    var backNum = phone.substring(7, phone.length);
    phone = frontNum + "****" + backNum;
    $("#lbCheckPhone").html(phone);
}

function div_Hint(val) {
    $("#div_Hint").show();
    $("#lb_Hint").html(val);
}

function Show_Next() {
    var thisStep = --step;
    if (thisStep >= 0 && thisStep <= 3) {
        $(".step").eq(thisStep).addClass("stepBorder_Bottom");
        $(".step").not($(".step").eq(thisStep)).removeClass("stepBorder_Bottom");
        $("div[name='content-view']").not($("div[name='content-view']").eq(3 - thisStep)).hide();
        $("div[name='content-view']").eq(3 - thisStep).show();
        if (thisStep == 0) {
            $("#btnUp").hide();
            $("#btnNext").hide();
            $("#btnOk").show();
        } else {
            $("#btnUp").show();
        }
    }
}

function CheckUser() {
    var data = {
        "classType": "User",//必须，执行那个类中的方法
        "methodType": "SelectCon",//必须，执行方法类型
        "attribute": "Name",     //必须，条件查询
        "con": $("#lbLoginUser").html()  //查询条件
    };
    $.getJSON("ashx/All-Powerful_GetBLL.ashx", data, function (ret) {
        $.each(ret, function (i, obj) {
            if ($("#txtLoginPwd").val() != obj.U_UserPwd) {
                div_Hint("密码不正确！");
                return;
            }
            Show_Next();
            $("#txtLoginPwd").val("");
            $("#div_Hint").hide();
        });

    });
}

//自动删除验证码
function deleteCheck() {
    //设置时间函数
    setTimeout(function () {
        --setDelectTime;
        console.log(setDelectTime);
        if (setDelectTime == 0) {
            verify = "e诚科技";
            setDelectTime = 180;
            return;
        }
        deleteCheck();
    }, 1000);
}

function getVerify() {
    //获取验证码
    var phone = { "phone": $("#lbCheckPhone").data("phone") };
    $.getJSON("ashx/PhoneVerify.ashx", phone,
        function (getVerify) {
            div_Hint("测试：你的验证码为  " + getVerify.Verify + "<br/>请不要退出本注册页面，否则验证码自动失效！");
            verify = getVerify.Verify;
            deleteCheck();
        });

}

function btnGetCheck_val() {
    setTimeout(function () {
        if (setTimeoutTime == 0) {
            $("#btnGetCheck").attr("disabled", false);
            $("#btnGetCheck").val("重新获取");
            setTimeoutTime = 60;
            return;
        } else {
            $("#btnGetCheck").attr("disabled", true);
            $("#btnGetCheck").val("等待" + setTimeoutTime + "秒");
            btnGetCheck_val();
        }
        --setTimeoutTime;
    }, 1000);
}

function btnGetCheck_click() {
    $("#btnGetCheck").click(function () {
        getVerify();
        btnGetCheck_val();
    });
}

function CkeckPhone() {
    if ($("#txtCheckCode").val() == "e诚科技") {
        div_Hint("验证码有误！");
        return;
    }
    if ($("#txtCheckCode").val() != verify) {
        div_Hint("验证码有误！");
        return;
    }
    Show_Next();
    $("#div_Hint").hide();

}

function CheckEmail() {
    var email = $("#txtEmail").val();
    if (email == "") {
        div_Hint("对不起，请输入新邮箱信息！");
        return;
    }
    if (!(/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(email))) {
        div_Hint("对不起，您输入的邮箱格式有误！");
        return;
    }
    if ($("#txtEmailOk").val()!=email) {
        div_Hint("邮箱不一致，请重新确认！");
        return;
    }
    Show_Next();
    $("#div_Hint").hide();
}

function btnNext_click() {

    $("#btnNext").click(function () {
        switch (step) {
            case 1:
                CheckEmail();
                break;
            case 2:
                CkeckPhone();
                break;
            case 3:
                CheckUser();
                break;
        }
    });
}

function btnUp_click() {
    $("#btnUp").click(function () {
        var thisStep = ++step;
        if (thisStep >= 0 && thisStep <= 3) {
            $(".step").eq(thisStep).addClass("stepBorder_Bottom");
            $(".step").not($(".step").eq(thisStep)).removeClass("stepBorder_Bottom");
            $("div[name='content-view']").not($("div[name='content-view']").eq(3 - thisStep)).hide();
            $("div[name='content-view']").eq(3 - thisStep).show();
            if (thisStep != 0) {
                $("#btnNext").show();
                $("#btnOk").hide();
            }
            if (thisStep == 3) {
                $("#btnUp").hide();
            }
        }

    });
}

function btnOk_click() {
    $("#btnOk").click(function () {
        $("#btnOk").hide();
        div_Hint("正在研发...");
    });
}