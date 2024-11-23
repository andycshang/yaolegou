<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>查看所有商品</title>
<link href="lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet" type="text/css" >
<style type="text/css">
		*{
			margin: 0px;
			padding: 0px;
		}
		#Shop{
			margin:0px;
			padding:0px;
			width: 100%;
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
			margin:7px;
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
	</style>
	<script type="text/javascript" src="../Js+JQuery/jquery-1.12.4.js"></script>
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
		})
		
		$(function (){
			var text = $("[name=ShopType]").attr("data");
			$("[name=ShopType]").val(text);
			
		})
		
		function dels(id, UserName){
			var is = confirm("删除后不可恢复，确认删除该商品吗？"+UserName);
			if(is){
				window.open("ShopView.do?State=del&shopid="+id+"&UserName="+UserName+"","_self");
				return true;
			}else{
				return false;
			}
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 商品管理 <span class="c-gray en">&gt;</span> 查看所有商品 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<form class="Huiform" method="post" action="ShopSelect.do" target="_self">
			<input type="text" placeholder="商品名称" name="ShopName" value="${ShopName }" class="input-text" style="width:320px">
			<span class="select-box" style="width:150px">
			<select class="select" name="ShopType" data="${typeid }">
				<option value="0" selected="selected">全部</option>
				<c:forEach items="${stList }" var="stl">
					<option value="${stl.shoptypeid }">${stl.shoptypename }</option>
				</c:forEach>
			</select>
			</span><button type="submit" class="btn btn-success" id="" name="" onClick="picture_colume_add(this);"><i class="Hui-iconfont">&#xe600;</i> 搜索商品</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"><!--  <span class="l"> <a href="javascript:;" onclick="edit()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe6df;</i> 编辑</a> <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span>--> <span class="r"> 共有数据：<strong>${ShopInfoList.size() }</strong> 条</span> </div>
	<div class="portfolio-content">
		<ul class="cl portfolio-area">
		<div id="Shop">
    		<c:if test="${not empty ShopInfoList }">
	    		<c:forEach var="sp" items="${ShopInfoList }">
		    		<c:if test="${sp.xiajia == 1 }">
		    			<div class="shop">
			    			<div class="back_update"></div>
			    			<div class="back_del"></div>
			    			<a href="#" class="del">改图</a>
			    			<a href="UpdateColor.do?shopid=${sp.shopid }" target="_blank" class="update">完善</a>
			    			<dl>
			    				<dt><img alt="" src="../${sp.image }" width="150px" onclick="window.open('ShangYi.do?State=Select&ShopId=${sp.shopid }')" title="${sp.shopname }"></dt>
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
			    				<dt><img alt="" src="../${sp.image }" width="150px" onclick="window.open('ShangYi.do?State=Select&ShopId=${sp.shopid }')" title="${sp.shopname }"></dt>
			    				<dd class="title"><span class="type">${sp.shoptype.shoptypename }</span>${sp.shopname }</dd>
			    				
			    				<dd class="price">价格：￥${sp.shopprice } <span onclick="shangjia(this,${sp.shopid})" style="cursor: pointer;background: orange	;color: #fff;padding: 0px 3px;border-radius: 3px;	">已下架</span></dd>
			    				<dd><span class="dels">修改</span><span class="dels" onclick="return dels(${sp.shopid},'${sp.zhuRenUser }')">删除</span></dd>
			    			</dl>
			    		</div>
		    		</c:if>
		    	</c:forEach>
    		</c:if>
	    	<c:if test="${empty ShopInfoList }">
	    		<p style="background: #ffffff;padding-top: 120px;text-align: center;">您还没有发布任何商品哦！</p>
	    	</c:if>
    	</div>

		</ul>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/lightbox2/2.8.1/js/lightbox.min.js"></script> 
<script type="text/javascript">
$(function(){
	$(".portfolio-area li").Huihover();
});
</script>
</body>
</html>