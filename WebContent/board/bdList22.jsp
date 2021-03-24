<%@page import="com.tp.bbs.db.BbsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 게시판 2</h1>
	
	
	<fieldset>
			
	<c:forEach items="${bbsList }" var="bbs">
			
		<table  width="600" height="200">
			<tr>
				<td rowspan="3">
					<a href="#"><img  src="manhattan.jpg" width="200" height="200"></a>				
				</td>
				
				
				<td>${bbs.bbs_title }</td>
				<td align="right">
				  <fmt:formatDate value="${bbs.bbs_date }" dateStyle="medium"/>
				</td>
			</tr>
			
			<tr>
				
				<td colspan="2">
				 <div>${bbs.bbs_content }</div> 
				
				</td>
				 
			</tr>
			
			<tr>
				<td><img src="view.png" width="15" height="`15" > 조회수 <img src="chat.png" width="15" height="15" > 리뷰수  </td>
				<td  align="right" >
				 <a href="#" style="text-decoration: none;" >자세히 보기 >></a> 
				</td>
				 
			</tr>
			
		</table>
			<hr>
			
			 		
	</c:forEach>
		
		 
	</fieldset>
	


	








</body>
</html>