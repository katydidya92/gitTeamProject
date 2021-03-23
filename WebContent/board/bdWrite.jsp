<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> 글쓰기 </h1>

<form action="./bbsAddAction.bbs" method="post" enctype="multipart/form-data">
  <fieldset>
	<table >
		 
		<tr>
			 
			  <select name="bbs_category">
			     <option value="1">게시판1</option>
			     <option value="2">게시판2</option>
			     <option value="3">게시판3</option>
			     <option value="4">게시판4</option>
			  </select>
			
		</tr>
		  
			<br>
			<br>
			
			<tr>
			  <input type="text" name="bbs_title" cols="60" placeholder="제목을 입력해 주세요.">
			</tr>
			 <br><br>
			<tr>
			  <input type="file" name="fileID">
			</tr>
			<br><br>
			
			<tr>
			  <textarea name="bbs_content" cols="60" rows="30" placeholder="내용을 입력하세요."></textarea>
			</tr>
			  
	 
	</table>

			

  </fieldset>
  
  			<br>
  			<input type="submit" value="등 록 ">
			<input type="reset" value="취 소 ">
  			
  
  
</form>



</body>
</html>