<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.5.1.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
	   // xml 데이터 파싱
	   $.ajax({
		   url:"http://api.visitkorea.or.kr/openapi/service/rest/PhotoGalleryService/galleryList?serviceKey=0o7nPm%2FahbTes6ejTwMTOLxsu5HlsrABbeUMYEPrbgFEHxHkmwxAbXvqPQ628IFnRhOTflqVCucOcRpWmuxh2w%3D%3D&pageNo=1&numOfRows=20&MobileOS=ETC&MobileApp=123&arrange=A",
		   success:function(data){
			   				// 상위 카테고리 선택
			   $(data).find('item').each(function(){
				    // 원하는 데이터 이름 선택
				    var count = 0;
				    $(this).find('galWebImageUrl').each(function(){
				    	count++;
				    }); // .length()
				    var galTitle = $(this).find('galTitle').text();
				    var galSearchKeyword = $(this).find('galSearchKeyword').text();
				    var galWebImageUrl = $(this).find('galWebImageUrl').text();
				    
				    console.log(count);
				    
				    
				    
				    for(var j = 0; j < count; j++) {
				    	  $('#a12').append("<tr><td>이름:"+galTitle+
					    				"<br/>검색키워드:"+galSearchKeyword/* .split(",")[3] */+
					    			"<br/>그림: <img src ="+galWebImageUrl+" width='100' height='100'></td></tr>"
					    			);
				    }
			   });
		   }
	   });
   });
  
</script>
</head>
<body>
 <table id = "a12">
 </table>

</body>
</html>