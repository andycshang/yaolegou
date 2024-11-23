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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<title>瑶乐购 后台管理系统</title>
<meta name="keywords" content="瑶乐购 后台管理系统 - 首页">
<meta name="description" content="瑶乐购 后台管理系统 - 是小型CMS后台系统。">
<script type="text/javascript" src="../Js+JQuery/jquery-1.12.4.js"></script>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">瑶乐购 后台管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">瑶乐购后台管理系统</a> 
			<span class="logo navbar-slogan f-l mr-10 hidden-xs"></span> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="article_add('添加资讯','article-add.jsp')"><i class="Hui-iconfont">&#xe616;</i> 资讯</a></li>
							<li><a href="javascript:;" onclick="picture_add('添加资讯','picture-add.jsp')"><i class="Hui-iconfont">&#xe613;</i> 图片</a></li>
							<li><a href="javascript:;" onclick="product_add('添加资讯','product-add.jsp')"><i class="Hui-iconfont">&#xe620;</i> 产品</a></li>
							<li><a href="javascript:;" onclick="member_add('添加用户','member-add.jsp','','510')"><i class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>
					<c:if test="${la.shenfenid == 1 }">
						超级管理员
					</c:if>
					<c:if test="${la.shenfenid == 2 }">
						管理员
					</c:if>
				</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">${la.username } <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
						<li><a href="javascript:;" onClick="myselfinfo()">修改密码</a></li>
						<li><a href="LoginAdmin.do?State=Exit">退出</a></li>
				</ul>
			</li>
				<li id="Hui-msg"> <a href="#" title="消息"><!-- <span class="badge badge-danger">100</span> --><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（主题色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
	<c:if test="${qx.shouyeadmin == 0 }">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 首页管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="Banner.do" data-title="Banner管理" href="javascript:void(0)">Banner管理</a></li>
					<li><a data-href="DaoHangTiao.do" data-title="导航条管理" href="javascript:void(0)">导航条管理</a></li>
					<li><a data-href="Banner.do?State=shangyi" data-title="首页上衣管理" href="javascript:void(0)">首页上衣管理</a></li>
					<li><a data-href="Banner.do?State=kuzi" data-title="首页裤子管理" href="javascript:void(0)">首页裤子管理</a></li>
					<li><a data-href="Banner.do?State=xiezi" data-title="首页鞋子管理" href="javascript:void(0)">首页鞋子管理</a></li>
				</ul>
			</dd>
		</dl>
	</c:if>
	<c:if test="${qx.shopadmin == 0 }">
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i> 商品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="ShopSelect.do" data-title="查看所有商品" href="javascript:void(0)">查看所有商品</a></li>
					<li><a data-href="PingLun.do" data-title="查看所有评论" href="javascript:void(0)">查看商品评论</a></li>
					<li><a data-href="TypeAdmin.do" data-title="查看所有类型" href="javascript:void(0)">管理分类类型</a></li>
				</ul>
			</dd>
		</dl>
	</c:if>
	<c:if test="${qx.useradmin == 0 }">
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="SelectUser.do" data-title="管理所有用户" href="javascript:void(0)">管理所有用户</a></li>
				</ul>
			</dd>
		</dl>
	</c:if>
	<c:if test="${qx.admin == 0 }">
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="SelectAdmin.do" data-title="查看管理员" href="javascript:;">查看管理员</a></li>
					<li><a data-href="QuanXian.do" data-title="权限分配" href="javascript:;">权限分配</a></li>
			</ul>
		</dd>
	</dl>
	</c:if>
	<c:if test="${qx.tongjiadmin == 0 }">
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 统计部分<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="fenbu.jsp" data-title="用户分布" href="javascript:;">用户分布</a></li>
					<li><a data-href="TongJi2.jsp" data-title="订单统计" href="javascript:;">信息统计</a></li>
					<li><a data-href="SelectAllDingDan.do" data-title="订单统计" href="javascript:;">订单统计</a></li>
					<li><a data-href="XiaoShouZuiDuoShop.do" data-title="卖的最多的商品" href="javascript:;">卖的最多的商品</a></li>
				</ul>
			</dd>
		</dl>
	</c:if>
	<c:if test="${qx.jibenadmin == 0 }">
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 基本设置<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="Music.jsp" data-title="音乐管理" href="javascript:;">音乐管理</a></li>
					<li><a data-href="WebSet.do" data-title="网站设置" href="javascript:;">网站设置</a></li>
					<li><a data-href="WebSet.do?State=tj" data-title="统计代码" href="javascript:;">统计代码</a></li>
				</ul>
			</dd>
		</dl>
	</c:if>
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="Welcome.do">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="Welcome.do"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	/*$("#min_title_list li").contextMenu('Huiadminmenu', {
		bindings: {
			'closethis': function(t) {
				console.log(t);
				if(t.find("i")){
					t.find("i").trigger("click");
				}		
			},
			'closeall': function(t) {
				alert('Trigger was '+t.id+'\nAction was Email');
			},
		}
	});*/
});
/*个人信息*/
function myselfinfo(){
	layer.open({
		type: 1,
		area: ['505px;','280px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '更改密码',
		content: '<iframe src="UpdateAdminPass.jsp" width="500px" height="280px">管理员信息</iframe>'
	});
}

/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}


</script> 
</body>
</html>