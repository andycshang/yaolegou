


var dates;
var suijishu;
$(function () {
    $("#text").blur(function () {
        var reg = /^1[3-9]\d{9}$/;
        if ($(this).val() == "") {
            $("#phone").html("必须输入手机号码");
        } else if (!reg.test($("#text").val())) {
            $("#phone").html("手机号码格式不正确")
        } else {
            $("#phone").html("")
        }
    })

    $("#yzms").blur(function(){
        if($(this).val() == ""){
            $("#yzmss").html("请输入验证码");
        }else{
            $("#yzmss").html("");
        }
    })


    $("#zhuce").click(function () {
        $("#phone").html('');
        var reg = /^1[3-9]\d{9}$/;
        if ($("#text").val() == "") {
            $("#phone").html("必须输入手机号码");
        } else if (!reg.test($("#text").val())) {
            $("#phone").html("手机号码格式不正确");
        }else if($("#yzms").val() == ""){
            $("#yzmss").html("请输入验证码");
        }else if(document.getElementById("tongyi").checked == false){
            $("xianshi").fadeIn(1000);
        }else{
            $.post("reg?State=checksms",{"smscode":$("#yzms").val()},function
                (data){
                if(data == 'true'){
                    $("xianshi").fadeOut(1000);
                    $("form").submit();
                }else{
                    $("#yzmss").html("验证码错误");
                }
            });
        }
    })

    $("#yzm").click(function () {
        var phone = $("[name=phone]").val();
        if(!isNaN(phone) && phone != ""){
            $.post("reg?State=yanzhengs",{"phone":phone},function (Data){
                if(Data == "true"){
                    $(this).css("background", "#ccc");
                    miao = 60;
                    $(this).html("请"+miao+"秒后重试");
                    dates = setInterval("jian()",1000);
                    suijishu="";
                    $.post("reg?State=sendsms",{"phone":phone},function (data){
                        if(data == 'true'){
                            $("#yzmss").html("验证码发送成功");
                        }
                    }, "json");
                }else{
                    alert("手机号已注册！");
                }
            })
        }else{
            alert("请输入正确的手机号码");
        }

    })
})

var miao = 60;

function jian(){
    if(miao==0){
        dates = clearInterval();
        $("#yzm").html("点击获取验证码");
        $("#yzm").css("background", "#ff3366");
    }else{
        miao--;
        $("#yzm").html("请"+miao+"秒后重试");
    }

}


