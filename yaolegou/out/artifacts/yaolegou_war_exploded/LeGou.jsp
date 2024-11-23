<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>瑶乐购 - 童瑶乐购，购起来！</title>
    <link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
    <link type="text/css" rel="stylesheet" href="Css/LeGou_Style.css">
    <link type="text/css" rel="stylesheet" href="Css/DaiFuKuan.css">
    <script type="text/javascript" src="Js+JQuery/jquery-1.8.3.js"></script>
    <script type="text/javascript">
	    $(function (){
			$("#quxiao").click(function (){
				$("#beijing").fadeOut(300);
			})
			
			$("#beijing2").click(function (){
				$("#beijing2").fadeOut(300);
			})
			
			$("#queding").click(function (){
				var shenfen = $("[name=shenfen").val();
				var UserName = $(".UserName span").html();
				var d = new Date();
				if(shenfen == ""){
					alert("身份证号码不能为空！");
				}else if(d.getFullYear()-shenfen.substring(6,10) < 18){
					alert("未满18岁，不能开通店铺哦！");
				}else{
					/**
						在这里加个  金额扣除的 金额不够充值金额 金额够了 再让提交
					*/
					$.post("LeGou.do?State=Money",{"UserName":UserName},function (is){
						if(is == "true"){
							$.post("LeGou.do?State=exist",{"shenfen":shenfen},function(shenfens){
								if(shenfens == "true"){
									alert("注册失败，你已经用过这个身份证号了。");
								}else{
									$.post("LeGou.do?State=KaiTong",{"shenfen":shenfen,"UserName":UserName},function (Data){
										if(Data == "true"){
											window.open("LeGou.do","_self");
											alert("恭喜您，您的店铺开通成功");
										}else{
											alert("您的店铺开通失败。");
										}
									})
								}
							})
						}else{
							alert("对不起，开通店铺需要缴纳1500元的资金，您的资金不够，请充值资金。");
						}
					})
					
					
				}
			})
		})
		
		$(function (){
			var dian = $(".dian").val();
			if(dian == "0"){
				$("#zhu").css("height","440px");
			}
		})
		
		function kaitong(){
	    	$("#beijing").fadeIn(300);
	    }
	    
	    
    	function changeFrameHeight(){  
		    document.getElementById("iframe").height=0;  
		    document.getElementById("iframe").height=document.getElementById("iframe").contentWindow.document.body.scrollHeight;  
		}  
		
		window.onresize=function(){  
		     changeFrameHeight();  
		
		} 
		
		$(function (){
			$("#msg").mouseenter(function (){
				$("#xiaoxizhongxin").fadeIn("50");
			})
			
			$("#msg").mouseleave(function (){
				$("#xiaoxizhongxin").fadeOut("50");
			})
			
		})
		
		$(function (){
			$(".msg").click(function (){
				$(this).children().eq(0).css("color","green");
				var number = $(this).parent().children().eq(1).val();
				//通过ajax查询商品信息
				$.post("LeGou.do?State=msg",{"number":number},function (Data){
					var d = eval("("+Data+")");
					$("#biaoti").html(d[0].xxtz.title);
					$("#Contexts").html("&nbsp;&nbsp;&nbsp;&nbsp;"+d[0].xxtz.context);
					$("#dingdannumber").html(d[0].dingdannumber);
					
					/* $("#time").html(this.createtime); */
					$("#address").html(d[0].shaddress.city+" "+d[0].shaddress.address);
					$("#neirongs").empty();
					$.each(d,function (){
						
						var str="<tr >"+
						"	<td style='border-right: 1px #e5e5e5 solid;border-bottom:1px #e5e5e5 solid; width: 400px'>"+
						"		<div class='shop'>"+
						"			<img src='"+this.si.image+"' height='80'>"+
						"			<a href='#''>"+this.si.shopname+"</a>"+
						"		</div>"+
						"	</td>"+
						"	<td style='width: 180px;border-right: 1px #e5e5e5 solid;border-bottom:1px #e5e5e5 solid;' align='middle'>"+this.si.shopprice+"</td>"+
						"	<td style='width: 100px;border-right: 1px #e5e5e5 solid;border-bottom:1px #e5e5e5 solid;' align='middle'>"+this.ddxq.count+"</td>"+
						"	<td style='width: 200px;border-bottom:1px #e5e5e5 solid;' align='middle'>￥"+parseInt(this.si.shopprice) * parseInt(this.ddxq.count)+"<br/> 等待发货</td>";
						"</tr>";
						$(str).appendTo($("#neirongs"));
						
					})
					$("#beijing2").fadeIn();
				})
				
			})
			
			
			
		})
		
		$(function (){
			$(".UpdatePass").click(function (){
				$("#beijing3").show("100");
			})
			
			$("#xiuggai").click(function (){
				var mima = $("[name=mima]").val();
				var password = $("[name=yuanmima]").val();
				if(mima == password){
					var pass = $("[name=pass]").val();
					var rpass = $("[name=rpass]").val();
					if(pass == rpass){
						$.post("UpdateInfo.do?State=UpdatePass",{"pass":pass},function (){
							alert("修改成功。为了安全起见，请重新登录！");
							window.open("LeGou.do?State=Exit","_self");
						})
					}else{
						alert("两次输入的密码不一致。");
					}
				}else{
					alert("和原始密码不一样。");
				}
			})
		})
    </script>
</head>
<body>
<input type="hidden" name="mima" value="${user.password }">
<!-- 提示页 -->
<div id="beijing" style="display: none;">
	<div id="hei"></div>
	<div id="context">
		<dl>
			<dt><img alt="" src="Image/LeGou_Image/!.png"></dt>
			<dd>用户须知：</dd>
			<dd>&nbsp;&nbsp;&nbsp;&nbsp;开通店铺后，会向 瑶乐购 缴纳1500元租金，成功开通店铺后可永久使用。具体请看 <a href="#">瑶乐购金融条款</a></dd>
		</dl>
		<form action="javascript:void(0)">
			<p>
				身份账号：
				<input type="text" name="shenfen">
				<span> 18位身份证号码</span>
			</p>
			<input type="button" value="取消" id="quxiao">
			<input type="button" value="确定" id="queding">
		</form>
	</div>
</div>
<div id="beijing2" style="display: none">
	<div id="hei2"></div>
	<div id="context2">
		<dl id="xinxis">
			<dt><img alt="" src="Image/LeGou_Image/!.png"></dt>
			<dd id="biaoti">订单通知标题</dd>
			<dd id="Contexts">Context</dd>
		</dl>
		<table border="0" cellspacing= "0" cellpadding= "0" style="width:650px;">
				<thead>
					<tr>
						<td colspan="5"><span class="title">订单编号：</span><span id="dingdannumber">1234567891111</span> <span class="title">签收地址：</span><span id="address">河北省邯郸市</span></td>
					</tr>
				</thead>
				<tbody id="neirongs">
					
				</tbody>
			</table>
	</div>
</div>
<div id="beijing3" style="display: none;">
	<div id="hei3"></div>
	<div id="context3">
		<dl>
			<dt><img alt="" src="Image/LeGou_Image/!.png"></dt>
			<dd>修改密码：</dd>
			<dd>
				<form action="javascript:void(0)">
					<p>原&nbsp;&nbsp;密&nbsp;码：<input type="password" name="yuanmima"></p>
					<p>新&nbsp;&nbsp;密&nbsp;码：<input type="password" name="pass"></p>
					<p>确认密码：<input type="password" name="rpass"></p>
					<p>
						<input type="submit" id="xiuggai" value="修改" style="background: #ff3366;color: #fff;padding: 3px 10px;border: 0px;float: left;margin-top: 10px;">
						<input type="button" value="取消" onclick="$('#beijing3').hide('100');" style="background: #ff3366;color: #fff;padding: 3px 10px;border: 0px;float: left;margin-left: 20px;margin-top: 10px;">
					</p>
				</form>
			</dd>
		</dl>
	</div>
</div>
<!-- **********************头部*********************** -->
<header>
    <div id="div_back">
        <div id="div_ul">
            <ul>
                <li onmousemove="wzfl()" onclick="window.open('index.do')"><img src="Image/GoWuChe_Image/XiaoFangzi.png" alt="" style="vertical-align: middle;margin-right: 5px;">返回首页</li>
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
    				<li style="position: relative;float: right;cursor: pointer;padding-bottom: 10px;" id="msg">消息（您有${msgcount }条新消息）
    					<div id="xiaoxizhongxin" style="display: none;">
    						<p>消息中心</p>
    						<ul>
    							
    							<c:forEach var="xl" items="${xxtzList }">
    								<c:if test="${xl.state == 1 }">
    									<li><a href="javascript:void(0)" class="msg">${xl.title } <span class="state">(未读)</span> ${xl.createtime }</a><input type="hidden" value="${xl.dingdannumber }"></li>
    									
    								</c:if>
    								<c:if test="${xl.state == 0 }">
    									<li><a href="javascript:void(0)" class="msg">${xl.title } <span class="state2">(已读)</span> ${xl.createtime }</a><input type="hidden" value="${xl.dingdannumber }"></li>
    								</c:if>
    							</c:forEach>
    						</ul>
    					</div>
    				</li>
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
				<dt><img alt="" src="Image/LeGou_Image/gwc.gif">我的购物车(<span name="count">${count }</span>)</dt>
			</dl>
			<dl>
				<dt><img alt="" src="Image/LeGou_Image/xq.gif">个人中心</dt>
				<dd><a href="javascript:void(0)" class="UpdatePass">修改密码</a></dd>
				<dd><a href="#">退出登录</a></dd>
			</dl>
			<dl>
				<dt><img alt="" src="Image/LeGou_Image/jq.png">我的订单</dt>
				<dd><a href="DaiFuKuan.do?UserName=${user.username }" target="_blank">待付款(<span name="count">${DaiFuKuanCount }</span>)</a></dd>
				<dd><a href="DaiShouHuo.do?UserName=${user.username }" target="_blank">待收货(<span name="count">${DaiShouHuo }</span>)</a></dd>
				<dd><a href="YiWanCheng.do?UserName=${user.username }" target="_blank">已完成(<span name="count">${YiWanChengCount }</span>)</a></dd>
			</dl>
			<c:if test="${ui.isdianpu == 1 }">
				<dl>
					<dt><img alt="" src="Image/LeGou_Image/xq.gif">我的店铺商城</dt>
					<dd><a href="FaBuShop.do?UserName=${ui.username }">发布商品</a></dd>
					<dd><a href="#">查看商品</a></dd>
					<dd><a href="#">管理商品</a></dd>
					<dd><a href="#">个人商城首页</a></dd>
				</dl>
				<dl>
					<dt><img alt="" src="Image/LeGou_Image/xq.gif">卖家管理</dt>
					<dd><a href="DingHuoTongZhi.do?UserName=${user.username }"">订货通知(<span name="count">${DingHuoTongZhiCount }</span>)</a></dd>
					<dd><a href="#">交易完成的商品</a></dd>
				</dl>
				<dl>
					<dt><img alt="" src="Image/LeGou_Image/xq.gif">信息统计</dt>
					<dd><a href="#">统计销量</a></dd>
					<dd><a href="#">统计查看次数</a></dd>
					<dd><a href="#">管理商品</a></dd>
				</dl>
			</c:if>
		</div>
		<div id="right">
			<div class="info">
				<dl>
					<dt onclick="window.open('LeGou.do?State=Update');" style="cursor: pointer;"><img alt="" title="修改资料" src="${ui.image }" class="yuan" width="94px"></dt>
					<dd style="font-weight: bold">${ui.usernick }</dd>
					<dd>手机号码：${ui.phone }</dd>
					<dd>邮箱号码：${ui.email==null?'您还没有填写邮箱':ui.email }</dd>
				</dl>
			</div>
			<div class="info">
				<dl>
					<dd class="UserName">乐购ID：<span>${ui.username }</span></dd>
					<dd>金额：${ui.money } <a href="LeGou.do?State=AddMoney&UserName=${ui.username }">充值</a><a href="#">提现</a></dd>
					<dd>店铺余额：${ui.dianpumoney } <a href="#">充值</a><a href="#">提现</a></dd>
				</dl>
				<dl>
					<dd>是否是店铺账号：<span style="color:red;">${ui.isdianpu==0?'不是':'是' }</span></dd>
					<dd>商城共有：<span name="count">${row }</span> 件商品 </dd>
					<dd><a href="javascript:" class="UpdatePass">修改密码</a><a href="LeGou.do?State=Exit" onclick="return confirm('确认退出吗？'')">退出登录</a></dd>
					<dd></dd>
				</dl>
			</div>
			<div id="zhu">
				<p>我的店铺商城<span style="margin-left: 20px;">表格视图</span><span style="background: #ff3366;color: #fff">商品视图</span></p>
				<iframe src="ShopView.do?UserName=${ui.username }" id="iframe" onload="changeFrameHeight()" scorlling="no" name="adds" frameborder="0" width="100%"></iframe>
				<input type="hidden" value="${ui.isdianpu }" class="dian">
				<c:if test="${ui.isdianpu == 0 }">
					<div id="shop">
					<div id="tishi2">
						<img src="Image/LeGou_Image/Shop.png" width="90px;">
						<p>您的店铺还未开通哦！~</p>
						<span onclick="kaitong()">开通店铺</span>
					</div>
				</div>
				</c:if>
			</div>
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