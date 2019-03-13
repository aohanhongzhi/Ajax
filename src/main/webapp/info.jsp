<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function loadXMLDoc(url) {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				
				
				
				var jsonObj = JSON.parse(  xmlhttp.responseText );
				alert(jsonObj);
				document.getElementById('A1').innerHTML = xmlhttp.status;
				document.getElementById('A2').innerHTML = xmlhttp.statusText;
				document.getElementById('A3').innerHTML = xmlhttp.responseText;
				document.getElementById('A4').innerHTML = jsonObj.key;
			}
		}
		xmlhttp.open("POST", url, true);
		xmlhttp.send();
	}
</script>
</head>
<body>

	<h2>Retrieve data from XML file</h2>
	<p>
		<b>Status:</b><span id="A1"></span>
	</p>
	<p>
		<b>Status text:</b><span id="A2"></span>
	</p>
	<p>
		<b>Response:</b><span id="A3"></span>
	</p>
	<p id ="A4"> </p>
	<button onclick="loadXMLDoc('/ajax/Test')">Get XML data</button>


</body>
</html>