//document.write("<script type='text/javascript' src='jquery-3.2.1.min.js'>");
var OriginalId = "";//原ID
var ParentID = "";//父ID

//获取时间
var setTimesss = 5000;
var theTime;
//循环/单击（当前）页
var getThisPage = 0;
//总页数
var sumPage = 3;

var timeThe;

//JQ脚本
$(function () {
   

    //设置显示导航下的子菜单
    $(".Front_Div_Logo_Navigation_ul").mousemove(function () {
        var Navigation_id = "#Navigation_div" + $(this).eq(0).attr("id");
        if (OriginalId != "" || ParentID != "") {
            $(OriginalId).css("display", "none");
            $(ParentID).css("color", "#000000");
        }
        if ($(Navigation_id + ":hidden") || ParentID == "") {
            $(Navigation_id).css("display", "block");
            $("#" + $(this).eq(0).attr("id")).css("color", "#982626");
            ParentID = "#" + $(this).eq(0).attr("id");
            OriginalId = Navigation_id;
        }
    });

    /*设置默认激活的选项卡eq(i)*/
    var thisFront_Navigation_ul = $(".Front_Div_Logo_Navigation_ul:eq(6)");
    thisFront_Navigation_ul.css("color", "#982626");
    $("#Slider").width(thisFront_Navigation_ul.innerWidth());//设置宽度
    $("#Slider").offset(thisFront_Navigation_ul.offset());//设置位置(id:Slider在al)
    //aL.addClass("listA");
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
        $(OriginalId).css("display", "none");
        $(ParentID).css("color", "#000000");
        var aL = $(".Front_Div_Logo_Navigation_ul:eq(6)");
        $("#Slider").width(aL.innerWidth());
        $("#Slider").offset(aL.offset());
        thisFront_Navigation_ul.css("color", "#982626");
    });
    /*
        设置进入到Front_Div_Navigation_div类所使用的子菜单导航时,
        保持父导航颜色位置和显示当前的子导航
   */
    $(".Front_Div_Navigation_div").mousemove(function () {
        if ($(OriginalId + ":hidden") || ParentID == "") {
            $(OriginalId).css("display", "block");
            $(ParentID).css("color", "#982626");
            $("#Slider").width($(ParentID).innerWidth());
            $("#Slider").offset($(ParentID).offset());
        }
        thisFront_Navigation_ul.css("color", "#000000");
    });
    /*
    设置进入到Front_Div_Navigation_div类所使用的子菜单导航时,
    隐藏子菜单，并恢复默认导航颜色位置
*/
    $(".Front_Div_Navigation_div").mouseout(function () {
        $(OriginalId).css("display", "none");
        $(ParentID).css("color", "#000000");
        var aL = $(".Front_Div_Logo_Navigation_ul:eq(6)");
        $("#Slider").width(aL.innerWidth());
        $("#Slider").offset(aL.offset());
        thisFront_Navigation_ul.css("color", "#982626");
    });

    //设置默认广告图片
    $(".Front_Div_All_middle_Advertising_img:eq(0)").css("display", "block");
    $(".Front_Div_All_middle_Advertising_imgPageID:eq(0)").css("background", "#ff6a00");
    $(".Front_Div_All_middle_Advertising_img").not(".Front_Div_All_middle_Advertising_img:eq(0)").css("display", "none");
    $(".Front_Div_All_middle_Advertising_imgPageID").not(".Front_Div_All_middle_Advertising_imgPageID:eq(0)").css("background", "#ffffff");

    //单击显示广告滚动图片
    $(".Front_Div_All_middle_Advertising_imgPageID").click(function () {
        getThisPage = $(".Front_Div_All_middle_Advertising_imgPageID").index(this);
        imgId = "Img" + $(this).eq(0).attr("id");
        $("#" + imgId).css("display", "block");
        $(".Front_Div_All_middle_Advertising_img").not("#" + imgId).css("display", "none");
        $("#" + $(this).eq(0).attr("id")).css("background", "#ff6a00");
        $(".Front_Div_All_middle_Advertising_imgPageID").not("#" + $(this).eq(0).attr("id")).css("background", "#ffffff");
    });

    //封装自动显示轮播图函数
    var autoShowImg = function (id) {
        $(".Front_Div_All_middle_Advertising_img:eq(" + id + ")").css("display", "block");
        $(".Front_Div_All_middle_Advertising_imgPageID:eq(" + id + ")").css("background", "#ff6a00");
        $(".Front_Div_All_middle_Advertising_img").not(".Front_Div_All_middle_Advertising_img:eq(" + id + ")").css("display", "none");
        $(".Front_Div_All_middle_Advertising_imgPageID").not(".Front_Div_All_middle_Advertising_imgPageID:eq(" + id + ")").css("background", "#ffffff");
    }

    //轮播
    var showImg = setInterval(function () {
        getThisPage++;
        if (getThisPage > sumPage) {
            getThisPage = 0;
        }
        autoShowImg(getThisPage);
        timeThe = setInterval("showImg()", 8000);
    }, setTimesss);
    //显示轮播
    $("boby").ready("onload", showImg());
});