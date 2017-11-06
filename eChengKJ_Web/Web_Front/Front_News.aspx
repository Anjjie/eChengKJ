<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/eChengKJ_FrontSite.Master" AutoEventWireup="true" CodeBehind="Front_News.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_News" %>
<%-- CSS样式 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="conPlaceHolder_Css" runat="server">
    <link href="css/Front_2.css" rel="stylesheet" />
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
            var NavigationEq = "2";//设置默认值
            var OriginalId = "";//顶部子导航原ID
            var ParentID = "1";//顶部导航父ID

            /*设置默认显示子选项卡*/
            var defaultSubNavgation = $("#Navigation_div4");
            defaultSubNavgation.css("display", "block");
            
            /*设置默认激活的选项卡eq(i)*/
            var thisFront_Navigation_ul = $(".Front_Div_Logo_Navigation_ul:eq(" + NavigationEq + ")");
            thisFront_Navigation_ul.css("color", "#982626");
            $("#Slider").width(thisFront_Navigation_ul.innerWidth());//设置宽度
            $("#Slider").offset(thisFront_Navigation_ul.offset());//设置位置(id:Slider在al)

            //设置返回默认值（完善再次选择默认子选项卡时，显示最后离开的父选项卡）
            defaultSubNavgation.mousemove(function () {
                OriginalId = "#Navigation_div4";
                ParentID = "2";
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
        $(function () {
            LoadPageUserData();
            LoginUrl();
            SetNavigation();
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
    <div style="width:100%;height:100%;min-width:1024px;min-height:768px;">
        <div class="PublicDIV">
            <div class="PublicDIV_left" >
                <div id="divNewsContent" class="PublicDIV_left_NewsContent">
                   <table style="width:100%;height:76px;border:0px solid #ff0000;text-align:left;cursor:pointer;">
                       <tr >
                           <td rowspan="3" style="border:0px solid #ff0000;width:64px;font-size:10px;">新闻图片</td>
                           <td style="border:0px solid #ff0000;height:20px;">新站发布</td>
                       </tr>
                       <tr >
                           <td style="border:0px solid #ff0000;height:30px;font-size:8px;" valign="top">恭喜，e诚科技网站成功建立！</td>
                       </tr>
                       <tr >
                           <td style="border:0px solid #ff0000;height:16px;font-size:10px;text-align:right;">2017-11-11</td>
                       </tr>
                   </table>
                </div>

                <div id="divNewsContent1" class="PublicDIV_left_NewsContent">
                   <table style="width:100%;height:76px;border:0px solid #ff0000;text-align:left;cursor:pointer;">
                       <tr >
                           <td rowspan="3" style="border:0px solid #ff0000;width:64px;font-size:10px;">新闻图片</td>
                           <td style="border:0px solid #ff0000;height:20px;">新站发布</td>
                       </tr>
                       <tr >
                           <td style="border:0px solid #ff0000;height:30px;font-size:8px;" valign="top">恭喜，e诚科技网站成功建立！</td>
                       </tr>
                       <tr >
                           <td style="border:0px solid #ff0000;height:16px;font-size:10px;text-align:right;">2017-11-11</td>
                       </tr>
                   </table>
                </div>
            </div>
            <div class="PublicDIV_right">
                <div id="News_top" class="PublicDIV_NewsNav" style="margin-bottom:30px;">
                    <div>热门新闻</div>
                    <hr style="width:60px;float:left;" />
                    <p></p>
                    <a href="#">暂时没有数据</a>
                </div>
                <div id="News_bottom" class="PublicDIV_NewsNav">
                    <div>最新动态</div>
                    <hr style="width:60px;float:left;" />
                    <p></p>
                    <a href="#">暂时没有数据</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
