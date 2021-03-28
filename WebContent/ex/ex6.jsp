<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
	   // xml 데이터 파싱
	   $.ajax({
		   url:"../bs_spot.xml",
		   success:function(data){
			   $(data).find('item').each(function(){
				    var galTitle = $(this).find('MAIN_TITLE').text();
				    var galSearchKeyword = $(this).find('CATE2_NM').text();
				    var galWebImageUrl = $(this).find('MAIN_IMG_NORMAL').text();
				    
				    $('body').append(
				    				"이름:"+galTitle+"<br>"+
				    				"이름:"+galSearchKeyword+"<br>"+
				    			"이름: <img src ="+galWebImageUrl+" width='100' height='100'>"
				    				);
			   });
		   }
	   });
   });
  
</script>
</head>
<body>
 <h1>WebContent/jq3/xml.html</h1>
</body>
</html>