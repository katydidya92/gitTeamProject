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
				<td >
					<a href="bdDetail.jsp"><img  src="manhattan.jpg" width="200" height="200"></a>				
				</td>
				

				 
			</tr>
			 
		</table>
			
			 
			 		
	</c:forEach>
		
		 
	</fieldset>
	


	








</body>
</html>