<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>瑶乐购 - 注册账号</title>
    <link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
    <link rel="stylesheet" href="Css/ZhuCe2_Style.css" type="text/css">
    <script src="Js+JQuery/jquery-1.12.4.js"></script>
    <script src="Js+JQuery/ZhuCe2.js"></script>
    <script type="text/javascript" src="Js+JQuery/jquery-1.12.4.js"></script>
    
    <script type="text/javascript">
    	$(function (){
    		$(".qr").click(function (){
    			var pwd = $("#miam").val();
    			var phone = $("#phone").val();
    			$.post("reg",{"State":"add","pwd":pwd,"phone":phone},function (Data){
    				if(Data != null){
    					$("#UserName").html(Data);
    				}
    			})
    		})
    	})
    </script>
    
</head>
<body>
<!-- **********************页头*********************** -->
<header>
    <div id="yetou">
        <img src="Image/Index_Image/logo.png" alt="">
    </div>
</header>
<!-- *********************中间部分********************** -->
<div id="chenggong" style="display: none">
	<div>
	<h2>恭喜您账号：<p id="UserName"></p>注册成功 快去买漂漂的衣服吧~</h2>
		<img src="Image/ZhuCe_Image/chenggong.png" width="130px;">
	</div>
	
</div>
<section>
	<input type="hidden" name="phone" id="phone" value="${phone }">
    <div class="kuangao">
        <p class="ziti">安全设置-设置密码</p><br><br>
        <div class="xiahuaxian">
            <span class="wenzi">01/</span><span class="wenzione">输入登录名</span><span class="wenzi1">02/</span><span class="wenzione">输入密码</span><span class="wenzi2">03/</span><span class="wenzione">重置密码</span>
        </div>
        <div class="password">
            *为了您的账户安全请设置密码
        </div>

        <div id="biaodan">
            <div id="pw">
                <p>新密码<input type="password" id="miam"></p>
                <span style="font-size: 12px;color: red;margin-left: 45px;" id="yz"></span>
                <div id="qingdu" style="display: none">
                    <div id="one"></div>
                    <div id="two"></div>
                    <div id="three"></div>
                    <p id="qiangdus">密码强度(强)</p>
                </div>
            </div>
            <ul class="texiao">
                <div class="drag">
                    <div class="bg"></div>
                    <p class="text">拖动滑块验证</p>
                    <div class="btn"></div>
                </div>
            </ul>
            <a href="javascript:void(0)" class="qr">确 认</a>
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
<script type="text/javascript">
    var x;
    var posX;
    var e;
    var done;
    var $s = function(selector){
            return document.querySelector(selector);
        },
        box = $s('.drag'),//容器
        bg = $s('.bg'),//绿色背景
        text = $s('.text'),//文字
        btn = $s('.btn'),//拖动按钮
        done = false;//是否通过验证
    btn.onmousedown = function(e){
        e= e || window.event;
        posX = e.clientX - this.offsetLeft;
        btn.onmousemove = function(e){
            var e = e || event;
            x= e.clientX - posX;
            this.style.left = x + 'px';
            bg.style.width = this.offsetLeft + 'px';
            // 通过验证
            if(x >= box.offsetWidth - btn.offsetWidth){
                done = true;
                btn.onmousedown = null;
                btn.onmousemove = null;
                text.innerHTML = '通过验证';
                $(".hua").html("<img src='Image/duihao.png' class='tu1'>");
            }
        };
        document.onmouseup = function(){
            btn.onmousemove = null;
            btn.onmouseup = null;
            if(done)return;
            bg.style.width = 0;
        }
    };
    text.onmousedown = function(){
        return false;
    };
</script >
</body>
</html>