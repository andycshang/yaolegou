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

$(function(){
	var zhang = localStorage.getItem("NewUser");
	if(zhang != null){
		$("#denglu").html("欢迎您："+zhang);
	}else{
		$("#denglu").html("请登录");
	}
})





function toogle(th) {
    var ele = $(th).children(".move");
    if (ele.attr("data-state") == "on") {
        ele.animate({
            left: "0"
        }, 300, function () {
            ele.attr("data-state", "off");
        });
        $(th).removeClass("on").addClass("off");
        $("#danmu [type=text]").slideUp(500);
        $("#danmu [type=button]").slideUp(500);
        $("#tan").slideUp(1000);

    } else if (ele.attr("data-state") == "off") {
        ele.animate({
            left: '60px'
        }, 300, function () {
            $(this).attr("data-state", "on");
        });
        $(th).removeClass("off").addClass("on");
        $("#danmu [type=text]").slideDown(500);
        $("#danmu [type=button]").slideDown(500);
        $("#tan").slideDown(1000);

    }
}

$(function (){
    var boxDom = $(".zhezhao");
    var top, right;

    var pageWidth = parseInt(boxDom.width());
    var pageHeight =parseInt(boxDom.height());

    //点击按钮
    $("#fasong").bind("click",auto);//按钮绑定方法
    //按下回车
    document.onkeydown = function(){
        if(event.keyCode == 13){
            auto();
        }
    }
    function auto(){
        //1.获取输入的字符串
        var str = $("#danmu [type=text]").val();
        //2.生成一个元素
        var createSpan = $("<span class = 'string' id='tan' style='font-size: 20px;width:500px' ></span>");

        //3.给生成的元素赋值

        createSpan.text(str);

        //为了页面友好，清空刚刚输入的值
        $("#danmu [type=text]").val("");

        //生成元素一个随机的位置，为了使每条弹幕都出现在屏幕上不同的位置
        top = Math.floor(Math.random()*pageHeight);
        if( top > 1000){
            top = Math.floor(Math.random()*pageHeight);
        }

        var tops = "-"+top+"px";
        createSpan.css({"top":tops, "right": -1000, "color": getRandomColor()});
        boxDom.append(createSpan);

        //4.设置元素的动画效果，animate(css样式值，时间， 执行完动画调用的方法)

        //页面上有N个span，只让最后一个动起来
        var spandom = $(".zhezhao>span:last-child");//找到最后一个span


        var daima = "<div class='lun'>"+
        "<dl>"+
        "<dt><img src='Image/ShiPin_Image/tx.jpg' alt='' width='50px' height='50px'></dt>"+
        "    <dd>来自用户</dd>"+
         "   <dd>5月22日</dd>"+
        "</dl>"+
        "<span>"+str+"</span>"+
        "<div/>";

        $(".lun:last").after(daima);

        spandom.animate({"right":pageWidth+300},10000,function(){

            //移除元素
            $(this).remove();

        });
    }
    //定义一个可以生成随机颜色的方法,可以使每条弹幕的颜色不同
    function getRandomColor() {

        var colorArr = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];
        var color = "";

        for (var i = 0; i < 6; i++) {
            color += colorArr[Math.floor(Math.random() * 16)];
        }
        return "#" + color;
    }
})


//初始化弹幕
function danmu(zhi){
    var boxDom = $(".zhezhao");

    var pageWidth = parseInt(boxDom.width());
    var pageHeight =parseInt(boxDom.height());
    var top,right;
    var createSpan = $("<span class = 'string' style='font-size: 20px' ></span>");

    createSpan.text(zhi);

    //生成元素一个随机的位置，为了使每条弹幕都出现在屏幕上不同的位置
    top = Math.floor(Math.random()*pageHeight);
    if( top > 1000){
        top = Math.floor(Math.random()*pageHeight);
    }

    var tops = "-"+top+"px";
    createSpan.css({"top":tops, "right": -1000, "color": "#fff"});
    $(".zhezhao").append(createSpan);


    var spandom = $(".zhezhao>span:last-child");//找到最后一个span
    spandom.animate({"right":pageWidth+100},10000,function(){
        //移除元素
        $(this).remove();

    });
}


$(function (){
    $("#biao").click(function(){
        document.getElementById("biao").play();
        danmu("10条弹幕来袭 做好准备！！！");
        /*setTimeout(1000,alert());*/

        var shu = new Array("哈哈哈哈哈哈哈~~","还有谁？？？？？","我最帅啊啊啊啊啊啊啊啊","底下的评委老师 真帅~！！！","尤其是李晓哲老师真帅！","这个团队的组长也帅！！！")
        for (var i = 0;i < shu.length;i++){
            danmus(shu[i]);
        }
    })
})

function danmus(zhi){
    var boxDom = $(".zhezhao");

    var pageWidth = parseInt(boxDom.width());
    var pageHeight =parseInt(boxDom.height());
    var top,right;
    var createSpan = $("<span class = 'string' style='font-size: 20px' ></span>");

    createSpan.text(zhi);

    //生成元素一个随机的位置，为了使每条弹幕都出现在屏幕上不同的位置
    top = Math.floor(Math.random()*pageHeight);
    if( top > 1000){
        top = Math.floor(Math.random()*pageHeight);
    }

    var tops = "-"+top+"px";
    createSpan.css({"top":tops, "right": -1000, "color":getRandomColor()});
    $(".zhezhao").append(createSpan);

    function getRandomColor() {

        var colorArr = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];
        var color = "";

        for (var i = 0; i < 6; i++) {
            color += colorArr[Math.floor(Math.random() * 16)];
        }
        return "#" + color;
    }

    var spandom = $(".zhezhao>span:last-child");//找到最后一个span
    spandom.animate({"right":pageWidth+100},10000,function(){
        //移除元素
        $(this).remove();

    });


}





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
