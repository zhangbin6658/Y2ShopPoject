//var flag = true;
//$("#user-new-code").blur(function() {
//	var text = $("#user-new-code").val();
//	if (text == null) {
//		alert("验证码不能为空");
//		flag = false;
//	} else if (text != textCode) {
//		alert("验证码输入错误！");
//		flag = false;
//	}
//	return flag;
//});

var textCode = "";// 返回的验证码
$("#dyMobileButton").click(function() {
	var phone = $("#phone").val();
	alert(phone);
	if(phone !=null&& phone !=""){
	var btn01 = $("#dyMobileButton");
	btn01.attr('disabled', true);
	var time = 30; // 倒计时5秒
	var timer = setInterval(fun1, 1000); // 设置定时器
	function fun1() {
		time--;
		if (time >= 0) {
			var text = (time + 1 + "s后重新发送");
			btn01.val(text);
		} else {
			btn01.val("重新发送验证码");
			btn01.attr('disabled', false); // 倒计时结束能够重新点击发送的按钮
			clearTimeout(timer); // 清除定时器
			time = 30; // 设置循环重新开始条件
		}
	}
	// 发送请求
	$.ajax({
		url : "/endproject_shop/sms/sendSms.html",
		type : "post",
		data : {
			"phone" : phone,
			"num" : "2"//2表示更换手机号
		},
		success : function(code) {
			// alert(code);
			textCode = code;
		}
	});
	}else{
		alert("手机号有误！！！");
	}
});

$("#update-phone").click(function(){
	var text= $("#user-new-code").val();
	alert("text:"+text);
	if(text ==null || text ==""){
		alert("验证码不能为空！！！");
		return false;
	}else if(text　!=textCode){
		alert("验证码输入错误！！！");
		return false;
	}else{
		alert("验证成功。");
		return true;
	}
});



 