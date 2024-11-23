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
    <title>瑶乐购 - 条件搜索共搜到（${count }）条结果</title>
    <link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
    <link type="text/css" rel="stylesheet" href="Css/ShangYi_Style.css">
    <script src="Js+JQuery/jquery-1.12.4.js"></script>
    <script src="Js+JQuery/ShangYi.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var bool = true;
           $("#shaixuan .fenlei ul p").click(function () {
               if(bool == true){
                   $(this).parent().parent().css({"height":"68px","transition":"all 0.2s ease-in-out"});
                   bool = false;
               }else{
                   $(this).parent().parent().css({"height":"38px","transition":"all 0.2s ease-in-out"});
                   bool = true;
               }

           })
        })
        
      	//传值，获取传过来的页码
		function getInfo(pages) {
			$("[name='page']").val(pages);
			$("[method=post]").trigger("submit");//trigger--->自动触发提交表单的事件
        }
        
        $(function (){
        	$("#SexFenLei li").click(function (){
        		$("[name=SexFenLei]").val($(this).html().substring(0,1));
        		$("[method=post]").submit();
        	})
        	var str = $("[name=SexFenLei]").val();
        	$("[value="+str+"]").css({"color":"#fff","background":"#FF3366","border-radius":"3px"});
        	
        	
        	$("#ma li").click(function (){
        		var state = "";
        		if($(this).html()=="全部"){
        			state = "部";
        		}else{
        			state = $(this).html().substring(0,1);
        		}
        		$("[name=ma]").val(state);
        		$("[method=post]").submit();
        	})
        	var str2 = $("[name=ma]").val();
        	$("[value="+str2+"]").css({"color":"#fff","background":"#FF3366","border-radius":"3px"});
        	
        	$("#banxing li").click(function (){
        		$("[name=banxing]").val($(this).html());
        		$("[method=post]").submit();
        	})
        	
        	
        	var str3 = $("[name=banxing]").val();
        	$("[value="+str3+"]").css({"color":"#fff","background":"#FF3366","border-radius":"3px"});
        	
        	
        	$("#queren2").click(function (){
        		$("[method=post]").submit();
        	})
        })
    </script>
</head>
<body style="overflow-x:hidden">
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
<header>
    <div id="div_back">
        <div id="div_ul">
            <ul>
                <li>网站分类</li>
                <li>商家入驻</li>
                <li>客户服务</li>
            </ul>
            <ul  class="daohang" style="float:right">
                	<c:if test="${ empty user.userinfo.usernick}">
  						<li class="login_DengLu" id="denglu">您好，请登录</li>
  					</c:if>
  					<c:if test="${ not empty user.userinfo.usernick}">
  						<li class="xia">${user.userinfo.usernick}
  							<div class="div_wzdh" onmouseout="wzfl_lk()">
	  							<a href="LeGou.do?UserName=${user.username}">个人管理</a>
	  							<a href="LeGou.do?State=Exit">退出账号</a>
	  						</div>
  						</li>
  					</c:if>
                <li>注册</li>
                <li class="xia">我的订单 <img src="Image/xiala2.png" alt=""></li>
                <li><img src="img/xiaogouwuche.png" height="11" width="13"/>购物车</li>
                <li>企业采购</li>
            </ul>
        </div>
        <div id = "DaoHang">
            <div class="one">
                <img src="Image/logo.png" height="90" width="190"/>
            </div>

            <div class="two">
                <form action="">
                    <img src="Image/Index_Image/serach.png" height="18" width="18"/>
                    <input type="text" placeholder="看看搜点什么" name="Serach" value="${Serach==null?'':Serach }"><p>搜 索</p>
                </form>
                <ul>
                    <li class="style">上衣</li>
                    <li class="shu">|</li>
                    <li class="style">裤子</li>
                    <li class="shu">|</li>
                    <li class="style">哈伦裤</li>
                    <li class="shu">|</li>
                    <li class="style">连衣裙</li>
                    <li class="shu">|</li>
                    <li class="style">童装</li>
                    <li class="shu">|</li>
                </ul>
            </div>
        </div>
        <div id="DaoHangTiao_back">
            <div id = "DaoHangTiao">
                <ul>
	  					<c:forEach var="dht" items="${DaoHangTiaoList }">
	  						<li><a href="${dht.href }" target="_blank">${dht.daohangtiaoname }</a></li>
	  					</c:forEach>
					    
				</ul>
            </div>
        </div>
    </div>
</header>

<!-- **********************主体*********************** -->
<section>
	
	<form action="Serach.do" method="post">
	    <div id="shaixuan">
	        <div class="fenlei" id="SexFenLei">
	            <ul>
	                <span style="color:#9EA3A9">衣服分类：</span>
	                <li value="全">全部</li>
	                <li value="男">男装</li>
	                <li value="女">女装</li>
	                <input type="hidden" name="SexFenLei" value="${SexFenLei==null?'全':SexFenLei }">
	
	            </ul>
	        </div>
	        <div class="fenlei" id="ma">
	            <ul>
	                <span style="color:#9EA3A9">尺码大小：</span>
	                <li value="部">全部</li>
	                <li value="大">大码</li>
	                <li value="小">小码</li>
	                <input type="hidden" name="ma" value="${ma==null?'部':ma }">
	            </ul>
	        </div>
	        <div class="fenlei" style="border-bottom: 0px;" id="banxing">
	            <ul>
	                <span style="color:#9EA3A9">衣服版型：</span>
	                <li value="全部">全部</li>
	                <li value="宽松">宽松</li>
	                <li value="标准">标准</li>
	                <li value="修身">修身</li>
	                <li value="简直">简直</li>
	                <input type="hidden" name="banxing" value="${banxing==null?'全部':banxing }">
	            </ul>
	        </div>
	        
	    </div>
    <div id="shaixuan2">
        <ul>
            <li style="background-color: #fff;border-right: 1px #e1e1e1 solid" class="sx">推荐</li>
            <li class="sx">热销</li>
            <li class="sx">乐购精选</li>
            <li class="sx">价格</li>
            <li style="padding: 13px 10px"><input type="text" name="s" value="${s }" placeholder="￥" style="margin-right: 5px">~<input type="text" placeholder="￥" name="b"  value="${b }" style="margin-left: 5px"><p style="display: inline-block;border: 1px #e1e1e1 solid;padding: 1px 3px;background-color: #fff;margin-left: 5px" id="queren2">确认</p></li>
        </ul>
    </div>
    <div id="sp">
    	<p style="font-size: 14px;color: #666">一共为您搜到 ${count } 条结果</p>
	    <c:forEach var="sp" items="${si }">
	    	<dl class="nan" onclick="window.open('ShangYi.do?State=Select&ShopId=${sp.shopid }')" title="${sp.shopname }">
	            <div style="width: 240px;height: 220px;overflow: hidden">
	                <dt style="margin-bottom: 0px;"><img src="${sp.image }" alt="" width="220px"></dt>
	            </div>
	            <dd>￥<span>${sp.shopprice }</span><p>收藏</p></dd>
	            <dd style="height: 20px;overflow: hidden;">${sp.shopname }</dd>
	            <dd style="overflow: hidden; height: 20px;">${sp.shopmiaoshu }</dd>
	        </dl>
	    </c:forEach>
	    </div>
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
    <div class="hui">
        <!-- <div id="tuijian">
            <div id="xiaodaohang" style="display: none">
                <ul>
                    <li style="background-color: #FF3366;color: #fff">精选推荐</li>
                    <li>时尚潮流</li>
                    <li>大牌美妆</li>
                    <li>乐购精选</li>
                    <li>大牌美妆</li>
                    <li>服饰日用</li>
                </ul>
            </div>

            <div id="tuijianshangpin" style="display: none">
                <div class="shangpin">
                    <img src="Image/ShangYi_Image/tuijian1.jpg" alt="图片" height="263px" width="263px">
                    <div class="miaoshu">
                        <p>幸福时光2018新款短袖T恤男韩版潮流学生圆领半袖男士印花上衣夏季衣服男T201</p>
                        <p>小清新穿上去给人一种帅气、绅士、爽快的一种神秘气息。</p>
                        <p>￥188</p>
                    </div>
                </div>
                <div class="shangpin">
                    <img src="Image/ShangYi_Image/tuijian2.jpg" alt="图片" height="263px" width="263px">
                    <div class="miaoshu">
                        <p>幸福时光2018新款短袖T恤男韩版潮流学生圆领半袖男士印花上衣夏季衣服男T201</p>
                        <p>小清新穿上去给人一种帅气、绅士、爽快的一种神秘气息。</p>
                        <p>￥188</p>
                    </div>
                </div>
            </div>

            <div id="lunbotuijian" style="display: none">
                <div id="lb">
                    <dl style="margin-left:0px;">
                        <dt><img src="Image/ShangYi_Image/1.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                    <dl>
                        <dt><img src="Image/ShangYi_Image/2.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                    <dl>
                        <dt><img src="Image/ShangYi_Image/3.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                    <dl>
                        <dt><img src="Image/ShangYi_Image/4.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                    <dl>
                        <dt><img src="Image/ShangYi_Image/5.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                    <dl>
                        <dt><img src="Image/ShangYi_Image/6.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                    <dl>
                        <dt><img src="Image/ShangYi_Image/7.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                    <dl>
                        <dt><img src="Image/ShangYi_Image/8.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                    <dl>
                        <dt><img src="Image/ShangYi_Image/9.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                    <dl>
                        <dt><img src="Image/ShangYi_Image/10.jpg" alt="" width="200px"></dt>
                        <dd>广州保税区发货</dd>
                        <dd>博朗(BRAUN) ST710卷直发器 负离子...</dd>
                        <dd>￥119</dd>
                    </dl>
                </div>
            </div>
        </div> -->
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
                <li class="style"><img src="Image/Index_Image/Xinlang.png" height="18" width="18"/>新浪微博</li>
                <li class="style"><img src="Image/Index_Image/Kongjian.png" height="18" width="18"/>QQ空间</li>
                <li class="style"><img src="Image/Index_Image/Weibo.png" height="18" width="18"/>腾讯微博</li>
            </ul>
            <dl>
                <dt>瑶乐购微信账号</dt>
                <dd><img src="Image/Index_Image/wx.png"  width="100"/></dd>
            </dl>
            <dl style="margin-left: 70px">
                <dt>高薪招聘人才</dt>
                <dd><img src="Image/Index_Image/wx.png" width="100"/></dd>
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
</body>
</html>