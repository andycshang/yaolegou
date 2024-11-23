<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>瑶乐购 - 后台管理员登录界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="Image/title.ico" type="image/x-icon">
	<link rel="stylesheet" href="Css/Admin_Style.css" type="text/css">
	<script src="Js+JQuery/jquery-1.12.4.js"></script>
	
    <script type="text/javascript">
        var imgssz = new Array("Image/Admin_Image/1.jpg","Image/Admin_Image/2.jpg","Image/Admin_Image/3.jpg","Image/Admin_Image/4.jpg","Image/Admin_Image/5.jpg","Image/Admin_Image/6.jpg");
        var ran = Math.ceil(Math.random()*6-1);
        $(function (){
        	
            $("body").css({"background":"url("+imgssz[ran]+") no-repeat"});
            $("#back_login").slideUp(0).slideDown(800);
        })
        
        $(function (){
        	$("#denglu").click(function (){
        		var username = $("[name=UserName]").val();
        		var Pass = $("[name=Pass]").val();
        		
        		$.post("ht/LoginAdmin.do",{"UserName":username,"Pass":Pass},function (Data){
        			if(Data != 'null'){
        				window.open("ht/LoginAdmin.do?State=jiazai","_self");
        			}else{
        				alert("账号或密码错误");
        			}
        		})
        	})
        })
        
        
        //按下回车事件
        document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];            
            if(e && e.keyCode==13){ // enter 键
                 //要做的事情
                var username = $("[name=UserName]").val();
	    		var Pass = $("[name=Pass]").val();
	    		if(username != ""){
	    			if(Pass != ""){
	    				$.post("ht/LoginAdmin.do",{"UserName":username,"Pass":Pass},function (Data){
	    	    			if(Data != 'null'){
	    	    				window.open("ht/LoginAdmin.do?State=IndexAdmin","_self");
	    	    			}else{
	    	    				alert("账号或密码错误");
	    	    			}
	    	    		})
	    			}else{
	    				alert("密码不能为空");
	    			}
	    		}else{
	    			alert("用户名不能为空");
	    		}
	    		
            }
        }; 
    </script>
   	<script src="js/admin.js"></script>
  </head>
  
  <body>
<div id="back">
    <div id="back_Color"></div>
    <div id="back_login">
        <p>瑶乐购 后台面板</p>
        <form action="javascript:void(0)" id="forms">
            <div id="form">
                <input type="text" class="text" name="UserName" size="38px" placeholder="用户名">
                <input type="password" class="text" name="Pass" size="38px" placeholder="密码">
            </div>
            <div id="state">
                <input type="checkbox" class="check" id="check"><label for="check">记住我</label>
                <a href="#">忘记密码？</a>
            </div>
            <div id="login">
                <input id="denglu" type="button" value="登录"/>
                <span>哎呦，不想进去？<a href="#">还是返回首页吧！</a></span>
            </div>
        </form>
    </div>
</div>
</body>
</html>
