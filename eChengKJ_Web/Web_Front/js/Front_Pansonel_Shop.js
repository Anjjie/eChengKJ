/// <reference path="JQ_File/jquery-3.2.1.min.js" />
var sumMoney = 0;

//选中处理（全部选中、包括结算总价钱统计）
function chkAll_click() {
    var $liMoney = $(".liMoney");
    
    $(".chkAll").change(function () {
       
        $(".chkAll").prop("checked", $(this).prop("checked"));
        $(".chkSelect").prop("checked", $(this).prop("checked"));
        sumMoney = 0;
        if ($(this).prop("checked")) {
            
            for (i = 1; i < $liMoney.length; i++) {
                sumMoney += parseFloat($liMoney.eq(i).html());
            }
            $("#lbSumNum").html($liMoney.length - 1);
        } else {
            sumMoney = 0;
            $("#lbSumNum").html(0);
        }
        
        $("#lbSumMoney").html(sumMoney);
    });
    $(".chkSelect").change(function () {
        if ($(".chkSelect").not($(".chkSelect:checked")).length > 0) {
            if ($(this).prop("checked")) {
                sumMoney = sumMoney + parseFloat($liMoney.eq($(".chkSelect").index($(this))+1).html());
            } else {
                sumMoney = sumMoney - parseFloat($liMoney.eq($(".chkSelect").index($(this)) + 1).html());
            }
            $("#lbSumNum").html($(".chkSelect:checked").length);
            $("#lbSumMoney").html(sumMoney);
            $(".chkAll").prop("checked", false);
            return;
        } else {
            sumMoney = 0;
            for (i = 1; i < $liMoney.length; i++) {
                sumMoney += parseFloat($liMoney.eq(i).html());
            }
            $("#lbSumNum").html($liMoney.length - 1);
            $("#lbSumMoney").html(sumMoney);
            $(".chkAll").prop("checked", true);
        }
       
       

    });
}
//添加数量处理（包括结算总价钱统计）
function shopMoney_Count() {
    var $liMoney = $(".liMoney");
    var $lbPrice = $(".lbPrice");
    var $txtNum = $(".txtNum");
    $txtNum.change(function () {
        var num = parseInt($(this).val());
        var price = parseFloat($lbPrice.eq($(this).index(".txtNum")).html());
        var money = num * price;
        if ($(".chkSelect").eq($(this).index(".txtNum")).prop("checked")) {
            sumMoney -= parseFloat($liMoney.eq($(this).index(".txtNum") + 1).html());
            $liMoney.eq($(this).index(".txtNum") + 1).html(parseFloat(money.toFixed(2)));
            sumMoney += money;
            $("#lbSumMoney").html(sumMoney);
        } else {
            $liMoney.eq($(this).index(".txtNum") + 1).html(parseFloat(money.toFixed(2)));
        }
    });
}
//包装购物车产品html文档
function ShopInfo_DivView(id,shopName, introduce, price, number) {
    var sumPrice = parseFloat( parseFloat(price) * parseInt( number));
    return  '<div class="shopInfo-view"> '
                     + '<ul class="ulShopTitle">'
                        +' <li class="liChk">'
                             +'<input type="checkbox" class="chkSelect" /></li>'
                         + '<li class="liShopInfo">'
                            + ' <div class="shopInfoCss">'
                             +'<div class="contentImage">商品图片</div>'
                             +'<div class="contentInfo">'
                                 + '<div class="contentTitle" data-id="' + id + '">' + shopName+ '</div>'
                                 + '<div class="contentText">' + introduce + '</div>'
                             + '</div>'
                            + '</div>'
                         +'</li>'
                         + '<li class="liPrice lineHeight">￥<label class="lbPrice">' + price + '</label></li>'
                         +'<li class="liNum lineHeight">'
                             + '<input type="number" class="txtNum" value="' + number + '" max="999" min="1" style="text-align: center;" />'
                         +'</li>'
                         + '<li class="liMoney lineHeight">' + sumPrice + '</li>'
                         +'<li class="liOperation">'
                             +'<br />'
                             +'<a href="javascript:;" class="aCollect">移入收藏</a><br />'
                             +'<a href="javascript:;" class="aDelete">删除</a>'
                        +' </li>'
                     +'</ul>'
                 +'</div>';
}

function LoadShopInfo() {
    var data = {
        "operation": "select",//操作类型
        "operations": "con",//执行方法
        "con": $("#thisUserName").html()
    }
    $.ajax({
        type: "get",
        url: "ashx/Shop_Table.ashx",
        data: data,
        success: function (ret) {
            $(".LoadContent").html("");
            var retData = $.parseJSON(ret);
            if (!(retData.length > 0)) {
                $(".LoadContent").append("<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><lable style='font-size:15pt;color:#999999;'>对不起，您的购物车没有任何产品。</lable>");
            } else {
                $.each(retData, function (i, obj) {
                    $(".LoadContent").append(ShopInfo_DivView(obj.Shop_Id, obj.GetProductByP_No.P_Name, obj.GetProductByP_No.P_Introduce, obj.GetProductByP_No.P_Price, obj.Shop_Number));
                });
            }
            chkAll_click();
            shopMoney_Count();
            aDelete_click();
        }
    });
}

function hint_Show(background_color, text) {
    $(".hint").html(text).css("background-color", background_color);
    $(".hint-view").slideDown(300, function () {
        
        $(".hint-view").delay(1000).slideUp(1000);
    });
}

function DeleteShop(id) {
    var data = {
        "operation": "delete",
        "id":id
    }
    var hint = "";
    var color = "";

    $.ajax({
        type: "get",
        data: data,
        url: "ashx/Shop_Table.ashx",
        success: function (ret) {
            if (ret == "1") {
                hint = "删除成功！";
                color = "cadetblue";
            } else {
                hint = "删除失败！";
                color = "Crimson";
            }
            hint_Show(color, hint);
            LoadShopInfo();
        }
    });
}

function aDelete_click() {

    $(".aDelete").click(function () {
         //var data = {
            //    "operation": "delete",
            //    "id": $(".contentTitle").eq($(this).index(".aDelete")).data("id")
            //}
            //var hint = "";
            //var color = "";
            //$.ajax({
            //    type: "get",
            //    data: data,
            //    url: "ashx/Shop_Table.ashx",
            //    success: function (ret) {
            //        if (ret == "1") {
            //            hint = "删除成功！";
            //            color = "cadetblue";
            //        } else {
            //            hint = "删除失败！";
            //            color = "Crimson";
            //        }
            //        hint_Show(color, hint);
            //        setTimeout(function () {
            //            LoadShopInfo();
            //        }, 2000);
            //    }
            //});
        DeleteShop($(".contentTitle").eq($(this).index(".aDelete")).data("id"));
    });

}

