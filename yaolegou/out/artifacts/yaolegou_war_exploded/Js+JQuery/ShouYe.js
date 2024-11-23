/**
 * Created by lenovo on 2018-06-30.
 */


/*$(function () {
    $(window).scroll(function(){
        var top = $(document).scrollTop();
        document.title = top;
        if(top <= 300){
            $("#sp").animate("height","973px",1000)
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
})*/

/*$(function (){
	y();
    $(".xia").mouseenter(function (){
        $(".div_wzdh").slideDown(100);
    }).mouseleave(function (){
        $(".div_wzdh").slideUp(100);
    })
})*/

/*首页Banner轮播动画*/

$(function (){
    $(".xia").mouseenter(function (){
        $(".div_wzdh").slideDown(100);
    }).mouseleave(function (){
        $(".div_wzdh").slideUp(100);
    });
})

$(function (){
	$(".xianshi").mouseenter(function (){
		 
		 var text = $(this).val();
		if(text == "1"){
			 $("#daohangs").slideUp(100);
		}else{
			$("#daohangs").slideDown(100);
		}
	})
	
	$("#daohangs").mouseleave(function (){
        $("#daohangs").slideUp(100);
    });
})

$(function (){
	$(".xianshi").mouseenter(function (){
		var text = $(this).val();
		if(text == "1"){
			$("#tishis").html("猜你喜欢");
			$("#xianshi").val(0);
		}else{
			$("#tishis").html("买的最多");
		}
		var texts = parseInt(text)-1;
		$.post("index.do?State=cha",{"typeid":texts},function (data){
			var d = eval("("+data+")");
			$("#infos").empty();
			$.each(d,function (){
				
				var str = "<dl style='cursor: pointer;' onclick='tiaozhuan("+this.shopid+")' >"+
  							"<dt><img alt='' src='"+this.image+"' width='180px' height='180px;' style='margin: 10px;margin-top: 0px;'></dt>"+
  							"<dd class='ShopTitle'>"+this.shopname+"</dd>"+
  							"<dd class='jiages'>￥"+this.shopprice+"<span style='float:right;font-size:12px;color:#666;margin-right:10px;font-weight:400;'>销量："+this.xiaoliangcount+"</span></dd>"+
  						"</dl>";
				$(str).appendTo($("#infos"));
			})
		})
	})
})

function tiaozhuan(shopid){
	window.open("ShangYi.do?State=Select&ShopId="+shopid+"");
}
$(function (){	
	$(".width img:nth-of-type(1)").mouseover(function (){
		$(this).css({"transform":"translate(0px,-15px)","transition":"all 0.3s ease-in-out","opacity":"1"});
		$(".width img:nth-of-type(2)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(3)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(4)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(5)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$("#one").slideDown(500);
		$("#two").slideUp(500);
		$("#three").slideUp(500);
		$("#four").slideUp(500);
		$("#five").slideUp(500);
	})
	
	$(".width img:nth-of-type(2)").mouseover(function (){
		$(this).css({"transform":"translate(0px,-15px)","transition":"all 0.3s ease-in-out","opacity":"1"});
		$(".width img:nth-of-type(1)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(3)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(4)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(5)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$("#one").slideUp(500);
		$("#two").slideDown(500);
		$("#three").slideUp(500);
		$("#four").slideUp(500);
		$("#five").slideUp(500);
	})

	$(".width img:nth-of-type(3)").mouseover(function (){
		$(this).css({"transform":"translate(0px,-15px)","transition":"all 0.3s ease-in-out","opacity":"1"});
		$(".width img:nth-of-type(1)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(2)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(4)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(5)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$("#one").slideUp(500);
		$("#two").slideUp(500);
		$("#three").slideDown(500);
		$("#four").slideUp(500);
		$("#five").slideUp(500);
	})
	
	$(".width img:nth-of-type(4)").mouseover(function (){
		$(this).css({"transform":"translate(0px,-15px)","transition":"all 0.3s ease-in-out","opacity":"1"});
		$(".width img:nth-of-type(1)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(2)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(3)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(5)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$("#one").slideUp(500);
		$("#two").slideUp(500);
		$("#three").slideUp(500);
		$("#four").slideDown(500);
		$("#five").slideUp(500);
	})
	$(".width img:nth-of-type(5)").mouseover(function (){
		$(this).css({"transform":"translate(0px,-15px)","transition":"all 0.3s ease-in-out","opacity":"1"});
		$(".width img:nth-of-type(1)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(2)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(3)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$(".width img:nth-of-type(4)").css({"transform":"translate(0px,0px)","transition":"all 0.3s ease-in-out","opacity":"0.7"});
		$("#one").slideUp(500);
		$("#two").slideUp(500);
		$("#three").slideUp(500);
		$("#four").slideUp(500);
		$("#five").slideDown(500);
	})
	
})



/*每隔1秒钟切换Banner
 */


/*商品推荐的右边的小轮播
*/

var indexs = 0;
function changImg(){
	indexs++;
	if(indexs>1){
		indexs=0;
   	}
 	changeim(indexs);
}

function changeim(i){
	$(".RightImage").fadeOut(200).eq(i).fadeIn(500);
	$("#MiaoSha_Three ul li").removeClass("curr").eq(i).addClass("curr");
}

$(function(){
	var mytimer = setInterval("changImg()",2500);
	$("#MiaoSha_Three ul li").bind({
		"mouseenter":function(){
			clearInterval(mytimer);
			indexs = $("#MiaoSha_Three ul li").indexs(this);
			mytimer = null;
			changeim(indexs);
		},
		"mouseleave":function(){
			mytimer = setInterval("changImg()",2500);
		}
	});
});


$(function (){
	$(".login_DengLu").click(function(){
		$("#login_back").fadeIn(200);
		$("#login").slideDown(500);
		$("#guan").css({"opacity":"1","transition":"all 2s ease-in-out"})
		
	})
})




$(function () {
	
    $(window).scroll(function(){
        var top = $(document).scrollTop();
        if(top >= 200){
        	$("#DaoHangTiao_back").addClass("fu");
        }else if(top <= 200){
        	$("#DaoHangTiao_back").removeClass("fu");
        }
        
        if(top >= 400){
        	$("#dingbu ").slideDown(300);
        }else{
        	$("#dingbu").slideUp(300);
        }
        
        if(top >= 3000){
        	$("#tuss").fadeIn(1000);
        }else if(top >= 2800){
        	$("#a1").fadeIn(1000);
        	$("#a2").fadeIn(1000);
        }else if(top >= 2100){
        	$("#wenzi3").fadeIn(1000);
        	$("#zhuti3").fadeIn(1000);
        }else if(top >= 1400){
        	$("#wenzi2").fadeIn(1000);
        	$("#zhuti2").fadeIn(1000);
        }else if(top >= 600){
        	$("#wenzi1").fadeIn(1000);
        	$("#zhuti1").fadeIn(1000);
        	
        }
    })
})


$(function (){
	function Index(node) {
	    this.node = node;
	    this.init();
	};
	Index.prototype.init = function () {
	    var self = this;
	    this.nodes = [];
	    Array.prototype.slice.call(self.node, 0).forEach(function (item, index) {
	        self.nodes.push(self.update(item));
	        self.bindEvents(item, index);
	    });
	};
	Index.prototype.update = function (item) {
	    return {
	        w: item.offsetWidth,
	        h: item.offsetHeight,
	        l: item.offsetLeft,
	        t: item.offsetTop
	    }
	};
	Index.prototype.bindEvents = function (item, index) {
	    var self = this;
	    $(item).on('mouseenter', function (e) {
	        self.addClass(e, item, 'in', index);
	        return false;
	        
	    })
	    $(item).on('mouseleave', function (e) {
	        self.addClass(e, item, 'out', index);
	        return false;
	    })
	};
	Index.prototype.addClass = function (e, item, state, index) {
	    var direction = this.getDirection(e, index);
	    var class_suffix = '';
	    switch (direction) {
	        case 0:
	            class_suffix = '-top'; 
	            break;
	        case 1:
	            class_suffix = '-right'; 
	            break;
	        case 2:
	            class_suffix = '-bottom';
	            break;
	        case 3:
	            class_suffix = '-left'; 
	            break;
	    }
	    item.className = '';
	    item.classList.add(state + class_suffix);
	};
	Index.prototype.getDirection = function (e, index) {
	    var w = this.nodes[index].w,
	        h = this.nodes[index].h,
	        x = e.pageX - this.nodes[index].l - w / 2 ,
	        y = e.pageY - this.nodes[index].t - h / 2 ;
	        // 取到x,y两点坐标
	        d=(Math.round(((Math.atan2(y, x) * (180 / Math.PI)) + 180) / 90)+3) % 4;

	    
	    return d;//d的数值用于判断方向上下左右。
	};
	new Index($('li'));
})
var is = true;

$(function (){
	$("#music").css({"left":"-321px","transition":"all 0.5s ease-in-out"});
	is = true;
	$("#music").css({"left":"0px","transition":"all 0.5s ease-in-out"});
	is = false;
	$("#jian").html("<");
	setTimeout(show, 2000);
	$("#music p").click(function (){
		if(is){
			$("#music").css({"left":"0px","transition":"all 0.5s ease-in-out"});
			$("#jian").html("<");
			is = false;
		}else{
			$("#music").css({"left":"-321px","transition":"all 0.5s ease-in-out"});
			$("#jian").html(">");
			is = true;
		}
		
	})
})
function show(){
	$("#music").css({"left":"-321px","transition":"all 0.5s ease-in-out"});
	$("#jian").html(">");
	is = true;
}
$(function (){
	$("#guan").click(function(){
		$("#login").slideUp(500);
		$("#login_back").fadeOut(200);
		$("#guan").css({"opacity":"0","transition":"all 2s ease-in-out"})
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