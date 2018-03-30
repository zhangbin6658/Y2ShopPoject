//$("#updatePwd").click(function findPwd() {
//	
//	var oldPwd = $("#user-old-password").val();
//	/*if (oldPwd == null||oldPwd=="") {
//		alert("-------" + oldPwd);
//		var small = "<small style="
//		color: red;
//		">密码不能为空</small>"
//		$("#p-oldPwd").text("密码不能为空");
//		$("#user-old-password").Focus();
//	} else if (oldPwd.length < 6) {
//		alert("格式不正确" + oldPwd);
//		var small = "<small style="color: red;">密码输入错误</small>"
//		$("#p-oldPwd").text("密码格式错误");
//		$("#user-old-password").Focus();
//	} else {*/
//	if(oldPwd.length < 6){
//		
//	}else{
//		$.ajax({
//			url : "findCustomerAll.html",
//			type : "post",
//			data : {
//				"oldPwd" : oldPwd
//			},
//			success : function(flag) {
//				alert(flag);
//				if (flag) {
//					/*$("#p-oldPwd").style.display="none";*/
//				} else {
//					alert("密码输入错误");
//					/*var small = "<small style='color: red;'>密码输入错误</small>";*/
//					/*$("#user-old-password").after( "<small style='color: red;'>密码输入错误</small>");*/
//					$("#p-oldPwd").text("密码输入错误");
//					$("#user-old-password").Focus();
//				}
//				$(".am-form am-form-horizontal").attr({"onsubmit":flag});
//				return flag;
//			}
//		});
//	}
//	/*}*/
//});
