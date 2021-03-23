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

	<h1> 게시판  1</h1>
	 
  <fieldset>
  
	<table>
	
		<tr>
			<td colspan="2" align="center"  width="300" > <b>제목</b></td>
			<td  align="center"><b>작성자</b></td>
			<td align="center"><b>작성일</b></td>
			<td align="center"> <b>조회</b></td>
			<td align="center"><b>좋아요</b></td>
		</tr>
		
	 
		<c:forEach items="${bbsList }" var="bbs"  > 
		 
		 <tr>
			<td width="20">${bbs.bbsID}</td>
			   
			 <td width="280">
				<a href="./BbsDetail.bbs/num=${bbs.bbsID }">
							${bbs.bbs_title }</a>
			 </td>
			
		     <td align="center" >${bbs.userNickName }</td>
			
			 <td><fmt:formatDate value="${bbs.bbs_date }" dateStyle="medium"/></td>
			 <td> 조회수 </td>  
			 <td>좋아요</td>
		  	     
		 </tr>
		 
		 </c:forEach>
		 
	</table>
	
	<hr>
	
	
	
	<a href="">이전</a>
	<a href="">이후</a>
	
	<a href="./BbsAdd.bbs">글 작성</a>
	
	
 </fieldset>



</body>
</html>