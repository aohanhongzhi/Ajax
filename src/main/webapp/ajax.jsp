<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
<script>
	function loadXMLDoc() {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.oneadystatechange = function() {
			document.getElementById("status").innerHTML = xmlhttp.responseText;
			
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
			}
		}
		/* xmlhttp.open("GET", "ajax_info.txt", true); */
		xmlhttp.open("POST", "/ajax/Test", true);
		xmlhttp.send();
	}
</script>
</head>
<body>
	<div id="status"></div>
	<div id="myDiv">
		<h2>使用 AJAX 修改该文本内容!</h2>
	</div>
	<button type="button" onclick="loadXMLDoc()">修改内容</button>



</body>
</html>