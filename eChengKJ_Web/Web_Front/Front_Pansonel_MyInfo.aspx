<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/Front_Pansonel.master" AutoEventWireup="true" CodeBehind="Front_Pansonel_MyInfo.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_Pansonel_MyInfo" %>
<%-- CSS样式文件及样式类 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="pansonelContent_CSS" runat="server">
    <link href="css/Front_Pansonel_Collect.css" rel="stylesheet" />
    <link href="css/Front_Pansonel_MyInfo.css" rel="stylesheet" />
</asp:Content>
<%-- JS(JQ文件已存在) --%>
<asp:Content ID="Content2" ContentPlaceHolderID="pansonelContent_JS" runat="server">
    <script type="text/javascript">
        //======================左侧导航(母版页实现，当前页面设置默认值)=============================//
        var defaultColorId = "#img0";//设置左边导航栏默认图片及文字颜色
        var imgId;//图片ID
        var defaultId = "#img0_0";//默认图片的ID地址选项中
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
                }else {
                    $("#thisUserName").html("登录");
                }a
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

        //============个人信息修改保存样式================//
        function MyInfoSave() {
            $(".MyInfo_AllContent_up_divContent").click(function () {
                $(this).css({
                    "border": "0px",
                    "background-color": "#ffffff"
                });
                $(".MyInfo_AllContent_up_divContent").not($(this)).css({
                    "border": "1px solid #cccbcb",
                    "background-color": "transparent"
                });
                var index = ".MyInfo_AllContent_below_divContent:eq(" + $(this).index() + ")";
                $(index).css("display", "block");
                $(".MyInfo_AllContent_below_divContent").not($(index)).css("display", "none");
            });
        }

        //============加载个人信息到本页面================//
        function LoadMyInfo() {
             var selectCon = {
                "classType": "User",//必须，执行那个类中的方法
                "methodType": "SelectCon",//必须，执行方法类型
                "attribute": "Name",     //必须，条件查询
                "con":"<%= this.GetUserInfo().U_UserName%>"  //查询条件
            };
            $.getJSON("ashx/All-Powerful_GetBLL.ashx", selectCon, function (returnData) {
                $.each(returnData, function (i, obj) {
                    $("#txtName").val(obj.U_Name);
                    $("#selSex").val( obj.U_Sex);
                    $("#txtPhone").val(obj.U_Phone);
                    $("#selIDType").val(obj.IDT_id);
                    $("#txtID").val(obj.U_IDS);
                    $("#txtCompany").val(obj.U_Company);
                    var address = obj.U_ComPanyAddress.split('/');
                    $("#selCompanyProvince").val(address[0]);
                    $("#selCompanyCity").val(address[1]);
                    $("#selCompanyCounty").val(address[2]);
                    $("#txtAddress").val(address[3]);
                });
            });
        }

        var verify = "e诚科技";//验证码

        //自动删除验证码
        function DeleteVerify(defaultPhone) {
            var deleteTime;
            var setDelectTime = 180;

            //获取验证码
            var phone = { "phone": defaultPhone };
            $.getJSON("ashx/PhoneVerify.ashx", phone,
                function (getVerify) {
                    alert("测试：\n你的验证码为  " + getVerify.Verify + "\n请不要退出本注册页面，否则验证码自动失效！");
                    verify = getVerify.Verify;
                });
            //设置时间函数
            deleteTime = setInterval(function () {
                setDelectTime--;
                if (setDelectTime == 0) {
                    verify = "e诚科技";
                    setDelectTime = 180;
                }
            }, 1000);
        }
        //获取验证码按钮
        function VerifyButton() {
            var setDate = 60;//设置时间60秒
            var timeSub;
            var thisPhone=$("#txtPhone").val();
            var $btnVerify = $("#btnGetVerify");
            $btnVerify.click(function () {
                DeleteVerify(thisPhone);
                //设置时间函数
                timeSub = setInterval(function () {
                    $btnVerify.val(setDate + "秒之后重新获取");
                    $btnVerify.prop("disabled", true);//禁用
                    setDate--;
                    if (setDate == 0) {
                        clearInterval(timeSub);
                        $btnVerify.val("重新获取");
                        $btnVerify.prop("disabled", false);//禁用
                        verify = "e诚科技";
                        setDate = 60;
                    }
                }, 1000);
            });
                                   
        }

        //保存按钮事件函数
        function SaveButtom(id) {
            var fTimer;
            var timer = 5;
            var selectCon = {
                "classType": "User",//必须，执行那个类中的方法
                "methodType": "SelectCon",//必须，执行方法类型
                "attribute": "Name",     //必须，条件查询
                "con":"<%= this.GetUserInfo().U_UserName%>"  //查询条件
            };
            $.getJSON("ashx/All-Powerful_GetBLL.ashx", selectCon, function (returnData) {
                $.each(returnData, function (i, obj) {
                    var userData = {
                        "classType": "User",        //执行那个类中的方法
                        "methodType": "Update",    //执行方法类型
                        "idtId": obj.IDT_id,
                        "lsId": obj.LS_id,
                        "mId":obj.M_id,
                        "Id": obj.U_id,
                        "Company": obj.U_Company,
                        "ComPanyAddress": obj.U_ComPanyAddress,
                        "Head":obj.U_Head,
                        "IDS": obj.U_IDS,
                        "Phone": obj.U_Phone,
                        "Name": obj.U_Name,
                        "PhoneVerify": obj.U_PhoneVerify,
                        "Sex": obj.U_Sex,
                        "UserName": obj.U_UserName,
                        "UserPwd": obj.U_UserPwd,
                        "LoginDatetime": obj.U_LoginDatetime,
                        "LoginAddress": obj.U_LoginAddress,
                        "CreateUserDate": obj.U_CreateUserDate
                    };
                    switch ($(id).eq(0).attr("id")) {
                        case "btnSave1":
                            if ($("#txtName").val() != "") {
                                if ($("#txtPhone").val()!="") {
                                    userData.Name = $("#txtName").val();
                                    userData.Sex = $("#selSex").val();
                                    userData.Phone = $("#txtPhone").val();
                                    $.ajax({
                                        type: "get",
                                        url: "ashx/All-Powerful_GetBLL.ashx",
                                        data: userData,
                                        success: function (retInfo) {
                                            if (retInfo == "Yes") {
                                                $("#labelSave1").html("恭喜，保存成功！");
                                                LoadMyInfo();
                                                fTimer = setInterval(function () {
                                                    timer--;
                                                    if (timer == 0) {
                                                        clearInterval(fTimer);
                                                        $("#labelSave1").html("");
                                                        timer = 5;
                                                    }
                                                }, 1000);

                                            } else {
                                                $("#labelSave1").html("保存失败！");
                                                fTimer = setInterval(function () {
                                                    timer--;
                                                    if (timer == 0) {
                                                        timer = 5;
                                                        clearInterval(fTimer);
                                                        $("#labelSave1").html("");
                                                    }
                                                }, 1000);

                                            }
                                        }
                                    });
                                } else {
                                    $("#lbPhone").html("对不起，电话号码不能为空!");
                                }
                            } else {
                                $("#lbName").html("对不起,姓名不能为空！");}
                            break;
                        case "btnSave2":
                            if ($("#txtPhoneVerify").val() != "" && $("#txtPhoneVerify").val() == verify) {
                                $("#lbPhoneVerify").html("");
                                userData.idtId = $("#selIDType").val();
                                userData.IDS = $("#txtID").val();
                                userData.Phone = $("#txtPhone").val();
                                $.ajax({
                                    type: "get",
                                    url: "ashx/All-Powerful_GetBLL.ashx",
                                    data: userData,
                                    success: function (retInfo) {
                                        if (retInfo == "Yes") {
                                            $("#labelSave2").html("恭喜，保存成功！");
                                            LoadMyInfo();
                                            fTimer = setInterval(function () {
                                                timer--;
                                                if (timer == 0) {
                                                    timer = 5;
                                                    clearInterval(fTimer);
                                                    $("#labelSave2").html("");
                                                }
                                            }, 1000);

                                        } else {
                                            $("#labelSave2").html("保存失败！");
                                            fTimer = setInterval(function () {
                                                timer--;
                                                if (timer == 0) {
                                                    timer = 5;
                                                    clearInterval(fTimer);
                                                    $("#labelSave2").html();
                                                }
                                            }, 1000);

                                        }
                                    }
                                });
                                verify = "e诚科技";
                            } else {
                                $("#lbPhoneVerify").html("验证码有误！");
                            }
                            break;
                        case "btnSave3":
                            if ($("#selCompanyProvince").val() != "请选择") {
                                if ($("#selCompanyCity").val() != "请选择") {
                                    if ($("#selCompanyCounty").val() != "请选择") {
                                        userData.Company = $("#txtCompany").val();
                                        userData.ComPanyAddress = $("#selCompanyProvince").val() + "/"
                                            + $("#selCompanyCity").val() + "/" + $("#selCompanyCounty").val() + "/" + $("#txtAddress").val();
                                        $.ajax({
                                            type: "get",
                                            url: "ashx/All-Powerful_GetBLL.ashx",
                                            data: userData,
                                            success: function (retInfo) {
                                                if (retInfo == "Yes") {
                                                    $("#labelSave3").html("恭喜，保存成功！");
                                                    LoadMyInfo();
                                                    fTimer = setInterval(function () {
                                                        timer--;
                                                        if (timer == 0) {
                                                            timer = 5;
                                                            clearInterval(fTimer);
                                                            $("#labelSave3").html("");
                                                        }
                                                    }, 1000);

                                                } else {
                                                    $("#labelSave3").html("保存失败！");
                                                    fTimer = setInterval(function () {
                                                        timer--;
                                                        if (timer == 0) {
                                                            timer = 5;
                                                            clearInterval(fTimer);
                                                            $("#labelSave3").html("");
                                                        }
                                                    }, 1000);

                                                }
                                            }
                                        });
                                    } else {
                                        $("#labelSave3").html("请选择县/区");
                                    }
                                } else {
                                    $("#labelSave3").html("请选择市");
                                }
                            } else {
                                $("#labelSave3").html("请选择省份");
                            }
                            break;
                    }
                    
                });
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
                    case "修改密码": break;
                    case "设置密保": break;
                    case "邮箱绑定": break;
                    case "手机绑定": break;
                }
            });
        }


        $(function () {
                ClickSubNav();
                MyInfoSave();
                VerifyButton();
                LoadMyInfo();
                $("#sonShowDiv0").show();
                $("#shanjiao1").css({
                    "transform": "rotate(90deg)"
                });
                $("#ShowDiv0").css("background-color", "rgba(95, 184, 120, 0.27)");
                $("#myInfo").css("color", "rgba(95, 184, 120, 0.27)");

                LoginUrl();
                LoadPageUserData();
            });
    </script>  
</asp:Content>
<%-- 左边导航 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="pansonelContent_Left" runat="server">
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
                             <div id="shanjiao1" class="Pansonel_leftDiv_sonDiv_div"></div>个人信息</a>
                     </li>
                  <div id="sonShowDiv0" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div id="myInfo" class="Pansonel_leftDiv_sonDiv_li_div">个人资料</div>
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
</asp:Content>
<%-- 右边内容 --%>
<asp:Content ID="Content4" ContentPlaceHolderID="pansonelContent_Right" runat="server">
    <div class="MyInfo_AllContent">
        <div class="MyInfo_AllContent_up">
            <div id="MyInfoNav0" class="MyInfo_AllContent_up_divContent"  style="border:0px; background-color:#ffffff;">基本信息</div>
            <div id="MyInfoNav1" class="MyInfo_AllContent_up_divContent" >详细信息</div>
            <div id="MyInfoNav2" class="MyInfo_AllContent_up_divContent">公司信息</div>
        </div>
        <div class="MyInfo_AllContent_below">
            <%-- 基本信息 --%>
            <div id="MyInfo0" class="MyInfo_AllContent_below_divContent">
                <table style="width:100%">
                    <tr style="height:40px;">
                        <td></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:30%;">姓名：</td>
                        <td style="text-align:left;width:20%;">
                            <input type="text" id="txtName" value="" placeholder="请完善你的真实姓名" /> </td>
                        <td style="text-align:left;"><label id="lbName"></label></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:30%;">性别：</td>
                        <td style="text-align:left;width:20%;">
                            <select id="selSex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select> </td>
                        <td style="text-align:left;"><label id="lbSex"></label></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:30%;">手机号码：</td>
                        <td style="text-align:left;width:20%;"><input type="text" id="txtPhone" value="400-123-4567" disabled="disabled" />
                            <a href="#" style="color:#2a00ff;font-size:10pt;" >更换</a></td>
                        <td style="text-align:left;"><label id="lbPhone"></label></td>
                    </tr>
                    <tr>
                        <td style="width:30%;" colspan="3">
                              <input type="button" id="btnSave1" value="保存" onclick="SaveButtom(this)" class="MyInfo_AllContent_SaveBtn" />
                              <label id="labelSave1" ></label>
                        </td>
                    </tr>
                </table>
            </div>
            <%-- 详细信息 --%>
            <div id="MyInfo1" class="MyInfo_AllContent_below_divContent" style="display:none;">
                <table style="width:100%;">
                    <tr style="height:40px;">
                        <td></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:30%;">证件类型：</td>
                        <td style="text-align:left;width:20%;"><select id="selIDType">
                                <option value="0">身份证</option>
                                <option value="1">护照</option>
                            </select> </td>
                        <td style="text-align:left;"><label id="lbIDType"></label></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:30%;">证件号：</td>
                        <td style="text-align:left;width:20%;">
                           <input type="text" id="txtID" value="" placeholder="请输入您的证件号码" /></td>
                        <td style="text-align:left;"><label id="lbID"></label></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:30%;">验证码：</td>
                        <td style="text-align:left;width:20%;">
                            <input type="text" id="txtPhoneVerify" value="" placeholder="请输入验证码"/></td>
                        <td style="text-align:left;"><label id="lbPhoneVerify"></label></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:30%;"></td>
                        <td style="text-align:left;width:20%;">
                            <input type="button" id="btnGetVerify" value="获取验证码" /> <font style="font-size:8pt;color:red;">（已绑定手机号接收）</font>
                        </td>
                        <td style="text-align:left;"><label id="lbGetVerify"></label></td>
                    </tr>
                    <tr>
                        <td style="width:30%;" colspan="3">
                              <input type="button" id="btnSave2" value="保存" onclick="SaveButtom(this)" class="MyInfo_AllContent_SaveBtn" />
                              <label id="labelSave2" ></label>
                        </td>
                    </tr>
                </table>
            </div>
            <%-- 公司信息 --%>
            <div id="MyInfo2" class="MyInfo_AllContent_below_divContent" style="display:none;">
                <table style="width:100%;">
                    <tr style="height:40px;">
                        <td></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:30%;">公司名称：</td>
                        <td style="text-align:left;width:20%;">
                            <input type="text" id="txtCompany" value="" />
                        </td>
                        <td style="text-align:left;"><label id="lbCompany"></label></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;width:30%;">公司地址：</td>
                        <td style="text-align:left;width:20%;" colspan="2" >
                            <select id="selCompanyProvince">
                                <option value="请选择">请选择</option>
                                <option value="广东省">广东省</option>
                            </select>
                            <select id="selCompanyCity">
                                <option value="请选择">请选择</option>
                                <option value="珠海市">珠海市</option>
                            </select>
                            <select id="selCompanyCounty">
                                <option value="请选择">请选择</option>
                                <option value="香洲">香洲</option>
                                <option value="金湾">金湾</option>
                                <option value="斗门">斗门</option>
                            </select>
                            <input id="txtAddress" type="text" value="" placeholder="详细地址" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:30%;" colspan="3">
                              <input type="button" id="btnSave3" value="保存" class="MyInfo_AllContent_SaveBtn" onclick="SaveButtom(this)" />
                              <label id="labelSave3" ></label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
