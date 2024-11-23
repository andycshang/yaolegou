


$(function(){
	var zhang = localStorage.getItem("NewUser");
	if(zhang != null){
		$("#denglu").html("欢迎您："+zhang);
	}else{
		$("#denglu").html("请登录");
	}
})

$(function (){
	$("#sp").fadeIn(1000);
	$("#sp").slideDown(1000);
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
        
        if(top >= 1800){
        	$("#xiangce").fadeIn(1000);
        	$("#kuang").fadeIn(1000);
        }else if(top >= 1100){
        	$("#tuijian2").fadeIn(1000);
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

$(function(){
    $(".xcs li").hover(
        function(){
            $(this).children().eq(1).css({"transform":"rotate(-36deg)","transition":"all 0.8s","height":"60px"});
        },
        function(){
            $(this).children().eq(1).css({"transform":"rotate(35deg)","transition":"all 0.8s","height":"0px"});
        }
    )
});

/*这是    两张图的文字显示*/
$(function (){
    $(".c-preview").hover(
        function (){
            $(this).children().eq(1).fadeIn(1000);
        }
        ,
        function(){
            $(this).children().eq(1).fadeOut(1000);
        }
    )
})

var index = 0;

function nan(){
    var nan = new Array('tj1.jpg','tj3.jpg');
    var nv = new Array('tj2.jpg','tj4.jpg');
    if(index > 1){
        index = 0;
        $(".c-preview:nth-of-type(1)").children().eq(0).attr("src","Image/KuZi_Image/ShangPin/"+nan[index]);
        $(".c-preview:nth-of-type(2)").children().eq(0).attr("src","Image/KuZi_Image/ShangPin/"+nv[index]);
    }else{
        /*$("#tuijian2").fadeOut(1000,function(){
            $(".c-preview:nth-of-type(1)").children().eq(0).attr("src","Image/KuZi_Image/ShangPin/"+nan[index]).css("transition","all 0.2s ease-in-out");
            $("#tuijian2").fadeIn(1000);
        })*/
        $(".c-preview:nth-of-type(1)").children().eq(0).attr("src","Image/KuZi_Image/ShangPin/"+nan[index]).css("transition","all 0.2s ease-in-out");
        $(".c-preview:nth-of-type(2)").children().eq(0).attr("src","Image/KuZi_Image/ShangPin/"+nv[index]).css("transition","all 0.2s ease-in-out");
        index++;
    }

}

$(function(){
    var oul = $('#xiangce #kuang');
    var oulHtml = oul.html();
    oul.html(oulHtml+oulHtml)
    var timeId = null;

    var ali = $('#xiangce #kuang ul');
    var aliWidth = ali.eq(0).width();
    var aliSize = ali.size();

    var ulWidth = aliWidth*aliSize;
    oul.width(ulWidth);	//1600px


    var speed = -2;

    function slider(){

        if(speed<0){
            if(oul.css('left')==-ulWidth/2+'px'){
                oul.css('left',1);
            }
            oul.css('left','+=-2px');
        }


        /*if(speed>0){
            if(oul.css('left')=='0px'){
                oul.css('left',-ulWidth/2+'px');
            }
            oul.css('left','+='+speed+'px');
        }*/

    }

    // setInterval()函数的作用是：每隔一段时间，执行该函数里的代码
    timeId = setInterval(slider,10);

    $('#xiangce').mouseover(function(){
        // clearInterval()函数的作用是用来清除定时器
        clearInterval(timeId);
    });

    $('#xiangce').mouseout(function(){
        timeId = setInterval(slider,10);
    });

});



$(function() {
    /**
     *  $('.grid-content') 该元素为内容的父元素
     *  '.grid-shade'       该元素为鼠标移入移出的遮罩层
     */
    $('.grid-content').mouseMove('.grid-shade')
})


var biao = 0;
$(function (){
    $(".duibi").click(function () {
        $("#duibi").slideDown(100);
        var imgPath = $(this).parent().parent().children("img").attr("src");//获取到图片路径
        var name = $(this).parent().children().eq(0).children().eq(0).html();   //获取商品名
        if (biao >= 3) {
            alert("最多只能对比3个哦")
        } else {
            $(".sp2:eq(" + biao + ")").remove();
            biao++;
            var daima = "<div class='sp2'>" + "<div class='img'>" + "<img src='" + imgPath + "' alt='' width='51px' height='51px'>" + "</div>" + "<p>" + name + "</p>" + "<a href='' style='display: block'>删除</a>" + "</div>";
            $("#title").after(daima);
        }

    })


    $("#duibi").click(function(){
        $(this).slideUp(100);
    })
})


