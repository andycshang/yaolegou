<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fenye.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="Js+JQuery/jquery-1.12.4.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="height: 100%; margin: 0">
       <div id="container" style="height: 100%"></div>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
       <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
       <script type="text/javascript">
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		
		var str1 = [];
		$.post("DiTu.do",function (Data){
			var d = eval(Data);
			
			$.each(d,function (){
				if(this.mapname == "邯郸"){
					str1.push({name: '邯郸', value: 98});
				}else if(this.mapname == "石家庄"){
					str1.push({name: '石家庄', value: 147});
				}else if(this.mapname == "秦皇岛"){
					str1.push({name: '秦皇岛', value: 136});
				}else if(this.mapname == "邢台"){
					str1.push({name: '邢台', value: 119});
				}else if(this.mapname == "保定"){
					str1.push({name: '保定', value: 153});
				}else if(this.mapname == "张家口"){
					str1.push({name: '张家口', value: 31});
				}else if(this.mapname == "承德"){
					str1.push({name: '承德', value: 25});
				}else if(this.mapname == "沧州"){
					str1.push({name: '沧州', value: 100});
				}else if(this.mapname == "廊坊"){
					str1.push({name: '廊坊', value: 193});
				}else if(this.mapname == "衡水"){
					str1.push({name: '衡水', value: 80});
				}else if(this.mapname == "唐山"){
					str1.push({name: '唐山', value: 119});
				}
			})
			var data = str1;
			
			var str2 = [];
			var geoCoordMap = {
				'邯郸':[114.47,36.6],
				'石家庄':[114.48,38.03],
				'唐山':[118.02,39.63],
				'秦皇岛':[119.57,39.95],
				'邢台':[114.48,37.05],
				'保定':[115.48,38.85],
				'张家口':[114.87,40.82],
				'承德':[117.93,40.97],
				'沧州':[116.83,38.33],
				'廊坊':[116.7,39.53],
				'衡水':[115.72,37.72],
			};
	
			var convertData = function (data) {
				var res = [];
				for (var i = 0; i < data.length; i++) {
					var geoCoord = geoCoordMap[data[i].name];
					if (geoCoord) {
						res.push({
							name: data[i].name,
							value: geoCoord.concat(data[i].value)
						});
					}
				}
				return res;
			};
	
			option = {
				title: {
					text: '瑶乐购 用户分布（中国） - 百度地图',
					subtext: 'data from PM25.in',
					sublink: 'http://www.pm25.in',
					left: 'center'
				},
				tooltip : {
					trigger: 'item'
				},
				bmap: {
					center: [104.114129, 37.550339],
					zoom: 5,
					roam: true,
					mapStyle: {
						styleJson: [{
							'featureType': 'water',
							'elementType': 'all',
							'stylers': {
								'color': '#d1d1d1'
							}
						}, {
							'featureType': 'land',
							'elementType': 'all',
							'stylers': {
								'color': '#f3f3f3'
							}
						}, {
							'featureType': 'railway',
							'elementType': 'all',
							'stylers': {
								'visibility': 'off'
							}
						}, {
							'featureType': 'highway',
							'elementType': 'all',
							'stylers': {
								'color': '#fdfdfd'
							}
						}, {
							'featureType': 'highway',
							'elementType': 'labels',
							'stylers': {
								'visibility': 'off'
							}
						}, {
							'featureType': 'arterial',
							'elementType': 'geometry',
							'stylers': {
								'color': '#fefefe'
							}
						}, {
							'featureType': 'arterial',
							'elementType': 'geometry.fill',
							'stylers': {
								'color': '#fefefe'
							}
						}, {
							'featureType': 'poi',
							'elementType': 'all',
							'stylers': {
								'visibility': 'off'
							}
						}, {
							'featureType': 'green',
							'elementType': 'all',
							'stylers': {
								'visibility': 'off'
							}
						}, {
							'featureType': 'subway',
							'elementType': 'all',
							'stylers': {
								'visibility': 'off'
							}
						}, {
							'featureType': 'manmade',
							'elementType': 'all',
							'stylers': {
								'color': '#d1d1d1'
							}
						}, {
							'featureType': 'local',
							'elementType': 'all',
							'stylers': {
								'color': '#d1d1d1'
							}
						}, {
							'featureType': 'arterial',
							'elementType': 'labels',
							'stylers': {
								'visibility': 'off'
							}
						}, {
							'featureType': 'boundary',
							'elementType': 'all',
							'stylers': {
								'color': '#fefefe'
							}
						}, {
							'featureType': 'building',
							'elementType': 'all',
							'stylers': {
								'color': '#d1d1d1'
							}
						}, {
							'featureType': 'label',
							'elementType': 'labels.text.fill',
							'stylers': {
								'color': '#999999'
							}
						}]
					}
				},
				series : [
					{
						type: 'scatter',
						coordinateSystem: 'bmap',
						data: convertData(data),
						symbolSize: function (val) {
							return val[2] / 10;
						},
						label: {
							normal: {
								formatter: '{b}',
								position: 'right',
								show: false
							},
							emphasis: {
								show: true
							}
						},
						itemStyle: {
							normal: {
								color: 'purple'
							}
						}
					},
					{
						type: 'effectScatter',
						coordinateSystem: 'bmap',
						data: convertData(data.sort(function (a, b) {
							return b.value - a.value;
						}).slice(0, 6)),
						symbolSize: function (val) {
							return val[2] / 10;
						},
						showEffectOn: 'render',
						rippleEffect: {
							brushType: 'stroke'
						},
						hoverAnimation: true,
						label: {
							normal: {
								formatter: '{b}',
								position: 'right',
								show: true
							}
						},
						itemStyle: {
							normal: {
								color: 'purple',
								shadowBlur: 10,
								shadowColor: '#333'
							}
						},
						zlevel: 1
					}
				]
			};;
			if (option && typeof option === "object") {
				myChart.setOption(option, true);
			}
			})
		
		
		
		
		

       </script>
   </body>
</html>
