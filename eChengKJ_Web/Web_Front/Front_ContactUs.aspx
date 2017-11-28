<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/eChengKJ_FrontSite.Master" AutoEventWireup="true" CodeBehind="Front_ContactUs.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_ContactUs" %>
<%-- CSS样式 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="conPlaceHolder_Css" runat="server">
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
            var NavigationEq = "1";//设置默认值
            var OriginalId = "";//顶部子导航原ID
            var ParentID = "1";//顶部导航父ID

            /*设置默认显示子选项卡*/
            var defaultSubNavgation = $("#Navigation_div5");
            defaultSubNavgation.css("display", "block");
            
            /*设置默认激活的选项卡eq(i)*/
            var thisFront_Navigation_ul = $(".Front_Div_Logo_Navigation_ul:eq(" + NavigationEq + ")");
            thisFront_Navigation_ul.css("color", "#982626");
            $("#Slider").width(thisFront_Navigation_ul.innerWidth());//设置宽度
            $("#Slider").offset(thisFront_Navigation_ul.offset());//设置位置(id:Slider在al)

            //设置返回默认值（完善再次选择默认子选项卡时，显示最后离开的父选项卡）
            defaultSubNavgation.mousemove(function () {
                OriginalId = "#Navigation_div5";
                ParentID = "1";
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
            $("#topNavigation").css("position", "fixed");
            LoadPageUserData();
            LoginUrl();
            SetNavigation();
        });
    </script>
</asp:Content>
<%-- 顶部导航 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="conPlaceHolder_Navigation" runat="server">
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
<%-- 中间内容部分 --%>
<asp:Content ID="Content4" ContentPlaceHolderID="conPlaceHolder_Content" runat="server">
    <div style="width:1024px;height:768px;border:0px solid #000000;position:relative;left:50%;margin-left:-512px;text-align:left;">
        <h2 style="color:dodgerblue;">快速留言</h2>
        <p>&nbsp;公司名称：<input type="text" id="txtComName" placeholder="*必填" style="width:300px;" /></p>
        <p>&nbsp;公司地址：<input type="text" id="txtComAddress" placeholder="*选填" style="width:300px;" /></p>
        <p>&nbsp;联系电话：<input type="text" id="txtPhone" placeholder="*必填，联系方式。方便联系" style="width:300px;" /></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;联系人：<input type="text" id="txtName" placeholder="*必填，如：e先生或e女士" style="width:300px;" /></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;E-Mail：<input type="text" id="txtMail" placeholder="*选填，E-Mail" style="width:300px;" /></p>
        <div style="border:0px solid dodgerblue;">
            <table>
                <tr>
                    <td valign="top">留言内容：</td>
                    <td><textarea id="txtContent" cols="100" rows="15" placeholder="*请输入你要咨询的内容"></textarea></td>
                </tr>
            </table> 
            <input type="button" id="btnOK" value="完成并提交" style="width:200px;left:50%;margin-left:-200px;position:relative;" />
        </div>
        
        <h2 style="color:#b01212;">联系我们</h2>
        <p>公司地址：广东省珠海市斗门区白蕉南路29号 南方IT学院教学133室</p>
        <p>热线电话：400-123-4567</p>
        <p>公司邮箱：Anjjiewm@163.com</p>

    </div>
</asp:Content>
