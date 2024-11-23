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
    
    <title>
	    <c:forEach var="title" items="${JiBenInfoList }">
	    	<c:if test="${title.key == 'Title' }">${title.value }</c:if>
	    </c:forEach>
	</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
	<link type="text/css" rel="stylesheet" href="Css/ShouYe_Style.css">
	
	
	
	<script type="text/javascript" src="Js+JQuery/jquery-1.12.4.js"></script>
    <script src="Js+JQuery/ShouYe.js" type="text/javascript"></script>
    <script src="Js+JQuery/jquery.idcode.js" type="text/javascript"></script>
    <script src="Js+JQuery/jquery.adipoli.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    	$(function (){
    		$("#tijiao").click(function (){
    			//获取用户名和密码
    			var UserName = $("[name=UserName]").val();
    			var PassWord = $("[name=PassWord]").val();
    			//执行异步请求
    			$.post("index",{"UserName":UserName,"PassWord":PassWord},function (Data){
    				if(Data == "true"){
    					//加载页面
    					window.open("index","_self");
    				}else if(Data == "dongjie"){
    					$("#text").html("您的账号已违规法律暂被停用！");
    					$("#beijing").fadeIn("300");
    				}else{
    					$("#beijing").fadeIn("300");
    				}
    			})
    		})
    		
    		//关闭提示背景
    		$("#beijing").click(function (){
    			$(this).fadeOut("300");
    			setTimeout(3,function (){
    				alert();
    				$("#beijing").fadeOut("300");
    			});
    		})
    	})
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
			<dd id="text">账号或密码错误！</dd>
		</dl>
	</div>
</div>
<!----------------------------------------------------  -->
  <div id="music">
  <p id="jian">></p>
  	<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width="330" height="450"
        src="http://music.163.com/outchain/player?type=0&amp;id=2319418051&amp;auto=1&amp;height=430" style="line-height:1.5;">
	</iframe>
  </div>
  	
  	<ul id="dingbu" style="display: none">
  		
  		<li onclick="window.open('tencent://message/?Menu=yes&uin=1973689961& Service=300&sigT=45a1e5847943b64c6ff3990f8a9e644d2b31356cb0b4ac6b24663a3c8dd0');">
  			<div id="backhei"></div>
  			<div class="quan">
  				<img src="Image/kf.png" width="45px">
  				<p>联系站长</p>
  			</div>
  		</li>
  		
  		<li onclick="gotoTop();return false;">
  			<div id="backhei"></div>
  			<div class="quan">
  				<img src="Image/zhiding.png" width="45px">
  				<p>返回顶部</p>
  			</div>
  		</li>
  	</ul>
  	<!-- **********************头部*********************** -->
  	<div id="login_back">
  		<div id="BackColor"></div>
  		<div id="login"  style="display: none">
  			<div style="overflow: hidden;height: 380px">
  				<img src="Image/Index_Image/denglutu.jpg">
  			</div>
  			<div id="guan"><guan>×</guan></div>
  			<div id="biaodan">
  				
  				<p>新用户登录</p>
	  			<form action="javascript:void(0)">
				    <input type="text" name="UserName" placeholder="手机号/邮箱/乐购ID">
				   	<biao style="font-size:12px;color:red;width:350px;display:inline-block;margin:3px 0px;margin-left:50px;" id="shouji">&nbsp;</biao>
				    <input type="password" name="PassWord" placeholder="输入您的密码">
				    <biao style="font-size:12px;color:red;width:350px;display:inline-block;margin:3px 0px;margin-left:50px;" id="mima">&nbsp;</biao>
				    <input type="text" name="yzm" placeholder="验证码" id="yzm">
				    <span id="idcode">验证码初始化</span>
				    <biao style="font-size:12px;color:red;width:350px;display:inline-block;margin:3px 0px;margin-left:50px;" id="yz">&nbsp;</biao>
				    <hang><input type="checkbox" name="gou" id="fws">同意 瑶乐购 服务条款<gou id="gou" style="margin-left:20px;color:red;display:none;">请勾选服务条款</gou><a href="reg1.jsp" target="_blank">注册账号</a></hang>
				    <input type="submit" name = "submit" value="登 录" id="tijiao">
				</form>
				
  			</div>
  		</div>
  	</div>
  	<header>
  		<div id="div_back">
  			<div id="div_ul">
  				<ul>
  					<li onmousemove="wzfl()">网站分类</li>
  					<li>商家入驻</li>
  					<li>客户服务</li>
  				</ul>
  				<ul  class="daohang" style="float:right">
  					<%-- <c:set var="student" value="1" scope="session"></c:set> --%>
  					<c:if test="${ empty user}">
  						<li class="login_DengLu" id="denglu">您好，请登录</li>
  					</c:if>
  					<c:if test="${ not empty user}">
  						<li class="xia">${user.userNick}
  							<div class="div_wzdh" onmouseout="wzfl_lk()">
	  							<a href="LeGou.do?UserName=${user.userName}" target="_black">个人管理</a>
	  							<a href="LeGou.do?State=Exit">退出账号</a>
	  						</div>
  						</li>
  					</c:if>


  					<li onclick="window.open('reg1.jsp')">注册</li>
  					<li class="xia">我的订单 <img src="Image/xiala2.png" alt=""></li>
  					<li onclick="window.open('Shopcart?UserName=${user.userName}')"><img src="Image/Index_Image/xiaogouwuche.png" alt=""> 购物车</li>
  					<li>企业采购</li>
  				</ul>
  			</div>
  			<div id = "DaoHang">
  				<div class="one">
  					<img src="Image/Index_Image/logo.png" alt="">
  				</div>
  				
  				<div class="two">
  					<form action="Serach.do" method="post" id="serach" target="_black">
  						<img src="Image/Index_Image/serach.png">
  						<input type="text" placeholder="看看搜点什么" name="sousuo"><p onclick="$('[id=serach]').submit()">搜 索</p>
        			</form>
        			<ul>
						<li class="style"><a href="shoplist">上衣</a></li>
        				<li class="shu" style="padding: 0px 10px;color: #ddd">|</li>
        				<li class="style">裤子</li>
        				<li class="shu" style="padding: 0px 10px;color: #ddd">|</li>
        				<li class="style">哈伦裤</li>
        				<li class="shu" style="padding: 0px 10px;color: #ddd">|</li>
        				<li class="style">连衣裙</li>
        				<li class="shu" style="padding: 0px 10px;color: #ddd">|</li>
        				<li class="style">童装</li>
        				<li class="shu" style="padding: 0px 10px;color: #ddd">|</li>
        			</ul>
  				</div>
  			</div>
  			<div id="DaoHangTiao_back">
  				<div id = "DaoHangTiao">
  					<ul id="ul">
	  					<c:forEach var="dht" items="${DaoHangTiaoList }">
	  						<c:if test="${dht.isTingYong == 0 }">
	  							<li class="xianshi" value="${dht.id }"><a href="${dht.href }" target="_blank">${dht.daohangtiaoname }</a></li>
	  						</c:if>
	  					</c:forEach>
	  					
				    </ul>
  				</div>
  				<div id="daohangs">
  					<div style="width: 1220px;height: 300px;margin: 0px auto;">
  						<p id="tishis" style="font-size: 14px;color: #666;margin-top: 5px;margin-left: 10px;padding-top: 5px;">买的最多</p>
  						<div id="infos">
  							
  						</div>
  					</div>
	  			</div>
  			</div>
  		</div>
  	</header>
  	
  	<!-- **********************身体*********************** -->
  	<section>
		<!-- 轮播广告 -->
		<div id="banner_tabs" class="flexslider">
			<ul class="slides">
				<c:forEach var="banner" items="${BannerList}">
					<c:if test="${banner.isTingYong == 0 }">
						<li>
							<a title="" target="_blank" href="${banner.href}">
								<img width="1920" height="339" alt="" style="background: url(${banner.image}) no-repeat center;backgroundsize:1200px">
								<div style="background: ${banner.bgColor}" id="color">
								</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</ul>
			<ul class="flex-direction-nav">
				<li><a class="flex-prev" href="javascript:;">Previous</a></li>
				<li><a class="flex-next" href="javascript:;">Next</a></li>
			</ul>
			<ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
				<c:forEach var="banner" items="${BannerList}">
					<c:if test="${banner.isTingYong == 0 }">
						<li><a>1</a></li>
					</c:if>
				</c:forEach>
			</ol>
		</div>

  		<div class="quickEntryBox" style="">
        <ul class="boxBody">
            <li>
                <div class="boxBorder">
                    <div class="frontBg">
                        <a href="">
                            <img class="frontBg_1"   src="Image/Index_Image/IndexImage/i1.png" alt="">
                            <img class="frontBg_2"   src="Image/Index_Image/IndexImage/b1.png" alt="">
                        </a>
                    </div>
                    <div class="zhehao" style=""></div>
                    <div class="fasticon" style=" ">
                        <img  src="Image/Index_Image/IndexImage/i11.jpg" alt="">
                    </div>
                    <div class="backBg" style="">
                        <img src="Image/Index_Image/IndexImage/back1.jpg" alt="" width="264px" >
                    </div>
                </div>
            </li>
            <li>
                <div class="boxBorder">
                    <div class="frontBg">
                        <a href="">
                            <img class="frontBg_1"  src="Image/Index_Image/IndexImage/i2.png" alt="">
                            <img class="frontBg_2"   src="Image/Index_Image/IndexImage/b2.png" alt="">
                        </a>
                    </div>
                    <div class="zhehao" style=""></div>
                    <div class="fasticon" style=" ">
                        <img  src="Image/Index_Image/IndexImage/i22.jpg" alt="">
                    </div>
                    <div class="backBg" style="">
                        <img src="Image/Index_Image/IndexImage/back2.jpg" alt="" width="264px">
                    </div>
                </div>
            </li>
            <li>
                <div class="boxBorder">
                    <div class="frontBg">
                        <a href="">
                            <img class="frontBg_1"  src="Image/Index_Image/IndexImage/i3.png" alt="">
                            <img class="frontBg_2"   src="Image/Index_Image/IndexImage/b33.png" alt="">
                        </a>
                    </div>
                    <div class="zhehao" style=""></div>
                    <div class="fasticon" style=" ">
                        <img  src="Image/Index_Image/IndexImage/i33.png" alt="">
                    </div>
                    <div class="backBg" style="">
                        <img src="Image/Index_Image/IndexImage/back3.jpg" alt="" width="264px">
                    </div>
                </div>
            </li>
            <li>
                <div class="boxBorder">
                    <div class="frontBg">
                        <a href="">
                            <img class="frontBg_1"  src="Image/Index_Image/IndexImage/i4.png" alt="">
                            <img class="frontBg_2"   src="Image/Index_Image/IndexImage/b4.png" alt="">
                        </a>
                    </div>
                    <div class="zhehao"></div>
                    <div class="fasticon">
                        <img  src="Image/Index_Image/IndexImage/i44.jpg" alt="" >
                    </div>
                    <div class="backBg" style="">
                        <img src="Image/Index_Image/IndexImage/back4.jpg" alt="" width="264px">
                    </div>
                </div>
            </li>
        </ul>
    </div>
    
  		
  		
  		<div class="hui""><!-- 设置灰背景 -->
	  		<div class="zhong"><!-- 主体的总div -->
	  				<div id="MiaoSha_section"><!-- 秒杀商品的div -->
				  		<div id="MiaoSha_one">
			  				<p>童瑶秒杀</p>
			  				<p>FLASH DEALS</p>
			  				<p><img src="Image/Index_Image/shandian.png"></p>
			  				<p>本场距离结束还剩</p>
			  				<div class="aui-sale-count">
								<div class="aui-sale-count-item">
									<span id="hour_show">00时</span>
								</div>
								<div class="aui-sale-count-item">
									<span id="minute_show">00分</span>
								</div>
								<div class="aui-sale-count-item">
									<span id="second_show">00秒</span>
								</div>
							</div>
			  			</div>
			  			<div id="MiaoSha_two">
			  				<div id="kuan">
			  					<dl>
			  					<dt><img src="Image/Index_Image/ShangPin/1.jpg" alt="哎呀，图片不小心没了。刷新下试试吧！" width="140px"></dt>
			  					<dd>芳妮诗胖mm2018夏季清新...</dd>
			  					<dd>现：<span>35.00</span> 原价：<span>99.00</span></dd>
			  				</dl>
			  				<dl>
			  					<dt><img src="Image/Index_Image/ShangPin/2.jpg" alt="哎呀，图片不小心没了。刷新下试试吧！" width="140px"></dt>
			  					<dd>芊婕防晒衣女中长款2清新...</dd>
			  					<dd>现：<span>55.20</span> 原价：<span>86.00</span></dd>
			  				</dl>
			  				<dl>
			  					<dt><img src="Image/Index_Image/ShangPin/3.jpg" alt="哎呀，图片不小心没了。刷新下试试吧！" width="140px"></dt>
			  					<dd>夏季新款女装连衣裙清新...</dd>
			  					<dd>现：<span>90.00</span> 原价：<span>200.00</span></dd>
			  				</dl>
			  				<dl>
			  					<dt><img src="Image/Index_Image/ShangPin/4.jpg" alt="哎呀，图片不小心没了。刷新下试试吧！" width="140px"></dt>
			  					<dd>袖驰短袖t恤女宽松下清新...</dd>
			  					<dd>现：<span>450.00</span> 原价：<span>890.00</span></dd>
			  				</dl>
			  				<dl>
			  					<dt><img src="Image/Index_Image/ShangPin/5.jpg" alt="哎呀，图片不小心没了。刷新下试试吧！" width="140px"></dt>
			  					<dd>南星点点t恤女短袖201清新...</dd>
			  					<dd>现：<span>399.00</span> 原价：<span>566.00</span></dd>
			  				</dl>
			  				<dl>
			  					<dt><img src="Image/Index_Image/ShangPin/6.jpg" alt="哎呀，图片不小心没了。刷新下试试吧！" width="140px"></dt>
			  					<dd>北极绒 2018夏装新款女清新...</dd>
			  					<dd>现：<span>50.00</span> 原价：<span>133.00</span></dd>
			  				</dl>
			  				<dl>
			  					<dt><img src="Image/Index_Image/ShangPin/7.jpg" alt="哎呀，图片不小心没了。刷新下试试吧！" width="140px"></dt>
			  					<dd>MAN2018夏季牛仔短裙女清新...</dd>
			  					<dd>现：<span>120.00</span> 原价：<span>265.00</span></dd>
			  				</dl>
			  				<dl>
			  					<dt><img src="Image/Index_Image/ShangPin/8.jpg" alt="哎呀，图片不小心没了。刷新下试试吧！" width="140px"></dt>
			  					<dd>春漫里短袖T恤女装清新...</dd>
			  					<dd>现：<span>19.00</span> 原价：<span>35.00</span></dd>
			  				</dl>
			  				</div>
			  				<!-- <span id="righs"><</span>
			  				<span id="lefts">></span> -->
			  			</div>
			  			<div id="MiaoSha_Three">
			  				<img src="Image/Index_Image/s_1.jpg" width="170px" height="255px" style="margin: 10px 0px 0px 10px" class="RightImage"/>
			  				<img src="Image/Index_Image/s_2.jpg" width="170px" height="255px" style="margin: 10px 0px 0px 10px" class="RightImage"/>
			  				<ul>
						        <li class="curr"></li>
						        <li></li>
    						</ul>
			  			</div>
		  			</div>
	  		</div>
  		</div>
  		<div class="hui">
  		<div class="wenzi" style="display: none" id="wenzi1"><p>精美上衣<span>BEAUTY&PERSONAL CARE</span></p></div>
  			<div class="zhuti"  style="display: none" id="zhuti1">
  				<img src="Image/Index_Image/ShangYi/shangyi.jpg" width="230px" height="614px" class="ban">
  				<div class="zhuti_one">
  					<div class="baokuan">
  						<ul>
  							<li style="color: #fff;background-color: #ff3366">好物推荐</li>
  							<li>今日爆款</li>
  						</ul>
  						<img src="Image/Index_Image/ShangYi/banner.jpg" style="margin-left: 10px;margin-top: 10px" width="448px">
  					</div>
					<c:forEach items="${ShouYeShopList1 }" var="sysl" begin="0"    end="1">
  						<div onclick="window.open('ShangYi.do?State=Select&ShopId=${sysl.shopid }')" style="width: 227px;cursor:position;height: 300px;overflow: hidden; float: left;margin-left: 12px;cursor: pointer;" >
							<dl class="tus">
							  	<dt><img src="${sysl.si.image }" width="180" height="180px"></dt>
							  	<dd style="overflow: hidden;height: 40px;">${sysl.si.shopname }</dd>
							  	<dd></dd>	
							  	<dd>￥${sysl.si.shopprice }</dd>
							</dl>
						</div>
  					</c:forEach>
  				</div>
  				<div class="zhuti_one">
  					<c:forEach items="${ShouYeShopList1 }" var="sysl" begin="2"    end="7">
  						<div onclick="window.open('ShangYi.do?State=Select&ShopId=${sysl.shopid }')"  style="width: 227px;height: 300px;overflow: hidden; float: left;cursor: pointer;" class="shangpins">
							<dl class="tus">
							  	<dt><img src="${sysl.si.image }" width="180" height="180px"></dt>
							  	<dd style="overflow: hidden;height: 40px;">${sysl.si.shopname }</dd>
							  	<dd></dd>	
							  	<dd>￥${sysl.si.shopprice }</dd>
							  	<em></em>
							</dl>
						</div>
					</c:forEach>
  				</div>
  			</div>
  			<div class="wenzi" style="display: none" id="wenzi2"><p>精美裤子<span>BEAUTY&PERSONAL CARE</span></p></div>
  			<div class="zhuti" style="display: none" id="zhuti2">
  				<img src="Image/Index_Image/KuZi/kuzi.jpg" width="230px" height="614px" class="ban">
  				<div class="zhuti_one">
  					<div class="baokuan">
  						<ul>
  							<li style="color: #fff;background-color: #ff3366">好物推荐</li>
  							<li>今日爆款</li>
  						</ul>
  						<img src="Image/Index_Image/KuZi/banner.jpg" style="margin-left: 10px;margin-top: 10px" width="448px">
  					</div>
  					<c:forEach items="${ShouYeShopList2 }" var="sysl" begin="0"    end="1">
  						<dl onclick="window.open('ShangYi.do?State=Select&ShopId=${sysl.shopid }')"  style="margin-left: 9px;">
						  	<dt><img  class="img-style row3" src="${sysl.si.image }" width="180" height="180px"></dt>
						  	<dd style="overflow: hidden;height: 40px;">${sysl.si.shopname }</dd>
						  	<dd></dd>
						  	<dd>￥${sysl.si.shopprice }</dd>
						</dl>
  					</c:forEach>
  				</div>
  				<div class="zhuti_one">
  					<c:forEach items="${ShouYeShopList2 }" var="sysl" begin="2"    end="7">
  						<dl onclick="window.open('ShangYi.do?State=Select&ShopId=${sysl.shopid }')"  style="margin-right: 10px;">
						  	<dt><img  class="img-style row3" src="${sysl.si.image }" width="180" height="180px"></dt>
						  	<dd style="overflow: hidden;height: 40px;">${sysl.si.shopname }</dd>
						  	<dd></dd>
						  	<dd>￥${sysl.si.shopprice }</dd>
						</dl>
  					</c:forEach>
  				</div>
  			</div>
  			<div class="wenzi" style="display: none" id="wenzi3"><p>精美鞋子<span>BEAUTY&PERSONAL CARE</span></p></div>
  			<div class="zhuti" style="display: none"  id="zhuti3">
  				<img src="Image/Index_Image/Xie/xie.jpg" width="230px" height="614px" class="ban">
  				<div class="zhuti_one">
  					<div class="baokuan">
  						<ul>
  							<li style="color: #fff;background-color: #ff3366">好物推荐</li>
  							<li>今日爆款</li>
  						</ul>
  						<img src="Image/Index_Image/Xie/banner.png" style="margin-left: 10px;margin-top: 10px" width="448px">
  					</div>
  					
  					<div class="wrapper">
						<ul>
							<c:forEach items="${ShouYeShopList3 }" var="sysl" begin="0"    end="1">
								<li style="margin-left: 11px;" onclick="window.open('ShangYi.do?State=Select&ShopId=${sysl.shopid }')" >
								<div class='picBox'>
									<div class='show'>
										<dl>
					  						<dt><img src="${sysl.si.image }" width="180" height="180px"></dt>
					  						<dd style="overflow: hidden;height: 40px;">${sysl.si.shopname }</dd>
										  	<dd></dd>
										  	<dd>￥${sysl.si.shopprice }</dd>		
							  			</dl>
									</div>
								</div>
							</li>
		  					</c:forEach>
						</ul>
					</div>
					
					
  					
  				</div>
  				<div class="zhuti_one">
  					<div class="wrapper">
						<ul>
							<c:forEach items="${ShouYeShopList3 }" var="sysl" begin="2"    end="7">
								<li style="margin-left: 7px;" onclick="window.open('ShangYi.do?State=Select&ShopId=${sysl.shopid }')" >
								<div class='picBox'>
									<div class='show'>
										<dl>
					  						<dt><img src="${sysl.si.image }" width="180" height="180px"></dt>
					  						<dd style="overflow: hidden;height: 40px;">${sysl.si.shopname }</dd>
										  	<dd></dd>
										  	<dd>￥${sysl.si.shopprice }</dd>		
							  			</dl>
									</div>
								</div>
							</li>
		  					</c:forEach>
						</ul>
					</div>
  				</div>
  			</div>
  		</div>
  		
  		<div class="hui" style="width:100%;overflow: hidden;padding-bottom: 20px;padding-top: 100px;display: none" id="a1"><div style="margin:0px auto;width: 152px"><img src="Image/Index_Image/cainixihuan.png"></div></div>
  		<div class="hui" style="background-color: #806657;display: none" id="a2">
  		
  			<div class="width">
  					<img  style="margin-right: 20px" src="Image/Index_Image/tuijian11.png" alt="推荐图片1">
  					<img  style="margin-right: 20px" src="Image/Index_Image/tuijian22.png" alt="推荐图片2">
  					<img  style="margin-right: 20px"  src="Image/Index_Image/tuijian33.png" alt="推荐图片3">
  					<img  style="margin-right: 20px"  src="Image/Index_Image/tuijian44.png" alt="推荐图片4">
  					<img src="Image/Index_Image/tuijian55.png" alt="推荐图片5">
  			</div>
  		</div>
  		<div class="hui" style="display: none" id="tuss">
  			<div class="tj" id="one" style="display: block;">
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu1.jpg"></dt>
  					<dd style="margin-top: 15px;">新款涤氨纶男式休闲圆领短袖T恤衫定制加工厂家直销文...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>26.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu2.jpg"></dt>
  					<dd style="margin-top: 15px;">丹杰仁2018夏季港风短裤糖果色五分裤男士十色速干沙...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>98.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu3.jpg"></dt>
  					<dd style="margin-top: 15px;">师臣SHICHEN下夏季2018年款短袖T恤套装男薄款时尚...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>39.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu4.jpg"></dt>
  					<dd style="margin-top: 15px;">美特斯邦威短袖T恤男士夏季舒适休闲净色基本款打底衫...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>39.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/yifu5.jpg"></dt>
  					<dd style="margin-top: 15px;">美特斯邦威短袖T恤男士内衣舒适纯色V字领打底衫韩版...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>39.00</span></dd>
  				</dl>	
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu9.jpg"></dt>
  					<dd style="margin-top: 15px;">Meters Bonwe美特斯邦威 夏季短袖圆领男士青年装...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>69.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu10.jpg"></dt>
  					<dd style="margin-top: 15px;">美特斯邦威长袖T恤男 秋季 款个性字母印花针织T恤男...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>99.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu6.jpg"></dt>
  					<dd style="margin-top: 15px;">YOHO有货潮流TEEBACCO卡通动漫唐老鸭印花休闲T...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>199.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu7.jpg"></dt>
  					<dd style="margin-top: 15px;">南极人男士T恤短袖P5015纯棉圆领男士打底衫...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>29.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/yifu8.jpg"></dt>
  					<dd style="margin-top: 15px;">七匹狼翻领短袖T恤男士2018夏季款商务时尚款...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>9.00</span></dd>
  				</dl>
  				
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu11.jpg"></dt>
  					<dd style="margin-top: 15px;">南极人1/2件装男士短袖T恤男体恤学生韩版宽松...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>59.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu12.jpg"></dt>
  					<dd style="margin-top: 15px;">南极人1/2件装男士短袖T恤男体恤学生韩版帅气...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>49.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu13.jpg"></dt>
  					<dd style="margin-top: 15px;">丹杰仁2018夏季港风短裤糖果色五分裤男士十色速干沙...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>59.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu14.jpg"></dt>
  					<dd style="margin-top: 15px;">美特斯邦威官方旗航店男装罗文背心2640645215061...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>29.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/yifu15.jpg"></dt>
  					<dd style="margin-top: 15px;">丹杰仁2018男士运动套装春秋卫衣长袖情侣装...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>114.00</span></dd>	
  				</dl>
  				
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu19.jpg"></dt>
  					<dd style="margin-top: 15px;">买短袖送T恤夏季新款休闲短裤男士薄款五分裤...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>49.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu20.jpg"></dt>
  					<dd style="margin-top: 15px;">2018男士T恤短袖 韩版圆领修身男神大码...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>29.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu16.jpg"></dt>
  					<dd style="margin-top: 15px;">买一条送一条牛仔裤2018春夏新品男士修身直筒裤...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>98.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu17.jpg"></dt>
  					<dd style="margin-top: 15px;">古尼卡特运动装男套装跑步服装 健身短袖...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>49.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/yifu18.jpg"></dt>
  					<dd style="margin-top: 15px;">浪莎男士纯棉背心青年春夏季运动装修身弹力打底衫...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>19.00</span></dd>
  				</dl>
  				
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu21.jpg"></dt>
  					<dd style="margin-top: 15px;">X-MAN2018	秋季新款T恤男短袖bf学生夏季韩...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>79.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu22.jpg"></dt>
  					<dd style="margin-top: 15px;">买一送一2018夏季新款男士休闲九分裤薄款...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>69.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu23.jpg"></dt>
  					<dd style="margin-top: 15px;">古人卡特2018	春季新款修身小脚裤男士加肥大码哈伦裤...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>99.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yifu24.jpg"></dt>
  					<dd style="margin-top: 15px;">古人卡特2018	男士套装短袖新款夏季男士短袖运动套装...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>59.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/yifu25.gif"></dt>
  					<dd style="margin-top: 15px;">浪莎男士背心纯棉青年透气修身型运动健身...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>29.00</span></dd>
  				</dl>
  			</div>
  			
  			
  			
  			
  			<!-- 第二个 -->
  			
  			
  			
  			<div class="tj" id="two" style="display: none">
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao1.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">七匹狼Skljsdlk男士钱包头层牛皮男青年时尚多功能...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>59.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao2.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">七匹狼2018新款男士钱包大容量信封包头层牛皮...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>198.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao3.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">七匹狼sepTwoLEVES那哪是钱包短款真皮夹子头层牛皮...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>59.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao4.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">七匹狼SEPTWOLEVES男包 单肩包男斜挎包 男士包包...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>59.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/qianbao5.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">七匹狼SEPTWOLEVES男包 单肩包男斜挎包帆布包...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>179.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao6.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">七匹狼SEPTWOLEVES男士钱包男士加长款拉链钱包...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>179.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao7.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">七匹狼SEPTWOLEVES男士钱包加长款商务皮甲...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>109.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao8.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">七匹狼SEPTWOLEVES牛津布包男士单肩包斜跨包...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>179.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao9.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">维克特锐男包横款手提包商务包公文包单肩包...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>198.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/qianbao10.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">SLLKISS男包单肩包真皮休闲竖款斜挎包棕色...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>196.00</span></dd>
  				</dl>
  				
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao11.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">威客特瑞 男包手拿包大尺寸夹包手抓包商务包大号...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>128.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao12.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">送手包 男士胸包腰包休闲情侣包韩版背包...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>129.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao13.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">威客特瑞 男士单肩包斜跨包韩版商务包男士时尚包包...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>129.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/qianbao14.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">威客特瑞 男士单肩包斜挎包韩版商务包...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>198.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/qianbao15.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">卡帝乐鳄鱼/CARTELO男士短款钱包韩版青年带拉链...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>59.00</span></dd>
  				</dl>
  				
  			</div>
  			
  			
  			
  			
  			<!-- 第三个 -->
  			
  			
  			<div class="tj" id="three" style="display: none">
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao1.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">正品宾卡达BINKADA手表男士全自动机械表男表镂空...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>399.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao2.png" width="180px" height = "180px""></dt>
  					<dd style="margin-top: 15px;">卡尔文·克莱恩(CalvinKlein)手表 时尚潮流金属钢带...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>1412.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao3.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">卡西欧明锐学生防水电子表男大厦苏子男孩运动表...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>1888.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao4.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">正品宾卡达BINKADA手表男士新款皮带手表女神时尚休闲潮流...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>199.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao5.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">CAS/卡西欧手表G-SHOUCK系列运动双线电子男表...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>1061.00</span></dd>
  				</dl>	
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao6.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">正品宾卡达BINKADA手表休闲时尚表男士背透全自动...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>369.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao7.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">TIANSUO天梭男表 俊雅系列石英瑞士时尚男士手表运动防水...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>1080.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao8.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">TIANSUO天梭手表机械表男士洛克系列时尚机械男士休闲 ...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>9.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao9.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">SANDA军用手表特种兵表运动防水户外...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>119.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao10.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">天梭李洛克自动机械手表中标正装商务钢带摆盘...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>2699.00</span></dd>
  				</dl>
  				
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao11.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">CK手表瑞士正品皮革表带男表K3M216G6女表情侣表...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>9.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao12.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">新款涤氨纶男式休闲圆领短袖T恤衫定制加工厂家直销文...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>850.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao13.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">男士手表潮流防水夜光男多功能手表ZB0803...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>35.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao14.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">卡宾达BINDA男士精钢腕表皮革表超薄简约休闲是商标...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>199.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/shoubiao15.png" width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">明锐儿童电子表 女 30米防水表环保材质  小学生计时运动表...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>29.00</span></dd>
  				</dl>
  			</div>
  			
  			
  			
  			<!-- 第四个 -->
  			
  			<div class="tj" id="four" style="display: none">
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_03.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿车载红茶25包50g茶叶...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>10.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_05.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿清新柠檬风味茶固体饮料10包180g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>9.60</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_07.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿绿茶25包50g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>2.00</span></dd>
  				</dl>	
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_09.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿黄牌精选红茶100包200g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>39.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_11.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立甘醇毛尖绿茶30g 灌装 散茶...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>39.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_18.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿铁观音乌龙茶100包200g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>39.90</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_19.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿乐活茉莉花茶20包36g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>24.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_20.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">新款涤氨纶男式休闲圆领短袖T恤衫定制加工厂家直销文...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>9.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_21.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿绿茶100包200g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>39.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_22.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿唤醒英式 早餐茶25包50g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>20.00</span></dd>
  				</dl>
  				
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_28.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿黄牌精选红茶50包100g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>20.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_29.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿韵香乌龙茶50g罐装...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>30.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_30.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">立顿豪门伯爵红茶25包37.5g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>20.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_31.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">柠檬片薄荷茶薄荷菊花玫瑰茶...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>14.80</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin/ChaYe_32.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">蜜桃乌龙茶画过组合领跑15包400g...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>28.00</span></dd>
  				</dl>
  			</div>
  			
  			
  			<!-- 第五个 -->
  			
  			
  			<div class="tj" id="five" style="display: none">
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu1.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁运动短裤男跑步健身速干运动裤薄款...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>99.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu2.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">NIKE耐克2018夏季新款詹姆斯15运动减震耐磨...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>495.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu3.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">NIKE2017冬季黑武士中邦男士实战篮球鞋...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>699.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu4.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁卫裤男运动裤大码春款男休闲百搭棉裤...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>99.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu5.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁运动套装短靴T恤男装夏季薄款透气速干...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>99.00</span></dd>
  				</dl>
  				
  				
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu6.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁七号篮球男女青少年儿童通用...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>139.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu7.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁男运动裤夏季梭织运动裤经典直通男裤 口袋拉链保暖...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>99.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu8.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">NIKE耐克男跑鞋新款Run SWIFT飞线气底...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>439.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu9.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁运动护膝运动跑步男女通用 轻薄四季...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>28.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu10.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">耐克男装2018夏季新款健身训练连元领运动休闲短袖...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>199.00</span></dd>
  				</dl>
  				
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu11.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁篮球5号6号男女青少年儿童通用	...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>79.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu12.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁短袖	夏季透气速干舒适运动套装...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>109.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin/yundongyifu13.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁运动护膝运动跑步男女通用 轻薄四季...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>28.00</span></dd>
  				</dl>
  				<dl style="margin-right:17.1px; ">
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu14.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">苏宁俱乐部2017年夏季男款春季文化衫...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>69.00</span></dd>
  				</dl>
  				<dl>
  					<dt><img src="Image/Index_Image/ShangPin//yundongyifu15.png"width="180px" height = "180px"></dt>
  					<dd style="margin-top: 15px;">李宁七分裤运动套装夏季速干透气休闲...</dd>
  					<dd>任性价:<c style="color:#ff3d3d">￥</c><span>69.00</span></dd>
  				</dl>
  			</div>

  		</div>
  		
  	</section>
  	
  	<!-- **********************页脚*********************** -->
    <footer>
        <div id="footer_manger">
            <div id="footer_back">
                <ul>
                    <li>卖家帮助</li>
                    <li class="style">新手指南</li>
                    <li class="style">服务保障</li>
                    <li class="style">常见问题</li>
                    <li class="style">风险监测</li>
                </ul>
                <ul>
                    <li>商家帮助</li>
                    <li class="style">供货商招募</li>
                    <li class="style">商家后台</li>
                </ul>
                <ul>
                    <li>关于我们</li>
                    <li class="style">关于瑶乐购</li>
                    <li class="style">联系我们</li>
                </ul>
                <ul>
                    <li>关注我们</li>
                    <li class="style"><img src="Image/Index_Image/Xinlang.png" alt="">新浪微博</li>
                    <li class="style"><img src="Image/Index_Image/Kongjian.png" alt="">QQ空间</li>
                    <li class="style"><img src="Image/Index_Image/Weibo.png" alt="">腾讯微博</li>
                </ul>
                <dl>
                    <dt>瑶乐购微信账号</dt>
                    <dd><img src="Image/Index_Image/wx.png" alt="" width="100px"></dd>
                </dl>
                <dl style="margin-left: 70px">
                    <dt>高薪招聘人才</dt>
                    <dd><img src="Image/Index_Image/wx.png" alt="" width="100px"></dd>
                </dl>
            </div>
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
    <script>
    $.idcode.setCode();   //加载生成验证码方法
    $("[type=submit]").click(function(){
        var IsBy = $.idcode.validateCode()  //调用返回值，返回值结果为true或者false
        var name = $("[name=Name]").val();//获取账号
        var Pass = $("[name=Pass]").val();//获取账号
        var yzm = $("[name=yzm]").val();	//验证码
        if(name == ""){
        	$("#shouji").html("手机号码不能为空");
        	return false;
        }else if(Pass == ""){
        	$("#mima").html("密码不能为空");
        	return false;
        }else if(yzm == ""){
        	$("#yz").html("验证码不能为空");
        	return false;
        }else if(document.getElementById("fws").checked == false){
        	$("#gou").fadeIn(1000);
        	return false;
        }else if(IsBy == false){
        	$("#yz").html("验证码不正确！请重新填写。");
        	return false;
        }
    })
    
    
    $(function (){
    	$("[name=Name]").blur(function(){
        	if($("[name=Name]").val() == ""){
        		$("#shouji").html("手机号码不能为空");
        	}else{
        		$("#shouji").html("&nbsp;");
        	}
        })
        
        $("[name=Pass]").blur(function(){
        	if($("[name=Pass]").val() == ""){
        		$("#mima").html("密码不能为空");
        	}else{
        		$("#mima").html("&nbsp;");
        	}
        })
        
        $("[name=yzm]").blur(function(){
        	if($("[name=yzm]").val() == ""){
        		$("#yz").html("密码不能为空");
        	}else{
        		$("#yz").html("&nbsp;");
        	}
        })
        $("[name=gou]").blur(function(){
        	if($("[name=gou]").checked == true){
        		$("#gou").fadeIn(1000);
        	}else{
        		$("#gou").fadeOut(1000);
        	}
        })
        
        
        
        var intDiff = parseInt(600000);//倒计时总秒数量

    	function timer(intDiff){
    		window.setInterval(function(){

    			var day=0,

    				hour=0,

    				minute=0,

    				second=0;//时间默认值

    			if(intDiff > 0){

    				day = Math.floor(intDiff / (60 * 60 * 24));

    				hour = Math.floor(intDiff / (60 * 60)) - (day * 24);

    				minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);

    				second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);

    			}

    			if (minute <= 9) minute = '0' + minute;

    			if (second <= 9) second = '0' + second;


    			$('#hour_show').html('<s id="h"></s>'+hour+'时');

    			$('#minute_show').html('<s></s>'+minute+'分');

    			$('#second_show').html('<s></s>'+second+'秒');

    			intDiff--;

    		}, 1000);

    	}


    	$(function(){

    		timer(intDiff);

    	});
        
    })
    
    $(function (){
	    function move(){
	        //动画效果：每次往前拉5张图片的宽度，完成效果后执行后面的函数
	        $("#MiaoSha_two #kuan").animate({"margin-left":"-200px"},function(){
	            $("#MiaoSha_two #kuan dl:first").clone().appendTo($("#MiaoSha_two #kuan"));
	            $("#MiaoSha_two #kuan dl:first").remove();
	            $("#MiaoSha_two #kuan").css("margin-left","0px");//再从第一张显示
	
	        })
	    }
	
	    var time = setInterval(move,3000);//每两秒切换一次
	    $("#MiaoSha_two #kuan").mouseover(function(){
	        clearInterval(time);
	    }).mouseout(function () {
	        time = setInterval(move,3000);//每两秒切换一次*/
	    })
	})
	
	/* $(function(){
        $('.row3').adipoli({
            'startEffect' : 'transparent',
            'hoverEffect' : 'boxRandom'
        });
    }); */
	</script>
	
	<script src="./Js+JQuery/jquery-1.10.2.min.js"></script>
	<script src="Js+JQuery/slider.js"></script>
	<script type="text/javascript">
	$(function() {
		var bannerSlider = new Slider($('#banner_tabs'), {
			time: 5000,
			delay: 400,
			event: 'hover',
			auto: true,
			mode: 'fade',
			controller: $('#bannerCtrl'),
			activeControllerCls: 'active'
		});
		$('#banner_tabs .flex-prev').click(function() {
			bannerSlider.prev();
		});
		$('#banner_tabs .flex-next').click(function() {
			bannerSlider.next();
		});
	})
	</script>
  </body>
</html>
