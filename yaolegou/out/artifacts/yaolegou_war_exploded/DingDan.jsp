<%@page import="org.YaoLeGouDB.entity.DingDanXiangQing"%>
<%@page import="org.YaoLeGouDB.Impl.DingDanXiangQingDaoImpl"%>
<%@page import="org.YaoLeGouDB.Dao.DingDanXiangQingDao"%>
<%@page import="org.YaoLeGouDB.entity.UserInfo"%>
<%@page import="org.YaoLeGouDB.entity.ShopInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>瑶乐购 - 确定订单</title>
    <link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="Css/DingDan_Style.css">
	<script type="text/javascript" src="Js+JQuery/jquery-1.12.4.js"></script>
	<script type="text/javascript">
		var text;
		function state(zhe){
			var context = $(zhe).parent().children().eq(0).val();
			if(context.length >= 100){
				alert("字数已经超限了，不能输入了。");
				$(zhe).parent().children().eq(0).val(text);
			}else{
				$(zhe).parent().children().eq(1).html(context.length+"/100");
				text = context;
			}
		}
		
		function update(zhe){
			var id = $(zhe).children().eq(2).val();
			var UserName = $(zhe).children().eq(3).val();
			var defaults = $(zhe).children().eq(4).val();
			$.post("DingDan.do?State=Update",{"id":id,"UserName":UserName,"defaults":defaults},function (Data){
				if(Data == "true"){
					/* $(zhe) */
					$(".img").attr("src","Image/DingDan_Image/default.png");
					$(zhe).children().eq(0).attr("src","Image/DingDan_Image/address.png");
				}
			})
		}
		
		
		
		
		$(function (){
    		
    		
    		$(".dizhi ul li").click(function (){
    			var text = $(this).html();
    			$.post("UpdateInfo.do?State=Select",{"text":text},function (Data){
    				$("[name=address1]").val(text+" ");
    				$(".dizhi ul li").remove();
    				var d = eval("("+Data+")");
    				var add = $(".dizhi ul");
     				$.each(d,function(){
     					var opt = $("<li onclick='city(this)''></li>").appendTo(add);
     					opt.html(this.cityname);
     				});
     				$("[name=address2]").removeAttr("disabled");//将按钮可用
    				
    			});
    			$(".text").css("border","1px #ccc solid");
    			$("#Address").html("<img src='Image/Update_Image/qd.png'> 详细地址填写正确。");
    		});
    		
    		$("#guan").click(function (){
    			$(".dizhi").hide();
    		})
    		$("[name=address1]").click(function (){
    			$(".dizhi").show();
    		})
    		
    	})
    	
    	function city(thiss){
    		var text = $(thiss).html();
			$.post("UpdateInfo.do?State=SelectQu",{"text":text},function (Data){
				$("[name=address1]").val($("[name=address1]").val()+text+" ");
				$(".dizhi ul li").remove();
				var d = eval("("+Data+")");
				var add = $(".dizhi ul");
 				$.each(d,function(){
 					var opt = $("<li onclick='qu(this)'></li>").appendTo(add);
 					opt.html(this.quname);
 				});
				
			});
			
			
    	}
    	
    	function qu(thiss){
    		var text = $(thiss).html();
    		$("[name=address1]").val($("[name=address1]").val()+text);
    		$(".dizhi").hide();
    		
    	}
    	
    	$(function (){
    		$("biaoqian").click(function (){
				var context = $(this).html();
				$("[name=lable]").val(context);
				$("biaoqian").css("border","1px #ccc solid");
				$(this).css("border","1px red solid");
			})
			
			$("[name=address1]").blur(function (){
				var context = $(this).val();
				if(context == ""){
					$("[name=address2]").attr({"disabled":"disabled"});
				}else{
					$("[name=address2]").removeAttr("disabled");//将按钮可用
				}
			})
			
			$("#guanbi").click(function (){
				$("#beijing").fadeOut("300");
			})
			$("#addressinfo").click(function (){
				$("#beijing").fadeIn("300");
			})
    		
    		$(".zhifu").click(function (){
    			$(".zhifu").css("border","1px #ccc solid");
    			$(this).css("border","1px #ff3366 solid");
    			$("[name=zhifufangshi]").val($(this).html());
    			$("#fukuanfangshi").html($(this).html());
    		})
    		
    		
    		$("#save").click(function (){
    			
    			var Name = $("[name=Name]").val();
    			var Phone = $("[name=Phone]").val();
    			var BeiYongPhone = $("[name=BeiYongPhone]").val();
    			var address1 = $("[name=address1]").val();
    			var address2 = $("[name=address2]").val();
    			var lable = $("[name=lable]").val();
    			var is = $("[name=is]").val();
    			var un = $("[name=un]").val();
    			
    			$.post("DingDan.do?State=AddAddress",{"Name":Name,"Phone":Phone,"BeiYongPhone":BeiYongPhone,"address1":address1,"address2":address2,"lable":lable,"is":is,"un":un},function (Data){
    				if(Data == "true"){
    					 history.go(0);
    				}
    			})
    		})
    		
    	})
    	
    	
    	function shanchu(id,user){
    		
    		$.post("DingDan.do",{"State":"DelInfo","id":id,"user":user},function (Data){
    			if(Data == "true"){
    				history.go(0);
    			}
    		})
    	}
    	
    	$(function (){
    		$(".addressinfo").click(function (){
    			$("[name=shaddressid]").val($(this).children().eq(2).val());
    			
    			var str = $(this).children().eq(5).val()+" "+$(this).children().eq(6).val()+" "+$(this).children().eq(7).val()+$(this).children().eq(8).val();
    			$("#shouhuos").html(str);
    			$("#names").html($(this).children().eq(5).val());
    			
    			$("#mingzi").html($(this).children().eq(5).val());
    			$("#infos").html(str);
    		})
    		    		
    	})
    	$(function (){
    		var address = document.getElementById("dizhis");
    		var name = $(address).children().eq(5).val();
    		var phone = $(address).children().eq(6).val();
    		var city = $(address).children().eq(7).val();
    		var address = $(address).children().eq(8).val();
    		$("#shouhuos").html(name+" "+phone+" "+city+" "+address);
    		$("#names").html(name);
    		
    		$("#mingzi").html(name);
    		$("#infos").html(phone+" "+city+" "+address);
    	})
    	
	</script>
  </head>
  
  <body>
  <!--------------------- 提示页 -------------------------->
  <div id="beijings" style="display: none">
		<div id="hei"></div>
		<div id="context" style="width: 600px;height: 180px;margin-top: 150px;">
			<dl style="width: 520px;line-height: 25px;">
				<dt><img alt="" src="Image/LeGou_Image/!.png"></dt>
				<dd style="width: 450px;">提示：</dd>
				<dd style="width: 450px;" id="wen">订单处理成功！您的订单号：${DingDanNumber }，收货人姓名：<span id="mingzi">张三</span><span id="infos"></span></dd>
				<dd style="margin-top: 20px;margin-left: 230px;"><input id="ok" type="button" value="确定" style="padding: 3px 10px;color: #fff;border: 0px;background: #ff3366"></dd>
			</dl>
		</div>
	</div>
	<!----------------------------------------------------  -->
  	<!--------------------- 提示页 -------------------------->
  	<div id="beijing" style="display: none">
		<div id="hei"></div>
		<div id="context">
			<p>新增收货地址<span id="guanbi" style="cursor: pointer;">×</span></p>
			<form action="javascript:void(0)" method="post">
				<table border="0px">
					<tr>
						<td><span>*</span>配送方式：</td>
						<td><input type="radio" checked="checked" name="isps">配送上门</td>
						<td></td>
					</tr>
					<tr>
						<td><span>*</span>收货人：</td>
						<td><input type="text" placeholder="姓名，如张三,Zty" name="Name"></td>
						<td></td>
					</tr>
					<tr>
						<td><span>*</span>手机：</td>
						<td><input type="text" name="Phone" placeholder="请输入正确的11位手机号"></td>
						<td></td>
					</tr>
					<tr>
						<td>备用手机：</td>
						<td><input type="text" name="BeiYongPhone" placeholder="选填"></td>
						<td></td>
					</tr>
					<tr>
						<td><span>*</span>所在地区：</td>
						<td><input type="text" name="address1" placeholder="请选择省、市、区">
							<div class="dizhi" style="display: none">
								<span class="span" style="color: #000">&nbsp;请选择省、市、区<span id="guan">×</span></span>
								<ul>
									<c:forEach var="sl" items="${ShengList }">
										<li>${sl.shengname }</li>
									</c:forEach>
								</ul>
							</div>
						</td>
						<td></td>
					</tr>
					<tr>
						<td><span>*</span>详细地址：</td>
						<td><input type="text" disabled="disabled" name="address2" style="width: 400px;" placeholder="街道、小区、楼牌号等，无须重复填写省市区"></td>
						<td></td>
					</tr>
					<tr>
						<td>标签：</td>
						<td><biaoqian>家</biaoqian><biaoqian>公司</biaoqian><biaoqian>学校</biaoqian></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" name="lable" placeholder="其它标签"></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="checkbox" name="is"> 设为默认收货地址</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" id="save" value="保存并使用"></td>
						<td></td>
					</tr>
				</table>
				<input type="hidden" name="un" value="${UserName }">
			</form>
		</div>
	</div>
	<!----------------------------------------------------  -->
    <header>
    	<div id="toubu">
    		<img src="Image/logo.png" height="90" width="190"/>
    	</div>
    </header>
    <form action="DingDanBiao.do" method="post" id="tijiaos">
    
    
    
    
    	<input type="hidden" name="dingdannumber" value="${DingDanNumber }">
    	<input type="hidden" name="user" value="${UserName }">
    	
    	
    	
    	
    	<section>
	    	<div id="shouhuo">
	    		<h4 style="margin-bottom: 7px;">收货信息</h4>
	    		<c:forEach var="address" items="${ShouHuolist }">
		    		<c:if test="${address.defaults==0 }">
		    			<div class="addressinfo" onclick="update(this)" name="addre">
			    			<img alt="" src="Image/DingDan_Image/default.png" class="img">
			    			<div class="wenzi">
			    				<p>${address.name }（${address.city }）<lable>${address.lable }</lable><default>默认</default></p>
			    				<span>
			    						${address.address }
			    				</span>
			    				<a href="#">修改</a>
			    				<a href="javascript:void(0)" onclick="shanchu(${address.id },${address.username })" class="shanchu">删除</a>
			    			</div>
			    			<input type="hidden" name="id" value="${address.id }">
				    		<input type="hidden" name="UserName" value="${address.username }">
				    		<input type="hidden" name="default" value="${address.defaults }">
				    		<input type="hidden" name="name" value="${address.name }">
				    		<input type="hidden" name="phone" value="${address.phone }">
				    		<input type="hidden" name="city" value="${address.city }">
				    		<input type="hidden" name="address" value="${address.address }">
			    		</div>
		    		</c:if>
		    		<c:if test="${address.defaults==1 }">
		    			<div class="addressinfo" onclick="update(this)" name="addre" id="dizhis">
			    			<img alt="" src="Image/DingDan_Image/address.png" class="img">
					    	<div class="wenzi">
					    		<p>${address.name }（${address.city }）<lable>${address.lable }</lable><default>默认</default></p>
					    		<span>
					    			${address.address }
					    		</span>
					    		<a href="#">修改</a>
					    		<a href="javascript:void(0)" onclick="shanchu(${address.id },${address.username })" class="shanchu">删除</a>
					    	</div>
					    	<input type="hidden" name="id" value="${address.id }">
				    		<input type="hidden" name="UserName" value="${address.username }">
				    		<input type="hidden" name="default" value="${address.defaults }">
				    		<input type="hidden" name="name" value="${address.name }">
				    		<input type="hidden" name="phone" value="${address.phone }">
				    		<input type="hidden" name="city" value="${address.city }">
				    		<input type="hidden" name="address" value="${address.address }">
						</div>
						<input type="hidden" name="shaddressid" value="${address.id }">
		    		</c:if>
		    	</c:forEach>
		    	
	    		<div id="addressinfo">
	    			<img alt="" src="Image/DingDan_Image/addaddress.png">
	    		</div>
	    	</div>
	    	
	    	<div id="zhifutype">
	    		<h4 style="margin-bottom: 7px;">支付方式</h4>
	    		<c:forEach var="zftdl" items="${ZhiFuTypeList }">
	    			<span class="zhifu">${zftdl.zhifuname }</span>
	    		</c:forEach>
	    		<input type="hidden" value="" name="zhifufangshi">
	    	</div>
	    	
	    	<div id="shopinfo">
	    		<h4 style="margin-bottom: 7px;">商品及服务信息</h4>
	    		<%
	    			String UserName = request.getParameter("UserName");
	    			int total = 0;
	    			int count = 0;
	    			List<DingDanXiangQing> list = (List<DingDanXiangQing>)request.getAttribute("list");
	    			DingDanXiangQingDao ddxqd = new DingDanXiangQingDaoImpl();
	    			for(int i = 0;i < list.size();i++){
	    		%>
		    		<table id="shoptable" border="0px" cellpadding="0px" cellspacing="0px">
		    			<thead>
		    				<td class="title"><span style="margin-left: 30px;"><%=list.get(i).getUi().getUsernick() %></span></td>
		    				<td class="fuwu">服务信息</td>
		    				<td class="info">单价</td>
		    				<td class="info">数量</td>
		    				<td class="info">小计</td>
		    			</thead>
		    				<%
		    					int sum = 0;
		    					List<DingDanXiangQing> list2 = (List<DingDanXiangQing>)ddxqd.ByMyUserAndUserNameGetAllInfo(UserName, list.get(i).getDingdannumber());
		    					for(int k = 0;k < list2.size();k++){
		    						if(list.get(i).getUsername().equals(list2.get(k).getUsername())){
		    				%>
			    			<tbody>
			    				<td style="border-right: 1px #eee solid;border-top: 1px #eee solid;">
			    					<div class="xinxi">
			    						<img alt="<%=list2.get(k).getSi().getImage() %>" src="<%=list2.get(k).getSi().getImage() %>" width="60px" height="60">
				    					<span class="biaoti"><%=list2.get(k).getSi().getShopname() %></span>
				    					<p style="color: #999">尺寸：<%=list2.get(k).getChicui() %> 颜色：<%=list2.get(k).getColor() %></p>
				    					<p style="color: #999">七天无理由退货</p>
			    					</div>
			    				</td>
			    				<td align="center" style="border-right:1px #eee solid;">完成后尽快为您发货</td>
			    				<td align="center">￥<%=list2.get(k).getSi().getShopprice() %></td>
			    				<td align="center"><%=list2.get(k).getCount() %></td>
			    				<%
			    					sum += (int)list2.get(k).getSi().getShopprice() * list2.get(k).getCount();
			    					count++;
			    				%>
			    				<td align="center">￥<%=(int)list2.get(k).getSi().getShopprice() * list2.get(k).getCount()%></td>
			    			</tbody>
			    			<input type="hidden" name="shopid" value="<%=list2.get(k).getShopid() %>">
			    			<input type="hidden" name="shopcount" value="<%=list2.get(k).getCount() %>">
			    			<%
		    						}
		    					}
		    					total += sum;
			    			%>
			    			<input type="hidden" name="maijiauser" value="<%=list.get(i).getUi().getUsername() %>">
			    			<tfoot>
			    				<tr>
			    					<td colspan="2" style="border-top: 1px #eee solid;border-right: 1px #eee solid;">
			    						<input type="text" size="110" name="beizhu" onkeyup="state(this)" style="border: 1px #ccc solid;outline: none;font-size: 12px;height: 20px; margin-left: 20px;"> 
		    							<span>0/100</span>
			    					</td>
			    					<td align="center">总计</td>
			    					<td></td>
			    					<td align="center">￥<%=sum %></td>
			    				</tr>
			    			</tfoot>
		    		</table>
	    		<%
	    			}
	    		%>
	    	</div>
	    	<div id="fapiao">
	    		<h4 style="margin-bottom: 7px;">发票信息</h4>
	    		<div id="xx">
	    			<p style="width: 300px;">发票类型：<span>纸质普通发票</span></p>
	    			<p>发票抬头：<span id="names">张晨</span></p>
	    		</div>
	    	</div>
	    	
	    	<div id="jiesuan">
	    		<h4 style="margin-bottom: 7px;">结算信息</h4>
	    		<div id="shops">
	    			<div id="xins">
	    				
	    				<ul>
	    					<li>￥<%=total %>.00</li>
	    					<li>￥0.00</li>
	    					<li>￥0.00</li>
	    					<li>￥0.00</li>
	    				</ul>
	    				<ul>
	    					<li><count><%=count %></count>件商品 总计：</li>
	    					<li>运费：</li>
	    					<li>优惠：</li>
	    					<li>优惠券/卡：</li>
	    				</ul>
	    				<span id="daifu"><input type="checkbox">找人代付</span>
	    			</div>
	    		</div>
	    	</div>
	    </section>
	    
	    
	    
	    <footer>
	    	<div id="tijiao">
	    		<p class="jine">应付金额：<span id="price">￥<%=total %>.00</span></p>
	    		<p id="tongyao"><span id="lijian">立减</span>童瑶支付立减5元 <a href="" style="text-decoration: none;color: #28e">点此领取</a></p>
	    		<p class="jine">收货信息：<info style="color:#000;" id="shouhuos">张晨 152****5008 河北省邯郸市永年区广府镇北堤口</info></p>
	    		<p class="jine">支付方式：<info style="color:#000;" id="fukuanfangshi">你还未选择付款方式</info></p>
	    		<p><span id="ts"><img alt="" src="Image/LeGou_Image/!.png" width="16px" style="vertical-align: middle;"> 提交订单后尽快支付，商品才不会被人抢走哦！</span><input type="button" id="submits" class="tjs" value="提交订单"></p>
	    	</div>
	    </footer>
	    <input type="hidden" name="dingdanjine" value="<%=total %>">
    </form>
  </body>
  <script type="text/javascript">
  	$(function (){
  		$("#ok").click(function (){
  			$("#tijiaos").submit();
  		})
  		
  		$(".tjs").click(function (){
  			$("#beijings").fadeIn("300");
  		})
  	})
  </script>
</html>
