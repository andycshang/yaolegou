<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的乐购 - 个人信息修改</title>
    <link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
    <link type="text/css" rel="stylesheet" href="Css/Update_Style.css">
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.7.2.min.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    
    <link rel="stylesheet" href="kuang/themes/default/default.css" />
	<link rel="stylesheet" href="kuang/plugins/code/prettify.css" />
	<script charset="utf-8" src="kuang/kindeditor-all.js"></script>
	<script charset="utf-8" src="kuang/lang/zh-CN.js"></script>
	<script charset="utf-8" src="kuang/plugins/code/prettify.js"></script>
    
    <script type="text/javascript">
    	$(function (){
    		$("[name=NameNick]").click(function (){
    			$("[name=NameNick]").css("border","1px #76ABF3 solid");
    			$("#NameNick").html("<img src='Image/Update_Image/info.png'> 请填写用户名，用来显示你的店铺或者你的账号昵称，可用于登录使用。");
    		})
    		
    		$("[name=NameNick]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px red solid");
    				$("#NameNick").html("<img src='Image/Update_Image/error.png'> 请输入用户名。");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#NameNick").html("<img src='Image/Update_Image/qd.png'> 用户名正确。");
    			}
    		})
    		
    		$("[name=Name]").click(function (){
    			$("[name=Name]").css("border","1px #76ABF3 solid");
    			$("#Name").html("<img src='Image/Update_Image/info.png'> 请填真实姓名，我们会严格保密您的信息。");
    		})
    		
    		$("[name=Name]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px #ccc solid");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#Name").html("<img src='Image/Update_Image/qd.png'> 用户名正确，用来显示你的店铺或者你的账号昵称！");
    			}
    		})
    		
    		
    		$("[name=Phone]").click(function (){
    			$("[name=Phone]").css("border","1px #76ABF3 solid");
    			$("#Phone").html("<img src='Image/Update_Image/info.png'> 用来可以登录您的账号信息。");
    		})
    		
    		$("[name=Phone]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px red solid");
    				$("#Phone").html("<img src='Image/Update_Image/error.png'> 请输入手机号。");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#Phone").html("<img src='Image/Update_Image/qd.png'> 手机号正确。");
    			}
    		})
    		
    		$("[name=Email]").click(function (){
    			$("[name=Email]").css("border","1px #76ABF3 solid");
    			$("#Email").html("<img src='Image/Update_Image/info.png'> 请填写邮箱，可以用邮箱来登录您的账号信息！");
    		})
    		
    		$("[name=Email]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px #ccc solid");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#Email").html("<img src='Image/Update_Image/qd.png'> 邮箱正确。");
    			}
    		})
    		$("[name=Address]").click(function (){
    			$("[name=Address]").css("border","1px #76ABF3 solid");
    			$("#Address").html("<img src='Image/Update_Image/info.png'> 请认真填写您的地址，我们会严格保密您的信息。");
    		})
    		
    		$("[name=Address]").blur(function (){
    			if($(this).val() == ""){
    				
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#Address").html("<img src='Image/Update_Image/qd.png'> 地址填写正确。");
    			}
    		})
    		
    		$("[name=Address2]").click(function (){
    			$("[name=Address2]").css("border","1px #76ABF3 solid");
    			$("#Address2").html("<img src='Image/Update_Image/info.png'> 填写详细地址，如街道，单元号。");
    		})
    		
    		$("[name=Address2]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px #ccc solid");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#Address2").html("<img src='Image/Update_Image/qd.png'> 详细地址填写正确。");
    			}
    		})
    		
    		$("[name=ChuShengRiQi]").click(function (){
    			$("[name=ChuShengRiQi]").css("border","1px #76ABF3 solid");
    			$("#ChuShengRiQi").html("<img src='Image/Update_Image/info.png'> 填写生日日期，享受特权好礼！");
    		})
    		
    		$("[name=ChuShengRiQi]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px #ccc solid");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#ChuShengRiQi").html("<img src='Image/Update_Image/qd.png'> 日期填写正确。");
    			}
    		})
    		
    	})
    	
    	
    	KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '../plugins/code/prettify.css',
				uploadJson : 'upload_json.jsp',
				fileManagerJson : 'file_manager_json.jsp',
				allowFileManager : true,
				/* afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				} */
			});
			prettyPrint();
		});
    	
    	$(function (){
    		var sexid = $("#Sex").val();
    		$("[value="+sexid+"]").attr("checked",true);
    	})
    	
    	function fclick(obj){
    		alert();
		    obj.style.posTop=event.srcElement.offsetTop;
		     var x=event.x-obj.offsetWidth/2;
		     if(x<event.srcElement.offsetLeft)x=event.srcElement.offsetLeft;
		     if(x>event.srcElement.offsetLeft+event.srcElement.offsetWidth-obj.offsetWidth)x=event.srcElement.offsetLeft+event.srcElement.offsetWidth-obj.offsetWidth;
		     obj.style.posLeft=x;
	 	}
    	
    	$(function (){
    		
    		
    		$(".dizhi ul li").click(function (){
    			var text = $(this).html();
    			$.post("UpdateInfo.do?State=Select",{"text":text},function (Data){
    				$("[name=Address]").val(text+" ");
    				$(".dizhi ul li").remove();
    				var d = eval("("+Data+")");
    				var add = $(".dizhi ul");
     				$.each(d,function(){
     					var opt = $("<li onclick='city(this)''></li>").appendTo(add);
     					opt.html(this.cityname);
     				});
     				
    				
    			});
    			$(".text").css("border","1px #ccc solid");
    			$("#Address").html("<img src='Image/Update_Image/qd.png'> 详细地址填写正确。");
    		});
    		
    		$("#guan").click(function (){
    			$(".dizhi").hide();
    		})
    		$("[name=Address]").click(function (){
    			$(".dizhi").show();
    		})
    		
    	})
    	
    	function city(thiss){
    		var text = $(thiss).html();
			$.post("UpdateInfo.do?State=SelectQu",{"text":text},function (Data){
				$("[name=Address]").val($("[name=Address]").val()+text+" ");
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
    		$("[name=Address]").val($("[name=Address]").val()+text);
    		$(".dizhi").hide();
    		
    	}
    	
    	$(function (){
    		$("#file").change(function (){
    			$("#tx").attr("src",URL.createObjectURL($(this)[0].files[0]));
    		})
    	})
    
    </script>
    <style type="text/css">
    	.dizhi{
    		margin:0px;
    		padding:0px;
			
			border: 1px #ccc solid;
			background: #fff;
			width: 380px;
			
			z-index: 100;
			line-height: 12px;
			position:absolute;
			top:215px;
			overflow:hidden;
			
		}
		.dizhi .span{
			margin: 0px;
			padding: 0px;
			float: right;
			font-size: 14px;
			width: 380px;
			border-bottom: 1px #ccc solid;
			padding: 10px 0px;
			margin-left: 5px;
		}
		.dizhi ul{
			margin:0px;
			padding:0px;
			list-style: none;
			line-height: 23px;
			border: 1px #fff solid;
			overflow: hidden;
		}
		.dizhi ul li{
			float: left;
			margin-left: 20px;
			margin-right: 28px;
			margin-top:5px;
			margin-bottom: 5px; 
			width: 36px;
			text-align: center;
		}
		.dizhi ul li{
			padding: 0px 5px;
		}
		.dizhi ul li:hover{
			background: #ff3366;
			color:#fff;
			cursor: pointer;
		}
		#guan{
			float: right;
			font-size: 14px;
			margin-right: 10px;
			cursor: pointer;
		}
		#left a:hover{
			color: #ff3366;
		}
    </style>
</head>
<body>
<!-- **********************头部*********************** -->
<header>
    <div id="div_back">
        <div id="div_ul">
            <ul>
                <li class="xia" onmousemove="wzfl()"><img src="Image/GoWuChe_Image/XiaoFangzi.png" alt="" style="vertical-align: middle;margin-right: 5px;">返回首页</li>
                <li>网站导航</li>
                <li>商家入驻</li>
                <li>客户服务</li>
            </ul>
            <ul  class="daohang" style="float:right">
                <li id="denglu">${user.userinfo.usernick==null?'您好，请登录':user.userinfo.usernick }</li>
                <li>注册</li>
                <li>我的订单</li>
                <li onclick="window.open('GouWuChe.do?UserName=${user.username}')"><img src="Image/Index_Image/xiaogouwuche.png" alt=""> 购物车</li>
                <li>企业采购</li>
            </ul>
        </div>
    </div>
    <div id="ding">
    	<div id="ding_border">
    		<img alt="" src="Image/LeGou_Image/LeGouLogo.png">
    		<div id="daohang">
    			<ul>
    				<li>首页</li>
    				<li>账户管理</li>
    				<li>消息</li>
    			</ul>
    		</div>
    	</div>
    </div>
</header>
<!--**********************主体*****************************-->
<section>
	<div id="body">
		<div id="left">
			<dl>
				<dt><img alt="" src="Image/LeGou_Image/xq.gif">个人中心</dt>
				<dd><a href="LeGou.do">个人信息</a></dd>
				<dd><a href="#">退出登录</a></dd>
			</dl>
			
		</div>
		<div id="zhu">
			<p>个人信息</p>
			
			<form action="UpdateInfo.do" method="post" enctype="multipart/form-data">
				<dl>
					<dt onclick="fclick(t_file)" style="cursor: pointer;"><img alt="" id="tx" src=${ui.image } width="125px">
					<span id="back"></span>
					<span id="txtext">编辑头像</span>
					<input type="file" name="file" id="file"></dt>
					<dd style="margin-top: 8px"><input type="text" name="NameNick" class="text" placeholder="请输入用户名/昵称"  value="${ui.usernick }"><span id="NameNick" class="tishi"></span></dd>
					<dd><input type="text" class="text" name="Name" value="${ui.name==null?'':ui.name }" placeholder="请输入真实姓名"><span id="Name" class="tishi"></span></dd>
				</dl>
				
				<table style="position: relative;">
					<tr>
						<td><span style="color:red">*</span>性别：</td>
						<td><input type="radio" name="sex" value="1" checked="checked">男
							<input type="radio" name="sex" value="2">女
							<input type="radio" name="sex" value="3">保密
							<input type="hidden" id="Sex" value="${ui.sexid }">
						</td>
					</tr>
					<tr>
						<td><span style="color:red">*</span>手机号：</td>
						<td><input type="text" value="${ui.phone==null?'':ui.phone }" class="text" name="Phone"><span id="Phone" class="tishi"></span></td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td><input type="text" value="${ui.email==null?'':ui.email }" placeholder="请填写您的邮箱" class="email" name="Email"><span id="Email" class="tishi"></span></td>
					</tr>
					<tr>
						<td>出生日期：</td>
						<td><input type="text" value="${ui.birthday==null?'':ui.birthday }" placeholder="选择日期" class="text" name="ChuShengRiQi" onclick="WdatePicker()"><span class="tishi" id="ChuShengRiQi"><img src='Image/Update_Image/info.png'> 填写生日日期，享受特权好礼！</span></td>
					</tr>
					<tr>
						<td>居住地址：</td>
						<td><input type="text" value="${address1 }" class="text" name="Address"><span id="Address" class="tishi"></span>
						<div class="dizhi" style="display: none">
							<span class="span">&nbsp;请选择省、市、区<span id="guan">×</span></span>
							
							<ul>
								<c:forEach var="sl" items="${ShengList }">
									<li>${sl.shengname }</li>
								</c:forEach>
								
							</ul>
						</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" value="${address2 }" class="text" name="Address2" placeholder="填写详细地址，如街道，单元号。" style="width: 300px"><span id="Address2" class="tishi"></span></td>
					</tr>
					<tr>
						<td>个人简介：</td>
						<td><textarea name="content1" style="width: 700px" rows="" cols="" class="text" name="JianJie">${ui.jianjie }</textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="保存信息"></td>
					</tr>
				</table>
				<input type="hidden" name="UserName" value="${ui.username }">
			</form>
			
		</div>
	</div>
</section>

<!-- **********************页脚*********************** -->
<footer>
    <div id="footer_manger">
        <p>
            <a href="#">京东商城</a>
            <span>|</span>
            <a href="#">天猫商城</a>
            <span>|</span>
            <a href="#">美丽说</a>
            <span>|</span>
            <a href="#">苏宁易购</a>
            <span>|</span>
            <a href="#">努比亚官网</a>
            <span>|</span>
            <a href="#">小米官网</a>
            <span>|</span>
            <a href="#">联想官网</a>
            <span>|</span>
            <a href="#">DR钻戒官网</a>
            <span>|</span>
            <a href="#">唯品会</a>
            <span>|</span>
            <a href="#">vivo官网</a>
        </p>
        <p>Copyright © 
            <c:forEach var="title" items="${JiBenInfoList }">
	    		<c:if test="${title.key == 'Copy' }">${title.value }</c:if>
	    	</c:forEach>
	    	  <!-- 电信与信息服务业务经营许可证100798号 --> 
	    	 经营性网站备案信息
	    	<c:forEach var="title" items="${JiBenInfoList }">
	    		<c:if test="${title.key == 'BeiAn' }">${title.value }</c:if>
	    	</c:forEach></p>
            <p>本网站直接或间接向消费者推销商品或者服务的商业宣传均属于“广告”（包装及参数、售后保障等商品信息除外）</p>
            <p>客服电话：15232045008  文明办网文明上网举报电话：010-82615762  违法不良信息举报中心
            <c:forEach var="title" items="${JiBenInfoList }">
	    		<c:if test="${title.key == 'TongJi' }">${title.value }</c:if>
	    	</c:forEach>
            </p>
    </div>

</footer>
</body>
</html>