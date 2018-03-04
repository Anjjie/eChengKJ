/// <reference path="JQ_File/jquery-3.2.1.min.js" />

function SetPageCheck(type,pageNo){
    var sumPage = parseInt($("#pageSum").html());
    var error = 0;
    var hint = "";
    switch (type) {
        case "Index":
            break;
        case "Up":
            if (pageNo < 1)
            {
                hint = "当前所在位置已经是第一页";
                error++;
                pageNo = 1;
            }
            break;
        case "Next":
            if (pageNo > sumPage) {
                hint = "当前所在位置已经是最后一页";
                error++;
                pageNo = sumPage;
            }
            break;
        case "Finally":
           
            break;
    }
    if (error>0) {
        return hint;
    }
    $("#pageThis").html(pageNo);
}

function PageFunction() {
    $(".pageNumber").eq(0).addClass("addBackground");
    $("#pageOen").click(function () {
        SetPageCheck("Index", 1);
        var val = 0;
        for (var i = 0; i < 5; i++) {
            val = (val + 1);
            $(".pageNumber").eq(i).html(val);
        }
        $(".pageNumber").eq(0).addClass("addBackground");
        $(".pageNumber").not($(".pageNumber").eq(0)).removeClass("addBackground");
    });
    $("#pageUp").click(function () {
        var thisNo = parseInt($("#pageThis").html());
        thisNo--;
        var retError = SetPageCheck("Up", thisNo);

        if (retError != undefined) {
            alert(retError);
            return;
        }
        if (parseInt($(".pageNumber").eq(0).html()) > 1 && thisNo <= (parseInt($("#pageSum").html()) - 3)) {
            for (var i = 0; i < 5; i++) {
                var newVal = (parseInt($(".pageNumber").eq(i).html()) - 1);
                $(".pageNumber").eq(i).html(newVal)
            }
        } else if (thisNo >= (parseInt($("#pageSum").html()) - 2) && thisNo <= parseInt($("#pageSum").html())) {
            var pageThisNo = (parseInt($("#pageSum").html()) - thisNo);
            pageThisNo = 4 - pageThisNo;
            $(".pageNumber").eq(pageThisNo).addClass("addBackground");
            $(".pageNumber").not($(".pageNumber").eq(pageThisNo)).removeClass("addBackground");
        } else if (thisNo <= 3) {
            $(".pageNumber").eq(parseInt($("#pageThis").html()) - 1).addClass("addBackground");
            $(".pageNumber").not($(".pageNumber").eq(parseInt($("#pageThis").html()) - 1)).removeClass("addBackground");
        }
    });
    $("#pageNext").click(function () {
        var thisNo = parseInt($("#pageThis").html());
        thisNo++;
        var retError = SetPageCheck("Next", thisNo);
        if (thisNo > 3 && thisNo <= (parseInt($("#pageSum").html()) - 2)) {
            for (var i = 0; i < 5; i++) {
                var newVal = (parseInt($(".pageNumber").eq(i).html()) + 1);
                $(".pageNumber").eq(i).html(newVal);
            }
        } else if (thisNo >= (parseInt($("#pageSum").html()) - 2) && thisNo <= parseInt($("#pageSum").html())) {
            var pageThisNo = (parseInt($("#pageSum").html()) - thisNo);
            pageThisNo = 4 - pageThisNo;
            //if (pageThisNo==1) {
            //    for (var i = 0; i < 5; i++) {
            //        var newVal = (parseInt($(".pageNumber").eq(i).html()) + 1);
            //        $(".pageNumber").eq(i).html(newVal);
            //    }
            //}
            $(".pageNumber").eq(pageThisNo).addClass("addBackground");
            $(".pageNumber").not($(".pageNumber").eq(pageThisNo)).removeClass("addBackground");
        } else if (thisNo<=3) {
            $(".pageNumber").eq(parseInt($("#pageThis").html()) - 1).addClass("addBackground");
            $(".pageNumber").not($(".pageNumber").eq(parseInt($("#pageThis").html()) - 1)).removeClass("addBackground");
        }
        if (retError != undefined) {
            alert(retError);
        }

        
    });
    $("#pageFinally").click(function () {
        SetPageCheck("Finally", parseInt($("#pageSum").html()));
        var val = parseInt($("#pageSum").html() - 5);
        for (var i = 0; i < 5; i++) {
            val = (val + 1);
            $(".pageNumber").eq(i).html(val);
        }
        $(".pageNumber").eq(4).addClass("addBackground");
        $(".pageNumber").not($(".pageNumber").eq(4)).removeClass("addBackground");
    });
    $(".pageNumber").click(function () {
        var index = $(this).index(".pageNumber");
        var val = $(this).html();
        switch (index) {
            case 0://减2
                if (val == 1) {
                    $(this).addClass("addBackground");
                    $(".pageNumber").not($(this)).removeClass("addBackground");
                    break;
                }
                if (val ==2) {
                    for (var i = 0; i < 5; i++) {
                        var newVal = (parseInt($(".pageNumber").eq(i).html()) - 1);
                        $(".pageNumber").eq(i).html(newVal);

                    }
                    $(".pageNumber").eq(2).addClass("addBackground");
                    $(".pageNumber").not($(".pageNumber").eq(2)).removeClass("addBackground");
                    break;
                }
                for (var i = 0; i < 5; i++) {
                    var newVal = (parseInt($(".pageNumber").eq(i).html()) - 2);
                    $(".pageNumber").eq(i).html(newVal);
                }
                $(".pageNumber").eq(2).addClass("addBackground");
                $(".pageNumber").not($(".pageNumber").eq(2)).removeClass("addBackground");
                break;
            case 1://减1
                if (val == 2) {
                    $(this).addClass("addBackground")
                    $(".pageNumber").not($(this)).removeClass("addBackground");
                    break;
                }
                for (var i = 0; i < 5; i++) {
                    var newVal = (parseInt($(".pageNumber").eq(i).html()) - 1);
                    $(".pageNumber").eq(i).html(newVal);

                }
                $(".pageNumber").eq(2).addClass("addBackground");
                $(".pageNumber").not($(".pageNumber").eq(2)).removeClass("addBackground");
                break;
            case 2://大于3默认所有页数为当前索引按钮
                    $(this).addClass("addBackground")
                    $(".pageNumber").not($(this)).removeClass("addBackground");
                break;
            case 3://加1
                if (val == (parseInt($("#pageSum").html())-1)) {
                    $(this).addClass("addBackground")
                    $(".pageNumber").not($(this)).removeClass("addBackground");
                    break;
                }
                for (var i = 0; i < 5; i++) {
                    var newVal = (parseInt($(".pageNumber").eq(i).html()) + 1);
                    $(".pageNumber").eq(i).html(newVal);

                }
                $(".pageNumber").eq(2).addClass("addBackground");
                $(".pageNumber").not($(".pageNumber").eq(2)).removeClass("addBackground");
                break;
            case 4://加2
                if (val == parseInt($("#pageSum").html())) {
                    $(this).addClass("addBackground")
                    $(".pageNumber").not($(this)).removeClass("addBackground");
                    $("#pageThis").html(val);
                    break;
                }
                if (val == (parseInt($("#pageSum").html()) - 1)) {
                    for (var i = 0; i < 5; i++) {
                        var newVal = (parseInt($(".pageNumber").eq(i).html()) + 1);
                        $(".pageNumber").eq(i).html(newVal);

                    }
                    $(".pageNumber").eq(2).addClass("addBackground");
                    $(".pageNumber").not($(".pageNumber").eq(2)).removeClass("addBackground");
                    break;
                }
                for (var i = 0; i < 5; i++) {
                    var newVal = (parseInt($(".pageNumber").eq(i).html()) + 2);
                    $(".pageNumber").eq(i).html(newVal);
                }
                $(".pageNumber").eq(2).addClass("addBackground");
                $(".pageNumber").not($(".pageNumber").eq(2)).removeClass("addBackground");
                break;
        }
        $("#pageThis").html(val);
        
    });
}

function CheckBox_SelAll() {
    $(".chkAll").click(function () {
        $(".chkSelect").prop("checked",$(this).prop("checked"));
    });
}

function Load_default() {
    Show_Data();
    Show_Page(50);
}

function Show_Data() {

    var uid = $("#thisUserName").data("uid");
    alert(uid);
    var data = {
        "uid": uid,
        "no": 1,
        "size":10
    }
   
    $.ajax({
        type: "get",
        data: data,
        url: "ashx/Oreder_Page.ashx",
        success: function (retData) {

            $(".view-orders").html(retData);
        }
    });

}

function Show_Page(oreder_Sum) {
    if (oreder_Sum <= 10) {
        $(".OrderPage").hide();
    } else {
        $(".OrderPage").show();
    }
}