<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/eChengKJ_FrontSite.Master" AutoEventWireup="true" CodeBehind="Front_PansonelInfo.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_PansonelInfo" %>
<%-- CSS样式文件及样式区 --%>
<asp:Content ID="conCss" ContentPlaceHolderID="conPlaceHolder_Css" runat="server">
    <link href="css/Front_PansonelInfo.css" rel="stylesheet" />
</asp:Content>
<%-- Javascript脚本文件及脚本代码区（已默认引入jQuery文件，无需重复引用） --%>
<asp:Content ID="conJavaScript" ContentPlaceHolderID="conPlaceHolder_JS" runat="server">
    <script type="text/javascript">
        //=======================顶部导航=============================//
        var OriginalId = "";//顶部导航原ID
        var ParentID = "";//顶部导航父ID
        var NavigationMouseout = function () {
            thisFront_Navigation_ul.css("color", "#982626");
        }
        //顶部导航效果
        function NavigationTopCss() {
            //设置显示导航下的子菜单
            $(".Front_Div_Logo_Navigation_ul").mousemove(function () {
                var Navigation_id = "#Navigation_div" + $(this).eq(0).attr("id");
                if (OriginalId != "" || ParentID != "") {
                    $(OriginalId).css("display", "none");
                    $(ParentID).css("color", "#000000");
                }
                if ($(Navigation_id + ":hidden") || ParentID == "") {
                    $(Navigation_id).css("display", "block");
                    $("#" + $(this).eq(0).attr("id")).css("color", "#982626");
                    ParentID = "#" + $(this).eq(0).attr("id");
                    OriginalId = Navigation_id;
                }
            });
            $("#Slider").hide();//设置位置(id:Slider在al)    
            /*
            设置进入到Front_Div_Logo_Navigation_ul类所使用的导航时,
            显示子菜单，并改变导航颜色位置
            */
            $(".Front_Div_Logo_Navigation_ul").mousemove(function () {
                $("#Slider").show();
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
                NavigationMouseout();
            });
            /*
                设置进入到Front_Div_Navigation_div类所使用的子菜单导航时,
                保持父导航颜色位置和显示当前的子导航
           */
            $(".Front_Div_Navigation_div").mousemove(function () {
                $("#Slider").show();
                if ($(OriginalId + ":hidden") || ParentID == "") {
                    $(OriginalId).css("display", "block");
                    $(ParentID).css("color", "#982626");
                    $("#Slider").width($(ParentID).innerWidth());
                    $("#Slider").offset($(ParentID).offset());
                }
                thisFront_Navigation_ul.css("color", "#000000");
            });
            /*
            设置进入到Front_Div_Navigation_div类所使用的子菜单导航时,
            隐藏子菜单，并恢复默认导航颜色位置
         */
            $(".Front_Div_Navigation_div").mouseout(function () {
                NavigationMouseout();
            });
        }
        //======================左侧导航=============================//
        var imgId;//图片ID
        var defaultId = "#img0_0";
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


                }
            });
        }
        //================左侧子导航(设置DIV旋转与下拉框)=======================//
        function leftSonDiv() {
            $(".Pansonel_leftDiv_sonDiv_li").click(function () {
                var trueOrFalse = $(this).find("div").css("transform");
                var showDivId = "#sonShowDiv" + $(this).index();
                if (trueOrFalse == "none" || trueOrFalse == "matrix(1, 0, 0, 1, 0, 0)") {
                    $(showDivId).slideToggle(1000);
                    $(this).find("div").css("transform", "rotate(90deg)");
                    $(this).find("div").css("transition", "transform 1s");
                   
                }
                else {
                    $(showDivId).slideToggle(1000);
                    $(this).find("div").css("transform", "rotate(0deg)");
                    $(this).find("div").css("transition", "transform 1s");
                }
                   
                
            });
        }
       

        $(function () {
            $("#sonShowDiv0").hide();
            $("#sonShowDiv2").hide();
            $("#sonShowDiv4").hide();
            //设置左边导航栏默认图片及文字颜色
            $("#img0").css("color", "#ffffff");
            defaultPath = $(defaultId).eq(0).attr("src");
            defaultPath = defaultPath.substring(0, defaultPath.indexOf(".")) + "_bai"
                + defaultPath.substring(defaultPath.indexOf("."), defaultPath.length);
            $(defaultId).eq(0).attr("src", defaultPath);
            NavigationTopCss();
            leftInfoButton();
            leftSonDiv();
        });
    </script>
</asp:Content>
<%-- 导航定位区 --%>
<asp:Content ID="conMiddle" ContentPlaceHolderID="conPlaceHolder_Navigation" runat="server">
     <div class="Front_Div_Logo_Navigation" id="Front_Div_Logo_NavigationId">
          <a href="#"><ul class="Front_Div_Logo_Navigation_ul" id="5">关于我们</ul></a>
          <a href="#"><ul class="Front_Div_Logo_Navigation_ul" id="6">联系我们</ul></a>
          <a href="#"><ul class="Front_Div_Logo_Navigation_ul" id="4">新闻中心</ul></a>
          <a href="#"><ul class="Front_Div_Logo_Navigation_ul" id="3">解决方案</ul></a>
          <a href="#"><ul class="Front_Div_Logo_Navigation_ul" id="2">提供服务</ul></a>
          <a href="#"><ul class="Front_Div_Logo_Navigation_ul" id="1">产品</ul></a>
          <a href="Front_Index.aspx"><ul class="Front_Div_Logo_Navigation_ul"  id="7">首页</ul></a>
     </div>
</asp:Content>
 <%-- 中间内容区 --%>
<asp:Content ID="conNavigation" ContentPlaceHolderID="conPlaceHolder_Content" runat="server">
    <div style="width:100%;height:700px;border:0px solid #000000;margin-top:10px;background-color:#f0f1f2;">
        <div class="Pansonel_leftDiv">
             <div class="Pansonel_leftDiv_fatherDiv" >
                <div id="img0" class="Pansonel_leftDiv_fatherDiv_buttonDiv" 
                    style="margin-top:30px;background-color:#5FB878;">
                    <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv" >
                        <img id="img0_0" src="image/zhanghu1.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img"/> 
                    </div> 
                    账户管理</div>
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
             <div class="Pansonel_leftDiv_sonDiv">
                 <ul style="width:150px; border:0px solid red;">
                     <li class="Pansonel_leftDiv_sonDiv_li" > 
                         <a href="javasrcipt:;" style="color:#808080;font-size:10pt;">
                             <div class="Pansonel_leftDiv_sonDiv_div"></div>个人信息</a>
                     </li>
                      <div id="sonShowDiv0" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div class="Pansonel_leftDiv_sonDiv_li_div">个人资料</div>
                             <div class="Pansonel_leftDiv_sonDiv_li_div">头像设置</div>
                         </div>
                     <li class="Pansonel_leftDiv_sonDiv_li" >
                          <a href="javasrcipt:;" style="color:#808080;font-size:10pt;">
                              <div class="Pansonel_leftDiv_sonDiv_div"></div>安全设置</a>
                     </li>
                      <div id="sonShowDiv2" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div class="Pansonel_leftDiv_sonDiv_li_div">修改密码</div>
                             <div class="Pansonel_leftDiv_sonDiv_li_div">设置密保</div>
                         </div>
                     <li class="Pansonel_leftDiv_sonDiv_li" > 
                         <a href="javasrcipt:;" style="color:#808080;font-size:10pt;">
                             <div class="Pansonel_leftDiv_sonDiv_div" ></div>绑定设置</a>

                     </li>
                      <div id="sonShowDiv4" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div class="Pansonel_leftDiv_sonDiv_li_div">邮箱绑定</div>
                             <div class="Pansonel_leftDiv_sonDiv_li_div">手机绑定</div>
                         </div>
                 </ul>
             </div>
        </div>
        <div class="Pansonel_rightDiv">

        </div>
    </div>
</asp:Content>