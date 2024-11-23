
$(function (){
	var sums = 0;
	var input = document.getElementsByName("check");
	$(".shuliang").html(input.length);
	for(var i = 0;i < input.length;i++){
		var danjia = $(input[i]).parent().parent().children().eq(11).children().eq(0).html();
		var counts = $(input[i]).parent().parent().children().eq(12).children().eq(0).children().eq(1).val();
		sums += parseFloat(danjia) * parseFloat(counts);
	}
	$("#jg2").html("￥"+sums+".0");
})

function yanzheng(){
	
	var check = document.getElementsByName("check");
	for(var i = 0;i < check.length;i++){
		if(check[i].checked == true){
			var count = $(check[i]).parent().parent().children().eq(12).children().eq(0).children().eq(1).val();
			 //获得shangpincount
	        $(check[i]).parent().parent().children().eq(3).val(count);
	        
	        //获得shangpincolor
	        $(check[i]).parent().parent().children().eq(4).val($(check[i]).parent().parent().children().eq(10).children().eq(1).children().eq(0).html());
	        
	        //获得shangpinchicun
	        $(check[i]).parent().parent().children().eq(6).val($(check[i]).parent().parent().children().eq(10).children().eq(0).children().eq(0).html());
	        
	        /*$("#jg2").html(parseFloat($("#jg2").html())+parseFloat(count)*parseFloat($(check[i]).parent().parent().children().eq(11).children().eq(0).html()))*/
		}
	}
	$("#form").submit();
}

$(function (){
    $(".xia").mouseenter(function (){
        $(".div_wzdh").slideDown(100);
    }).mouseleave(function (){
        $(".div_wzdh").slideUp(100);
    });
})


$(function () {
    $(".shop:even").css("background-color", "#FFFBF2");
    /*$(".shop:odd").css("background-color","#FF3366");*/
})
function even(){
    $(".shop:even").css("background-color", "#FFFBF2");
}





$(function (){
    function move(){
        //动画效果：每次往前拉5张图片的宽度，完成效果后执行后面的函数
        $("#likes #width").animate({"margin-left":"-230px"},function(){
            $("#likes #width dl:first").clone().appendTo($("#likes #width"));
            $("#likes #width dl:first").remove();
            $("#likes #width").css("margin-left","0px");//再从第一张显示

        })
    }

    var time = setInterval(move,3000);//每两秒切换一次
    $("#likes").mouseover(function(){
        clearInterval(time);
    }).mouseout(function () {
        time = setInterval(move,3000);//每两秒切换一次*/
    })
})



function dian(checks) {
	var sums = 0;
    var input = document.getElementsByName("check");
    for (var i = 0; i < input.length; i++) {
        input[i].checked = checks;
    }
    if(checks == true){
    	$(".shuliang").html(input.length);
    	for(var i = 0;i < input.length;i++){
    		var danjia = $(input[i]).parent().parent().children().eq(11).children().eq(0).html();
    		var counts = $(input[i]).parent().parent().children().eq(12).children().eq(0).children().eq(1).val();
    		sums += parseFloat(danjia) * parseFloat(counts);
    	}
    }else{
    	$(".shuliang").html(0);
    	sums = 0;
    }
    $("#jg2").html("￥"+sums+".0");
   /* for(var i = 0;i < input.length;i++){
		if(input[i].checked == true){
			 //获得shangpincount
	        $(input[i]).parent().parent().children().eq(3).val($(input[i]).parent().parent().children().eq(12).children().eq(0).children().eq(1).val());
	        
	        //获得shangpincolor
	        $(input[i]).parent().parent().children().eq(4).val($(input[i]).parent().parent().children().eq(10).children().eq(1).children().eq(0).html());
	        
	        //获得shangpinchicun
	        $(input[i]).parent().parent().children().eq(6).val($(input[i]).parent().parent().children().eq(10).children().eq(0).children().eq(0).html());
		}else{
			//获得shangpincount
	        $(input[i]).parent().parent().children().eq(3).val("");
	        
	        //获得shangpincolor
	        $(input[i]).parent().parent().children().eq(4).val("");
	        
	        //获得shangpinchicun
	        $(input[i]).parent().parent().children().eq(6).val("");
		}
	}*/
}


function checks(zhe){
    var input = document.getElementsByName("check");
    var xuan = document.getElementsByName("checks");

    for(var i = 0;i < xuan.length;i++){
    	var str = "";
    	var count = 0;
    	var sum = 0;
    	for(var j = 0;j < input.length;j++){
    		if(input[j].checked == false){
    			str += "0";
    			
       	 	}else{
       		 	str += "1";
       		 	count++;
       		 	var danjia = $(input[j]).parent().parent().children().eq(11).children().eq(0).html();
       		 	var counts = $(input[j]).parent().parent().children().eq(12).children().eq(0).children().eq(1).val();
       		 	sum += parseFloat(danjia) * parseFloat(counts);
       		 	
       	 	}
    		
    	}
    	$("#jg2").html("￥"+sum+".0");
    	if(str.indexOf('0') == -1){
    		xuan[0].checked = true;
    	}else{
    		xuan[0].checked = false;
    	}
    	$(".shuliang").html(count);
    }    
    
    /*if(zhe.checked == true){
    	//获取数量
        var count = $(zhe).parent().parent().children().eq(12).children().eq(0).children().eq(1).val();
        //尺寸
        var chicun = $(zhe).parent().parent().children().eq(10).children().eq(0).children().eq(0).html();
        
        //颜色
        var color = $(zhe).parent().parent().children().eq(10).children().eq(1).children().eq(0).html();
        
        
        //获得shangpincount
        $(zhe).parent().parent().children().eq(3).val(count);
        
        //获得shangpincolor
        $(zhe).parent().parent().children().eq(4).val(color);
        
        //获得shangpinchicun
        $(zhe).parent().parent().children().eq(6).val(chicun);
    }else{
    	 //获得shangpincount
        $(zhe).parent().parent().children().eq(3).val("");
        
        //获得shangpincolor
        $(zhe).parent().parent().children().eq(4).val("");
        
        //获得shangpinchicun
        $(zhe).parent().parent().children().eq(6).val("");
    }*/
    
}

function addcount(zhe){
	//获取数量
	var count = parseInt($(zhe).prev().val())+1;
	//单价
	var jiage = parseInt($(zhe).parent().parent().prev().children().html())*count;
	
	$(zhe).parent().parent().next().children().html("￥"+jiage+".0");
	$(zhe).prev().val(count);

	var shopid = $(zhe).parent().parent().parent().children().eq(2).val();
	var username = $(zhe).parent().parent().parent().children().eq(1).val();
	var id = $(zhe).parent().parent().parent().children().eq(0).val();

	$.post("Shopcart?State=AddCount",
		{"id":id,"username":username,"shopid":shopid,"count":1},function (result){
			if(result>0) alert("更新成功");
			else alert("更新失败");
		
	})
	var state = $(zhe).parent().parent().parent().children().eq(7).children().eq(0).is(':checked');
	if(state == true){
		var sums = 0;
		var input = document.getElementsByName("check");
		for(var i = 0;i < input.length;i++){
			var danjia = $(input[i]).parent().parent().children().eq(11).children().eq(0).html();
			var counts = $(input[i]).parent().parent().children().eq(12).children().eq(0).children().eq(1).val();
			sums += parseFloat(danjia) * parseFloat(counts);
		}
		$("#jg2").html("￥"+sums+".0");
	}
	
}

function jiancount(zhe){
	//获取数量
	var count = parseInt($(zhe).next().val())-1;
	if(count <= 0){
		alert("不能再减啦");
	}else{
		//单价
		$(zhe).next().val(count);
		var jiage = parseInt($(zhe).parent().parent().prev().children().html())*count;
		$(zhe).parent().parent().next().children().html("￥"+jiage+".0");
		var shopid = $(zhe).parent().parent().parent().children().eq(2).val();
		var username = $(zhe).parent().parent().parent().children().eq(1).val();
		var id = $(zhe).parent().parent().parent().children().eq(0).val();

		$.post("Shopcart?State=JianCount",{"id":id,"username":username,"shopid":shopid,"count":1},function (result){
				if(result>0) alert("更新成功");
				else alert("更新失败");
			})
		var state = $(zhe).parent().parent().parent().children().eq(7).children().eq(0).is(':checked');
		if(state == true){
			var sums = 0;
			var input = document.getElementsByName("check");
			for(var i = 0;i < input.length;i++){
				var danjia = $(input[i]).parent().parent().children().eq(11).children().eq(0).html();
				var counts = $(input[i]).parent().parent().children().eq(12).children().eq(0).children().eq(1).val();
				sums += parseFloat(danjia) * parseFloat(counts);
			}
			$("#jg2").html("￥"+sums+".0");
		}
	}
	
}


function total(){
    var prices=document.getElementsByName("yuanjiage");
    var count=document.getElementsByName("count");
    /*alert(prices[0].innerHTML);*/
    var sum=0;
    for(var i=0; i<prices.length;i++){
        sum+=parseFloat(prices[i].innerHTML)*count[i].value;
        /*alert(prices[i].innerHTML+":"+count[i].value+":"+sum);*/
    }
    $("#jg2").html("¥" +parseFloat(sum)+".0");
}
total();

function deletes(obj){
	var username = $(obj).parent().parent().children().eq(1).val();
	var id = $(obj).parent().parent().children().eq(0).val();
    var is = confirm("确定要删除吗？");
    if(is == true){
    	$.post("Shopcart?State=del",{"username":username,"id":id},function (Data){
    		if(Data == "true") {
				$(obj).parent().parent().remove();
				var input = document.getElementsByName("check");
				var sums = 0;
				for (var i = 0; i < input.length; i++) {
					if (input[i].checked == true) {
						var danjia = $(input[i]).parent().parent().children().eq(11).children().eq(0).html();
						var counts = $(input[i]).parent().parent().children().eq(12).children().eq(0).children().eq(1).val();
						sums += parseFloat(danjia) * parseFloat(counts);
					}

				}
				$("#jg2").html("￥"+sums+".0");
				alert("删除成功");
			}else{
				alert("删除失败");
			}


    	})
        
    }
}