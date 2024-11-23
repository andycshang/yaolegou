<%@page import="org.YaoLeGouDB.Impl.DingDanBiaoDaoImpl"%>
<%@page import="org.YaoLeGouDB.Dao.DingDanBiaoDao"%>
<%@page import="org.YaoLeGouDB.entity.DingDanBiao"%>
<%@page import="org.YaoLeGouDB.Impl.DingDanXiangQingDaoImpl"%>
<%@page import="org.YaoLeGouDB.Dao.DingDanXiangQingDao"%>
<%@page import="org.YaoLeGouDB.entity.DingDanXiangQing"%>
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
    <title>我的乐购 - 订货通知</title>
    <link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
    <link type="text/css" rel="stylesheet" href="Css/FaBuShop_Style.css">
    <link type="text/css" rel="stylesheet" href="Css/DaiFuKuan.css">
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.7.2.min.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>

    <link rel="stylesheet" href="kuang/themes/default/default.css" />
	<link rel="stylesheet" href="kuang/plugins/code/prettify.css" />
	<script charset="utf-8" src="kuang/kindeditor-all.js"></script>
	<script charset="utf-8" src="kuang/lang/zh-CN.js"></script>
	<script charset="utf-8" src="kuang/plugins/code/prettify.js"></script>
    
    <script type="text/javascript">
    	
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
				<dd><a href="#">待付款</a></dd>
				<dd><a href="#">待收货</a></dd>
				<dd><a href="#">已完成</a></dd>
			</dl>
			
		</div>
		<div id="zhu">
			<p>订货通知</p>
			<%
				String UserName = (String)request.getParameter("UserName");
				List<DingDanBiao> list = (List<DingDanBiao>)request.getAttribute("list");
				DingDanBiaoDao ddbd = new DingDanBiaoDaoImpl();
				for(int i = 0;i < list.size();i++){					
			%>
			<table border="0" cellspacing= "0" cellpadding= "0">
				<thead>
					<tr>
						<td colspan="5"><span class="title">订单编号：</span><span><%=list.get(i).getDingdannumber() %></span> <span class="title">下单时间：</span><span><%=list.get(i).getCreatetime() %></span><span class="title">签收地址：</span><span><%=list.get(i).getShaddress().getAddress() %></span></td>
					</tr>
				</thead>
				<%
					List<DingDanBiao> list2 = ddbd.ByUserGetAllStateInfo(list.get(i).getDingdannumber(),UserName);
					for(int k = 0;k < list2.size();k++){
				%>
				<tbody>
					<tr >
						<td style="border-right: 1px #e5e5e5 solid;border-bottom:1px #e5e5e5 solid; width: 400px">
							<div class="shop">
								<img src="<%=list2.get(k).getSi().getImage() %>" height="80">
								<a href="#"><%=list2.get(k).getSi().getShopname() %></a>
							</div>
						</td>
						<td style="width: 180px;border-right: 1px #e5e5e5 solid;border-bottom:1px #e5e5e5 solid;" align="middle">￥<%=list2.get(k).getSi().getShopprice() %></td>
						<td style="width: 100px;border-right: 1px #e5e5e5 solid;border-bottom:1px #e5e5e5 solid;" align="middle"><%=list2.get(k).getDdxq().getCount() %></td>
						<td style="width: 200px;border-bottom:1px #e5e5e5 solid;" align="middle">￥<%=(int)list2.get(k).getSi().getShopprice() * list2.get(k).getDdxq().getCount()%>.0<br/> <%=list2.get(k).getDingdanstate().getStatename() %></td>
						
					</tr>
				</tbody>
				<%
					}
				%>
				<tfoot>
					<tr>
						<td style="width: 180px;" align="middle"> </td>
						<td style="width: 100px;" align="middle"> </td>
						<td style="width: 100px;" align="middle"> </td>
						<td class="caozuo">
							<c:if test="<%=list.get(i).getStateid() == 1 %>">
								<a href="DingHuoTongZhi.do?State=QueRenFaHuo&DingDanNumber=<%=list.get(i).getDingdannumber() %>&UserName=<%=UserName %>">确认发货</a>
							</c:if>
							<c:if test="<%=list.get(i).getStateid() == 2 %>">
								<a href="#">物品通知已发出！！</a>
							</c:if>
							<c:if test="<%=list.get(i).getStateid() == 3 %>">
								<a href="#">删除交易记录</a>
							</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
			<%
				}
			%>
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