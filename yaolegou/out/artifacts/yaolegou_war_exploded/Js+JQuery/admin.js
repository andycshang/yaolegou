

function Click(){
	
}

$(function (){
	$.ajax({
		type: "POST",
		url: "Ajax/LoginHandler.ashx",
		data: "username=" + escape($('#username').val()) + "&password=" + escape($('#password').val()),
		beforeSend: function () {
			$("#loading").css("display", "block"); //点击登录后显示loading，隐藏输入框
			$("#login").css("display", "none");
		},
		success: function (msg) {
			$("#loading").hide(); //隐藏loading
			if (msg == "success") {
				//parent.tb_remove();
				parent.document.location.href = "admin.htm"; //如果登录成功则跳到管理界面
				parent.tb_remove();
			}
			if (msg == "fail") {
				alert("登录失败！");
			}
		}
	})
})