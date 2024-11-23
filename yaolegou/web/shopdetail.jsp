<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" autoFlush="false" buffer="100kb" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>瑶乐购 - ${si.shopName }</title>
    <link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
    <link type="text/css" rel="stylesheet" href="Css/WuPinXiangQing.css">
    <script type="text/javascript" src="Js+JQuery/jquery-1.12.4.js"></script>
    <!--<script type="text/javascript" src="Js+JQuery/jquery-1.8.3.min.js"></script>-->
    <script src="Js+JQuery/jquery.js"></script>
    <script src="Js+JQuery/jquery.jqzoom.js"></script>
    <script src="Js+JQuery/lanrenzhijia.js"></script>
    
    <script type="text/javascript" src="Js+JQuery/WuPinXiangQing.js"></script>
    <script type="text/javascript" src="Js+JQuery/sinaFaceAndEffec.js"></script>
    <script type="text/javascript">
    	$(function (){
    		$("#xia dl dd div p").click(function (){
    			var shopid = $("#shopid").val();
    			var color = $(this).html();
    			$.post("WuPinXiangQing.do",{"State":"Color","shopid":shopid,"color":color},function (Data){
    				if(Data != null){
        				$(".items ul li ").remove();
    					$("#preview span").remove();
        				var d = eval("("+Data+")");
        				var add = $(".items ul");
        				$("<span class='jqzoom'><img jqimg='"+d[0].b_img+"' src='"+d[0].s_img+"' width='350px;' height='350px;' /></span>").appendTo("#preview ");
         				$.each(d,function(){
         					var opt = $("<li><img bimg="+this.b_img+" src="+this.s_img+" onmousemove='preview(this);'></li>").appendTo(add);
         				});
    				}
    			})
    		});
    		
    		$(".yanse").click(function (){
    			$("[name=yanse]").val($(this).html());
    			$("[name=shangpincolor]").val($(this).html());
    		});
    		
    		$(".chicun").click(function (){
    			$("[name=chicun]").val($(this).html());
    			$("[name=shangpinchicun]").val($(this).html());
    		});
    		
    		$("#jiaru").click(function (){
    			var img = $("[name=fengmian]").val();
    			var id = $("[name=id]").val();
    			var shopname = $("#title").html();
    			var yanse = $("[name=yanse]").val();
    			var chicun = $("[name=chicun]").val();
    			var jiage = $("[name=jiage]").val();
    			var count = $("[name=count]").val();
    			var UserName = $("[name=UserName]").val();
    			if(UserName != ""){
    				if(yanse != ""){
        				if(chicun !=""){
        					$.post("ShopDetail",{"State":"add","img":img,"id":id,"shopname":shopname,"yanse":yanse,"chicun":chicun,"jiage":jiage,"count":count,"UserName":UserName},function (Data){
        						if(Data == "true"){
        							$("#beijing").fadeIn("300");
                    				$("#wen").html("加入购物车成功");
        						}else{
        							$("#beijing").fadeIn("300");
                    				$("#wen").html("加入购物车失败");
        						}
        					})
        				}else{
        					$("#beijing").fadeIn("300");
            				$("#wen").html("请选择尺码！");
        				}
        			}else{
        				$("#beijing").fadeIn("300");
        				$("#wen").html("请选择颜色！");
        			}
    			}else{
    				$("#beijing").fadeIn("300");
    				$("#wen").html("您还没有登录！");
    			}
    			
    		})
    		
    		$("#beijing").click(function (){
    			$(this).fadeOut("300");
    			setTimeout(3,function (){
    				alert();
    				$("#beijing").fadeOut("300");
    			});
    		})
    		
    		$("#lijigoumai").click(function (){
    			var yanse = $("[name=yanse]").val();
    			var chicun = $("[name=chicun]").val();
    			if(yanse != ""){
    				if(chicun !=""){
    					$("#lijigoumaiform").submit();
    				}else{
    					$("#beijing").fadeIn("300");
        				$("#wen").html("请选择尺码！");
    				}
    			}else{
    				$("#beijing").fadeIn("300");
    				$("#wen").html("请选择颜色！");
    			}
    			
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
			<dd id="wen">账号或密码错误！</dd>
		</dl>
	</div>
</div>
<!----------------------------------------------------  -->

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
  						<li class="xia" onclick="window.open('LeGou.do?UserName=${user.userName}')">${user.userNick}
  						</li>
  					</c:if>
                <li>注册</li>
                <li class="xia">我的订单 <img src="Image/xiala2.png" alt=""></li>
                <li onclick="window.open('Shopcart?UserName=${user.userName}')"> 购物车</li>
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
    <div id="backs">
        <ul>
            <li>首页</li>
            <li>夹克</li>
            <li>衬衣</li>
            <li>T恤</li>
            <li>裤子</li>
            <li>卫衣</li>
            <li>休闲裤</li>
        </ul>
    </div>

</header>
<!--**********************主体*****************************-->
<section>


<input type="hidden" name="fengmian" value="${si.image }">
<input type="hidden" name="yanse" value="">
<input type="hidden" name="chicun" value="">
<input type="hidden" name="jiage" value="${si.shopPrice }">
<input type="hidden" name="UserName" value="${user.userName}">
<input type="hidden" name="id" value="${si.shopId }">
<input type="hidden" name="ziji" value="${ui.userName }">
<input type="hidden" name="usernick" value="${ui.userNick }">

    <div id="one">
        <div id="left">
            <div class="lanrenzhijia">
                <!-- 大图begin -->
                <div id="preview" class="spec-preview">
                	<c:forEach var="img" items="${ShopMingXiList }" begin="0" end="0">
                    	<span class="jqzoom"><img jqimg="${img.bimg }" src="${img.simg }" width="350px;" height="350px;" /></span>
                    </c:forEach>
                </div>
                <!-- 大图end -->
                <!-- 缩略图begin -->
                <div class="spec-scroll"> <a class="prev">&lt;</a> <a class="next">&gt;</a>
                    <div class="items">
                        <ul>
	                        <c:forEach var="img" items="${ShopMingXiList }">
	                        	<li><img bimg="${img.bimg }" src="${img.simg }" onmousemove="preview(this);"></li>
	                        </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- 缩略图end -->
            </div>
        </div>
        <div id="zhong">
        	<input type="hidden" id="shopid" value="${si.shopId }">
            <p id="title">${si.shopName }</p>
            <span style="color:#f60;font-size: 14px;margin-left: 5px">春夏新品</span>
            <div id="xx">
                <div id="hui">
                    <dl>
                        <dt>乐 购 价</dt>
                        <dd><span>￥</span>${si.shopPrice }</dd>
                    </dl>
                    <dl>
                        <dt>领&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;券</dt>
                        <dd><img src="Image/WuPinXiangQing_Image/quan.png" alt=""></dd>
                        <!--<dd style="margin-top: -5px"><span>共5张优惠券</span></dd>-->
                    </dl>
                    <dl style="margin-top: 13px;">
                        <dt>促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</dt>
                        <dd style="margin-top: 1px"><shi>实名有礼</shi><span style="font-size: 12px;color: #666;margin-left: 10px;float: left;font-weight: 400">实名认证领15元无门槛易券</span><p style="font-size: 12px;color: #2272cb;text-decoration: underline;font-weight: 400;float: left;margin-left: 10px;">查看</p></dd>
                        <!--<dd style="margin-top: -5px"><span>共5张优惠券</span></dd>-->
                    </dl>
                </div>


                <dl style="margin-left: 6px;margin-top: 10px">
                    <dt>送&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至</dt>
                    <dd><span style="font-size: 12px;color: #666;float: left;font-weight: 400;margin-top: 12px;">实名认证领15元无门槛易券</span></dd>
                    <br/>
                    <dd><span style="font-size: 12px;color: #666;float: left;font-weight: 400;margin-top: 13px;clear:both;margin-left: 53px;">由 图泽专营店 从  杭州市 销售和发货，并提供售后服务</span></dd>
                </dl>
            </div>
            <div id="xia">
                <dl>
                    <dt>颜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色</dt>
                    <dd>
                    <!-- 读取颜色 类型字符串数组 -->
	                    <%
	                    	String[] Color = (String[]) request.getAttribute("Color");
	                    	for(int i = 0;i<Color.length;i++){
	                    %>
		                    <div>
		                       	<p class="yanse"><%=Color[i] %></p>
	                        </div>
	                   	<%
	                    	};
	                   	%>
                    </dd>
                </dl>
                <dl>
                    <dt>迟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</dt>
                    <dd>
                        <!-- 读取尺寸类型  类型字符串数组 -->
                        <%
	                    	String[] ChiCun = (String[]) request.getAttribute("ChiCun");
	                    	for(int i = 0;i<ChiCun.length;i++){
	                    %>
                        <p class="chicun"><%=ChiCun[i] %></p>
                        <%
	                    	};
	                   	%>
                    </dd>
                </dl>
                <dl>
                    <dt>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</dt>
                    <dd>
                        <input type="button" value="-" style="margin-right: -5px" name="jian">
                        <input type="text" value="1" name="count">
                        <input type="button" value="+" style="margin-left: -5px" name="jia">
                    </dd>
                </dl>
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
            <div id="anniu">
            	<form action="ShopDetail?State=add&UserName=${user.userName }&DingDanNumber=<%=DingDanNumber %>" method="post" id="lijigoumaiform">
            		<p id="lijigoumai" style="cursor: pointer;">立即购买</p>
            		<input type="hidden" value="${si.shopId }" name="shopid">
            		<input type="hidden" value="1" name="shangpincount">
            		<input type="hidden" value="" name="shangpincolor">
            		<input type="hidden" value="" name="shangpinchicun">
            		<input type="hidden" value="${ui.userName }" name="usernames">
            	</form>
                <p id="jiaru"><img src="Image/WuPinXiangQing_Image/gwc.png" alt="">加入购物车</p>
            </div>
        </div>
        <div id="right">
            <h5 style="margin-left: 15px;margin-top: 10px;margin-bottom: 5px;">看了又看</h5>
            <div id="box">
                <ul>
                    <li><img src="Image/WuPinXiangQing_Image/k1.jpg" width="200"/><div class="hei"><p>点击查看</p></div></li>
                    <li><img src="Image/WuPinXiangQing_Image/k2.jpg" width="200"/><div class="hei"><p>点击查看</p></div></li>
                    <li><img src="Image/WuPinXiangQing_Image/k3.jpg" width="200"/><div class="hei"><p>点击查看</p></div></li>
                    <li><img src="Image/WuPinXiangQing_Image/k4.jpg" width="200"/><div class="hei"><p>点击查看</p></div></li>
                    <li><img src="Image/WuPinXiangQing_Image/k5.jpg" width="200"/><div class="hei"><p>点击查看</p></div></li>
                    <li><img src="Image/WuPinXiangQing_Image/k5.jpg" width="200"/><div class="hei"><p>点击查看</p></div></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="xiangqing">
        <div id="zuoce">
            <div id="shangjia">
                <div id="biaoti">
                    <p><img src="Image/WuPinXiangQing_Image/shang.png" alt="">童瑶商家</p>
                </div>
                <dl style="width: 200px;">
                    <dt>商家：</dt>
                    <dd>${ui.userNick }</dd>
                </dl>
                <dl style="width: 200px;">
                    <dt>邮箱：</dt>
                    <dd>
                    	<c:if test="${ empty ui.email}">
                    		无
                    	</c:if>
                    	<c:if test="${not empty ui.email }">
                    		${ui.email}
                    	</c:if>
                    </dd>
                </dl>
                <dl>
                    <dt>电话：</dt>
                    <dd>${ui.phone }</dd>
                </dl>
                <hr style="border: 0px;border-bottom: 1px #ccc solid;width: 170px;margin: 0px auto;margin-top: 12px;"/>
                <ul>
                    <li>商品</li>
                    <li>4.96 <img src="Image/WuPinXiangQing_Image/jiantou.png" alt=""></li>
                </ul>
                <ul>
                    <li>商品</li>
                    <li>4.96 <img src="Image/WuPinXiangQing_Image/jiantou.png" alt=""></li>
                </ul>
                <ul>
                    <li>商品</li>
                    <li>4.96 <img src="Image/WuPinXiangQing_Image/jiantou.png" alt=""></li>
                </ul>
                <span style="color: #FF3366;border: 1px #FF3366 solid">进入店铺</span>
                <span>收藏店铺</span>
            </div>
            <div id="cainixihuan">
                <p>猜你喜欢</p>
                <div id="cainixihuans">
                    <ul>
                        <li><img src="Image/WuPinXiangQing_Image/k1.jpg" width="180"/><div class="hei"><p>点击查看1</p></div></li>
                        <li><img src="Image/WuPinXiangQing_Image/k2.jpg" width="180"/><div class="hei"><p>点击查看2</p></div></li>
                        <li><img src="Image/WuPinXiangQing_Image/k3.jpg" width="180"/><div class="hei"><p>点击查看3</p></div></li>
                        <li><img src="Image/WuPinXiangQing_Image/k4.jpg" width="180"/><div class="hei"><p>点击查看4</p></div></li>
                        <li><img src="Image/WuPinXiangQing_Image/k5.jpg" width="180"/><div class="hei"><p>点击查看5</p></div></li>
                        <li><img src="Image/WuPinXiangQing_Image/k5.jpg" width="180"/><div class="hei"><p>点击查看6</p></div></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="neirong">
            <div id="jieshao">
                <div style="background-color: #f7f7f7;width: 988px;height: 48px">
                    <ul id="daohangs">
                        <li style="color: #FF3366;background-color: #fff;border-top: 2px #ff3366 solid;">商品详情</li>
                        <li>包装及参数</li>
                        <li>评论（0）</li>
                        <li>售后保障</li>
                    </ul>
                </div>
                <div id="img">
                    <!-- 内容简介 -->
                    ${si.getContext()}
                </div>
            </div>
            <div id="pl">
                <p class="ping" style="border-bottom: 1px #ccc solid">说点什么呢？</p>
                <textarea rows="3" cols="20" class="text" placeholder="姑娘说点什么吧"></textarea>
                <p style='font-size: 14px;color: red;margin-left: 10px' class="te"></p>
                <div id="k">
                    <p id="biaoqing">☺</p><p id="tupian">▧</p>
                    <span onclick="out()">发表评论</span>
                </div>
            </div>
            <div id="pinglun">
                <p class="ping">热门评论</p>

				<c:forEach var="pl" items="${plList }">
					<div class="p">
	                    <dl>
	                        <dt><img src="${pl.ui.image }" alt="" width="85"></dt>
	                        <dd>${pl.ui.usernick }</dd>
	                    </dl>
	                    <div class="zhu">
	                        <img src="Image/WuPinXiangQing_Image/wuxing.png" alt="">
	                        <p>${pl.context }</p>
	                        <div class="di">
	                            <span>${pl.createtime }</span>
	                            <span><img src="Image/WuPinXiangQing_Image/dianzan.png" alt="">&nbsp;0</span>
	                            <span>举报</span>
	                        </div>
	                    </div>
	                </div>
				</c:forEach>
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
<script type="text/javascript">


    // 绑定表情
    $('#biaoqing').SinaEmotion($('textarea'));

    // 测试本地解析
    function out() {
        var inputText = $('textarea').val();
        if(inputText != ""){
            $('#neirong #pinglun').append(reply(AnalyticEmotion(inputText)));
            $(".te").html("")
        }else{
            $(".te").html("请输入与要评论的文字！")
        }

    }

    $("textarea").blur(function () {
        if($('textarea').val() != ""){
            $(".te").html("")
        }else{
            $(".te").html("请输入与要评论的文字！")
        }
    })

    var html;
    function reply(content){
    	
    	var MyUser = $("[name=UserName]").val();
    	var usernick = $("[name=usernick]").val();
    	var ziji = $("[name=ziji]").val();
    	var shopid = $("[name=id]").val();
    	if(MyUser != ""){
    		$.post("ShangYi.do?State=AddInfo",{"MyUser":MyUser,"ziji":ziji,"context":content,"shopid":shopid},function (Data){
    			history.go(0);
        	})
    	}else{
    		alert("请先登录，在评论。");
    	}
        
    }
    
    
</script>
</html>