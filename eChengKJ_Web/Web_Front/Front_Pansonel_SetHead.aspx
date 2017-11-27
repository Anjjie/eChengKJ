﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/Front_Pansonel.master" AutoEventWireup="true" CodeBehind="Front_Pansonel_SetHead.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_Pansonel_SetHead" %>
<%-- CSS样式文件及样式类 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="pansonelContent_CSS" runat="server">
    <link href="css/Front_Pansonel_Collect.css" rel="stylesheet" />
    <link href="css/Front_2.css" rel="stylesheet" />
</asp:Content>
<%-- JS(JQ文件已存在) --%>
<asp:Content ID="Content2" ContentPlaceHolderID="pansonelContent_JS" runat="server">
    <script type="text/javascript">
        //======================左侧导航(母版页实现，当前页面设置默认值)=============================//
        var defaultColorId = "#img0";//设置左边导航栏默认图片及文字颜色
        var imgId;//图片ID
        var defaultId = "#img0_0";//默认图片的ID地址选项中
        var defaultPath;//默认图片地址
        var path;//原图片地址
        var newPath;//新图片地址
        //左边导航栏图片效果
        function leftInfoButton() {
            $(".Pansonel_leftDiv_fatherDiv_buttonDiv").on({
                mousemove: function () {
                    imgId = $(this).eq(0).attr("id");
                    path = $("#" + imgId + "_0").attr("src");
                    if (path.indexOf("_bai") < 0) {
                        newPath = path.substring(0, path.indexOf(".")) + "_bai" + path.substring(path.indexOf("."), path.length);
                        $("#" + imgId + "_0").attr("src", newPath);
                    } else {
                        $("#" + path + "_0").attr("src", newPath);
                    }
                },
                mouseout: function () {
                    if (path.indexOf("_bai") > 0) {
                        newPath = path.substring(0, path.indexOf("_bai")) + path.substring(path.indexOf("_bai") + 4, path.length);
                        if ("#" + imgId + "_0" != defaultId) {
                            $("#" + imgId + "_0").attr("src", newPath);
                        }
                    } else {
                        if ("#" + imgId + "_0" != defaultId) {
                            $("#" + imgId + "_0").attr("src", path);
                        }
                    }
                },
                click: function () {
                    var idType = $(this).eq(0).attr("id");
                    switch (idType) {
                        case "img0":
                            window.location.href = "Front_PansonelInfo.aspx";
                            break;
                        case "img1":
                            window.location.href = "Front_Pansonel_Shop.aspx";
                            break;
                        case "img2":
                            window.location.href = "Front_Pansonel_Order.aspx";
                            break;
                        case "img3":
                            window.location.href = "Front_Pansonel_Collect.aspx";
                            break;
                        case "img4":
                            window.location.href = "Front_Pansonel_SystemInfo.aspx";
                            break;
                        case "img5":
                            window.location.href = "Front_Pansonel_Notice.aspx";
                            break;
                        case "img6":
                            window.location.href = "Front_Pansonel_Set.aspx";
                            break;
                    }
                }
            });
        }

        //======================隔离=============================//
               //============加载用户页面数据================//
        function LoadPageUserData() {
            var type = "<%=notIsLogin%>";
            if (type == "登录") {
                    $("#thisUserName").html("<%= this.GetUserInfo().U_UserName%>");
                }else {
                    $("#thisUserName").html("登录");
                }a
            }
        //============页面登录链接页面================//
        function LoginUrl() {
            $loginUrl = $("#thisUserName");
            $loginUrl.click(function () {
                var contene = $loginUrl.html();
                if (contene == "登录") {
                    $loginUrl.eq(0).attr("href", "Front_Login.aspx");
                } else {
                    $loginUrl.eq(0).attr("href", "Front_PansonelInfo.aspx");
                }
            });
        }

        //==============设置头像====================//
        function HeadSetSave() {
            var $divSetHeadCloth = $("#divSetHeadCloth");
            var $divSetHeadBack = $("#divSetHeadBack");
            var $setHead = $("#setHead");
            var $btnFileImage = $("#btnFileImage");
            var $btnSave = $("#btnSave");
            var $btnCancel = $("#btnCancel");
            var $selFileImage = $("#conPlaceHolder_Content_pansonelContent_Right_selFileImage");
            $setHead.on("click", function () {
                $divSetHeadCloth.css({
                    "height": $("body").height() + "px",
                    "width": $("body").width() + "px",
                    "display": "block"
                });
                $divSetHeadBack.css({
                    "display": "block"
                });
            });
            $btnCancel.on("click", function () {
                $divSetHeadCloth.css({
                    "display": "none"
                });
                $divSetHeadBack.css({
                    "display": "none"
                });
            });
            $selFileImage.change(function () {
                var path = $selFileImage.val();
                var imgURL = "../image/Head/*.jpg";

                var str = $selFileImage.val().split('.');
                str = str[str.length - 1];
                switch (str) {
                    case "jpg":
                        $btnFileImage.attr("title", "已选择图片：" + path);
                       
                        $("#setImage200").attr({
                            "src": path
                        });
                        break;
                    case "png":
                        $btnFileImage.attr("title", "已选择图片：" + path);
                        $("#setImage200").attr({
                            "src": path
                        });
                        break;
                    default:
                        $selFileImage.select("");
                        alert("对不起，你选择的图片格式有误,请重新选择！");
                        $btnFileImage.attr("title", "未选择任何文件");
                        break;
                }
               
            });
        }

        function selectFile() {
            $("#conPlaceHolder_Content_pansonelContent_Right_selFileImage").click();
        }

        $(function () {
                HeadSetSave();
                $("#sonShowDiv0").show();
                $("#shanjiao1").css({
                    "transform": "rotate(90deg)"
                });
                $("#ShowDiv0").css("background-color", "rgba(95, 184, 120, 0.27)");
                $("#myInfo").css("color", "rgba(95, 184, 120, 0.27)");
                LoginUrl();
                LoadPageUserData();
            });
    </script>  
</asp:Content>
<%-- 左边导航 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="pansonelContent_Left" runat="server">
     <%-- 父左导航栏 --%>
    <div class="Pansonel_leftDiv_fatherDiv" >
                <div id="img0" class="Pansonel_leftDiv_fatherDiv_buttonDiv" 
                    style="margin-top:30px;background-color:#5FB878;">
                    <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv" >
                        <img id="img0_0" src="image/zhanghu1.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img"/> 
                    </div> 账户管理
                </div>

                <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img1">
                   <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv" >
                        <img id="img1_0" src="image/Gouwuche.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img"/> 
                    </div> 购物车
                </div>
                <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img2">
                     <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv" >
                        <img id="img2_0" src="image/dingdan1.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img"/> 
                    </div>
                    订单</div>
                <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img3">
                    <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv" >
                        <img id="img3_0" src="image/Shouchang.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img"/> 
                    </div>
                    收藏</div>
                <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img4">
                     <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv" >
                        <img id="img4_0" src="image/Youxiang.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img"/> 
                    </div>
                    信息</div>
                <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img5">
                    <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv" >
                       <img id="img5_0" src="image/Tongzhi.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img"/> 
                    </div>
                    公告</div>
                <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img6">
                    <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv" >
                        <img id="img6_0" src="image/Gongju.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img"/> 
                    </div>
                     
                    设置</div>
            </div>
    <%-- 子左导航栏 --%>
    <div class="Pansonel_leftDiv_sonDiv">
                 <%-- 个人信息 --%>
                <ul class="Pansonel_leftDiv_sonDiv_ul">
                     <li class="Pansonel_leftDiv_sonDiv_li" id="ShowDiv0"> 
                         <a href="javasrcipt:;" style="color:#808080;font-size:10pt;">
                             <div id="shanjiao1" class="Pansonel_leftDiv_sonDiv_div"></div>个人信息</a>
                     </li>
                  <div id="sonShowDiv0" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div  class="Pansonel_leftDiv_sonDiv_li_div">个人资料</div>
                             <div id="myInfo" class="Pansonel_leftDiv_sonDiv_li_div">头像设置</div>
                  </div>
                </ul>
                 <%-- 安全设置 --%>
                <ul class="Pansonel_leftDiv_sonDiv_ul">
                     <li class="Pansonel_leftDiv_sonDiv_li" id="ShowDiv1">
                          <a href="javasrcipt:;" style="color:#808080;font-size:10pt;">
                              <div class="Pansonel_leftDiv_sonDiv_div"></div>安全设置</a>
                     </li>
                      <div id="sonShowDiv1" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div class="Pansonel_leftDiv_sonDiv_li_div">修改密码</div>
                             <div class="Pansonel_leftDiv_sonDiv_li_div">设置密保</div>
                         </div>
                </ul>
                 <%-- 绑定设置 --%>
                <ul class="Pansonel_leftDiv_sonDiv_ul">
                          <li class="Pansonel_leftDiv_sonDiv_li" id="ShowDiv2" > 
                         <a href="javasrcipt:;" style="color:#808080;font-size:10pt;">
                             <div class="Pansonel_leftDiv_sonDiv_div" ></div>绑定设置</a>

                     </li>
                      <div id="sonShowDiv2" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div class="Pansonel_leftDiv_sonDiv_li_div">邮箱绑定</div>
                             <div class="Pansonel_leftDiv_sonDiv_li_div">手机绑定</div>
                         </div>
                 </ul>
             </div>
</asp:Content>
<%-- 右边内容 --%>
<asp:Content ID="Content4" ContentPlaceHolderID="pansonelContent_Right" runat="server">
    <div id="divSetHeadCloth" class="DivClothMax"></div>
    <div id="divSetHeadBack" class="DivClothMax_setHeadBack">
         <form runat="server">
            <asp:FileUpload ID="selFileImage" runat="server" ToolTip="选择图片" Style="display:none;" />
             <asp:Button ID="btnUp" runat="server"  Text="上传"/>
        </form>
      <%--  <input id="selFileImage" type="file" value="" hidden="hidden" accept="Image/*.jpg" />--%>
        <input id="btnFileImage" type="button"  value="选择图片" onclick="selectFile();" title="未选择任何文件"  class="selImage" />
        <p class="pTitle">仅支持JPG,PNG格式;文件小于3M</p>
        <div class="divSetHead">
            <div id="setHead200" ><img style="width:200px;height:200px;" id="setImage200" src="image/Logo_ICO.png" /></div>
            <div id="setHead150" ><img style="width:150px;height:150px;"  id="setImage150" src="image/Logo_ICO.png" /></div>
            <div id="setHead75" ><img  style="width:75px;height:75px;" id="setImage75" src="image/Logo_ICO.png" /></div>
            <div id="setHead50" ><img style="width:50px;height:50px;"  id="setImage50" src="image/Logo_ICO.png" /></div>
        </div>
        <div class="divSetHeadBottom">
            <input id="btnCancel" type="button" value="取消"  class="btnSaveCancel"/>
            <input id="btnSave" type="button" value="保存" class="btnSaveCancel" />
        </div>
    </div>
     <div class="ShowHeadBack">
         <div class="MyHeads"></div>
         <span id="setHead" style=" margin-left:145px;cursor:pointer;">设置头像</span>
     </div>
    <%-- 广告1 --%>
    <div class="adDiv">
      
    </div>
    <%-- 广告2 --%>
    <div class="adDiv"></div>

</asp:Content>