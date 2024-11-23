
$(function (){
    $(".xia").mouseenter(function (){
        $(".div_wzdh").slideDown(100);
    }).mouseleave(function (){
        $(".div_wzdh").slideUp(100);
    });
})
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

$(function (){
    function move(){
        //动画效果：每次往前拉5张图片的宽度，完成效果后执行后面的函数
        $("#lunbotuijian #lb").animate({"margin-left":"-235px"},function(){
            $("#lunbotuijian #lb dl:first").clone().appendTo($("#lunbotuijian #lb"));
            $("#lunbotuijian #lb dl:first").remove();
            $("#lunbotuijian #lb").css("margin-left","0px");//再从第一张显示

        })
    }

    var time = setInterval(move,3000);//每两秒切换一次
    $("#lunbotuijian").mouseover(function(){
        clearInterval(time);
    }).mouseout(function () {
        time = setInterval(move,3000);//每两秒切换一次*/
    })
})

$(function () {
    $(window).scroll(function(){
        var top = $(document).scrollTop();
        if(top <= 300){
            /*$("#sp").animate("height","973px",1000)*/
        }else if(top <= 600){
            $("#fanye").slideDown(1000);
        }else if(top <= 700){
            $("#xiaodaohang").slideDown(1000)
        }else if(top <= 800){
            $("#tuijianshangpin").slideDown(1000)
        }else if(top <= 1100){
            $("#lunbotuijian").slideDown(1000);

        }


    });
})
/*-------------------这是条件筛选--------------------------*/
$(function () {
    $("#nan").click(function () {
    	$("#qb").removeClass("zhi");
        $(this).addClass("zhi");
        $(".nan").hide();
    })
    
    $("#qb").click(function(){
    	$("#nan").removeClass("zhi");
    	$(this).addClass("zhi");
        $(".nan").show();
    })
})