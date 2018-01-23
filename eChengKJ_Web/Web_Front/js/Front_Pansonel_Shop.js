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
        }
        $(".chkAll").prop("checked", true);
       

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

