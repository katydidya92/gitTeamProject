<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
	var txt, x, i, xmlDoc;
	
	var xhr = new XMLHttpRequest();
	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/PhotoGalleryService/galleryList?serviceKey=0o7nPm%2FahbTes6ejTwMTOLxsu5HlsrABbeUMYEPrbgFEHxHkmwxAbXvqPQ628IFnRhOTflqVCucOcRpWmuxh2w%3D%3D&pageNo=1&numOfRows=20&MobileOS=ETC&MobileApp=123&arrange=A'; /*URL*/
	xhr.open('GET', url);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4 && this.status == 200) {
	    	
	    	xmlDoc = this.responseXML;
	    	txt = '';
	    	x = xmlDoc.getElementsByTagName('galTitle');
	    	var b = xmlDoc.getElementsByTagName('galTitle').length;
	    	console.log(b);
	    	
	    	var a = xhr.responseXML.getElementsByTagName( "galTitle" ).length;
	    	console.log(a);
	    	
	    	for(i = 0; i < a/5; i++) {
	    		txt = txt + x[i].childNodes[0].nodeValue + '<br/>'
	    	}
	    	document.getElementById('demo').innerHTML = txt;
	    }
	};
	xhr.send('');
	
	</script>
<div id = "demo"></div>

	</body>
</html>