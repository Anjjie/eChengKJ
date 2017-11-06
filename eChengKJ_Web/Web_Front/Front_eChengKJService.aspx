<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/eChengKJ_FrontSite.Master" AutoEventWireup="true" CodeBehind="Front_eChengKJService.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_eChengKJService" %>
<%-- 样式 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="conPlaceHolder_Css" runat="server">
    <link href="css/Front_eChengKJService.css" rel="stylesheet" />
</asp:Content>
<%-- JS --%>
<asp:Content ID="Content2" ContentPlaceHolderID="conPlaceHolder_JS" runat="server">
    <script type="text/javascript">
         var count = 0;
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
            var NavigationEq = "4";
            var OriginalId = "";//顶部子导航原ID
            var ParentID = "1";//顶部导航父ID

            /*设置默认显示子选项卡*/
            var defaultSubNavgation = $("#Navigation_div2");
            defaultSubNavgation.css("display", "block");
            
            /*设置默认激活的选项卡eq(i)*/
            var thisFront_Navigation_ul = $(".Front_Div_Logo_Navigation_ul:eq(" + NavigationEq + ")");
            thisFront_Navigation_ul.css("color", "#982626");
            $("#Slider").width(thisFront_Navigation_ul.innerWidth());//设置宽度
            $("#Slider").offset(thisFront_Navigation_ul.offset());//设置位置(id:Slider在al)

            //设置返回默认值（完善再次选择默认子选项卡时，显示最后离开的父选项卡）
            defaultSubNavgation.mousemove(function () {
                OriginalId = "#Navigation_div2";
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
        //============提供服务导航效果================//
        function SetServiceNavigation() {
            var SaveContentID = "";
            var defaultContentID = "#divContent1";
            //设置默认选项卡
            $("#divServiceNavigation1").css({
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
                if (SaveContentID != "" && SaveContentID!=divContentId) {
                    $(SaveContentID).css("display", "none");
                }
                SaveContentID = divContentId;
            });
        }
        $(document).ready(function () {
            $("#topNavigation").css("position", "fixed");
            LoadPageUserData();
            LoginUrl();
            SetNavigation();
            SetServiceNavigation();
        });
    </script>
</asp:Content>
<%-- 顶导航 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="conPlaceHolder_Navigation" runat="server">
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
<%-- 内容 --%>
<asp:Content ID="Content4" ContentPlaceHolderID="conPlaceHolder_Content" runat="server">
    <div class="PublicDIV">
        <%-- 展览 --%>
        <div id="divExhibition" class="PublicDIV_divExhibition"></div>
        <%-- 服务 --%>
        <div id="divService" class="PublicDIV_divService">
            <%-- 服务左边导航框架 --%>
            <div id="divLeft" class="PublicDIV_divService_Left">
                <div style="width:100%;font-size:18pt;text-align:left;margin-bottom:20px;font-weight:600;">提供服务</div>
                <div id="divServiceNavigation1" class="divService_Left_divServiceNavigation">客户服务</div>
                <div id="divServiceNavigation2" class="divService_Left_divServiceNavigation">开发者服务</div>
                <div id="divServiceNavigation3" class="divService_Left_divServiceNavigation">系统升级</div>
                <div id="divServiceNavigation4" class="divService_Left_divServiceNavigation" style="border-bottom:1px solid #d6d5d5;">
                    客户咨询服务</div>
            </div>
            <%-- 服务右边内容框架 --%>
            <div id="divRight" class="PublicDIV_divService_Right">
                 <div id="divContent1" class="divService_Right_divContent">
                    <div id="divConteneTitle1" class="Right_divContene_Title">客户服务</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                         <p>e诚科技 ERP咨询顾问根据客户要求与公司流程进行ERP操作的培训。两次培训中，将协助用户自定义系统，配合公司的业务运作。</p>
                         <h4 style="font-size:14pt;">北上广深地区</h4>
                         <p>付费用户来 e诚科技培训：免费3次（3个小时/1次)</p>
                         <p>e诚科技职工拜访用户公司：</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;使用e诚科技产品半年以上的用户，免费1次。后期如需再培训，上门一次 300元（2个小时/1次）。</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;使用e诚科技产品未满半年以上的用户，上门一次 300元（2个小时/1次）。</p>
                         <h4 style="font-size:14pt;">其它地区</h4>
                         <p>付费用户来 e诚科技培训：免费2次（3个小时/1次)</p>
                         <p>e诚科技职工拜访用户公司：</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;上门一次 300元（2个小时/1次）。</p>
                     </div>
                </div>
                 <div id="divContent2" class="divService_Right_divContent">
                    <div id="divConteneTitle2" class="Right_divContene_Title">开发者服务</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                         <p>e诚科技 ERP技术人员根据用户提出的系统相关问题做出修复，保障用户公司的正常运行</p>
                         <h4 style="font-size:14pt;">已购买产品保障服务</h4>
                         <p>技术人员通过远程方式查找系统问题并提交  [免费]</p>
                         <p>e诚科技职工拜访用户公司进行问题查找：</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;用户需要提供e诚科技技术人员上门查询问题的食宿、交通费（由e诚科技报价）  [免费]</p>
                         <h4 style="font-size:14pt;">未购买产品保障服务</h4>
                         <p>e诚科技职工拜访用户公司进行问题查找：</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;使用e诚科技产品半年以上的用户，免费1次。后续如需再次出现问题，用户需要提供e诚科技技术人员上门查询问题的食宿、交通费（由e诚科技报价）以及检测费500元/1次</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;使用e诚科技产品未满半年以上的用户，用户需要提供e诚科技技术人员上门查询问题的食宿、交通费（由e诚科技报价）以及检测费500元/1次</p>
                     </div>
                </div>
                 <div id="divContent3" class="divService_Right_divContent">
                    <div id="divConteneTitle3" class="Right_divContene_Title">系统升级</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                         <p>为了保持ERP的效用性、保证时间与资本间的效益，ERP系统必须能够适应国内外变化的经济环境。e诚科技 ERP为了适应时代环境，定期进行升级与更新。</p>
                         <p>安装客户端型ERP进行升级开发时，需要投入大量费用。但是e诚科技 ERP的升级费用已包含在使用费中，不额外进行收费。</p>
                         <h4>升级内容</h4>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;根据浏览器版本升级更新</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;更新查询功能</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;更新输入资料的方法及报表格式</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;升级更新手机版本</p>
                         <p>&nbsp;&nbsp;·&nbsp;&nbsp;开发用户建议的功能</p>
                         <p></p>
                         <p>如果您有疑问，请联系客服或者反馈/留言，我们将尽快答复您。</p>
                         <p>查看更多关于e诚科技常见问题方面的内容。<a href="#">(解决方案)</a></p>
                     </div>
                </div>
                 <div id="divContent4" class="divService_Right_divContent">
                    <div id="divConteneTitle4" class="Right_divContene_Title">客户咨询服务</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                         <h3>在线留言咨询服务</h3>
                         <p>在使用e诚科技 ERP期间，遇到疑问时，可通过系统内提供的在线留言咨询平台进行解决。</p>
                         <p>工作日期间，会实时解答您提交的问题。节假日期间，会在次日回复或给您去电解答。</p>
                         <p>工作日：09:30 ~ 20:00 </p>
                         <p>星期六：09:30 ~ 17:00 </p>
                         <p></p>
                         <p></p>
                         <h3>专业ERP顾问电话咨询服务</h3>
                         <p>e诚科技 ERP提供在线解决方案，可与我们的ERP专家进行实时电话咨询。</p>
                         <p>在使用e诚科技 ERP期间，对于上门培训和使用指南等解决方案中的难点，可以马上与我们进行电话咨询。</p>
                         <p>工作日：09:30 ~ 20:00 </p>
                         <p>周  末：09:30 ~ 17:00 </p>
                     </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
