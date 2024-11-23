<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>条形统计</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="Js+JQuery/jquery-1.12.4.js"></script>
	<script src="ht/js/echarts.simple.min.js"></script>
  </head>
  
  <body>
   
    <div id="main2" style="width: 600px;height:400px;float: left;margin: 120px 100px"></div>
    <script>
    // 绘制图表。
    $.post("ht/TongJi.do",function (Data){
    	var d = eval("("+Data+")");
	    echarts.init(document.getElementById('main2')).setOption({
	        series: {
	            type: 'pie',
	            roseType: 'angle',
	            data: [
	                {name: d[0].shoptypename, value: d[0].count},
	                {name: d[1].shoptypename, value: d[1].count},
	                {name: d[2].shoptypename, value: d[2].count}
	            ]
	        }
	    });
    })
</script>



<!-- 条形统计图 -->
 <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;float: left;margin: 120px 100px"></div>
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
$(function (){
	   $.post("ht/TongJi.do?State=TJSex",function (Data){
    	var d = eval("("+Data+")");
    	var option = {
    	    title: {
    	        text: 'ECharts 入门示例'
    	    },
    	    tooltip: {},
    	    legend: {
    	        data:['销量']
    	    },
    	    xAxis: {
    	        data: [d[0].sexname,d[1].sexname,d[2].sexname]
    	    },
    	    yAxis: {},
    	    series: [{
    	        name: '销量',
    	        type: 'bar',
    	        data: [d[0].count,d[1].count,d[2].count,]
    	    }
    	    ]
    	};
    		// 使用刚指定的配置项和数据显示图表。
    	myChart.setOption(option);
    })
})
</script>
</body>
</html>
