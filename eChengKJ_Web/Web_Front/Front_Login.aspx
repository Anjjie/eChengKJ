<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Front_Login.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_Login" %>

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
        //自定义DIV按钮:内容变换
        $(function () {
            $("#registerDiv").hide();
            $("#LoginButtonDiv").on("click", function () {
                $("#loginTitle").html("注&nbsp;&nbsp;&nbsp;&nbsp;册");
                $("#btnLogin").val("注  册");
                $("#LoginButtonDiv").html("正在注册...");
                $("#PwdButtonDiv").html("返回登录");
            });
            $("#PwdButtonDiv").on("click", function () {
                var thisText = $(this).text();
                if (thisText == "返回登录") {
                    $("#loginTitle").html("登&nbsp;&nbsp;&nbsp;&nbsp;录");
                    $("#btnLogin").val("登  录");
                    $("#LoginButtonDiv").html("新用户注册");
                    $("#PwdButtonDiv").html("忘记密码？");
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
                            <a href="#">产品中心</a>
                        </div>
                    </div>
                     <%-- 登录界面：内容栏 --%>
                     <div id="loginDiv" class="LoginTier_content" >
                            <input type="text" id="txtLoginId" value="" placeholder="请输入账号" class="LoginTier_content_text" />
                            <div id="txtLoginIdDiv" class="LoginTier_content_textDiv"></div>
                            <input type="text" id="txtLoginPwd" value="" placeholder="请输入密码" class="LoginTier_content_text" />
                            <div id="txtLoginPwdDiv" class="LoginTier_content_textDiv"></div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <input type="text" id="txtPhone" value="" placeholder="请输入手机号码" class="LoginTier_content_text" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <input type="button" id="btnGetCheckInfo" value="获取验证码" />
                            <div id="txtPhoneDiv"  class="LoginTier_content_textDiv"></div>
                            <input type="text" id="txtChrckInfo" value="" placeholder="请输入验证信息" class="LoginTier_content_text" />
                            <div id="txtChrckInfoDiv" class="LoginTier_content_textDiv"></div>
                            <asp:Button ID="btnLogin" runat="server" Text="登  录" CssClass="LoginTier_content_buttonLogin" />
                    </div>
                    <%--                     <div id="registerDiv" class="LoginTier_content">
                        注册
                    </div>--%>
                     <%-- 登录界面：底部栏 --%>
                     <div class="LoginTier_bottom">
                        <div id="LoginButtonDiv" class="LoginTier_bottom_left" >
                           新用户注册
                        </div>
                        <div  id="PwdButtonDiv" class="LoginTier_bottom_right">
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
                    <li>Copyright © <a href="#" class="Front_Div_All_buttom_MyCompanyInfo_li_a">eChengKJ.com</a> All Rights Reserved. </li>
                </ul>
            </div>
            </div>
        </div>
    </div>
        </form>
</body>
</html>
