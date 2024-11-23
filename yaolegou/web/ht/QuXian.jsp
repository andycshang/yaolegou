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
<title>角色管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 管理员管理 <span class="c-gray en">&gt;</span> 权限分配 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray"><span class="r">共有数据：<strong>54</strong> 条</span> </div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="5">角色管理</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" value="" name=""></th>
				<th>ID</th>
				<th>身份</th>
				<th>所拥有的权限</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${QuanXianlist }" var="qxl">
			<tr class="text-c">
				<td><input type="checkbox" value="" name=""></td>
				<td>${qxl.adminuser }</td>
				<td>
					<c:if test="${qxl.la.shenfenid == 1 }">
						超级管理员
					</c:if>
					<c:if test="${qxl.la.shenfenid == 2 }">
						管理员
					</c:if>
				</td>
				<td>
					<c:if test="${qxl.shouyeadmin == 0 }">
						<input type="checkbox" id="shouye" checked="checked" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','shouyeadmin','${qxl.shouyeadmin }')">首页管理
					</c:if>
					<c:if test="${qxl.shouyeadmin == 1 }">
						<input type="checkbox" id="shouye" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','shouyeadmin','${qxl.shouyeadmin }')">首页管理
					</c:if>
					<c:if test="${qxl.shopadmin == 0 }">
						<input type="checkbox" id="shouye" checked="checked" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','shopadmin','${qxl.shopadmin }')">商品管理
					</c:if>
					<c:if test="${qxl.shopadmin == 1 }">
						<input type="checkbox" id="shouye" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','shopadmin','${qxl.shopadmin }')">商品管理
					</c:if>
					<c:if test="${qxl.useradmin == 0 }">
						<input type="checkbox" id="shouye" checked="checked" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','useradmin','${qxl.useradmin }')">用户管理
					</c:if>
					<c:if test="${qxl.useradmin == 1 }">
						<input type="checkbox" id="shouye" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','useradmin','${qxl.useradmin }')">用户管理
					</c:if>
					<c:if test="${qxl.admin == 0 }">
						<input type="checkbox" id="shouye" checked="checked" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','admin','${qxl.admin }')">管理员管理
					</c:if>
					<c:if test="${qxl.admin == 1 }">
						<input type="checkbox" id="shouye" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','admin','${qxl.admin }')">管理员管理
					</c:if>
					<c:if test="${qxl.tongjiadmin == 0 }">
						<input type="checkbox" id="shouye" checked="checked" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','tongjiadmin','${qxl.tongjiadmin }')">统计管理
					</c:if>
					<c:if test="${qxl.tongjiadmin == 1 }">
						<input type="checkbox" id="shouye" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','tongjiadmin','${qxl.tongjiadmin }')">统计管理
					</c:if>
					<c:if test="${qxl.jibenadmin == 0 }">
						<input type="checkbox" id="shouye" checked="checked" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','jibenadmin','${qxl.jibenadmin }')">基本管理
					</c:if>
					<c:if test="${qxl.jibenadmin == 1 }">
						<input type="checkbox" id="shouye" style="margin: 0px 30px" onclick="qx('${qxl.adminuser }','jibenadmin','${qxl.jibenadmin }')">基本管理
					</c:if>
					
					
				</td>
				<td class="f-14"><a title="删除" href="javascript:;" onclick="admin_role_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript">

function qx(zhe,weizhi,stateid){

	window.open("QuanXian.do?State=update&UserName="+zhe+"&weizhi="+weizhi+"&stateid="+stateid,"_self");
}

/*管理员-角色-添加*/
function admin_role_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-角色-编辑*/
function admin_role_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-角色-删除*/
function admin_role_del(obj,id){
	layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}


</script>
</body>
</html>