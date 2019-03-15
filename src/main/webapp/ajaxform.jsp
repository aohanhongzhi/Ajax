<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>login test</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="ajax方式">
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	function login() {
		$.ajax({
			//几个参数需要注意一下
			url : "${pageContext.request.contextPath}/users/login",//url
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			data : $('#form1').serialize(),//这个是发送给服务器的数据
			
			success : function(result) {
				console.log(result);//打印服务端返回的数据(调试用),result是服务器返回的数据，一定要返回json数据，否则就是error
				if (result.resultCode == 200) {
					alert("SUCCESS");
				}
				
				;
			},
			error : function() {
				//console.log(data);
				alert("异常！");
			}
		});
	}
</script>
</head>
<body>
	<div id="form-div">
		<form id="form1" onsubmit="return false" action="##" method="post">
			<p>
				用户名：<input name="userName" type="text" id="txtUserName" tabindex="1"
					size="15" value="" />
			</p>
			<p>
				密 码：<input name="password" type="password" id="TextBox2"
					tabindex="2" size="16" value="" />
			</p>
			<p>
				<input type="button" value="登录" onclick="login()">&nbsp;<input
					type="reset" value="重置">
			</p>
		</form>
	</div>
</body>
</html>