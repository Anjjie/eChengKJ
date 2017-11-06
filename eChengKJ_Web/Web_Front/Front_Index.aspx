<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/eChengKJ_FrontSite.Master" AutoEventWireup="true" CodeBehind="Front_Index.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_Index" %>
<%-- CSS样式文件及样式区 --%>
<asp:Content ID="conCss" ContentPlaceHolderID="conPlaceHolder_Css" runat="server">
    <link href="css/Front_Index.css" rel="stylesheet" />
</asp:Content>
<%-- Javascript脚本文件及脚本代码区（已默认引入jQuery文件，无需重复引用） --%>
<asp:Content ID="conJS" ContentPlaceHolderID="conPlaceHolder_JS" runat="server">
     <%-- 放置引用JS脚本文件或者编写脚本代码地方（已默认引入JQ压缩文件） --%>
        <script type="text/javascript" src="js/Front_Index.js"></script>
    <script type="text/javascript">
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

        $(function () {
            $("#topNavigation").css("position", "fixed");
            var thisID;
            //设置卡片中，更多的动画效果
            $("[name='aDiv']").click(function () {
                thisID = $(this).eq(0).attr("id");
                //获取显示层ID
                $("#" + thisID + "_Tier").css({
                    opacity: 0.8
                }).fadeIn(1000);
                $(".Front_Div_All_middle_Advertising_Card_LucencyCard").not("#" + thisID + "_Tier").fadeOut(1000);
            });
            $(".Front_Div_All_middle_Advertising_Card_LucencyCard").click(function () {
                $(this).fadeOut(1000);
            });
            LoadPageUserData();
            LoginUrl();
        });
    </script>
</asp:Content>
<%-- 中间内容区 --%>
<asp:Content ID="conMiddle" ContentPlaceHolderID="conPlaceHolder_Content" runat="server">
     <!-- 广告、某个产品介绍、技术介绍、优点介绍 -->
     <div class="Front_Div_All_middle_Advertising">
         <div id="Imgad1" style="background-image:url(image/ad1.png);" class="Front_Div_All_middle_Advertising_img">
             <%--<div style="border:0px solid #ff0000;width:300px;position:absolute; left:10%;top:inherit;margin-top:75px;">
                  <h1 style="color:#ffffff;text-align:left;">科技引领未来</h1>
                  <span></span>
                  <h3 style="color:#ffffff;text-align:left;">ERP多种选择，任你选！！</h3>
                  <span></span>
                  <p style="color:#ffffff;text-align:left;">ERP网上管理资源、财务、采购，e诚科技帮你实现。</p>
             </div>--%>
         </div>
         <div id="Imgad2" style="background-image:url(image/ad2.jpg);" class="Front_Div_All_middle_Advertising_img">
             <div style="border:0px solid #ff0000;width:300px;position:absolute; left:50%;top:inherit;margin-top:5px;margin-left:-150px;">
                  <h1 style="color:#000000;text-align:left;">成就互联网+企业</h1>
                  <span></span>
                  <h3 style="color:#000000;text-align:left;">从现在开始，掌握手中的大数据</h3>
                  <span></span>
                  <p style="color:#000000;text-align:left;">e诚科技是移动互联网时代的新型ERP，
                      是基于WEB2.0与云技术的新时代企业管理服务平台。业务架构上贯穿流程驱动与角色驱动思想，
                      精细化支持企业财务管理、供应链管理、生产管理、s-HR管理、供应链协同管理等核心应用。</p>
             </div>
         </div>
         <div id="Imgad3" style="background-image:url(image/ad3.jpg);" class="Front_Div_All_middle_Advertising_img">
             <div style="border:0px solid #ff0000;width:300px;position:absolute; left:10%;top:inherit;margin-top:75px;">
                  <h1 style="color:#ffffff;text-align:left;">科技引领未来</h1>
                  <span></span>
                  <h3 style="color:#ffffff;text-align:left;">ERP多种选择，任你选！！</h3>
                  <span></span>
                  <p style="color:#ffffff;text-align:left;">ERP网上管理资源、财务、采购，e诚科技帮你实现。</p>
             </div>
         </div>
         <div id="Imgad4" style="background-image:url(image/ad4.jpg);" class="Front_Div_All_middle_Advertising_img">
             <div style="border:0px solid #ff0000;width:300px;position:absolute; left:10%;top:inherit;margin-top:75px;">
                  <h1 style="color:#ffffff;text-align:left;">科技引领未来</h1>
                  <span></span>
                  <h3 style="color:#ffffff;text-align:left;">ERP多种选择，任你选！！</h3>
                  <span></span>
                  <p style="color:#ffffff;text-align:left;">ERP网上管理资源、财务、采购，e诚科技帮你实现。</p>
             </div>
         </div>
         <div class="Front_Div_All_middle_Advertising_imgPage">
             <div class="Front_Div_All_middle_Advertising_imgPageID" id="ad1" onclick="javascript:showImg(1);"></div>
             <div class="Front_Div_All_middle_Advertising_imgPageID" id="ad2" onclick="javascript:showImg(1);"></div>
             <div class="Front_Div_All_middle_Advertising_imgPageID" id="ad3" onclick="javascript:showImg(1);"></div>
             <div class="Front_Div_All_middle_Advertising_imgPageID" id="ad4" onclick="javascript:showImg(1);"></div>
         </div>
     </div>
     <div class="Front_Div_All_middle_Advertising">
         <div class="Front_Div_All_middle_Advertising_Product_triangleDiv" ></div>
         <br />
          <hr style="border:0.5px solid #000000;width:1024px;" />
         <div class="Front_Div_All_middle_Advertising_Product_backDiv">
             <br />
             <div class="Front_Div_All_middle_Advertising_Product_backDiv_contentDiv">
                 <div><b style="font-size:28pt;color:#ffffff;">e诚科技ERP - 网店版</b></div>
                 <div style="width:520px;float:left;border:0px solid #ff0000;" >
                     <p style="font-size:18pt;color:#ffffff;">全面解决网店管理问题</p>
                     <p style="color:#ffffff;">
                         &nbsp; &nbsp; &nbsp; &nbsp;无论您是一开始就选择了网店创业，
                         还是从传统实体业务向网店业务拓展，
                         e诚科技ERP都将助您建立起一个规范、
                         高效的信息化管理平台，告别网店管理的混乱局面</p>
                 </div>
                 <div style="width:490px;height:200px; float:right;border:0px solid #00ff21;" >
                     <div style="width:80px;height:80px;background-color:#ff0000;border-radius:80px;float:left;margin:60px 5px 5px 80px;line-height:80px;font-size:15pt;">优惠</div>
                     <div style="width:80px;height:80px;background-color:#6beece;border-radius:80px;float:left;margin:60px 5px 5px 5px;line-height:80px;font-size:15pt;">实用</div>
                     <div style="width:80px;height:80px;background-color:#e2e19b;border-radius:80px;float:left;margin:60px 5px 5px 5px;line-height:80px;font-size:15pt;">安全</div>
                     <div style="width:80px;height:80px;background-color:#621afe;border-radius:80px;float:left;margin:60px 5px 5px 5px;line-height:80px;font-size:15pt;">热门</div>
                 </div>
             </div>
              <a href="#">
                <div id="buyDiv" class="Front_Div_All_middle_Advertising_Product_backDiv_buyDiv">点击购买</div>
             </a>
         </div>
     </div>
     <div id="cardInfo" class="Front_Div_All_middle_Advertising">
         <div style="width:100%;height:550px;">
             <div style="font-size:24pt;margin-top:50px;margin-bottom:30px;">随时随地都能办公，将梦想变为现实。</div>
             <hr style="border:0.5px solid #808080;width:150px;" />
             <div style="font-size:18pt;margin-top:30px;">未来移动办公将会是主流。</div>
             <div style="font-size:18pt;">e诚科技ERP系统，将帮你实现随地办公、轻松管理。</div>
             <div style="width:1210px;left:50%;margin-left:-605px;position:absolute;border:0px solid red;">
                  <%-- 卡片效果1:安装说明 --%>
                  <div class="Front_Div_All_middle_Advertising_Card">
                     <div id="cardDiv1_Tier" class="Front_Div_All_middle_Advertising_Card_LucencyCard">
                          <div class="Card_LucencyCard_Link">省安装</div>
                          <div class="Card_LucencyCard_Link">省操作</div>
                          <div class="Card_LucencyCard_Link">安全高效</div>
                          <div class="Card_LucencyCard_Link">专人服务</div>
		             </div>
		             <h3><img src="image/121b87af493473a467132787859a62a6.png" style="width:64px;height:64px;" /></h3>
		             <span style="font-size:15pt;font-weight:bold;">无需安装,即可办公</span>
		             <p style="font-size:10pt;margin-left:30px;margin-right:30px;">科技创造未来，无需安装任何东西。有网即可登录，进行办公！</p>
                     <a href="#">
		                 <div class="Front_Card_button">查看详细</div>
		             </a>
		             <p><a id="cardDiv1" name="aDiv" href="javascript:;">更多</a></p>
                 </div>
                  <%-- 卡片效果2:PC/APP说明 --%>
                  <div class="Front_Div_All_middle_Advertising_Card">
                     <div id="cardDiv2_Tier" class="Front_Div_All_middle_Advertising_Card_LucencyCard">
                          <div class="Card_LucencyCard_Link">PC(电脑)</div>
                          <div class="Card_LucencyCard_Link">APP(手机)</div>
                          <div class="Card_LucencyCard_Link">同步办公</div>
                          <div class="Card_LucencyCard_Link">移动办公</div>
		             </div>
		             <h3><img src="image/Shouji.png" style="width:84px;height:64px;" /></h3>
		             <span style="font-size:15pt;font-weight:bold;">PC端与手机APP</span>
		             <p style="font-size:10pt;margin-left:30px;margin-right:30px;">电脑与手机APP同步办公，实现电脑手机都能处理事情，体验移动办公的方便性！</p>
                      <a href="#">
		                 <div class="Front_Card_button">查看详细</div>
		              </a>
		              <p><a id="cardDiv2" name="aDiv" href="javascript:;">更多</a></p>
                 </div>
                  <%-- 卡片效果3:办公方便性 --%>
                  <div class="Front_Div_All_middle_Advertising_Card">
                     <div id="cardDiv3_Tier" class="Front_Div_All_middle_Advertising_Card_LucencyCard">
                         <div class="Card_LucencyCard_Link">简单</div>
                          <div class="Card_LucencyCard_Link">方便</div>
                          <div class="Card_LucencyCard_Link">快捷</div>
                          <div class="Card_LucencyCard_Link">同步协作</div>
		             </div>
		             <h3><img src="image/Wushou.png" style="width:84px;height:64px;" /></h3>
		             <span style="font-size:15pt;font-weight:bold;">办公更快捷</span>
		             <p style="font-size:10pt;margin-left:30px;margin-right:30px;">电脑手机同步办公。公司、家中、外出旅行也可以办公！</p>
                     <a href="#">
		                 <div class="Front_Card_button">查看详细</div>
		             </a>
		             <p><a id="cardDiv3" name="aDiv" href="javascript:;">更多</a></p>
                  </div>
                  <%-- 卡片效果4:资源管理的便捷 --%>
                  <div class="Front_Div_All_middle_Advertising_Card" style="border:1px solid #c2c2c2;">
                     <div id="cardDiv4_Tier" class="Front_Div_All_middle_Advertising_Card_LucencyCard">
                          <div class="Card_LucencyCard_Link">资源共享</div>
                          <div class="Card_LucencyCard_Link">自动整理</div>
                          <div class="Card_LucencyCard_Link">统计资源</div>
                          <div class="Card_LucencyCard_Link">快捷管理</div>
		             </div>
		             <h3><img src="image/File.png" style="width:64px;height:64px;" /></h3>
		             <span style="font-size:15pt;font-weight:bold;">资源管理更便捷</span>
		             <p style="font-size:10pt;margin-left:30px;margin-right:30px;">电脑手机资源共享、自动整理与收集资源、更有效率的统计资源信息！</p>
                      <a href="#">
		                 <div class="Front_Card_button">查看详细</div>
		              </a>
		              <p><a id="cardDiv4" name="aDiv" href="javascript:;">更多</a></p>
                 </div>
             </div>
         </div>
     </div>
     <div class="Front_Div_All_middle_Advertising">
        <div style="width:100%;height:250px;opacity:0.5;background-image:url(image/buttomServers.jpg);background-repeat:round;">
            <p style="color:#000000;font-size:40pt;font-weight:700;font-family:'华文行楷';line-height:250px">e诚科技，让你的企业走在时代前沿。</p>
        </div>
     </div>
</asp:Content>
<%-- 导航定位区 --%>
<asp:Content ID="conNavigation" runat="server" contentplaceholderid="conPlaceHolder_Navigation">
     <div class="Front_Div_Logo_Navigation" id="Front_Div_Logo_NavigationId">
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="6">关于我们</ul></a>
          <a href="Front_ContactUs.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="5">联系我们</ul></a>
          <a href="Front_News.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="4">新闻中心</ul></a>
          <a href="Front_Solution.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="3">解决方案</ul></a>
          <a href="Front_eChengKJService.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="2">提供服务</ul></a>
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="1">产品</ul></a>
          <a href="Front_Index.aspx"><ul class="Front_Div_Logo_Navigation_ul"  id="7">首页</ul></a>
     </div>
</asp:Content>

