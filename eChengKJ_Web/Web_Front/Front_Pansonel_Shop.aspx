<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Front/Front_Pansonel.master" AutoEventWireup="true" CodeBehind="Front_Pansonel_Shop.aspx.cs" Inherits="eChengKJ_Web.Web_Front.Front_Pansonel_Shop" %>

<%@ Register Src="~/Web_Front/WebUC/UC_FindInfo.ascx" TagPrefix="uc1" TagName="UC_FindInfo" %>

<%-- CSS样式文件及样式类 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="pansonelContent_CSS" runat="server">
    <link href="css/Front_Pansonel_Shop.css" rel="stylesheet" />
    <link href="css/Front_UCFind.css" rel="stylesheet" />
</asp:Content>
<%-- JS(JQ文件已存在) --%>
<asp:Content ID="Content1" ContentPlaceHolderID="pansonelContent_JS" runat="server">
    <script src="js/Front_Pansonel_Shop.js"></script>
    <script type="text/javascript">
        //======================左侧导航(母版页实现，当前页面设置默认值)=============================//
        var defaultColorId = "#img1";//设置左边导航栏默认图片及文字颜色
        var imgId;//图片ID
        var defaultId = "#img1_0";//默认图片的ID地址选项中
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
            LoginUrl();
            LoadPageUserData();
            chkAll_click();
            shopMoney_Count();
        });
    </script>  
</asp:Content>
<%-- 左边导航 --%>
<asp:Content ID="Content2" ContentPlaceHolderID="pansonelContent_Left" runat="server">
     <%-- 父左导航栏 --%>
     <div class="Pansonel_leftDiv_fatherDiv" >
                <div id="img0" class="Pansonel_leftDiv_fatherDiv_buttonDiv">
                    <div class="Pansonel_leftDiv_fatherDiv_buttonDiv_imgDiv" >
                        <img id="img0_0" src="image/zhanghu1.png" class="Pansonel_leftDiv_fatherDiv_buttonDiv_img"/> 
                    </div> 
                    账户管理</div>
                <div class="Pansonel_leftDiv_fatherDiv_buttonDiv" id="img1"  
                    style="margin-top:30px;background-color:#5FB878;">
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
                            <%-- <div class="Pansonel_leftDiv_sonDiv_div"></div>--%>全部商品</a>
                     </li>
<%--                  <div id="sonShowDiv0" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div class="Pansonel_leftDiv_sonDiv_li_div">个人资料</div>
                             <div class="Pansonel_leftDiv_sonDiv_li_div">头像设置</div>
                  </div>--%>
                </ul>
                 <%-- 安全设置 --%>
                <ul class="Pansonel_leftDiv_sonDiv_ul">
                     <li class="Pansonel_leftDiv_sonDiv_li" id="ShowDiv1">
                          <a href="javasrcipt:;" style="color:#808080;font-size:10pt;">
                             <%-- <div class="Pansonel_leftDiv_sonDiv_div"></div>--%>降价商品</a>
                     </li>
                     <%-- <div id="sonShowDiv1" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div class="Pansonel_leftDiv_sonDiv_li_div">修改密码</div>
                             <div class="Pansonel_leftDiv_sonDiv_li_div">设置密保</div>
                         </div>--%>
                </ul>
                 <%-- 绑定设置 --%>
                <ul class="Pansonel_leftDiv_sonDiv_ul">
                          <li class="Pansonel_leftDiv_sonDiv_li" id="ShowDiv2" > 
                         <a href="javasrcipt:;" style="color:#808080;font-size:10pt;">
                            <%-- <div class="Pansonel_leftDiv_sonDiv_div" ></div>--%>下架商品</a>

                     </li>
                    <%--  <div id="sonShowDiv2" class="Pansonel_leftDiv_sonDiv_li_div" style="margin:0;float:left;">
                             <div class="Pansonel_leftDiv_sonDiv_li_div">邮箱绑定</div>
                             <div class="Pansonel_leftDiv_sonDiv_li_div">手机绑定</div>
                         </div>--%>
                 </ul>
             </div>
</asp:Content>
<%-- 右边内容 --%>
<asp:Content ID="Content4" ContentPlaceHolderID="pansonelContent_Right" runat="server">
    <div style="width:100%;height:100%;border:0px solid #ff0000;">
        <div class="topTitle">
            <div class="divTitleName">
                <div>
                    <div style="width:5px;height:80%;background-color:cornflowerblue;margin-top:5px;float:left;margin-right:15px;"></div>
                    <label style="line-height:50px;font-size:16pt;">全部商品</label>
                </div>
                <div class="divDemand">
                    <ul class="ulDemand">
                        <li class="liDemandText">
                            <input type="text" id="txtDemandInfo" value="" placeholder="请输入查询信息" />
                        </li>
                        <li class="liDemandButton">
                            <input type="button" id="btnDemand" value="查询" />
                        </li>
                    </ul>
                </div>
            </div>
            <div class="divShopTitleName">
                <ul class="ulShopTitle">
                    <li class="liChkAll"><input type="checkbox" class="chkAll"  />全选</li>
                    <li class="liShopInfo">商品信息</li>
                    <li class="liPrice">单价</li>
                    <li class="liNum">数量</li>
                    <li class="liMoney">金额</li>
                    <li class="liOperation">操作</li>
                </ul>
            </div>
        </div>
        <%-- 内容 --%>
        <div class="Shop_Content ">
            <div >
                <div class="shopInfo-view">
                <ul class="ulShopTitle">
                   <li class="liChk"><input type="checkbox" class="chkSelect"   /></li>
                   <li class="liShopInfo shopInfoCss">
                       <div class="contentImage">商品图片</div>
                       <div class="contentInfo">
                           <div class="contentTitle">ERP-网店版(优惠促销)</div>
                           <div class="contentText">内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息</div>
                       </div>
                   </li>
                   <li class="liPrice lineHeight">￥<label class="lbPrice">199999.50</label></li>
                   <li class="liNum lineHeight">
                       <input type="number" class="txtNum" value="1" max="999" min="1" style="text-align:center;" />
                   </li>
                   <li class="liMoney lineHeight">199999.00</li>
                   <li class="liOperation" >
                            <br />
                             <a href="javascript:;" class="aCollect">移入收藏</a><br />
                            <a href="javascript:;" class="aDelete">删除</a>
                   </li>
                </ul>
            </div>
                <div class="shopInfo-view">
                <ul class="ulShopTitle">
                   <li class="liChk"><input type="checkbox"  class="chkSelect"   /></li>
                   <li class="liShopInfo shopInfoCss">
                       <div class="contentImage">商品图片</div>
                       <div class="contentInfo">
                           <div class="contentTitle">ERP-网店版(优惠促销)</div>
                           <div class="contentText">内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息</div>
                       </div>
                   </li>
                   <li class="liPrice lineHeight">￥<label class="lbPrice">199999.00</label></li>
                   <li class="liNum lineHeight">
                       <input type="number" class="txtNum" value="1" max="999" min="1" style="text-align:center;" />
                   </li>
                   <li class="liMoney lineHeight">199999.00</li>
                   <li class="liOperation" >
                            <br />
                             <a href="javascript:;" class="aCollect">移入收藏</a><br />
                            <a href="javascript:;" class="aDelete">删除</a>
                   </li>
                </ul>
            </div>
                <div class="shopInfo-view">
                    <ul class="ulShopTitle"> 
                       <li class="liChk"><input type="checkbox" class="chkSelect"   /></li>
                       <li class="liShopInfo shopInfoCss">
                           <div class="contentImage">商品图片</div>
                           <div class="contentInfo">
                               <div class="contentTitle">ERP-网店版(优惠促销)</div>
                               <div class="contentText">内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息</div>
                           </div>
                       </li>
                       <li class="liPrice lineHeight">￥<label class="lbPrice">199999.00</label></li>
                       <li class="liNum lineHeight">
                           <input type="number" class="txtNum" value="1" max="999" min="1" style="text-align:center;" />
                       </li>
                       <li class="liMoney lineHeight">199999.00</li>
                       <li class="liOperation" >
                                <br />
                                 <a href="javascript:;" class="aCollect">移入收藏</a><br />
                                <a href="javascript:;" class="aDelete">删除</a>
                       </li>
                    </ul>
                </div>
                <div class="shopInfo-view">
                <ul class="ulShopTitle">
                   <li class="liChk"><input type="checkbox" class="chkSelect"   /></li>
                   <li class="liShopInfo shopInfoCss">
                       <div class="contentImage">商品图片</div>
                       <div class="contentInfo">
                           <div class="contentTitle">ERP-网店版(优惠促销)</div>
                           <div class="contentText">内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息</div>
                       </div>
                   </li>
                   <li class="liPrice lineHeight">￥<label class="lbPrice">199999.00</label></li>
                   <li class="liNum lineHeight">
                       <input type="number" class="txtNum" value="1" max="999" min="1" style="text-align:center;" />
                   </li>
                   <li class="liMoney lineHeight">199999.00</li>
                   <li class="liOperation" >
                            <br />
                             <a href="javascript:;" class="aCollect">移入收藏</a><br />
                            <a href="javascript:;" class="aDelete">删除</a>
                   </li>
                </ul>
            </div>
                <div class="shopInfo-view">
                <ul class="ulShopTitle">
                   <li class="liChk"><input type="checkbox" class="chkSelect"   /></li>
                   <li class="liShopInfo shopInfoCss">
                       <div class="contentImage">商品图片</div>
                       <div class="contentInfo">
                           <div class="contentTitle">ERP-网店版(优惠促销)</div>
                           <div class="contentText">内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息</div>
                       </div>
                   </li>
                   <li class="liPrice lineHeight">￥<label class="lbPrice">199999.00</label></li>
                   <li class="liNum lineHeight">
                       <input type="number" class="txtNum" value="1" max="999" min="1" style="text-align:center;" />
                   </li>
                   <li class="liMoney lineHeight">199999.00</li>
                   <li class="liOperation" >
                            <br />
                             <a href="javascript:;" class="aCollect">移入收藏</a><br />
                            <a href="javascript:;" class="aDelete">删除</a>
                   </li>
                </ul>
            </div>
                <div class="shopInfo-view">
                <ul class="ulShopTitle">
                   <li class="liChk"><input type="checkbox" class="chkSelect"   /></li>
                   <li class="liShopInfo shopInfoCss">
                       <div class="contentImage">商品图片</div>
                       <div class="contentInfo">
                           <div class="contentTitle">ERP-网店版(优惠促销)</div>
                           <div class="contentText">内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息</div>
                       </div>
                   </li>
                   <li class="liPrice lineHeight">￥<label class="lbPrice">199999.00</label></li>
                   <li class="liNum lineHeight">
                       <input type="number" class="txtNum" value="1" max="999" min="1" style="text-align:center;" />
                   </li>
                   <li class="liMoney lineHeight">199999.00</li>
                   <li class="liOperation" >
                            <br />
                             <a href="javascript:;" class="aCollect">移入收藏</a><br />
                            <a href="javascript:;" class="aDelete">删除</a>
                   </li>
                </ul>
            </div>
                <div class="shopInfo-view">
                <ul class="ulShopTitle">
                   <li class="liChk"><input type="checkbox" class="chkSelect"   /></li>
                   <li class="liShopInfo shopInfoCss">
                       <div class="contentImage">商品图片</div>
                       <div class="contentInfo">
                           <div class="contentTitle">ERP-网店版(优惠促销)</div>
                           <div class="contentText">内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息内容信息</div>
                       </div>
                   </li>
                   <li class="liPrice lineHeight">￥<label class="lbPrice">199999.00</label></li>
                   <li class="liNum lineHeight">
                       <input type="number" class="txtNum" value="1" max="999" min="1" style="text-align:center;" />
                   </li>
                   <li class="liMoney lineHeight">199999.00</li>
                   <li class="liOperation" >
                            <br />
                             <a href="javascript:;" class="aCollect">移入收藏</a><br />
                            <a href="javascript:;" class="aDelete">删除</a>
                   </li>
                </ul>
            </div>
             </div>
             <%-- 结账 --%>
            <div class="divCloseAnAccount ">
                <ul class="ulCloseAnAccount">
                    <li><input type="checkbox"  class="chkAll" style="cursor:pointer;" />全选</li>
                    <li><a href="javascript:;" id="SelectDelete">删除</a></li>
                    <li><a href="javascript:;" id="SelectAddCollect">移入收藏</a></li>
                    <li style="width:20%;">&nbsp;</li>
                    <li>&nbsp;</li>
                    <li>已选商品&nbsp;<label style="font-size:18pt;color:#ff6a00;" id="lbSumNum">0</label>件</li>
                    <li>合计：<label style="font-size:12pt;color:#ff6a00;">￥</label><label style="font-size:25pt;color:#ff6a00;" id="lbSumMoney">0</label></li>
                    <li style="width:10%;"><input type="button"  value="结算" id="btnCloseAnAccount" /> </li>
                </ul>
            </div>
            <div style="margin-top:10px; width:100%;height:60px;">
               
            </div>
        </div>
       
    </div>
</asp:Content>
