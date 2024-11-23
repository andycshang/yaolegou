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
    <link rel="stylesheet" href="Css/ZhuCe_Style.css" type="text/css">
    <script src="Js+JQuery/jquery-1.12.4.js"></script>
    <script src="Js+JQuery/ZhuCe.js"></script>
</head>
<body>
<header>
    <div id="yetou">
        <img src="Image/Index_Image/logo.png" alt="">
    </div>
</header>
<section style="background-image: url('Image/ZhuCe_Image/zhuces.png')">
    <div id="zhuti">
        <div id="biao">
            <p id="label">新用户注册</p>
            <form action="reg" method="post">
                <input type="text" name="phone" id="text" placeholder="手机号码">
                <div class="phone" id="phone"></div>
                <p id="yzm" style="margin-top: 7.5px;margin-bottom: 7.5px;cursor: pointer">点击获取验证码</p>
                <input type="text" name="yzm" id="yzms" placeholder="验证码" style="margin-top: 7.5px;margin-bottom: 7.5px;">
                <div class="phone" id="yzmss" style="clear: both"></div>
                <p id="zhuce" style="margin-top: 7.5px;cursor: pointer">立即注册</p><br/>
                <div  style="color: #333;font-size: 12px;margin-left: 38px;margin-top: 15px;    ">
                    <input type="checkbox" id="tongyi">我已阅读并且同意 <a href="#" style="color: #333">瑶乐购注册条款</a><xianshi style="color: red;font-size: 12px;margin-left: 50px;display: none">必须勾选</xianshi>
                </div>
                <span style="font-size: 12px;text-decoration: underline;float: right;margin-top: 18px;margin-right: 39px;margin-bottom: 30px">< 已有账号登录</span>
            </form>
        </div>
    </div>
</section>
<iframe style="display: none" name="j" src="" frameborder="0"></iframe>
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
</body>
</html>