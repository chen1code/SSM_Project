$(function(){	
	$(".input-block input").focus(function(){
		$(".wrong-tip").css("visibility","hidden");
	})
	$("#submit").click(function(){
		//var data = $("#login_regis").serialize();
		var account = $("#account").val();
		var password = $("#password").val();
		$.ajax({
			url : "login",
			type : "POST",
			async:true,
			dataType: "json",
			data: {
				account : account,
				password: password
			},
			success : function(data_return){
				if(data_return.message == "登录成功"){
					window.location.href = "index";
				}else{
					$(".wrong-tip").css("visibility","visible");
				}
			},
			error: function(){
				window.location.href="login";
			}
		})
	})
	//注册
	$("#regist").click(function(){
		//var data = $("#login_regis").serialize();
		var account = $("#account").val();
		var password = $("#password").val();
		if(account != "" && password != ""){
			$.ajax({
				url : "regist",
				type : "POST",
				async:true,
				dataType: "json",
				data: {
					account : account,
					password: password
				},
				success : function(data_return){
					if(data_return.message == "注册成功"){
						window.location.href = "login";
					}else{
						$(".wrong-tip").css("visibility","visible")
					}
				},
				error: function(){
					window.location.href="error";
				}
			})
		}
	})
	
	
})
