
$(function (){
    $(".xia").mouseenter(function (){
        $(".div_wzdh").slideDown(100);
    }).mouseleave(function (){
        $(".div_wzdh").slideUp(100);
    });
})

var zhang ;

$(function () {
	
    $(window).scroll(function(){
        var top = $(document).scrollTop();
        /*document.title = top;*/
        
        if(top >= 400){
        	$("#dingbu ").slideDown(300);
        }else{
        	$("#dingbu").slideUp(300);
        }
    })
})

function gotoTop(acceleration,stime) {
	   acceleration = acceleration || 0.1;
	   stime = stime || 10;
	   var x1 = 0;
	   var y1 = 0;
	   var x2 = 0;
	   var y2 = 0;
	   var x3 = 0;
	   var y3 = 0; 
	   if (document.documentElement) {
	       x1 = document.documentElement.scrollLeft || 0;
	       y1 = document.documentElement.scrollTop || 0;
	   }
	   if (document.body) {
	       x2 = document.body.scrollLeft || 0;
	       y2 = document.body.scrollTop || 0;
	   }
	   var x3 = window.scrollX || 0;
	   var y3 = window.scrollY || 0;
	 
	   // 滚动条到页面顶部的水平距离
	   var x = Math.max(x1, Math.max(x2, x3));
	   // 滚动条到页面顶部的垂直距离
	   var y = Math.max(y1, Math.max(y2, y3));
	 
	   // 滚动距离 = 目前距离 / 速度, 因为距离原来越小, 速度是大于 1 的数, 所以滚动距离会越来越小
	   var speeding = 1 + acceleration;
	   window.scrollTo(Math.floor(x / speeding), Math.floor(y / speeding));
	 
	   // 如果距离不为零, 继续调用函数
	   if(x > 0 || y > 0) {
	       var run = "gotoTop(" + acceleration + ", " + stime + ")";
	       window.setTimeout(run, stime);
	   }
	}
(function($) {
    $.fn.extend({
        insertContent: function(myValue, t) {
            var $t = $(this)[0];
            if (document.selection) { //ie
                this.focus();
                var sel = document.selection.createRange();
                sel.text = myValue;
                this.focus();
                sel.moveStart('character', -l);
                var wee = sel.text.length;
                if (arguments.length == 2) {
                    var l = $t.value.length;
                    sel.moveEnd("character", wee + t);
                    t <= 0 ? sel.moveStart("character", wee - 2 * t - myValue.length) : sel.moveStart("character", wee - t - myValue.length);
  
                    sel.select();
                }
            } else if ($t.selectionStart || $t.selectionStart == '0') {
                var startPos = $t.selectionStart;
                var endPos = $t.selectionEnd;
                var scrollTop = $t.scrollTop;
                $t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
                this.focus();
                $t.selectionStart = startPos + myValue.length;
                $t.selectionEnd = startPos + myValue.length;
                $t.scrollTop = scrollTop;
                if (arguments.length == 2) {
                    $t.setSelectionRange(startPos - t, $t.selectionEnd + t);
                    this.focus();
                }
            }
            else {
                this.value += myValue;
                this.focus();
            }
        }
    })
})(jQuery);
$(document).ready(function(){
	$("#tupian").click(function(){
		$("textarea").insertContent('<img src="请在这里输入图片地址" alt=""/>', -10);
	});
});



$(function(){
    $("#xia dd div").click(function() {
        /*$(this).addClass("yangshis");*/
        $("#xia dd div").css({"border": "1px #ccc solid"})
        $(this).css({"border": "1px #ff3366 solid"})
    })

    $("#xia dl:nth-of-type(2) dd p").click(function () {
        $("#xia dl:nth-of-type(2) dd p").css({"border": "1px #ccc solid"})
        $(this).css({"border": "1px #ff3366 solid"})
    })

    $("[name=jia]").click(function (){
        var count = $("[name=count]").val();
        var sum = parseInt(count)+1;
        $("[name=count]").val(sum);
        $("[name=shangpincount]").val(sum);
    })
    $("[name=jian]").click(function (){
        var count = $("[name=count]").val();
        if(count <= 1){
            alert("数量不能小于1哦");
        }else{
            var sum = parseInt(count)-1;
            $("[name=count]").val(sum);
            $("[name=shangpincount]").val(sum);
        }

    })
})
$(function(){/*clone没参数时默认是false*/
    $("#box ul").clone().appendTo($("#box"));
    var i=0;
    var sets = function(){
        i++;
        if(i >= $("#box ul").height()){
            i=0;
        }
        $("#box").scrollTop(i);
    }/*setInterval定时器  (function，50)*/
    var setsi = setInterval(sets,50)
    $("#box").mouseover(function () {
        clearInterval(setsi);/*清除定时器*/
    }).mouseout(function () {
        setsi = setInterval(sets,50);
    })
})


$(function(){
    $("#box ul li").mouseenter(function(){
        $(this).children().eq(0).next().fadeIn(500);
    })

    $("#box ul li").mouseleave(function(){
        $(this).children().eq(0).next().fadeOut(500);
    })


    setInterval(move,3000);//每两秒切换一次
})

function move(){
    $("#cainixihuans ul").animate({"margin-top":"-205px"},function(){
        $("#cainixihuans ul li:lt(1)").clone().appendTo($("#cainixihuans ul"));//把前5张克隆一份追加到ul里
        $("#cainixihuans ul li:lt(1)").remove();//把前5张删掉
        $("#cainixihuans ul").css("margin-top","0px");//再从第一张显示
    })
}