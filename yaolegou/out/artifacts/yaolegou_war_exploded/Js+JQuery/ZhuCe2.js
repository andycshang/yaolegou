$(function () {
    $(".qr").click(function(){
        if($("#miam").val() == ""){
            $("#yz").html("请输入密码！");
        }else{
            var text = $("[type=password]").val();
            localStorage.setItem("Pass",text);
            $("#chenggong").show();
        }
    })

    $("#miam").blur(function(){
        if($(this).val() == ""){
            $("#yz").html("请输入密码！");
        }else{
            $("#yz").html("");
        }
    })
    /*$("#miam").blur(function(){
        var ruo = /^[0-9]*$/;
        if(ruo.test($("#miam").val())){
            /!*$("#qingdu")*!/
            alert("密码强度弱");
        }

        var zifu = /^\ba[a-z]*[A-Z]*\b$/;
        if(zifu.test($("#miam").val())){
            /!*$("#qingdu")*!/
            alert("密码强度弱 这是字符");
        }

        var zhong = /^[0-9][a-z][A-Z]*$/;
        if(zhong.test($("#miam").val())){
            /!*$("#qingdu")*!/
            alert("密码强度中");
        }
    })*/

    $('#miam').keyup(function(e) {
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
         if (strongRegex.test($(this).val())) {
            $('#passstrength').className = 'ok';
             $("#qingdu #one").show();
             $("#qingdu #two").show();
             $("#qingdu #three").show();
             $("#qingdu div").css("background","green");
             $("#qiangdus").html("密码强度(强)");
             $("#qiangdus").css("color","green");
             $("#qingdu").show();
        } else if (mediumRegex.test($(this).val())) {
            $('#passstrength').className = 'alert';
             $("#qingdu #one").hide();
             $("#qingdu #two").show();
             $("#qingdu #three").show();
             $("#qingdu div").css("background","orange")
             $("#qiangdus").html("密码强度(中)");
             $("#qiangdus").css("color","orange");
             $("#qingdu").show();
        } else {
            $('#passstrength').className = 'error';
             $("#qingdu #one").hide();
             $("#qingdu #two").hide();
             $("#qingdu #three").show();
             $("#qingdu div").css("background","red");
             $("#qiangdus").html("密码强度(弱)");
             $("#qiangdus").css("color","red");
             $("#qingdu").show();
        }
        return true;
    });
})