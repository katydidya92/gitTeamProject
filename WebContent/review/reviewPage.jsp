<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판</title>

<script src="${contextPath }/js/bootstrap.js"></script>
<script src="${contextPath }/js/jquery-3.5.1.js"></script>

<link rel="stylesheet" href="${contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath }/review/css/detail.css">
<link rel="stylesheet" href="${contextPath }/review/css/noticeWrite.css">
 
<script type="text/javascript">
	$(function(){
		$('#likeBtn').click(function() {
			var bbsID = $('#BBSID').attr('value');
			$.ajax({
				url: "${pageContext.request.contextPath}/like.ao?bbsID="+bbsID,
				type: "get" ,		 			
				success: function(data) {
					var data2 = data.split(",")[0];
					var data3 = data.split(",")[1];
					if(data2 == 1){
						$('#likeImg').attr('src','./img/heart.png');
						$('#likeResult').text(data3);  
					} else if(data2 == 0) {
						$('#likeImg').attr('src','./img/like.png');
						$('#likeResult').text(data3);  
					} else {
						alert(data);
					}
				 },
		 		error: function() {
		 			alert("error");	
		 		}
		 	});
		});
	});
</script> 
</head>
<body>
	<!-- 네비게이션 -->
	<jsp:include page="../inc/nav.jsp" />
	<!-- 네비게이션 -->
	<!-- @ subHeader Top area -->    
	<div id="subVisual">
	    <section id="subVisu" class="submenu-DOM_00000020100300">
	        <h2 class="tit">게시판</h2>
	    </section>
	    <section id="nav">
	        <div class="navInner boxing">
	            <div class="left">
	                <ul>
	                	<li class="home"><a href="${contextPath }/Main.do" title="홈"><img src="${contextPath }/img/sub/home.jpg" style="height: 22px; margin-top: 15px;"></a></li>
						<li class="home">게시판 > </li>
						<li class="depth2"><a href="${contextPath }/ReviewList.ao" title="후기로 갑니다">후기 게시판 </a></li>
	                </ul>
	            </div>
	        </div>
	    </section>
	    <script src="${contextPath }/js/subjs.js"></script>
	</div>
	<hr style = "margin: 2.5% 5% ">
    <!--// @ subHeader Top area -->
	<div class="container">
		<div id="content">
	  		<div class="innerwrap">
	  		<c:set var="url" value="${pageContext.request.requestURL}" />
			<c:set var="uri" value="${pageContext.request.requestURI}" />
			<c:set var="scheme" value="${pageContext.request.scheme}" />
			<c:set var="serverName" value="${pageContext.request.serverName}" />
			<c:set var="serverPort" value="${pageContext.request.serverPort}" />
	  		<h1>${scheme }</h1>
	  		<h1>${serverName }</h1>
	  		<h1>${serverPort }</h1>
	  		<h1>${contextPath }</h1>
	  		<h1>${url }</h1>
	  		<h1>${uri }</h1>
	  		<hr>
		 		<form action="./BbsModifyEnd.bo" method="post">
				 	<c:set value="${bbsDetail }" var="bbsDetail" />  
					<c:set value="${likeCheck }" var="likeCheck" />
					<c:set value="${likeSum }" var="likeSum" />
					 
					<input type="hidden" value="${bbsDetail.bbsID }" name="bbsID" id="BBSID">
					<input type="hidden" value="${bbsDetail.userID }" name="userID">
					<input type = "hidden" value = "3" name = "bbs_category">
					<table class="bbs_default view">
						<colgroup>
				   			<col style="width:200px">
				   			<col style="width:auto;">
						</colgroup>
						<tr>
							<td colspan="6">
								<div><h4 class="tit">  ${bbsDetail.bbs_title }</h4></div>   
							</td>
						</tr>	 
						<tr>
							<td style="text-align: center;"><span  style="font-weight: bold;">닉네임</span>  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  ${bbsDetail.userNickName } </td>
							<td style="text-align: center;"><span  style="font-weight: bold;">작성일</span>   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <fmt:formatDate value="${bbsDetail.bbs_date }"  pattern="yyyy.MM.dd  HH:mm" /></td>
							<td style="text-align: center;"><span  style="font-weight: bold;">조회</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${bbsDetail.bbs_readcount }</td>
							<td style="text-align: right;">
								<c:if test="${userID eq bbsDetail.userID}">
			        				<input type="button" style="padding: 3px 7px;  border-radius: 5px;" value="수 정" onclick="location.href='./ReviewModify.ao?bbsID=${bbsDetail.bbsID}'">
									<input type="button" style="padding: 3px 7px;  border-radius: 5px;" onclick="return fun();" value="삭 제">
								</c:if>
							</td>
	 					</tr>
				<!--  -------------------내용부분-------------------- -->
	 		 			<tr>
							<td colspan="6">
				   				<br><img id="blah" src="${contextPath }/upload/${fileName}" style = "height : 500px; " alt="your image" /><br><br><br>
	 			  				<div >${bbsDetail.bbs_content }</div> <!-- //내용 -->
		  	 	   				<br><br><br>
		  	 	   			</td>
	 		 			</tr>
		  	 	   				
 						<tr style="border-top: 10px solid white; ">	
							<td colspan="6">
			  	   				<a href="${contextPath }/ReviewList.ao?sc_ck=userNickName&search=${bbsDetail.userNickName}"><b style="font-size: 17px; font-weight: bold;">${bbsDetail.userNickName }</b> 님의 게시글 더보기</a><br><br>
 						
 						<!--  좋아요---------------------------------------- -->		  	
 						
 							</td>
 						</tr>
 						<tr style="border-top: 10px solid white; ">	
 							<td colspan="6" >
				  				<c:choose>
									<c:when test="${likeCheck ==0 }">
				 						 
				 						<button type="button" id="likeBtn" style="margin-left: 50%;  outline-style: none; "  >
				 							<img id="likeImg" alt="Like" src="./img/like.png" width="20" height="20">
				 							<div id="likeResult" >${likeSum }</div>
				 						</button>
				 						 
				 					</c:when>
				 					<c:when test="${likeCheck ==1 }">
				 						<button type="button" id="likeBtn" style="margin-left: 50% ; outline-style: none;  " >
				 							<img id="likeImg" alt="Like" src="./img/heart.png" width="20" height="20">
				 							<div id="likeResult">${likeSum }</div> 
				 						</button>
				 					</c:when>
				   				</c:choose>
				   				<br><br>
							<!--  좋아요 ------------------------------------------------->	
							</td>
	 		 			</tr>
					</table>
				</form>
				<script type="text/javascript">
			        function fun(){
						var con = confirm('정말로 삭제하시겠습니까?')
						if(con==true) {
							location.href="./ReviewDelete.ao?bbsID="+${bbsDetail.bbsID};
						} else if(con==false) {
							return false;
						}
					}
			        
			        function writeCk(){
						var fr = document.fr;
						if(fr.cmt_content.value==""){
							alert("글 내용을 입력하세요");
							return false;
						}
					}
			</script>
	 	<!-- ---------댓글 리스트-------------------------------------------- -->
		<div class="commnet-container">
		    <div class="comment-count">
		        <h4>댓글</h4>
		    </div>
		    <c:forEach items="${cmtList }" var="ct" varStatus="vs">
		    	<c:set value="${userList }" var="ut" />
		    <table >
		        <tbody class="cmt-content${vs.index}">
		            <tr class="left-section" >
	                	<td class="left-info-nick">닉네임 : ${ut[vs.index].userNickName }</td>
		                <td class="left-info-date"><fmt:formatDate  value="${ct.cmt_date }" pattern="yyyy.MM.dd HH:mm" /></td>
		            </tr >
		
		            <tr class="right-section" >
		            	<c:if test="${not empty userID}">
				            <td id="reCmt${vs.index}" class="right-info">대댓글</td >
		                </c:if>
		            	<c:if test="${userID eq ct.userID}">
		                	<td id="fixCmt${vs.index}" class="right-info">수정</td >
		                </c:if>
		            	<c:if test="${userID eq ct.userID or adminStatus eq 1}">
		                	<td id="delCmt${vs.index}" class="right-info">삭제</td >
		                </c:if>
		            </tr >
		        </tbody >
		        <tbody>
		            <tr class="cmt-content${vs.index}">
		                <td class="comment-content">${ct.cmt_content }</td>
		            </tr>
		        </tbody>
		
		        <tfoot >
			        <div class="fix-comment-hidden${vs.index}" style="display: none">
			            <div class="fix-comment-txt">
			                <textarea id="fixCmtCnt${vs.index}" name="fixcmtCnt" placeholder="여러분의 소중한 댓글을 수정해주세요.">${ct.cmt_content }</textarea>
			            </div>
			            <div class="fix-comment-button">
			                <button id="fixCmtCnt-btn${vs.index}" class="fix-CmtBtn tabActive${vs.index}">수정하기</button>
			                <button class="fix-CmtBtn-cancel${vs.index}">취소</button>
			            </div>
			        </div>
		        	<c:forEach items="${cmtReList }" var="ct2" varStatus="vs2">
		        		<c:set value="${userReList }" var="ut2" />
				        <c:if test="${ct.cmt_ref == ct2.cmt_ref}">
					        <tr class="reCmtCnt reFixCmt-hiddenInfo${vs2.index}">
				            	<td class="reCmtCnt-nick">닉네임 : ${ut2[vs2.index].userNickName }</td>
					            <td class="reCmtCnt-date"><fmt:formatDate  value="${ct2.cmt_date }" pattern="yyyy.MM.dd HH:mm" /></td>
					           	<c:if test="${userID eq ct2.userID}">
					            	<td class="reCmtCnt-right-info fixTabActive${vs2.index}" id="reCmtCnt-fix${vs2.index}" style="right: 55px">수정</td >
					            </c:if>
					            <c:if test="${userID eq ct2.userID or adminStatus eq 1}">
					            	<td class="reCmtCnt-right-info" id="reCmtCnt-del${vs2.index}" style="right: 10px">삭제</td >
					            </c:if>
					            <td class="reCmtCnt-content">${ct2.cmt_content }</td>
					        </tr>
					        <tr class="reFixCmt-hidden${vs2.index} hiddenReCmtFix" style="display: none">
					            <td class="reComment-fixTxt">
					                <textarea id="reFixCmtCnt${vs2.index}" name="reFixCmtCnt${vs2.index}" placeholder="여러분의 소중한 댓글을 입력해주세요.">${ct2.cmt_content }</textarea>
					            </td>
					            <td class="reComment-fixButton">
					                <button id="reFixCmtCnt-btn${vs2.index}" class="reCmtBtn fixTabActive${vs2.index}">완료</button>
					                <button class= "refix-CmtBtn-cancel${vs2.index}">취소</button>
					            </td>
					        </tr>
				        </c:if>
		        	</c:forEach>
		        <tr class="reCmt-hidden${vs.index} hiddenReCmt">
		            <td class="reComment-txt">
		                <textarea id="reCmtCnt${vs.index}" name="reCmtCnt${vs.index}" placeholder="여러분의 소중한 대댓글을 입력해주세요."></textarea>
		            </td>
		            <td class="reComment-button">
		                <button id="reCmtCnt-btn${vs.index}" class="reCmtBtn">대댓</button>
		                <button id="reCmtCnt-btn-cancel${vs.index}" class="reCmtBtn">취소</button>
		            </td>
		        </tr>
		        </tfoot >
		    </table >
		    </c:forEach>
		    <div>
		        <div class="comment-txt">
		            <textarea id="cmtCnt" name="cmtCnt" placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
		        </div>
		        <div class="comment-button">
		            <button id="cmtCnt-btn">댓글달기</button>
		        </div>
		    </div>
		</div>
		
		<script type="text/javascript">
			$("#cmtCnt-btn").click(function() {
				$.ajax({
					url : "${contextPath }/CmtAdd.cmt",
					type : "POST",
					data : {
						cmt_content : $("#cmtCnt").val(),
						bbsID : '${bbsDetail.bbsID }'
					},
					success : function() {
						console.log("보내기 성공");
						location.reload()
					},
				})
			});

			<c:forEach items="${cmtList }" var="ct" varStatus="vs" >
				$("#reCmt${vs.index}").click(function() {
					$(".reCmt-hidden${vs.index}").css("display", "block");
				});
			
				$("#reCmtCnt-btn-cancel${vs.index}").click(function() {
					$(".reCmt-hidden${vs.index}").css("display", "none");
				});
				
				$("#fixCmt${vs.index}").click(function() {
					$(".cmt-content${vs.index}").css("display", "none");
					$(".fix-comment-hidden${vs.index}").css("display", "block");
				});
			
				$(".fix-CmtBtn-cancel${vs.index}").click(function() {
					$(".cmt-content${vs.index}").css("display", "");
					$(".fix-comment-hidden${vs.index}").css("display", "none");
				});
				
				$("#reCmtCnt-btn${vs.index}").click(function() {
					$.ajax({
						url : "${contextPath }/CmtReply.cmt",
						type : "POST",
						data : {
							cmt_content : $("#reCmtCnt${vs.index}").val(),
							cmtID : '${ct.cmtID}',
							cmt_seq : '${ct.cmt_seq }',
							cmt_lev : '${ct.cmt_lev }',
							cmt_ref : '${ct.cmt_ref }',
							cmt_seq : '${ct.cmt_seq }',
							bbsID : '${bbsDetail.bbsID }'
						},
						success : function() {
							console.log("보내기 성공");
							location.reload()
						},
					})
				});
				
				$("#fixCmtCnt-btn${vs.index}").click(function() {
					$.ajax({
						url : "${contextPath }/CmtModify.cmt",
						type : "POST",
						data : {
							cmt_content : $("#fixCmtCnt${vs.index}").val(),
							cmtID : '${ct.cmtID}',
							cmt_seq : '${ct.cmt_seq }',
							cmt_lev : '${ct.cmt_lev }',
							cmt_ref : '${ct.cmt_ref }',
							cmt_seq : '${ct.cmt_seq }',
							bbsID : '${bbsDetail.bbsID }'
						},
						success : function() {
							location.reload()
						},
					})
				});
				
				$("#delCmt${vs.index}").click(function() {
					if (confirm('정말 삭제하시겠습니까 ?') == true) {
						$.ajax({
							url : "${contextPath }/CmtDelete.cmt",
							type : "POST",
							data : {
								cmtID : '${ct.cmtID}',
								bbsID : '${bbsDetail.bbsID }'
							},
							success : function() {
								console.log("보내기 성공");
								location.reload()
							},
						})
					}
				});
				
				function confirmDelete() {
					if ('${ct.cmtID }') {
						alert("댓글이 있는 게시글은 삭제할 수 없습니다.");
						return false;
					}
				};
			</c:forEach>
		</script>
			
		<script type="text/javascript">
			<c:forEach items="${cmtReList }" var="ct2" varStatus="vs2" >
				$("#reCmtCnt-fix${vs2.index}").click(function() {
					$(".reFixCmt-hidden${vs2.index}").css("display", "block");
					$(".reFixCmt-hiddenInfo${vs2.index}").css("display", "none");
				});
			
				$(".refix-CmtBtn-cancel${vs2.index}").click(function() {
					$(".reFixCmt-hidden${vs2.index}").css("display", "");
					$(".reFixCmt-hiddenInfo${vs2.index}").css("display", "block");
				});
				
				$("#reFixCmtCnt-btn${vs2.index}").click(function() {
					$.ajax({
						url : "${contextPath }/CmtReModify.cmt",
						type : "POST",
						data : {
							cmt_content : $("#reFixCmtCnt${vs2.index}").val(),
							cmtID : '${ct2.cmtID}',
							bbsID : '${bbsDetail.bbsID }'
						},
						success : function() {
							console.log("보내기 성공");
							location.reload()
						},
					})
				});
				
				$("#reCmtCnt-del${vs2.index}").click(function() {
					if (confirm('정말 삭제하시겠습니까 ?') == true) {
						$.ajax({
							url : "${contextPath }/CmtDelete.cmt",
							type : "POST",
							data : {
								cmtID : '${ct2.cmtID}',
								bbsID : '${bbsDetail.bbsID }'
							},
							success : function() {
								console.log("보내기 성공");
								location.reload()
							},
						})
					}
				});
			</c:forEach>
		</script>
		<!-- 댓글 00000000000000000000000000000000000000000000000 -->
				</div> 
			</div>
		</div>
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer -->
</body>
</html>