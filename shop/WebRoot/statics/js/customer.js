var flag = true;
function checkPassWord(pwd) {
	var passWord = pwd.value;
	if (passWord == "" || passWord == null) {
		alert("密码不能为空！");
		flag = false;
	} else if (!(/^\d{6}$/.test(passWord))) {
		alert("密码格式不正确，请重填！！！");
		flag = false;
	}
	return flag;
}

function checkPassWordRepeat(pwd) {
	var passWord = $("#passWord").val();
	var passWordRepeat = pwd.value;
	if (passWordRepeat == "" || passWordRepeat == null) {
		alert("密码不能为空！");
		flag = false;
	} else if (passWordRepeat == passWord) {

		alert("两次密码不一致，请重填！！！");
		flag = false;
	}
	return flag;
}
function checkPhone(phone) {
	$("#phone").style.color = "black";
	var value = phone.value;
	if (value == "" || value == null) {
		alert("Please input " + e.name + "!");
		flag = false;
	} else if (!(/^1[3|5|7|8]\d{9}$/.test(value))) {
		$("#phone").style.color = "red";
		alert("手机号码有误，请重填！！！");
		flag = false;
	}
	return flag;

}
$("#code").blur(function() {
	var text = $("#code").val();
	if (text == null) {
		alert("验证码不能为空");
		flag = false;
	} else if (text != textCode) {
		alert("验证码输入错误！");
		flag = false;
	}
	return flag;
});

var textCode = "";// 返回的验证码
$("#dyMobileButton").click(function() {
	var phone = $("#phone").val();
if(phone!=null && phone!=""){
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
			"num" : "1"// 1表示注册请求
		},
		success : function(code) {
			// alert(code);
			textCode = code;
		}
	});
}
	
});

// $("#code").blur(function() {
// var text = $("#code").val();
// if (text == null) {
// alert("验证码不能为空");
// flag = false;
// } else if (text != textCode) {
// alert("验证码输入错误！");
// flag = false;
// }
// return flag;
// });

$("#register").click(function(){
	var passWords =$("#passwords").val();
	/* alert("---------2"+passWords); */
	var passWord = $("#password").val();
	/* alert("----------1"+passWord); */
	if (passWords != passWord) {
		alert("两次密码不一致，请重填！！！");
		return false;
	}
	var text = $("#code").val();
	if (text != textCode) {
		alert("验证码输入错误！");
		return false;
	}
});


$(function() {
	$('#doc-my-tabs').tabs();
});

 