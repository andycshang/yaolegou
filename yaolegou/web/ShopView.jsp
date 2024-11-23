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
    
    <title>My JSP 'ShopView.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="Js+JQuery/jquery-1.12.4.js"></script>
	<style type="text/css">
		*{
			margin: 0px;
			padding: 0px;
		}
		#body{
			width: 1018px;
			overflow: hidden;
			/* border: 1px red solid; */
		}
		#Shop{
			margin:0px;
			padding:0px;
			width: 1020px;
			overflow: hidden;
			/* border: 1px green solid; */
			background: #f5f5f5;
			padding-top: 5px;
		}
		.shop{
			margin:0px;
			padding:0px;
			width: 194px;
			height: 260px;
			background: #fff;
			margin:5px;
			float: left;
			position: relative;
			
		}
		.shop dl{
			margin: 0px;
			padding: 0px;
			width: 194px;
			height: 260px;
		}
		.shop dl dt{
			margin-left: 22px;
			margin-top: 18px;
			margin-bottom: 5px;
			cursor: pointer;
		}
		
		.shop dl dd{
			margin: 0px;
			padding: 0px;
			text-align: center;
			line-height: 25px;
			
		}
		
		.shop dl dd:nth-child(2){
			width: 150px;
			height: 20px;
			overflow: hidden;
			margin: 3px auto;
		}
		.shop dl .title{
			font-size: 14px;
			
		}
		.type{
			/* display: inline;
			font-size: 14px;
			padding:0px 3px;
			background: #ff3366;
			color: #fff;
			margin: 2.5px 0px;
			width: 10px;
			border: 1px red solid;
			border-radius: 3px;
			margin-right: 2px; */
			color: #ff3366;
			margin-right: 3px;
		}
		.price{
			font-size:14px;
			color: orangered;
			height: 28px;
		}
		.shop a{
			text-decoration: none;
			color: #fff;
			position: absolute;
			padding: 8px 13px;
			display: none;
			font-size: 14px;
		}
		.del{
			right: 0px;
		}
		.back_update{
			padding: 18px 28px;
			background: black;
			opacity:0.5;
			position: absolute;
			border-radius: 3px;		
			display: none;	
		}
		.back_del{
			padding: 18px 28px;
			background: black;
			opacity:0.5;
			position: absolute;
			right: 0px;	
			border-radius: 3px;
			display: none;
		}
		#body form p{
			float: left;
			display: inline-block;
			margin-left: 100px;
			margin-top: 50px;
			margin-bottom: 50px;
		}
		[type=submit]{
			background: #ff3366;
			border: 0px;
			color: #fff;
			padding: 5px 20px;
			border-radius: 3px;	
		}
		.dels{
			font-size: 14px;
			background: #ff3366;
			color: #fff;
			padding: 2px 15px;
			cursor: pointer;
			border-radius: 3px;	
		}
		.dels:nth-child(1){
			margin-right: 30px;
		}
		#fanye{
    width: 1018px;
    overflow: hidden;
    margin: 0px auto;
}
#fanye ul {
    margin: 0px;
    padding: 0px;
    height:30px;
    list-style: none;
    font-size: 14px;
    text-align: center;
    margin-top: 25px;
    margin-bottom: 15px;
}
#fanye ul li{
    padding: 3px 10px;
    border: 1px #FF3366 solid;
    display: inline;
    background: #fff;
}
#fanye ul li:hover{
    cursor: pointer;
    color: #fff;
    background-color: #FF3366;
}
	</style>
	<script type="text/javascript">
		$(function (){
			$(".shop").hover(function (){
				$(this).children(".back_update").show();
				$(this).children(".back_del").show();
				$(this).children(".update").show();
				$(this).children(".del").show();
			},
			function (){
				$(this).children(".back_update").hide();
				$(this).children(".back_del").hide();
				$(this).children(".update").hide();
				$(this).children(".del").hide();
			}
			);
			
			/* $(".update").hover(
				function (){
					$(this).prve().children(".back_update").css("opacity","0.7");
				},
				function (){
					$(this).prve().children(".back_update").css("opacity","0.5");
				}
			) */
		})
		
		$(function (){
			var text = $("[name=ShopType]").attr("data");
			$("[name=ShopType]").val(text);
			
		})
		
		function dels(id, UserName){
			var is = confirm("删除后不可恢复，确认删除该商品吗？");
			if(is){
				window.open("ShopView.do?State=del&shopid="+id+"&UserName="+UserName+"","_self");
				return true;
			}else{
				return false;
			}
		}
		
		
		//传值，获取传过来的页码
		function getInfo(pages) {
			$("[name='page']").val(pages);
			$("#page").trigger("submit");//trigger--->自动触发提交表单的事件
        }
		
		
		
		function xiajia(zhe,shopid){
			$.post("ShopView.do?State=xiajia",{"shopid":shopid},function (Data){
				history.go(0);
			})
		}
		
		function shangjia(zhe,shopid){
			$.post("ShopView.do?State=shangjia",{"shopid":shopid},function (Data){
				history.go(0);
			})
		}
	</script>
  </head>
  
  <body>
    <div id="body">
    	<form action="ShopView.do">
    		<input type="hidden" name="UserName" value="${UserName }">
    		<p>
    			商品名称：
    			<input type="text" name="ShopName" value=${ShopName }>
    		</p>
    		<p>
    			商品类型：
    			<select name="ShopType" data="${typeid }">
					<option value="0">全部</option>
					<c:forEach var="stl" items="${ShopTypeList }">
						<option value="${stl.shoptypeid }">${stl.shoptypename }</option>
					</c:forEach>
				</select>
    		</p>
    		<p>
    			<input type="submit" value="查询">
    		</p>
    	</form>
    	<div id="Shop">
    	<c:if test="${not empty si }">
    		<form action="ShopView.do" method="post" id="page">
	    		<c:forEach var="sp" items="${si }">
		    		<c:if test="${sp.xiajia == 1 }">
		    			<div class="shop">
			    			<div class="back_update"></div>
			    			<div class="back_del"></div>
			    			<a href="#" class="del">改图</a>
			    			<a href="UpdateColor.do?shopid=${sp.shopid }" target="_blank" class="update">完善</a>
			    			<dl>
			    				<dt><img alt="" src="${sp.image }" width="150px" onclick="window.open('ShangYi.do?State=Select&ShopId=${sp.shopid }')" title="${sp.shopname }"></dt>
			    				<dd class="title"><span class="type">${sp.shoptype.shoptypename }</span>${sp.shopname }</dd>
			    				
			    				<dd class="price">价格：￥${sp.shopprice } <span onclick="xiajia(this,${sp.shopid})" style="cursor:pointer;background: #ff3366	;color: #fff;padding: 0px 3px;border-radius: 3px;	">下架</span></dd>
			    				<dd><span class="dels">修改</span><span class="dels" onclick="return dels(${sp.shopid},'${sp.zhuRenUser }')">删除</span></dd>
			    			</dl>
			    		</div>
		    		</c:if>
		    		<c:if test="${sp.xiajia == 0 }">
		    			<div class="shop">
			    			<div class="back_update"></div>
			    			<div class="back_del"></div>
			    			<a href="#" class="del">改图</a>
			    			<a href="UpdateColor.do?shopid=${sp.shopid }" target="_blank" class="update">完善</a>
			    			<dl>
			    				<dt><img alt="" src="${sp.image }" width="150px" onclick="window.open('ShangYi.do?State=Select&ShopId=${sp.shopid }')" title="${sp.shopname }"></dt>
			    				<dd class="title"><span class="type">${sp.shoptype.shoptypename }</span>${sp.shopname }</dd>
			    				
			    				<dd class="price">价格：￥${sp.shopprice } <span onclick="shangjia(this,${sp.shopid})" style="cursor: pointer;background: orange	;color: #fff;padding: 0px 3px;border-radius: 3px;	">已下架</span></dd>
			    				<dd><span class="dels">修改</span><span class="dels" onclick="return dels(${sp.shopid},'${sp.zhuRenUser }')">删除</span></dd>
			    			</dl>
			    		</div>
		    		</c:if>
		    	</c:forEach>
		    	<div id="fanye">
			        <ul>
			            <li onclick="getInfo();return false;">首页</li>
			            <c:forEach var="i" begin="1" end="${pb.totalPage }">
			            	<c:if test="${pb.pageNo==i }">
			            		<li style="background: #ff3366;color:#fff;" onclick="getInfo(${i});return false;">${i }</li>
			            	</c:if>
			            	<c:if test="${pb.pageNo!=i }">
			            		<li onclick="getInfo(${i});return false;">${i }</li>
			            	</c:if>
			            	
						</c:forEach>
			            <li onclick="getInfo(${pb.totalPage});return false;">末尾</li>
			        </ul>
			    </div>
			    <input type="hidden" name="page" value="">
		    </form>
    	</c:if>
    	<c:if test="${empty si }">
    		<p style="background: #ffffff;padding-top: 120px;text-align: center;">您还没有发布任何商品哦！</p>
    	</c:if>
    	</div>
    </div>
  </body>
</html>
