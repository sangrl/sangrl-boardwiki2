<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script src="${pageContext.request.contextPath}/js/teamBoard.reply.js"></script>

	<!-- Page top section -->
<section class="page-top-section set-bg" data-setbg="/img/page-top-bg/4.jpg">
	<div class="page-info">
		<h2>모임</h2>
		<div class="site-breadcrumb">
			<a href="">Home</a>  /
			<span>Team Request</span> /
			<span><a href="myTeam2">My Team</a></span>
		</div>
	</div>
</section>
<!-- Page top end-->
<section class="blog-page">
<div class="container">
	<div class="row">
		<div class="col-lg-12">
<!-- 게시판 글 상세 시작 -->
<div class="page-main">
	<h2> ${board.teaB_title}</h2>
	<div class="align-right">
	<c:if test="${!empty user &&user.mem_num != board.mem_num}">
	</c:if>
		<c:if test="${!empty user &&user.mem_num == board.mem_num}">
			<input type="button" value="수정"
				onclick="location.href='teamBoardUpdate?teaB_num=${board.teaB_num}'">
			<input type="button" value="삭제" id="delete_btn">
			<script type="text/javascript">
	 			const delete_btn = document.getElementById('delete_btn');
	 			delete_btn.onclick=function(){
	 				const choice = confirm('삭제하시겠습니까?');
	 				if(choice){
	 					location.replace('teamBoardDelete?teaB_num=${board.teaB_num}');
	 				}
	 			}
	 		</script>
		</c:if >
		<c:if test="${admin || user.mem_auth ==9}">
		<input type="button" value="목록" onclick="location.href='teamBoardAdmin?tea_num=${board.tea_num}'">
		</c:if>
		
		<c:if test="${!admin && user.mem_auth !=9}">
		<input type="button" value="목록" onclick="location.href='teamBoardUser?tea_num=${board.tea_num}'">
		</c:if>
	</div>	
	<ul class="detail-info">
	<li><input type="hidden" id="teaB_num" value="${board.teaB_num}"></li>
		<li> 작성자 : ${board.mem_nickname} <br>
			 <c:if test="${empty board.teaB_mdate}">
            작성일 : ${fn:substring(board.teaB_rdate, 0, 10)}
        </c:if>
        <c:if test="${!empty board.teaB_mdate}">
            최근 수정일 : ${fn:substring(board.teaB_mdate, 0, 10)}
        </c:if>  조회 : ${board.teaB_hit}</li>
	</ul>
	<c:if test="${!empty board.filename}">
		<ul class="detail-info">
			<li>첨부 파일 :  <a href=" file?teaB_num=${board.teaB_num}">${board.filename}</a></li>
		</ul>
	</c:if>
	<hr>
	<div class="detail-content">${board.teaB_content}</div>
	<hr>
	<div class="font-white">
		<span id="output_rcount"></span>
	</div>
	<!-- 	 댓글 ui 시작-->
	<div id="reply_div">
		<span class="re-title align-center">댓글달기</span>
		<form id="re_form">
			<input type="hidden" name="teaB_num" value="${board.teaB_num}" id="teaB_num">
			<textarea rows="3" cols="100" name="teaR_content" id="teaR_content" class="rep-content"
			<c:if test="${empty user}"> disabled="disabled"</c:if>
			><c:if test="${empty user}">로그인해야 작성할수 있습니다.</c:if></textarea>
			<c:if test="${!empty user}">
				<div id="re_first">
					<span class="letter-count">300/300</span>
				</div>
				<div id="re_second" class="align-right">
					<input type="submit" value="전송">
				</div>
			</c:if>
		</form>
	</div>
	<!--댓글 목록 출력  -->
	<div id="output"></div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/loading.gif" width="30" height="30">
	</div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="더보기">		
	</div>
	<!--  댓글 ui  끝 -->
</div>
<!-- 게시판 글 상세 끝 -->
</div>
</div>
</div>
</section>