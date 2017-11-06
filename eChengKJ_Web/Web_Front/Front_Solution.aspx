<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/eChengKJ_FrontSite.Master" AutoEventWireup="true" CodeBehind="Front_Solution.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front__Solution" %>
<%-- CSS样式 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="conPlaceHolder_Css" runat="server">
    <%-- 与服务一样布局(调用) --%>
    <link href="css/Front_eChengKJService.css" rel="stylesheet" />
</asp:Content>
<%-- JavaScript脚本（已引用jQuery文件） --%>
<asp:Content ID="Content2" ContentPlaceHolderID="conPlaceHolder_JS" runat="server">
    <script type="text/javascript">
         //============加载用户页面数据================//
        function LoadPageUserData() {
            var type = "<%=notIsLogin%>";
            if (type == "登录") { $("#thisUserName").html("<%= this.GetUserInfo().U_UserName%>");
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
            var NavigationEq = "3";//设置默认值
            var OriginalId = "";//顶部子导航原ID
            var ParentID = "1";//顶部导航父ID

            /*设置默认显示子选项卡*/
            var defaultSubNavgation = $("#Navigation_div3");
            defaultSubNavgation.css("display", "block");
            
            /*设置默认激活的选项卡eq(i)*/
            var thisFront_Navigation_ul = $(".Front_Div_Logo_Navigation_ul:eq(" + NavigationEq + ")");
            thisFront_Navigation_ul.css("color", "#982626");
            $("#Slider").width(thisFront_Navigation_ul.innerWidth());//设置宽度
            $("#Slider").offset(thisFront_Navigation_ul.offset());//设置位置(id:Slider在al)

            //设置返回默认值（完善再次选择默认子选项卡时，显示最后离开的父选项卡）
            defaultSubNavgation.mousemove(function () {
                OriginalId = "#Navigation_div3";
                ParentID = "3";
            });

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

            //返回默认选择的选择项（鼠标离开时，调用这个方法）
            var returnDefaultNav = function () {
                $(OriginalId).css("display", "none");
                $(ParentID).css("color", "#000000");
                var aL = $(".Front_Div_Logo_Navigation_ul:eq(" + NavigationEq + ")");
                $("#Slider").width(aL.innerWidth());
                $("#Slider").offset(aL.offset());
                thisFront_Navigation_ul.css("color", "#982626");
                defaultSubNavgation.css("display", "block")
            }

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
        //============提供服务导航效果================//
        function SetServiceNavigation() {
            var SaveContentID = "";
            var defaultContentID = "#divContent1";
            //设置默认选项卡
            $("#divSolutionNavigation").css({
                "border": "1px solid #1c5cd2",
                "color": "#1c5cd2",
                "box-shadow": "0 2px 10px #1c5cd2"
            });
            //设置默认显示的内容
            $(defaultContentID).css("display", "block");
            //鼠标单击后的选项卡
            $(".divService_Left_divServiceNavigation").click(function () {
                var divContentId = "#divContent" + $(this).index();
                //选中的改变颜色
                $(this).css({
                    "border": "1px solid #1c5cd2",
                    "color": "#1c5cd2",
                    "box-shadow": "0 2px 10px #1c5cd2"
                });
                //其余的恢复原状
                $(".divService_Left_divServiceNavigation").not($(this))
                    .css({
                        "border": "0px solid #770f0f",
                        "border-top": "1px solid #d6d5d5",
                        "color": "#000000",
                        "box-shadow": "0 0 0 #1c5cd2"
                    });
                if (divContentId != defaultContentID) {
                    $(defaultContentID).css("display", "none");
                }
                //关联（绑定）内容DIV框
                $(divContentId).css("display", "block");
                if (SaveContentID != "" && SaveContentID != divContentId) {
                    $(SaveContentID).css("display", "none");
                }
                SaveContentID = divContentId;
            });
        }

        $(function () {
            LoadPageUserData();
            LoginUrl();
            SetNavigation();
            SetServiceNavigation();
        });

    </script>
</asp:Content>
<%-- 顶部导航 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="conPlaceHolder_Navigation" runat="server">
    <div class="Front_Div_Logo_Navigation" id="Front_Div_Logo_NavigationId">
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="6">关于我们</ul></a>
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="5">联系我们</ul></a>
          <a href="Front_News.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="4">新闻中心</ul></a>
          <a href="Front_Solution.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="3">解决方案</ul></a>
          <a href="Front_eChengKJService.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="2">提供服务</ul></a>
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="1">产品</ul></a>
          <a href="Front_Index.aspx"><ul class="Front_Div_Logo_Navigation_ul"  id="7">首页</ul></a>
     </div>
</asp:Content>
<%-- 中间内容部分 --%>
<asp:Content ID="Content4" ContentPlaceHolderID="conPlaceHolder_Content" runat="server">
    <div class="PublicDIV">
        <%-- 展览 --%>
        <div id="divExhibition" class="PublicDIV_divExhibition" style="margin-top:10px;background-image:url('image/Solution.jpg')"></div>
        <%-- 服务 --%>
        <div id="divService" class="PublicDIV_divService">
            <%-- 服务左边导航框架 --%>
            <div id="divLeft" class="PublicDIV_divService_Left">
                <div style="width:100%;font-size:18pt;text-align:left;margin-bottom:20px;font-weight:600;">解决方案</div>
                <div id="divSolutionNavigation" class="divService_Left_divServiceNavigation">产品常见问题</div>
                <div id="divSolutionNavigation1" class="divService_Left_divServiceNavigation">购买流程</div>
                <div id="divSolutionNavigation2" class="divService_Left_divServiceNavigation">如何申请产品试用</div>
                <div id="divSolutionNavigation3" class="divService_Left_divServiceNavigation">在线指南</div>
            </div>
            <%-- 服务右边内容框架 --%>
            <div id="divRight" class="PublicDIV_divService_Right">
                 <div id="divContent1" class="divService_Right_divContent">
                    <div id="divConteneTitle1" class="Right_divContene_Title">产品常见问题</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                         <h2>敬请期待...</h2>
                     </div>
                </div>
                 <div id="divContent2" class="divService_Right_divContent">
                    <div id="divConteneTitle2" class="Right_divContene_Title">购买流程</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                        <img src="image/GouMaiLiuCheng.png" style="height:400px;width:800px;" />
                     </div>
                </div>
                 <div id="divContent3" class="divService_Right_divContent">
                    <div id="divConteneTitle3" class="Right_divContene_Title">如何申请产品试用</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                          <h2 style="color:#0094ff;">已注册用户</h2>
                        <p>登录已注册的账号，完善个人基本信息及其它信息。去申请试用产品中点击申请，即可。<br />
                        </p>
                         <h2 style="color:#0094ff;">未注册用户</h2>
                        <p>未注册用户请去到 e诚科技 登录页面点击注册后，并进行快速注册。<br />
                            注册完成登录账号完善个人基本信息及其它信息。去申请试用产品中点击申请，即可。
                        </p>
                     </div>
                </div>
                 <div id="divContent4" class="divService_Right_divContent">
                    <div id="divConteneTitle4" class="Right_divContene_Title">在线指南</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                        <h2 style="color:#0094ff;">在线指南</h2>
                        <p>使用ERP时遇到疑问时，可以通过在线指南进行解决。<br />
                             在线指南中整合了各个菜单使用中的常见问题解答。对于使用方法上的问题，可以进行高效地检索并找到合理的解决方案。
                        </p>
                         <h2 style="color:#0094ff;">对想了解的问题进行高效检索</h2>
                        <p>在e诚科技 ERP中，提供了非常强大的检索系统，输入部分关键词，就可以检索出想要的答案。<br />
                             通过检索系统，可以根据查询的关键词自动匹配查询到对应指南，或其他用户提出的相关问题与专业的解决方案。
                        </p>
                     </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
