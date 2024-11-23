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
    <title>瑶乐购 - 购物车</title>
    <link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
    <link type="text/css" rel="stylesheet" href="Css/GouWuChe_Style.css">
    <script type="text/javascript" src="Js+JQuery/jquery-1.12.4.js"></script>
    <script src="Js+JQuery/GouWuChe.js" type="text/javascript"></script>
    <script type="text/javascript">
    	$(function (){
    		$(".shop").load(jiesuan());
    	})
    	
    	function jiesuan(){
    		var prices=document.getElementsByName("yuanjiage");
    	    var count=document.getElementsByName("count");
    	    var danjia=document.getElementsByName("danjia");
    	    for(var i = 0;i < prices.length;i++){
    	    	$(danjia[i]).html("￥"+$(prices[i]).html()*$(count[i]).val()+".0");
    	    }
    	}
    	
    	

    </script>
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
                	<c:if test="${ empty user.userNick}">
  						<li class="login_DengLu" id="denglu">您好，请登录</li>
  					</c:if>
  					<c:if test="${ not empty user.userNick}">
  						<li class="xia">${user.userNick}
  							<div class="div_wzdh" onmouseout="wzfl_lk()">
	  							<a href="LeGou.do?UserName=${user.userName}">个人管理</a>
	  							<a href="LeGou.do?State=Exit">退出账号</a>
	  						</div>
  						</li>
  					</c:if>
                <li>注册</li>
                <li class="xia">我的订单 <img src="Image/xiala2.png" alt=""></li>
                <li><img src="Image/Index_Image/xiaogouwuche.png" alt=""> 购物车</li>
                <li>企业采购</li>
            </ul>
        </div>
        <div id = "DaoHang">
            <div class="one">
                <img src="Image/Index_Image/logo.png" alt="">
                
            </div>

            <div class="two">
                <img src="Image/Index_Image/serach.png">
                <input type="text" id="text"><a href="#">搜索</a>
            </div>
        </div>
    </div>
</header>
<!--**********************主体*****************************-->
<section>

	<c:if test="${ empty user.userName && GouWuChelist != null}">
		<div id="kongde">
			<div id="neirong">
				<img src="Image/GoWuChe_Image/gwc1.png" width="120px;">
				<span>您还未登录哦，请登录后在查看。</span>
			</div>
		</div>
	</c:if>
	<c:if test="${ not empty user.userName && empty GouWuChelist }">
		<div id="kongde">
			<div id="neirong">
				<img src="Image/GoWuChe_Image/gwc1.png" width="120px;">
				<span>您的购物车是空的，去商城看看吧。</span>
			</div>
		</div>
	</c:if>
	
	<c:if test="${ not empty user.userName && not empty GouWuChelist }">
		<div id="zongde">
			<div id="caida">
		        <p>
		            <input type="checkbox" name="checks" onchange="dian(this.checked)" checked="checked">全选
		        </p>
		        <ul>
		            <li>商品信息</li>
		            <li>规格</li>
		            <li>单价（元）</li>
		            <li>数量</li>
		            <li>小计（元）</li>
		            <li>操作</li>
		        </ul>
		    </div>
		    <%
			  	//生成10位订单随机数
			  	String DingDanNumber = "";
				int suiji = 0;
				Random random = new Random();
				for (int i = 0; i < 13; i++) {
					suiji = random.nextInt(9);
					DingDanNumber += suiji;
				}	
		    %>

            <form action="Shopcart?State=submit&UserName=${user.userName }&DingDanNumber=<%=DingDanNumber %>" method="post" id="form">

		    <c:forEach var="shopinfo" items="${GouWuChelist}">
		    	<div class="shop" style="background-color: rgb(255, 251, 242);">
		    		<input type="hidden" name="ids" value="${shopinfo.id }">
			    	<input type="hidden" name="usernames" value="${shopinfo.zhuRenUser }">
			    	<input type="hidden" name="shopid" value="${shopinfo.shopId }">
			    	<input type="hidden" name="shangpincount" vlaue="">
			        <input type="hidden" name="shangpincolor" vlaue="">
			        <input type="hidden" name="shangpinprice" vlaue="">
			        <input type="hidden" name="shangpinchicun" vlaue="">
			    	<p class="xuan"> 
			    		<input type="checkbox" class="check" name="check" onclick="checks(this)" checked="checked" >
			    	</p>
			    	<img src="${shopinfo.image }" alt="">
			     	<span>${shopinfo.shopName }</span>
			     	<div class="guige">
			     		<p>尺码：<chima>${shopinfo.chiCun }</chima></p>
			      		<p>颜色：<chima>${shopinfo.color }</chima></p>
			      	</div>
			      	<div class="money">
			       		<p name="yuanjiage">${shopinfo.price }</p>
			       	</div>
			        <div class="number">
			        	<div class="input">
				        	<input type="button" value="-" name="jian" onclick="jiancount(this);">
				        	<input type="text" value="${shopinfo.count }" name="count">
				        	<input type="button" value="+" name="jia" onclick="addcount(this);">
			        	</div>
			        </div>
			        <div class="xiaoji">
			        	<strong id="zongjia0" class="danjia" name="danjia">￥<jiage>${shopinfo.price }</jiage></strong>
			        </div>
			        <div class="caozuo">
			         	<p onclick="deletes(this)">删除</p>
			         	<input type="hidden" name="username" value="${shopinfo.userName }">
			         	<input type="hidden" name="id" value="${shopinfo.id }">
			        	<p>移入收藏</p>
			        </div>
			     </div>
		    </c:forEach>
		    <div id="state">
		        <a href="#">已选中<span class="shuliang">0</span>件商品</a>
		        <div id="right">
		            <span id="js" style="cursor: pointer;background: #ff3366" onclick="yanzheng()">去结算</span>
		            <div id="jg">
		                <p>总价（含运费）<span id="jg2">￥0.00</span></p>
		                <p>运费（以结算页为准）：¥0.00</p>
		            </div>
		            <div class="xians"></div>
		        </div>
		
		    </div>
		    </form>
		</div>
	</c:if>
    <div id="like">
        猜你喜欢
    </div>
    <div id="likes">
        <div id="width">
            <dl style="margin-left: 11px">
                <dt><img src="Image/GoWuChe_Image/1.jpg" height="160" width="160" class="imgs"/></dt>
                <dd>￥<span class="jg">121.00</span><span class="gm" style="color: #999;float: right;margin-right: 20px;margin-top: 5px"><c style="color: black">141</c>人已购买</span></dd>
                <dd><span>自营</span><text>美特斯邦威短袖打底衫男士内衣舒适纯色V领半袖韩版</text></dd>
                <dd class="jiarugouwuches"><img src="Image/GoWuChe_Image/gwc.png" alt="" class="jiarugouwuches">加入购物车</dd>
            </dl>
            <dl>
                <dt><img src="Image/GoWuChe_Image/2.jpg" alt="" width="160px" height="160px"  class="imgs"></dt>
                <dd>￥<span class="jg">89.50</span><span class="gm" style="color: #999;float: right;margin-right: 20px;margin-top: 5px"><c style="color: black">141</c>人已购买</span></dd>
                <dd><span>自营</span><text>2018新款茉莉卡没其他夏季连衣裙修身条纹中长款蕾丝露肩裙</text></dd>
                <dd class="jiarugouwuches"><img src="Image/GoWuChe_Image/gwc.png" alt="" class="jiarugouwuches">加入购物车</dd>
            </dl>
            <dl>
                <dt><img src="Image/GoWuChe_Image/3.jpg" alt="" width="160px" height="160px"  class="imgs"></dt>
                <dd>￥<span class="jg">299.00</span><span class="gm" style="color: #999;float: right;margin-right: 20px;margin-top: 5px"><c style="color: black">141</c>人已购买</span></dd>
                <dd><span>自营</span><text>裂锦2018新款娃娃领无袖刺身裙子双层小A字连衣裙</text></dd>
                <dd class="jiarugouwuches"><img src="Image/GoWuChe_Image/gwc.png" alt="" class="jiarugouwuches">加入购物车</dd>
            </dl>
            <dl>
                <dt><img src="Image/GoWuChe_Image/4.jpg" alt="" width="160px" height="160px" class="imgs"></dt>
                <dd>￥<span class="jg">258.80</span><span class="gm" style="color: #999;float: right;margin-right: 20px;margin-top: 5px"><c style="color: black">141</c>人已购买</span></dd>
                <dd><span>自营</span><text>韩国纯色加绒卫衣秋冬新款小高领宽松长袖女装打底衫 蓝色卫</text></dd>
                <dd class="jiarugouwuches"><img src="Image/GoWuChe_Image/gwc.png" alt="" class="jiarugouwuches">加入购物车</dd>
            </dl>
            <dl>
                <dt><img src="Image/GoWuChe_Image/5.jpg" alt="" width="160px" height="160px" class="imgs"></dt>
                <dd>￥<span class="jg">230.00</span><span class="gm" style="color: #999;float: right;margin-right: 20px;margin-top: 5px"><c style="color: black">141</c>人已购买</span></dd>
                <dd><span>自营</span><text>马连杀短袖T恤女新款韩版假背带夏季学生宽松bf风上衣 白色</text></dd>
                <dd class="jiarugouwuches"><img src="Image/GoWuChe_Image/gwc.png" alt="" class="jiarugouwuches">加入购物车</dd>
            </dl>
            <dl>
                <dt><img src="Image/GoWuChe_Image/6.jpg" alt="" width="160px" height="160px" class="imgs"></dt>
                <dd>￥<span class="jg">790.00</span><span class="gm" style="color: #999;float: right;margin-right: 20px;margin-top: 5px"><c style="color: black">141</c>人已购买</span></dd>
                <dd><span>自营</span><text>单人节夏季2018香港风糖果色五分裤十色速干沙滩裤</text></dd>
                <dd class="jiarugouwuches"><img src="Image/GoWuChe_Image/gwc.png" alt="" class="jiarugouwuches">加入购物车</dd>
            </dl>
            <dl>
                <dt><img src="Image/GoWuChe_Image/7.jpg" alt="" width="160px" height="160px" class="imgs"></dt>
                <dd>￥<span class="jg">569.00</span><span class="gm" style="color: #999;float: right;margin-right: 20px;margin-top: 5px"><c style="color: black">141</c>人已购买</span></dd>
                <dd><span>自营</span><text>师臣SHICHEN夏季2018年新款短袖T恤套装韩版休闲运动</text></dd>
                <dd class="jiarugouwuches"><img src="Image/GoWuChe_Image/gwc.png" alt="" >加入购物车</dd>
            </dl>
            <dl>
                <dt><img src="Image/GoWuChe_Image/8.jpg" alt="" width="160px" height="160px" class="imgs"></dt>
                <dd>￥<span class="jg">188.00</span><span class="gm" style="color: #999;float: right;margin-right: 20px;margin-top: 5px"><c style="color: black">141</c>人已购买</span></dd>
                <dd><span>自营</span><text>裂帛2018夏季圆领半开裙中袖玫瑰简化衬衣</text></dd>
                <dd class="jiarugouwuches"><img src="Image/GoWuChe_Image/gwc.png" alt="" class="jiarugouwuches">加入购物车</dd>
            </dl>
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