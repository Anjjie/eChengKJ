<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UPFileImage.aspx.cs" Inherits="eChengKJ_Web.Web_Front.UPFileImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link href="css/Front_Prnsonel_SetHead.css" rel="stylesheet" />
    <script src="js/JQ_File/jquery-3.2.1.min.js"></script>
    <script>
        
        function button_SelectFilt() {
            $selFileImage = $("#selFileImage");
            $btnUp = $("#btnUp");
            $btnFileImage = $("#btnFileImage");

            $selFileImage.change(function () {
                var path = $selFileImage.val();
                var imgURL = "../image/Head/*.jpg";

                var str = $selFileImage.val().split('.');
                str = str[str.length - 1];
                var fileName = $selFileImage.val().split("\\");
                fileName = fileName[fileName.length - 1];
                switch (str) {
                    case "jpg":
                    case "png":
                        $btnUp.click();
                        $btnFileImage.attr("title", "选择图片名：" + fileName);
                        break;
                    default:
                        $selFileImage.select("");
                        alert("对不起，你选择的图片格式有误,请重新选择！");
                        $btnFileImage.attr("title", "未选择任何文件");
                        break;
                }

            });

        }
        //==============获取选择文件单击事件==============//
        function selectFile() {
            $("#selFileImage").click();
        }
        function GetFilePath() {
            $getFileName = $("#getFileName");
            if ($getFileName.html() != "") {
                $("#imgSetHead200").attr("src", $getFileName.html());
                $("#imgSetHead150").attr("src", $getFileName.html());
                $("#imgSetHead75").attr("src", $getFileName.html());
                $("#imgSetHead50").attr("src", $getFileName.html());
            }
        }

        $(function () {
            selectFile();
            button_SelectFilt();
            GetFilePath();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
            <label id="getFileName" runat="server" style="display: none;"></label>
            <asp:FileUpload ID="selFileImage" runat="server" ToolTip="选择图片"  Style="display: none;" />
            <asp:Button ID="btnUp" runat="server" Text="上传"  Style="display: none;" OnClick="btnUp_Click" />
            <%--  <input id="selFileImage" type="file" value="" hidden="hidden" accept="Image/*.jpg" />--%>
            <input id="btnFileImage" type="button" value="选择图片" onclick="selectFile();"  class="selImage" />
            <label id="lbHint" runat="server" style="color:red;margin-top:20px;margin-left:10px; font-family:'宋体';font-size:10pt;"></label>
             <p class="pTitle">仅支持JPG,PNG格式;文件小于3M</p>
            <div class="divSetHead">
                    <div id="setHead200">
                        <img id="imgSetHead200" style="width: 200px; height: 200px;" id="setImage200" src="image/Logo_ICO.png" />
                    </div>
                    <div id="setHead150">
                        <img id="imgSetHead150"  style="width: 150px; height: 150px;" id="setImage150" src="image/Logo_ICO.png" />
                    </div>
                    <div id="setHead75">
                        <img id="imgSetHead75"  style="width: 75px; height: 75px;" id="setImage75" src="image/Logo_ICO.png" />
                    </div>
                    <div id="setHead50">
                        <img id="imgSetHead50"  style="width: 50px; height: 50px;" id="setImage50" src="image/Logo_ICO.png" />
                    </div>
                </div>
            
    </form>
</body>

</html>
