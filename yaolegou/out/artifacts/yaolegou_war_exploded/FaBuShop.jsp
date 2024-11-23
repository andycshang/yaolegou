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
    <title>我的乐购 - 商品发布</title>
    <link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
    <link type="text/css" rel="stylesheet" href="Css/FaBuShop_Style.css">
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.7.2.min.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    
    <link rel="stylesheet" href="kuang/themes/default/default.css" />
	<link rel="stylesheet" href="kuang/plugins/code/prettify.css" />
	<script charset="utf-8" src="kuang/kindeditor-all.js"></script>
	<script charset="utf-8" src="kuang/lang/zh-CN.js"></script>
	<script charset="utf-8" src="kuang/plugins/code/prettify.js"></script>
    
    <script type="text/javascript">
    	$(function (){
    		$("[name=ShopName]").click(function (){
    			$("[name=ShopName]").css("border","1px #76ABF3 solid");
    			$("#ShopName").html("<img src='Image/Update_Image/info.png'> 填写商品标题名称，可用于用户查看。如（小清新男友上衣T恤清爽帅气秋季款）");
    		})
    		
    		$("[name=ShopName]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px red solid");
    				$("#ShopName").html("<img src='Image/Update_Image/error.png'> 请输入商品名称。");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#ShopName").html("<img src='Image/Update_Image/qd.png'> 商品名称正确。");
    			}
    		})
    		
    		$("[name=Image]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px red solid");
    				$("#Image").html("<img src='Image/Update_Image/error.png'> 请选择商品封面图。");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#Image").html("<img src='Image/Update_Image/qd.png'> 商品封面图已有。");
    			}
    		})
    		
    		$("[name=ShopMiaoShu]").click(function (){
    			$("[name=ShopMiaoShu]").css("border","1px #76ABF3 solid");
    			$("#ShopMiaoShu").html("<img src='Image/Update_Image/info.png'> 商品描述，简单的描述下吧！");
    		})
    		
    		$("[name=ShopMiaoShu]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px red solid");
    				$("#ShopMiaoShu").html("<img src='Image/Update_Image/error.png'> 请输入商品描述。");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#ShopMiaoShu").html("<img src='Image/Update_Image/qd.png'> 商品描述正确。");
    			}
    		})
    		
    		$("[name=ShopPrice]").click(function (){
    			$("[name=ShopPrice]").css("border","1px #76ABF3 solid");
    			$("#ShopPrice").html("<img src='Image/Update_Image/info.png'> 合理的填写价格哦！");
    		})
    		
    		$("[name=ShopPrice]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px red solid");
    				$("#ShopPrice").html("<img src='Image/Update_Image/error.png'> 请输入商品价格，不然赔死了。");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#ShopPrice").html("<img src='Image/Update_Image/qd.png'> 商品价格正确。");
    			}
    		})
    		
    		$("[name=ChiCun]").click(function (){
    			$("[name=ChiCun]").css("border","1px #76ABF3 solid");
    			$("#ChiCun").html("<img src='Image/Update_Image/info.png'> 如有多个尺寸可以用逗号(,)隔开哦！");
    		})
    		
    		$("[name=ChiCun]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px red solid");
    				$("#ChiCun").html("<img src='Image/Update_Image/error.png'> 请输入商品尺寸。");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#ChiCun").html("<img src='Image/Update_Image/qd.png'> 尺寸填写正确。");
    			}
    		})
    		
    		$("[name=Color]").click(function (){
    			$("[name=Color]").css("border","1px #76ABF3 solid");
    			$("#Color").html("<img src='Image/Update_Image/info.png'> 如有多个颜色可以用逗号(,)隔开哦！");
    		})
    		
    		$("[name=Color]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px red solid");
    				$("#Color").html("<img src='Image/Update_Image/error.png'> 请输入商品尺寸。");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#Color").html("<img src='Image/Update_Image/qd.png'> 尺寸填写正确。");
    			}
    		})
    		
    		$("[name=content1]").click(function (){
    			$("[name=content1]").css("border","1px #76ABF3 solid");
    			$("#content1").html("<img src='Image/Update_Image/info.png'> 用于物品的详细介绍！");
    		})
    		
    		$("[name=content1]").blur(function (){
    			if($(this).val() == ""){
    				$(this).css("border","1px red solid");
    				$("#content1").html("<img src='Image/Update_Image/error.png'> 请输入商品介绍。");
    			}else{
    				$(this).css("border","1px #ccc solid");
    				$("#content1").html("<img src='Image/Update_Image/qd.png'> 正确。");
    			}
    		})
    	})
    	
    	$(function (){
    		$("#fengmian").change(function (){
    			$("#fengmianimg").attr("src",URL.createObjectURL($(this)[0].files[0]));
    		});
    	})
    	
    	function bian(zhe){
    		$(zhe).prev().attr("src",URL.createObjectURL($(zhe)[0].files[0]))
    	}
    	
    	/* function da(zhe){
    		$(this).prev().attr("src",URL.createObjectURL($(this)[0].files[0]));
    	} */
    	
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
    		var index = 2;
    		$("#AddDefaultImg").click(function (){			
    			index++;
    			var str = 
    			"<div class='Image'>"+
    				"<li style='margin-bottom: 20px;margin-top: 15px;'>"+
		    			"添加默认图"+index+"： "+
						"<img src='Image/FaBuShop_Image/shangchuan.jpg' width='100px' height='100px' style='vertical-align: middle;'>"+
						"<input type='file' name='B_Default_Image' class='xiaotu' onchange='bian(this)'>"+
						"<a href='javascript:void(0)' class='guan' onclick='del(this)'><img alt='' src='Image/FaBuShop_Image/x.png'></a>"+
					"</li>"+
				"</div>";
				$(str).appendTo($("defaulttu"));
    		})  
    		
    		$("#beijing").click(function (){
    			$(this).fadeOut("300");
    			setTimeout(3,function (){
    				alert();
    				$("#beijing").fadeOut("300");
    			});
    		})
    	})
    	
    	function del(zhe){
    		var a = confirm("确定要删除吗？");
    		if(a){
    			$(zhe).parent().parent().remove();
    		}
    	}
    	
    	function yanzheng(){
    		var typeid = $("[name=ShopType]").val();
    		var ShopPrice = $("[name=ShopPrice]").val();
    		if(typeid == 0){
    			$("#beijing").fadeIn("300");
				$("#wen").html("请选择商品分类！");
    			return false;
    		}else if(isNaN(ShopPrice)){
    			$("#beijing").fadeIn("300");
				$("#wen").html("请输入正确的价格！");
    			return false;
    		}else{
    			return true;
    		}
    	}
    	
    	
    </script>
</head>
<body>
<!--------------------- 提示页 -------------------------->
  <div id="beijing" style="display: none">
	<div id="hei"></div>
	<div id="context">
		<dl>
			<dt><img alt="" src="Image/LeGou_Image/!.png"></dt>
			<dd>提示：</dd>
			<dd id="wen">账号或密码错误！</dd>
		</dl>
	</div>
</div>
<!----------------------------------------------------  -->
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
				<dd><a href="#">个人信息</a></dd>
				<dd><a href="#">商品发布</a></dd>
				<dd><a href="#">退出登录</a></dd>
			</dl>
			
		</div>
		<div id="zhu">
			<p>商品发布</p>
			<form action="FaBuShop.do?State=Add" style="position: relative;" method="post" enctype="multipart/form-data" ><!--   -->
				<!-- <input type="hidden" name="State" value="Add"> -->
				<input type="hidden" value="${UserName }" name="ZhuRenUser">
				<ul>
					<li>商品名称：<input type="text" name="ShopName"><span class="tishi" id="ShopName" style="width: 500px;"><img src='Image/Update_Image/info.png'> 填写商品标题名称，可用于用户查看。如（小清新男友上衣T恤清爽帅气秋季款）</span></li>
					<li>商品封面：<img src="Image/FaBuShop_Image/shangchuan.jpg" id="fengmianimg" width="100px" height="100px" style="vertical-align: middle;"><input type="file" name="S_Default_Image" class="xiaotu" onchange="bian(this)"> <span style="margin-left: 20px;"><img src='Image/Update_Image/info.png'> 封面图一定要帅气好看，这可是人家用户的第一印象哦！</span></li>
					<li>商品描述：<input type="text" name="ShopMiaoShu" style="width: 600px"><span id="ShopMiaoShu" class="tishi"><img src='Image/Update_Image/info.png'> 商品描述，简单的描述下吧！</span></li>
					<li>商品价格：<input type="text" name="ShopPrice"><span id="ShopPrice" class="tishi"><img src='Image/Update_Image/info.png'> 合理的填写价格哦！</span>商品尺寸：<input type="text" name="ChiCun"><span id="ChiCun" class="tishi"><img src='Image/Update_Image/info.png'> 如有多个尺寸可以用逗号(,)隔开哦！</span></li>
					<li>商品颜色：<input type="text" name="Color"><span id="Color" class="tishi"><img src='Image/Update_Image/info.png'> 如有多个颜色可以用逗号(,)隔开哦！</span>
						商品类型：
						<select name="ShopType">
							<option value="0">全部</option>
							<c:forEach var="stl" items="${ShopTypeList }">
								<option value="${stl.shoptypeid }">${stl.shoptypename }</option>
							</c:forEach>
						</select>
						<span class="tishi"><img src='Image/Update_Image/info.png'> 选择商品分类，如（上衣）</span>
					</li>
					<defaulttu>
						<div class="Image">
							<li style="margin-bottom: 20px;margin-top: 15px;">
								添加默认图1：
								<img src="Image/FaBuShop_Image/shangchuan.jpg" width="100px" height="100px" style="vertical-align: middle;">
								<input type="file" name="S_Default_Image" class="xiaotu" onchange="bian(this)">
							</li>
						</div>
						<div class="Image">
							<li style="margin-top: 15px;">
								添加默认图2：
								<img src="Image/FaBuShop_Image/shangchuan.jpg" width="100px" height="100px" style="vertical-align: middle;">
								<input type="file" name="B_Default_Image" class="xiaotu" onchange="bian(this)">
								<input type="button" value="添加默认图片" id="AddDefaultImg">
							</li>
						</div>
					</defaulttu>
					<li style="clear: both;">商品内容介绍：</li>
					<li><textarea rows="" cols="" name="content1" style="width: 978px;height: 400px"></textarea>
					<span id="content1" class="tishi"><img src='Image/Update_Image/info.png'> 用于物品的详细介绍！</span></li>
					<li><input type="reset" value="重新填写" name="buttom"><input type="submit" value="发布商品" name="buttom" onclick="return yanzheng()"></li>
				</ul>
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