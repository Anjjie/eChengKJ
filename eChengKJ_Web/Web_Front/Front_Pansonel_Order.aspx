<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/Front_Pansonel.master" AutoEventWireup="true" CodeBehind="Front_Pansonel_Order.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_Pansonel_Order" %>

<%-- CSS样式文件及样式类 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="pansonelContent_CSS" runat="server">
    <link href="css/Front_Pansonel_Order.css" rel="stylesheet" />
</asp:Content>
<%-- JS(JQ文件已存在) --%>
<asp:Content ID="Content1" ContentPlaceHolderID="pansonelContent_JS" runat="server">
    <script src="js/Front_Pansonel_Order.js"></script>
    <script type="text/javascript">
        //======================左侧导航(母版页实现，当前页面设置默认值)=============================//
        var defaultColorId = "#img2";//设置左边导航栏默认图片及文字颜色
        var imgId;//图片ID
        var defaultId = "#img2_0";//默认图片的ID地址选项中
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
                $("#thisUserName").data("uid","<%= this.GetUserInfo().U_id%>");
            } else {
                $("#thisUserName").html("登录");
            }
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

        //============设置默认子导航选择============//
        function SetNavDefault() {
            //$("#sonShowDiv0").show();
            //设置选择90度
            //$("#shanjiao1").css({
            //    "transform": "rotate(90deg)"
            //});
            $("#ShowDiv0").css("background-color", "rgba(95, 184, 120, 0.27)");
            //$("#myInfo").css("color", "rgba(95, 184, 120, 0.27)");
        }

        $(function () {
            LoginUrl();
            LoadPageUserData();
            Load_default();
            SetNavDefault();
            PageFunction();
            CheckBox_SelAll();
        });
    </script>
</asp:Content>
<%-- 左边导航 --%>
<asp:Content ID="Content2" ContentPlaceHolderID="pansonelContent_Left" runat="server">
    <%-- 父左导航栏 --%>
    <div class="Pansonel_leftDiv_fatherDiv">
        <div id="img0" class="Pansonel_leftDiv_fatherDiv_buttonDiv">
            <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv">
                <img id="img0_0" src="image/zhanghu1.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img" />
            </div>
            账户管理
        </div>
        <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img1">
            <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv">
                <img id="img1_0" src="image/Gouwuche.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img" />
            </div>
            购物车
        </div>
        <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img2"
            style="margin-top: 30px; background-color: #5FB878;">
            <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv">
                <img id="img2_0" src="image/dingdan1.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img" />
            </div>
            订单
        </div>
        <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img3">
            <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv">
                <img id="img3_0" src="image/Shouchang.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img" />
            </div>
            收藏
        </div>
        <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img4">
            <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv">
                <img id="img4_0" src="image/Youxiang.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img" />
            </div>
            信息
        </div>
        <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img5">
            <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv">
                <img id="img5_0" src="image/Tongzhi.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img" />
            </div>
            公告
        </div>
        <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img6">
            <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv">
                <img id="img6_0" src="image/Gongju.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img" />
            </div>

            设置
        </div>
    </div>
    <%-- 子左导航栏 --%>
    <div class="Pansonel_leftDiv_sonDiv">
        <%-- 我的订单 --%>
        <ul class="Pansonel_leftDiv_sonDiv_ul">
            <li class="Pansonel_leftDiv_sonDiv_li" id="ShowDiv0">
                <a href="javasrcipt:;" style="color: #808080; font-size: 10pt;">全部订单</a>
            </li>
            <li class="Pansonel_leftDiv_sonDiv_li">
                <a href="javasrcipt:;" style="color: #808080; font-size: 10pt;">待付款订单</a>
            </li>
            <li class="Pansonel_leftDiv_sonDiv_li">
                <a href="javasrcipt:;" style="color: #808080; font-size: 10pt;">已完成订单</a>
            </li>
            <li class="Pansonel_leftDiv_sonDiv_li">
                <a href="javasrcipt:;" style="color: #808080; font-size: 10pt;">退款订单</a>
            </li>
        </ul>
    </div>
</asp:Content>
<%-- 右边内容 --%>
<asp:Content ID="Content4" ContentPlaceHolderID="pansonelContent_Right" runat="server">
    <div class="view-order">
        <div class="topTitle">
            <div class="divTitleName">
                <div>
                    <div style="width: 5px; height: 80%; background-color: cornflowerblue; margin-top: 5px; float: left; margin-right: 15px;"></div>
                    <label style="line-height: 50px; font-size: 16pt;">全部订单</label>
                </div>
                <div class="divDemand">
                    <ul class="ulDemand">
                        <li class="liDemandText">
                            <input type="text" id="txtDemandInfo" value="" placeholder="请输入查询信息" />
                        </li>
                        <li class="liDemandButton">
                            <input type="button" id="btnDemand" value="查询" />
                        </li>
                    </ul>
                </div>
            </div>

            <div class="divShopTitleName">
                <ul class="ulShopTitle" style="color: #999999;">
                    <li class="lichkSelect">
                        <input type="checkbox" class="chkAll" />全选</li>
                    <li class="liShop">商品</li>
                    <li class="liShopCount">商品种类</li>
                    <li class="liNum">数量</li>
                    <li class="liMoney">总金额</li>
                    <li class="liDate">付款日期</li>
                    <li class="liOperation">操作</li>
                </ul>
            </div>
        </div>
        <div class="myOrder">
            <div class="view-orders">
                <div class="view-OrderInfo">
                    <ul class="ulShopTitle">
                        <li class="liChk">
                            <input type="checkbox" class="chkSelect" /></li>
                        <li class="liShop">this资源,e诚智管</li>
                        <li class="liShopCount">2</li>
                        <li class="liNum">2</li>
                        <li class="liMoney">111111111111</li>
                        <li class="liDate">2018-01-24</li>
                        <li class="liOperation">
                            <a href="javascript:;" class="aParticulars">详情</a>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="OrderPage">
                <ul class="view-Page">
                    <li id="pageOen" style="border-left: 0.5px solid;" title="首页"><<</li>
                    <li id="pageUp" title="上一页">< </li>
                    <li class="pageNumber">1 </li>
                    <li class="pageNumber">2 </li>
                    <li class="pageNumber">3 </li>
                    <li class="pageNumber">4 </li>
                    <li class="pageNumber">5 </li>
                    <li id="pageNext" title="下一页">> </li>
                    <li id="pageFinally" title="最后一页">>></li>
                </ul>
                <p>当前<label id="pageThis">1</label>页 | 总共<label id="pageSum">50</label>页 </p>
            </div>
        </div>
    </div>
</asp:Content>
