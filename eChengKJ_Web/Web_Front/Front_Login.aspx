﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Front_Login.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <%-- LOGO ICO --%>
    <link href="image/Logo_ico.ico" rel="icon" />
    <%-- CSS FILE OR CSS3 --%>
    <link href="css/Front_Login.css" rel="stylesheet" />
    <link href="css/Front_Master.css" rel="stylesheet" />
    <%-- JAVASCRIPT FILE OR JAVASCRIPT --%>
    <script src="js/JQ_File/jquery-3.2.1.min.js"></script>
    <script src="js/Front_Login.js"></script>

    <script type="text/javascript">
        //手机号码是否有效验证
        function isPoneAvailable(str) {
            var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
            if (!myreg.test(str)) {
                return false;
            } else {
                return true;
            }
        }
        //自定义DIV按钮:内容变换
        $(function () {
            var verify = "e诚科技";//验证码
            $("#registerDiv").hide();
            $("#LoginButtonDiv").on("click", function () {
                $("#loginTitle").html("注&nbsp;&nbsp;&nbsp;&nbsp;册");
                $("#btnLogin").val("注  册");
                $("#LoginButtonDiv").html("正在注册...");
                $("#PwdButtonDiv").html("返回登录");
                verify = "e诚科技";//验证码
            });
            $("#PwdButtonDiv").on("click", function () {
                var thisText = $(this).text();
                if (thisText == "返回登录") {
                    $("#loginTitle").html("登&nbsp;&nbsp;&nbsp;&nbsp;录");
                    $("#btnLogin").val("登  录");
                    $("#LoginButtonDiv").html("新用户注册");
                    $("#PwdButtonDiv").html("忘记密码？");
                    verify = "e诚科技";//验证码
                }
            });
            $(".LoginTier_content_text").on("focus", function () {
                var nextId = $(this).next("div").eq(0).attr("id");
                if (nextId == null) {
                    nextId = "txtPhoneDiv";
                }
                $("#" + nextId).css("border-bottom-color", "#2F4056");
                $("#"+nextId).css("transition", "border-bottom 2s");
                $(".LoginTier_content_textDiv").not("#" + nextId).css("border-bottom-color", "#c2c2c2");
                $(".LoginTier_content_textDiv").not("#" + nextId).css("transition", "border-bottom 2s");
            });


            var $txtUserName = $("#txtUserName");
            var $txtUserPwd = $("#txtUserPwd");
            var $txtPhone = $("#txtPhone");
            var $txtChrckInfo = $("#txtChrckInfo");
            
            var User_Phone = "";
            var checkPhone = "";
            //获取手机信息
            $txtUserName.blur(function () {
                    var userName = {
                        "userName": $txtUserName.val(),
                        "con": "name"
                    };
                $.getJSON("ashx/LoginButton.ashx", userName,
                    function (data) {
                        $.each(data, function (i, obj) {
                            User_Phone = obj.U_Phone;
                        })
                    });
            });
            //获取查询手机是否存在
            $txtPhone.blur(function () {
                var userName = {
                    "userName": $txtPhone.val(),
                    "con": "phone"
                };
                $.getJSON("ashx/LoginButton.ashx", userName,
                    function (data) {
                        $.each(data, function (i, obj) {
                            checkPhone = obj.U_Phone;
                        })
                    });
            });
            
            //自动删除验证码
            function DeleteVerify() {
                var deleteTime;
                var setDelectTime = 180;
                //获取验证码
                var phone = { "phone": $txtPhone.val() };
                $.getJSON("ashx/PhoneVerify.ashx", phone,
                    function (getVerify) {
                        alert("测试：\n你的验证码为  "+getVerify.Verify+"\n请不要退出本注册页面，否则验证码自动失效！");
                        verify = getVerify.Verify;
                    });
                //设置时间函数
                deleteTime = setInterval(function () {
                    setDelectTime--;
                    if (setDelectTime == 0) {
                        verify = "e诚科技";
                        setDelectTime = 180;
                    }
                }, 1000);
            }
            //获取验证码按钮
            function VerifyButton() {
                var setDate = 60;//设置时间60秒
                var timeSub;
                var thisPhone;
                var $btnVerify = $("#btnGetCheckInfo");
                $btnVerify.click(function () {
                    if ($txtUserName.val() != "") {
                        if ($txtUserPwd.val() != "") {
                            if ($txtPhone.val() != "") {
                                if (isPoneAvailable($txtPhone.val()) == true) {
                                    if ($("#btnLogin").val() == "登  录") {
                                        if (User_Phone == $txtPhone.val()) {
                                            DeleteVerify();
                                            //设置时间函数
                                            timeSub = setInterval(function () {
                                                $btnVerify.val(setDate + "秒之后重新获取");
                                                $btnVerify.prop("disabled", true);//禁用
                                                setDate--;
                                                if (setDate == 0) {
                                                    clearInterval(timeSub);
                                                    $btnVerify.val("重 新 获 取");
                                                    $btnVerify.prop("disabled", false);//禁用
                                                    verify = "e诚科技";
                                                    setDate = 60;
                                                }
                                            }, 1000);
                                        } else {
                                            alert("对不起，号码不正确！");
                                        }
                                    } else {
                                        if (checkPhone != $txtPhone.val()) {
                                            DeleteVerify();
                                            //设置时间函数
                                            timeSub = setInterval(function () {
                                                $btnVerify.val(setDate + "秒之后重新获取");
                                                $btnVerify.prop("disabled", true);//禁用
                                                setDate--;
                                                if (setDate == 0) {
                                                    clearInterval(timeSub);
                                                    $btnVerify.val("重 新 获 取");
                                                    $btnVerify.prop("disabled", false);//禁用
                                                    verify = "e诚科技";
                                                    setDate = 60;
                                                }
                                            }, 1000);
                                        } else {
                                            alert("对不起，该号码已经被注册！");
                                        }
                                    }
                                } else {
                                    alert("不好意思，你输入的手机号码无效！");
                                }
                            } else {
                                alert("对不起，请输入你的手机号码！");
                            }
                        } else {
                            alert("对不起，请输入你的密码！");
                        }
                    } else {
                        alert("对不起，请输入你的账号！");
                    }
                });
            }
            //登录按钮事件函数
            function LoginButton() {
                var $btnLogin = $("#btnLogin");

                function checkInfo() {
                    if ($txtUserName.val() != "") {
                        if ($txtUserPwd.val() != "") {
                            if ($txtPhone.val() != "") {
                                if ($txtChrckInfo.val() != ""
                                && $txtChrckInfo.val() == verify) {
                                    return "通过";
                                } else {
                                    return "嗨，请检查验证码是否正确哦！";
                                }
                            } else {
                                return "对不起，请输入手机号码！";
                            }
                        } else {
                            return "对不起，请输入密码!";
                        }
                    } else {
                        return "对不起，请输入用户账号！";
                    }
                }

                $btnLogin.click(function () {
                    //登陆
                    if ($btnLogin.val() == "登  录") {
                        if (checkInfo() == "通过") {
                            var userName = {
                                "userName": $txtUserName.val(),
                                "con": "name"
                            };
                                $.getJSON("ashx/LoginButton.ashx", userName,
                                    function (data) {
                                        $.each(data, function (i, obj) {
                                            if (obj == null) {
                                                alert("对不起，账号不存在!");
                                            } else {
                                                if (obj.U_UserPwd == $txtUserPwd.val()) {
                                                    window.location.href = "Front_PansonelInfo.aspx?userName=" + obj.U_UserName;
                                                    verify = "e诚科技";
                                                }
                                                else {
                                                    alert("对不起，密码不正确！");
                                                }
                                            }
                                        });
                                    });
                        } else {
                            alert(checkInfo());
                        }  
                    } else {
                        //注册
                        if (checkInfo() == "通过") {
                            var userName = {
                                "userName": $txtUserName.val(),
                                "con": "name"
                            };
                            $.getJSON("ashx/LoginButton.ashx", userName,
                                function (data) {
                                    $.each(data, function (i, obj) {
                                        if (obj != null) {
                                            alert("对不起，账号已存在!");
                                        } else {
                                            if (checkPhone == $txtPhone.val()) {
                                                alert("对不起，该手机号码已被注册！");
                                            } else {
                                                var UserInfo = {
                                                    "phone": $txtPhone.val(),
                                                    "username": $txtUserName.val(),
                                                    "userpwd": $txtUserPwd.val()
                                                };
                                                $.ajax({
                                                    type: "get",
                                                    url: "ashx/Login_RegisterInfo.ashx",
                                                    data: UserInfo,
                                                    success: function (reutrnData) {
                                                        if (reutrnData == "Yes") {
                                                            var btnConfirm= confirm("注册成功！\n点击确定将直接登录");
                                                            if (btnConfirm==true) {
                                                                window.location.href = "Front_PansonelInfo.aspx?userName="+$txtUserName.val();
                                                                verify = "e诚科技";
                                                            } else {
                                                                window.location.href = "Front_Login.aspx";
                                                                verify = "e诚科技";
                                                            }
                                                        } else {
                                                            alert("对不起，注册失败！");
                                                        }
                                                    }
                                                });
                                                verify = "e诚科技";
                                            }
                                        }
                                    });
                                });
                        } else {
                            alert(checkInfo());
                        }
                    }
                });
            }
            VerifyButton();
            LoginButton();
        });
    </script>
</head>
<body>
    <form runat="server" id="myLogin">
    <div class="Front_Login_bottomBackDiv">
        <div class="bottomBackDiv_TierDiv">
            <%-- LOGO --%>
            <div style="border:0px solid red;">
                <img src="image/Logo.png" style="margin-left:45px;" />
            </div>
            <%-- content --%>
            <div style="border:0px solid blue;">
                <div class="bottomBackDiv_TierDiv_LoginTier">
                     <%-- 登录界面：顶部栏 --%>
                     <div class="LoginTier_top">
                        <div class="LoginTier_top_left">
                            <a href="Front_Index.aspx">返回首页</a> 
                        </div>
                        <div class="LoginTier_top_Middle">
                            <label id="loginTitle" class="top_Middle_Title">登&nbsp;&nbsp;&nbsp;&nbsp;录</label>
                        </div>
                        <div class="LoginTier_top_left">
                            <a href="Front_Product.aspx">产品中心</a>
                        </div>
                    </div>
                     <%-- 登录界面：内容栏 --%>
                     <div id="loginDiv" class="LoginTier_content" >
                        <input type="text" id="txtUserName" value="User01" placeholder="请输入账号" class="LoginTier_content_text" />
                        <div id="txtLoginIdDiv" class="LoginTier_content_textDiv"></div>
                        <input type="password" id="txtUserPwd" value="User01" placeholder="请输入密码" class="LoginTier_content_text" />
                        <div id="txtLoginPwdDiv" class="LoginTier_content_textDiv"></div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        <input type="text" id="txtPhone" value="17607560135" placeholder="请输入手机号码" class="LoginTier_content_text" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <input type="button" id="btnGetCheckInfo" value="获取验证码" />
                        <div id="txtPhoneDiv"  class="LoginTier_content_textDiv"></div>
                        <input type="text" id="txtChrckInfo" value="" placeholder="请输入验证信息" class="LoginTier_content_text" />
                        <div id="txtChrckInfoDiv" class="LoginTier_content_textDiv"></div>
                        <input type="button" id="btnLogin" value="登  录" class="LoginTier_content_buttonLogin"  />
                    </div>
                     <%-- 登录界面：底部栏 --%>
                     <div class="LoginTier_bottom">
                        <div id="LoginButtonDiv" class="LoginTier_bottom_left" >
                           新用户注册
                        </div>
                        <div id="PwdButtonDiv" class="LoginTier_bottom_right">
                            忘记密码？
                        </div>
                    </div>
                </div>
            </div>
            <%-- bottom --%>
            <div style="height:60px;border-top:1px solid #9d9c9c;">
                <div style="background-color:transparent;" class="Front_Div_All_buttom_MyCompanyInfo">
                <ul class="Front_Div_All_buttom_MyCompanyInfo_li">
                    <li>热线电话：400-123-4567
                    &nbsp;&nbsp;&nbsp;&nbsp;邮箱：Anjjiewm@163.com</li>
                    <li>广东省珠海市斗门区白蕉南路29号 南方IT学院教学133室</li>
                    <li>Copyright © <a href="http://www.eChengkeji.top" class="Front_Div_All_buttom_MyCompanyInfo_li_a">eChengkeji.top</a> All Rights Reserved.</li>
                </ul>
            </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
