<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/eChengKJ_FrontSite.Master" AutoEventWireup="true" CodeBehind="Front_Product.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_Product" %>
<%-- CSS文件 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="conPlaceHolder_Css" runat="server">
    <link href="css/Front_ProductCss.css" rel="stylesheet" />
</asp:Content>
<%-- JavaScript文件与代码 --%>
<asp:Content ID="Content2" ContentPlaceHolderID="conPlaceHolder_JS" runat="server">
    <script type="text/javascript">
        var count = 0;
       //============加载用户页面数据================//
        function LoadPageUserData() {
            var type = "<%=notIsLogin%>";
            if (type == "登录") {
                    $("#thisUserName").html("<%= this.GetUserInfo().U_UserName%>");
                }else {
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
        //============设置导航默认值及动态效果================//
        function SetNavigation() {
            var OriginalId = "";//顶部子导航原ID
            var ParentID = "1";//顶部导航父ID

            /*设置默认显示子选项卡*/
            var defaultSubNavgation = $("#Navigation_div1");
            defaultSubNavgation.css("display", "block");
            //设置显示导航下的子菜单
            $(".Front_Div_Logo_Navigation_ul").mousemove(function () {
                var Navigation_id = "#Navigation_div" + $(this).eq(0).attr("id");
                ParentID = "#" + $(this).eq(0).attr("id");
                OriginalId = Navigation_id;
                if (OriginalId != "") {
                    defaultSubNavgation.css("display", "none");
                }
                $Navigation_id = $(Navigation_id);
                $Navigation_id.css("display", "block");
                $("#" + $(this).eq(0).attr("id")).css("color", "#982626");
            });
            
            /*设置默认激活的选项卡eq(i)*/
            var thisFront_Navigation_ul = $(".Front_Div_Logo_Navigation_ul:eq(5)");
            thisFront_Navigation_ul.css("color", "#982626");
            $("#Slider").width(thisFront_Navigation_ul.innerWidth());//设置宽度
            $("#Slider").offset(thisFront_Navigation_ul.offset());//设置位置(id:Slider在al)
            //返回默认选择的选择项
            var returnDefaultNav = function () {
                $(OriginalId).css("display", "none");
                $(ParentID).css("color", "#000000");
                var aL = $(".Front_Div_Logo_Navigation_ul:eq(5)");
                $("#Slider").width(aL.innerWidth());
                $("#Slider").offset(aL.offset());
                thisFront_Navigation_ul.css("color", "#982626");
                defaultSubNavgation.css("display", "block")
            }
            //设置返回默认值
            //（放置再次选择子选项卡时，显示最后离开的父选项卡）
            defaultSubNavgation.mousemove(function () {
                OriginalId = "#Navigation_div1";
                ParentID = "1";
            });

            /*
            设置进入到Front_Div_Logo_Navigation_ul类所使用的导航时,
            显示子菜单，并改变导航颜色位置
            */
            $(".Front_Div_Logo_Navigation_ul").mousemove(function () {
                $("#Slider").width($(this).innerWidth());
                $("#Slider").offset($(this).offset());
                thisFront_Navigation_ul.css("color", "#000000");
                //$(this).addClass();
            });
            /*
                设置离开Front_Div_Logo_Navigation_ul类所使用的导航时,
                隐藏子菜单，并恢复默认导航颜色位置
            */
            $(".Front_Div_Logo_Navigation_ul").mouseout(function () {
                returnDefaultNav();
            });
            /*
                设置进入到Front_Div_Navigation_div类所使用的子菜单导航时,
                保持父导航颜色位置和显示当前的子导航
           */
            $(".Front_Div_Navigation_div").mousemove(function () {
                if ($(OriginalId + ":hidden") || ParentID == "") {
                    $(ParentID).css("color", "#982626");
                    $("#Slider").width($(ParentID).innerWidth());
                    $("#Slider").offset($(ParentID).offset());
                    if (OriginalId != "") {
                        defaultSubNavgation.css("display", "none");
                    }
                    $(OriginalId).css("display", "block");
                }
                thisFront_Navigation_ul.css("color", "#000000");
            });
            /*
            设置进入到Front_Div_Navigation_div类所使用的子菜单导航时,
            隐藏子菜单，并恢复默认导航颜色位置
        */
            $(".Front_Div_Navigation_div").mouseout(function () {
                returnDefaultNav();
            });
        };
        //============广告效果================//
        function ShowPro_Ad() {
            var className = "";
            var Pro_AdTime;
            var Url = "Front_Index.aspx";
            $("#Pro_ad").slideDown(3000);
            //关闭广告单击事件
            $("#ad_Close").click(function () {
                Url = "";
                Pro_AdTime = setInterval(function () {
                    className = ".ProductSlideshow_DIVcss:eq(" + count + ")";
                    count = count + 1;
                    $(className).fadeOut(3000);
                    if (count > 3) {
                        $("#Pro_ad").slideUp(3300, function () {
                            $("#ProductDiv").css("margin-top", "10px");
                        });
                        //$("#masterBottom").animate({ "margin-top": "-210px" }, 3400);
                        clearInterval(Pro_AdTime);
                        count = 0;
                    }
                }, 300);
            });
            $(".ProductSlideshow_DIVcss").click(function () {
                if (Url != "") {
                    window.location.href = Url;
                } 
            });
        };
        //============产品类型================//
        function ProductTypeInfo() {
            $(".ProductFunction_DIV_SubDIV_ProductButton:eq(0)").css({ "background-color": "#1893e0", "border-top-color": "#1893e0" });
            //单击：固定颜色不变
            $(".ProductFunction_DIV_SubDIV_ProductButton").click(function () {
                $(this).css({ "background-color": "#1893e0", "border-top-color": "#1893e0" });
                $(".ProductFunction_DIV_SubDIV_ProductButton").not($(this)).css({ "background-color": "#ffffff", "border-color": "#dfdfdf" });
                var value = $(this).val();
                switch (value) {
                    case "按领域":
                        $("#ProductTypeDiv").css("display", "none");
                        $("#DomainTypeDiv").css("display", "block");
                        break;
                    case "按产品":
                        $("#DomainTypeDiv").css("display", "none");
                        $("#ProductTypeDiv").css("display", "block");
                        break;
                }
            });
            //鼠标移动到可视范围：颜色改变
            $(".ProductFunction_DIV_SubDIV_Button").mousemove(function () {
                $(this).css({ "border-bottom": "1px solid #1893e0" });
            });
            //鼠标移动离开可视范围：颜色消失
            $(".ProductFunction_DIV_SubDIV_Button").mouseout(function () {
                $(this).css({ "border-bottom": "0px " });
            });
        }
        //============产品功能介绍================//
        function ProductFunction() {
            var $functionImage = $("#FunctionImage");
            $(".ProductFunction_DIV_SubDIV_Button:eq(0)").css({ "background-color": "#1893e0", "border-top-color": "#1893e0" });
            $functionImage.html(" <img id='bothImg' src='image/ProductFunctionImage/B2COrB2B/both.png' class='ProductFunction_DIV_SubDIV_Img' />");
            //单击：固定颜色不变
            $(".ProductFunction_DIV_SubDIV_Button").click(function () {
                $(this).css({ "background-color": "#1893e0", "border-top-color": "#1893e0" });
                $(".ProductFunction_DIV_SubDIV_Button").not($(this)).css({ "background-color": "#ffffff", "border-color": "#dfdfdf" });
                var value = $(this).val();
               
                switch (value) {
                    case "线上零售(B2C)/批发业务(B2B)":
                        //单网店业务
                        //$functionImage.html("<img id='oneImg' src='image/ProductFunctionImage/B2COrB2B/one.png' class='ProductFunction_DIV_SubDIV_Img' />");
                        //多网店业务
                        $functionImage.html(" <img id='bothImg' src='image/ProductFunctionImage/B2COrB2B/both.png' class='ProductFunction_DIV_SubDIV_Img' />");
                        break;
                    case "分销业务(B2B2C)":
                        $functionImage.html("<img id='B2B2CImg' src='image/ProductFunctionImage/B2B2C.png' class='ProductFunction_DIV_SubDIV_Img' />");
                        break;
                    case "微电商业务":
                        $functionImage.html("<img id='e-commerceImg' src='image/ProductFunctionImage/e-commerce.png' class='ProductFunction_DIV_SubDIV_Img' />");
                        break;
                }
            });
            //鼠标移动到可视范围：颜色改变
            $(".ProductFunction_DIV_SubDIV_Button").mousemove(function () {
                $(this).css({ "border-bottom": "1px solid #1893e0" });
            });
            //鼠标移动离开可视范围：颜色消失
            $(".ProductFunction_DIV_SubDIV_Button").mouseout(function () {
                $(this).css({ "border-bottom": "0px " });
            });
        }

        $(function () {
            $("#topNavigation").css("position", "fixed");
            SetNavigation();
            LoadPageUserData();
            LoginUrl();
            ShowPro_Ad();
            ProductFunction();
            ProductTypeInfo();
        });
    </script>
</asp:Content>
<%-- 顶部导航栏 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="conPlaceHolder_Navigation" runat="server">
    <div class="Front_Div_Logo_Navigation" id="Front_Div_Logo_NavigationId">
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="6">关于我们</ul></a>
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="5">联系我们</ul></a>
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="4">新闻中心</ul></a>
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="3">解决方案</ul></a>
          <a href="Front_eChengKJService.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="2">提供服务</ul></a>
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="1">产品</ul></a>
          <a href="Front_Index.aspx"><ul class="Front_Div_Logo_Navigation_ul"  id="7">首页</ul></a>
     </div>
</asp:Content>
<%-- 中间区域内容 --%>
<asp:Content ID="Content4" ContentPlaceHolderID="conPlaceHolder_Content" runat="server">
    <div class="ConteneDIVAll">
        <%-- 广告 --%>
         <div id="Pro_ad" class="ConteneDIVAll_ProductSlideshow">
                <%-- 单个隐藏效果层:广告 --%>
                <div class="ProductSlideshow_DIVcss" style="background-image:url('image/Pro_ad/Img1_1.jpg')"></div>
                <div class="ProductSlideshow_DIVcss" style="background-image:url('image/Pro_ad/Img1_2.jpg')"></div>
                <div class="ProductSlideshow_DIVcss" style="background-image:url('image/Pro_ad/Img1_3.jpg')"></div>
                <div class="ProductSlideshow_DIVcss" style="background-image:url('image/Pro_ad/Img1_4.jpg')">
                    <div id="ad_Close" style="float:right;font-size:10pt;cursor:alias;">关闭</div>
                </div>
             </div>
         <%-- 商品名称及注册 --%>
         <div id="ProductDiv" class="ConteneDIVAll_ProductDiv">
             <div style="height:60px;"></div>
             <div style="font-size:45pt;color:#ffffff;font-weight:500;">e诚科技云ERP - 网店/办公版</div>
             <div style="font-size:20pt; color:#ffffff;">——目标，将每天都有<font style="color:#fc6900">200000+</font>网店客户使用云ERP</div>
              <div style="height:60px;"></div>
             <input class="ConteneDIVAll_ProductDiv_Register" id="btnRegister" type="button" value="立即注册，申请免费试用" />
         </div>
          <%-- 产品介绍 --%>
         <div class="ConteneDIVAll_ProductFunction"  style="background-color:#f8f8f8;">
             <div class="ProductFunction_DIV">
                 <div class="ProductFunction_DIV_SubDIV" style="height:30px">
                     <input type="button" value="按领域" class="ProductFunction_DIV_SubDIV_ProductButton" />
                     <input type="button" value="按产品" class="ProductFunction_DIV_SubDIV_ProductButton"  />
                     <a href="#" style="float:right;font-size:10pt;color:#0400ff">立即购买 >> &nbsp;</a>
                 </div>
                 <%-- 领域卡片 --%>
                 <div id="DomainTypeDiv" class="ProductDomain_DIV" style="height:420px;display:block;">
                      <a href="#"><div class="Product_DomainCard">
                         <div  style="background-image:url('image/DomainCrad/e-commerce.png')" class="Product_DomainCard_Image"></div>
                         <div style="width:100%;height:20px;margin-top:20px;">电子商务</div>
                     </div></a>
                      <a href="#"><div class="Product_DomainCard">
                         <div  style="background-image:url('image/DomainCrad/financialManager.png')"  class="Product_DomainCard_Image"></div>
                         <div style="width:100%;height:20px;margin-top:20px;">财务管理</div>
                     </div></a>
                      <a href="#"><div class="Product_DomainCard">
                         <div style="background-image:url('image/DomainCrad/mobileOfficing.png')" class="Product_DomainCard_Image"></div>
                         <div style="width:100%;height:20px;margin-top:20px;">移动办公</div>
                     </div></a>
                      <a href="#"><div class="Product_DomainCard">
                         <div style="background-image:url('image/DomainCrad/HRManager.png')" class="Product_DomainCard_Image"></div>
                         <div style="width:100%;height:20px;margin-top:20px;">人力资源管理</div>
                     </div></a>
                      <a href="#"><div class="Product_DomainCard" style="border-bottom:0px;">
                         <div style="background-image:url('image/DomainCrad/resourceManager.png')" class="Product_DomainCard_Image"></div>
                         <div style="width:100%;height:20px;margin-top:20px;">资源管理</div>
                     </div></a>
                 </div>
                  <%-- 产品卡片 --%>
                 <div id="ProductTypeDiv" class="ProductDomain_DIV" style="height:420px">
                      <a href="#"><div class="Product_DomainCard">
                         <div  style="background-image:url('image/ProductCard/eGou.png'); background-repeat:round;" class="Product_DomainCard_Image"></div>
                         <div style="width:100%;height:20px;margin-top:20px;">e购天下</div>
                     </div></a>
                      <a href="#"><div class="Product_DomainCard">
                         <div  style="background-image:url('image/ProductCard/eFu.png'); background-repeat:round;"  class="Product_DomainCard_Image"></div>
                         <div style="width:100%;height:20px;margin-top:20px;">e服智管</div>
                     </div></a>
                      <a href="#"><div class="Product_DomainCard">
                         <div style="background-image:url('image/ProductCard/ThisZiYuan.png'); background-repeat:round;" class="Product_DomainCard_Image"></div>
                         <div style="width:100%;height:20px;margin-top:20px;">This资源</div>
                     </div></a>
                 </div>
             </div>
         </div>
        <%-- 功能介绍 --%>
         <div class="ConteneDIVAll_ProductFunction">
             <div class="ProductFunction_DIV">
                 <div class="ProductFunction_DIV_SubDIV" style="height:30px">
                     <input type="button" value="线上零售(B2C)/批发业务(B2B)" class="ProductFunction_DIV_SubDIV_Button" />
                     <input type="button" value="分销业务(B2B2C)" class="ProductFunction_DIV_SubDIV_Button"  />
                     <input type="button" value="微电商业务" class="ProductFunction_DIV_SubDIV_Button"  />
                 </div>
                 <div id="FunctionImage" class="ProductFunction_DIV_SubDIV" style="height:420px">
                 </div>
             </div>
         </div>
        <%-- 优质服务，全程无忧 --%>
        <div style="width:100%;height:500px;background-color:#f8f8f8">
            <img style="width:80%;height:500px;" src="image/ProductFunctionImage/back.png" />
        </div>
    </div>
</asp:Content>
