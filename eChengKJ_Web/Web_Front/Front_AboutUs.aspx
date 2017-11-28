<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/eChengKJ_FrontSite.Master" AutoEventWireup="true" CodeBehind="Front_AboutUs.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_AboutUs" %>
<%-- CSS样式 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="conPlaceHolder_Css" runat="server">
     <link href="css/Front_eChengKJService.css" rel="stylesheet" />
     <link href="css/Front_AboutUs.css" rel="stylesheet" />
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
            var NavigationEq = "0";//设置默认值
            var OriginalId = "";//顶部子导航原ID
            var ParentID = "1";//顶部导航父ID

            /*设置默认显示子选项卡*/
            var defaultSubNavgation = $("#Navigation_div6");
            defaultSubNavgation.css("display", "block");
            
            /*设置默认激活的选项卡eq(i)*/
            var thisFront_Navigation_ul = $(".Front_Div_Logo_Navigation_ul:eq(" + NavigationEq + ")");
            thisFront_Navigation_ul.css("color", "#982626");
            $("#Slider").width(thisFront_Navigation_ul.innerWidth());//设置宽度
            $("#Slider").offset(thisFront_Navigation_ul.offset());//设置位置(id:Slider在al)

            //设置返回默认值（完善再次选择默认子选项卡时，显示最后离开的父选项卡）
            defaultSubNavgation.mousemove(function () {
                OriginalId = "#Navigation_div6";
                ParentID = "0";
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
        //============左边导航效果================//
        function SetServiceNavigation() {
            var SaveContentID = "";
            var defaultContentID = "#divContent1";
            //设置默认选项卡
            $("#divAboutUsNavigation").css({
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
        //============设置下拉框值================//
        function SetSelectOption() {
            var $selPost = $("#selPost");
            $.getJSON("ashx/AboutUs_JoinUs_SelPost.ashx", function (data) {
                var option = "<option value='====请选择你要申请的岗位===='>====请选择你要申请的岗位====</option>";
                $.each(data, function (i,obj) {
                    option = option + "<option value='" + obj.JUP_id + "'>" + obj.JUP_Name + "</option>";
                });
                $selPost.html(option);
            });
        }
        //手机号码是否有效验证
        function isPoneAvailable(str) {
            var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
            if (!myreg.test(str)) {
                return false;
            } else {
                return true;
            }
        }
        //============加入我们（校验信息完整性与提交按钮）================//
        function CheckInfoOrJoinUs() {
            var $Name = $("#txtName");
            var $Phone = $("#txtPhone");
            $Name.blur(function () {
                var val = $(this).val();
                if (val=="") {
                    $("#checkName").html("对不起，[姓名]不能为空！");
                } else {
                    $("#checkName").html("");
                }
            });
            $Phone.blur(function () {
                var val = $(this).val();
                if (val == "") {
                    $("#checkPhone").html("对不起，[联系方式]不能为空！");
                } else if (isPoneAvailable(val)==false) {
                    $("#checkPhone").html("对不起，您输入的[联系方式]有误！");
                } else {
                    $("#checkPhone").html("");
                }
            });
            $("#btnOK").click(function () {
                if ($Name.val() != "") {
                    if ($Phone.val() != "" ) {
                        if (isPoneAvailable($Phone.val()) == false) {
                            $("#checkPhone").html("为了方便我们联系您，请输入正确的手机号码！\n谢谢配合");
                        } else {
                            if ($("#selPost").val() == "====请选择你要申请的岗位====") {
                                $("#checkPost").html("请选择你要申请的岗位！");
                            } else {
                                var joinUsData = {
                                    "Name": $Name.val(),
                                    "Sex": $("input[name='Sex']:checked").val(),
                                    "Phone": $Phone.val(),
                                    "Address": $("#txtAddress").val(),
                                    "Post": $("#selPost").val()
                                };
                                $.ajax({
                                    url: "ashx/AboutUs_JoinUs_btnOK.ashx",
                                    type: "get",
                                    data: joinUsData,
                                    success: function (returnVal) {
                                        if (returnVal != "") {
                                            $Name.val("");
                                            $("input:radio[name='Sex']")[0].checked = true;
                                            $Phone.val("");
                                            $("#txtAddress").val("");
                                            $("#selPost option:first").prop("selected", 'selected');
                                            alert(returnVal);
                                        }
                                    }
                                });
                            }
                        }
                    } else {
                        $("#checkPhone").html("为了方便我们联系您，请输入手机号码！\n谢谢配合");
                    }
                } else {
                    $("#checkName").html("为了方便我们对您的称呼，请输入姓名！\n谢谢配合");
                }
            });
        }
        $(function () {
            $("#topNavigation").css("position", "fixed");
            LoadPageUserData();
            LoginUrl();
            SetNavigation();
            SetServiceNavigation();
            SetSelectOption();
            CheckInfoOrJoinUs();
        });
      </script>
</asp:Content>
<%-- 顶部导航 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="conPlaceHolder_Navigation" runat="server">
    <div class="Front_Div_Logo_Navigation" id="Front_Div_Logo_NavigationId">
          <a href="Front_AboutUs.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="6">关于</ul></a>
          <a href="Front_ContactUs.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="5">联系我们</ul></a>
          <a href="Front_News.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="4">新闻中心</ul></a>
          <a href="Front_AboutUs.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="3">解决方案</ul></a>
          <a href="Front_eChengKJService.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="2">提供服务</ul></a>
          <a href="Front_Product.aspx"><ul class="Front_Div_Logo_Navigation_ul" id="1">产品</ul></a>
          <a href="Front_Index.aspx"><ul class="Front_Div_Logo_Navigation_ul"  id="7">首页</ul></a>
     </div>
</asp:Content>
<%-- 中间内容部分 --%>
<asp:Content ID="Content4" ContentPlaceHolderID="conPlaceHolder_Content" runat="server">
     <div class="PublicDIV">
        <%-- 展览 --%>
        <div id="divExhibition" class="PublicDIV_divExhibition" style="background-image:url('image/选择我们.jpg')"></div>
        <%-- 服务 --%>
        <div id="divService" class="PublicDIV_divService">
            <%-- 服务左边导航框架 --%>
            <div id="divLeft" class="PublicDIV_divService_Left">
                <div style="width:100%;font-size:18pt;text-align:left;margin-bottom:20px;font-weight:600;">关于</div>
                <div id="divAboutUsNavigation" class="divService_Left_divServiceNavigation">关于我们</div>
                <div id="divAboutUsNavigation1" class="divService_Left_divServiceNavigation">成长历程</div>
                <div id="divAboutUsNavigation2" class="divService_Left_divServiceNavigation">企业信誉</div>
                <div id="divAboutUsNavigation3" class="divService_Left_divServiceNavigation">加入我们</div>
            </div>
            <%-- 服务右边内容框架 --%>
            <div id="divRight" class="PublicDIV_divService_Right">
                 <div id="divContent1" class="divService_Right_divContent">
                    <div id="divContentTitle1" class="Right_divContene_Title">关于我们</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                         <p>2017·e诚科技继续前进！</p>
                         <p>e诚科技针对中、小型企业量身定制现代化管理模式，在管理中实现价值。
                             帮助客户在转型与发展中不落伍，跟上时代发展步伐！</p>
                         <p></p>
                         <h4>企业愿景：成为质量与效率同步</h4>
                         <h4>企业使命：为客户创造价值，帮助客户实现现代化管理！</h4>
                         <h4>经营理念：创新、尊重、专业</h4>
                         <h4>企业精神：效力、责任、热忱</h4>
                         <p></p>
                         <p>我们充满激情，与客户一道共铸辉煌。</p>
                     </div>
                </div>
                 <div id="divContent2" class="divService_Right_divContent">
                    <div id="divContentTitle2" class="Right_divContene_Title">成长历程</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                        <h2>2017年e诚科技创办！</h2>
                     </div>
                </div>
                 <div id="divContent3" class="divService_Right_divContent">
                    <div id="divContentTitle3" class="Right_divContene_Title">企业信誉</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                         <p>信誉是积累的结晶，e诚科技愿与你一起见证！</p>
                     </div>
                </div>
                 <div id="divContent4" class="divService_Right_divContent">
                    <div id="divContentTitle4" class="Right_divContene_Title">加入我们</div>
                     <div style="margin-top:20px;text-align:left;font-size:10pt;">
                         <table>
                              <tr>
                                 <td>姓名：</td>
                                 <td  style="text-align:left;">
                                     <input type="text" id="txtName" placeholder="*姓名，如：李先生" />
                                 </td>
                                 <td id="checkName" style="color:#ff0000;text-align:left;"></td>
                             </tr>
                              <tr>
                                 <td>性别：</td>
                                 <td style="text-align:left;">
                                     <input type="radio" id="radioMan" name="Sex" value="男" checked="checked"/>男
                                     <input type="radio" id="radioWoman" name="Sex" value="女" />女
                                 </td>
                             </tr>
                              <tr>
                                 <td>手机号码：</td>
                                 <td  style="text-align:left;"><input type="text" id="txtPhone" placeholder="*手机号码,如：134*****134"  /></td>
                                 <td id="checkPhone" style="color:#ff0000;text-align:left;"></td>
                             </tr>
                              <tr>
                                 <td>E-Mail：</td>
                                 <td  style="text-align:left;"><input type="text" id="txtMail" placeholder="不用填写" disabled="disabled" /></td>
                                 <td id="checkMail" style="color:#ff0000;text-align:left;"></td>
                             </tr>
                              <tr>
                                 <td>现所在住址：</td>
                                 <td  style="text-align:left;"><input type="text" id="txtAddress" placeholder="*请输入您的地址"  /></td>
                                 <td id="checkAddress" style="color:#ff0000"></td>
                             </tr>
                              <tr>
                                 <td>申请岗位：</td>
                                 <td>
                                     <select id="selPost" style="width:100%;">
                                         <option value="0">====请选择你要申请的岗位====</option>
                                         <option value="1" >2</option>
                                         <option value="2">3</option>
                                     </select>
                                 </td>
                                 <td id="checkPost" style="color:#ff0000"></td>
                             </tr>
                             <tr>
                                 <td colspan="2"><input type="button" id="btnOK" value="完成并提交" /></td>
                             </tr>
                         </table>
                     </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
