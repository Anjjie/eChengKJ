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
        var defaultId = "#img0_0";//默认图片定位ID选项
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
        //============左侧子导航(设置DIV旋转与下拉框)================//
        function leftSonDiv() {
            $("#sonShowDiv0").hide();
            $("#sonShowDiv1").hide();
            $("#sonShowDiv2").hide();
            $(".Pansonel_leftDiv_sonDiv_li").click(function () {
                var trueOrFalse = $(this).find("div").css("transform");
                var showDivId = "#son" + $(this).eq(0).attr("id");
                if (trueOrFalse == "none" || trueOrFalse == "matrix(1, 0, 0, 1, 0, 0)") {
                    $(showDivId).slideDown(1000);
                    $(this).find("div").css({
                        "transform": "rotate(90deg)",
                        "transition": "transform 1s"
                    });
                }
                else{
                    $(showDivId).slideUp(1000);
                    $(this).find("div").css({
                        "transform": "rotate(0deg)",
                        "transition": "transform 1s"
                    });
                }
            });
        }
        //============消费统计================//
        function btnConsumeMonthOrDay() {
            //设置默认值
            var $setDefault = $(".Pansonel_rightDiv_rightTop_btnMonthOrDay:eq(0)");
            $setDefault.css("background-color", "#ffffff");
            $setDefault.css("box-shadow", "0 5px 10px #1085f0");
            $(".Pansonel_rightDiv_rightTop_btnMonthOrDay").click(function () {
                $(this).css("background-color", "#ffffff");
                $(this).css("box-shadow", "0 5px 10px #1085f0");
                var $getNotThis = $(".Pansonel_rightDiv_rightTop_btnMonthOrDay").not($(this));
                $getNotThis.css("box-shadow", "0 0 0px #1085f0");
                $getNotThis.css("background-color", "transparent");
            });
        }
        //============购物车================//
        function btnShopMonthOrDay() {
            //设置默认值
            var $setDefault = $(".Pansonel_rightDiv_rightTop_btnMonthOrDays:eq(0)");
            $setDefault.css("background-color", "blue");
            $setDefault.css("color", "#ffffff");
            $(".Pansonel_rightDiv_rightTop_btnMonthOrDays").click(function () {
                $(this).css("background-color", "blue");
                $(this).css("color", "#ffffff");
                $(".Pansonel_rightDiv_rightTop_btnMonthOrDays").not($(this)).css("background-color", "transparent");
                $(".Pansonel_rightDiv_rightTop_btnMonthOrDays").not($(this)).css("color", "#000000");
            });
        }
        
       //============加载用户页面数据================//
        function LoadPageUserData() {
            var type="<%=notIsLogin%>";
            if (type == "登录") {
                $("#thisUserName").html("<%= this.GetUserInfo().U_UserName%>");
                $("#myName").html("<%= this.GetUserInfo().U_Name%>");
                $("#myLoginId").html("<%= this.GetUserInfo().U_UserName%>");
                $("#myPhoto").attr("src","image/Head/<%= this.GetUserInfo().U_Head%>");
                var conpany = "<%= this.GetUserInfo().U_Company%>";
                if (conpany=="") {
                    $("#myConpany").html("你还没有填写公司");
                } else {
                    $("#myConpany").html("<%= this.GetUserInfo().U_Company%>");
                }
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

        //==============子目录下的单击事件==========//
        function ClickSubNav() {
            $(".Pansonel_leftDiv_sonDiv_li_div").click(function () {
                switch ($(this).html()) {
                    case "个人资料":
                        window.location.href = "Front_Pansonel_MyInfo.aspx";
                        break;
                    case "头像设置":
                        window.location.href = "Front_Pansonel_SetHead.aspx";
                        break;
                    case "修改密码":
                        window.location.href = "Front_UpdatePwd.aspx";
                        break;
                    case "设置密保":
                        window.location.href = "Front_SetSecurity.aspx";
                        break;
                    case "邮箱绑定":
                        window.location.href = "Front_EMail.aspx";
                        break;
                    case "手机绑定":
                        window.location.href = "Front_Phone.aspx";
                        break;
                }
            });
        }

        $(function () {
            $(".Pansonel_rightDiv_leftBottom").click(function () {
                window.open("https://promotion.aliyun.com/ntms/act/ecshighperformance.html?utm_content=se_1276629");
            });
            $(".Pansonel_rightDiv_rightBottom").click(function () {
                window.open("http://www.ucpaas.com/?utm_source=baidu&utm_medium=ppc&utm_term=%E5%93%81%E8%B7%91%E6%A0%87%E9%A2%98&utm_content=&utm_campaign=pinpao&id=103014");
            });
            //设置左边导航栏默认图片及文字颜色
            $("#img0").css("color", "#ffffff");
            defaultPath = $(defaultId).eq(0).attr("src");
            defaultPath = defaultPath.substring(0, defaultPath.indexOf(".")) + "_bai"
                + defaultPath.substring(defaultPath.indexOf("."), defaultPath.length);
            $(defaultId).eq(0).attr("src", defaultPath);
            NavigationTopCss();
            leftInfoButton();
            leftSonDiv();
            btnConsumeMonthOrDay();
            btnShopMonthOrDay();
            LoadPageUserData();
            LoginUrl();
            ClickSubNav();
        });
    </script>
</asp:Content>
<%-- 导航定位区 --%>
<asp:Content ID="conMiddle" ContentPlaceHolderID="conPlaceHolder_Navigation" runat="server">
     <div class="Front_Div_Logo_Navigation" id="Front_Div_Logo_NavigationId">
          <a href="Front_AboutUs.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="6">关于</ul></a>
          <a href="Front_ContactUs.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="5">联系我们</ul></a>
          <a href="Front_News.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="4">新闻中心</ul></a>
          <a href="Front_Solution.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="3">解决方案</ul></a>
          <a href="Front_eChengKJService.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="2">提供服务</ul></a>
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="1">产品</ul></a>
          <a href="Front_Index.aspx"><ul class="Front_Div_Logo_Navigation_ul"  id="7">首页</ul></a>
     </div>
</asp:Content>
 <%-- 中间内容区 --%>
<asp:Content ID="conNavigation" ContentPlaceHolderID="conPlaceHolder_Content" runat="server">
    <div style="width:100%;height:700px;border:0px solid #000000;margin-top:10px;background-color:#f0f1f2;">
         <%-- 左导航区 --%>
        <div class="Pansonel_leftDiv" >
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
                             <div class="Pansonel_leftDiv_sonDiv_div"></div>个人信息</a>
                     </li>
                  <div id="sonShowDiv0" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                        <div class="Pansonel_leftDiv_sonDiv_li_div">个人资料</div>
                        <div class="Pansonel_leftDiv_sonDiv_li_div">头像设置</div>
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
        </div>
         <%-- 右内容区 --%>
        <div class="Pansonel_rightDiv">
            <%-- 个人基本显示信息（头像、姓名、登录账号[手机号码或者邮箱号码]、VIP等级、所属公司） --%>
            <div class="Pansonel_rightDiv_leftTop">
                <div style="float:left;border:0px solid red;width:29%;height:100%;">
                    <div style="border:0px solid red;height:40%;">
                        <div class="Pansonel_rightDiv_leftTop_photo" style="margin-top:+45px;">
                            <img id="myPhoto" src="image/Logo_ICO.png" style="width:100px;height:100px;border-radius:10px;border:1px solid rgba(128, 128, 128, 0.25);" />
                        </div>
                    </div>
                </div>
                <div style="float:right;border:0px solid red;width:69.5%;height:100%;">
                    <table style="border:0px solid red;width:100%;margin-top:10%;">
                        <tr style="border:0px solid red;">
                            <td align="right" style="border:0px solid red;width:50px;font-size:24pt;">Hi,</td>
                            <td id="myName" align="left" valign="bottom" style="border:0px solid red;font-size:18pt;">e诚小达人</td>
                        </tr>
                        <%-- 隔离带 --%>
                        <tr style="height:20px;">
                            <td colspan="2" ><hr style="border:0.5px solid #808080" /></td>
                        </tr>
                        <tr style="border:0px solid red;">
                            <td align="right" style="border:0px solid red;width:80px;font-size:14pt;">账  号：</td>
                            <td id="myLoginId" align="left" style="border:0px solid red;font-size:14pt;">eChengkeji</td>
                        </tr>
                        <tr style="border:0px solid red;">
                            <td align="right" style="border:0px solid red;width:80px;font-size:14pt;">级  别：</td>
                            <td id="myVip" align="left" style="border:0px solid red;">白银 VIP</td>
                        </tr>
                        <tr style="border:0px solid red;">
                            <td align="right" style="width:80px;font-size:14pt;">公  司：</td>
                            <td id="myConpany" align="left" style="border:0px solid red;">e诚科技</td>
                        </tr>
                    </table>
                </div>
            </div>
            <%-- 账户余额、礼卡 --%>
            <div class="Pansonel_rightDiv_rightTop">
                <div class="divBalance">
                    <div class="rightTop-Title">
                        <div></div>账户余额
                    </div>
                    <div class="rightTop-Content">
                        <div>
                            <div style="float:left;"><label class="full" id="balanceFull">0</label><label class="double" id="balanceDouble">.00</label><label style="font-size:13pt;color:#999999;">元</label></div>
                            <div id="balanceHint">余额不足，<a style="color:blue;" href="javascript:;">点击充值</a></div>
                        </div>
                    </div>
                </div>
                <div class="divGiftBag">
                     <div class="rightTop-Title">
                        <div></div>我的礼包卡
                    </div>
                    <div class="rightTop-Content">
                        <div><label class="full" id="GiftBagFull">0</label><label class="double" id="GiftBagdouble">.00</label><label style="font-size:13pt;color:#999999;">元</label>
                            <a  href="javascript:;" style="margin-left:2%;color:#ff6a00;">查看</a>
                        </div>
                    </div>
                </div>
            </div>
             <%-- 广告 --%>
            <div class="Pansonel_rightDiv_leftBottom">
               <img src="image/aliyun.png" style="width:100%;height:70%;" />
                <div>
                    阿里云-提供专业的云服务器ECS、关系型数据库服务RDS、开放存储服务OSS、内容分发网络CDN等云产品服务。
                </div>
            </div>
             <%-- 广告 --%>
            <div class="Pansonel_rightDiv_rightBottom">
                 <img src="image/yunzhixun.jpg" style="width:100%;height:70%;" />
                <div>
                    云之讯为互联网/移动互联网广大开发者和企业提供通讯能力,云计算PaaS平台,开发者无需硬件网络成本,快速接入电信级通讯能力
                </div>
            </div>
        </div>
    </div>
</asp:Content>
