<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 게시판 목록 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<section class="page-top-section set-bg" data-setbg="/img/page-top-bg/4.jpg">
		<div class="page-info">
		<c:choose>
        	<c:when test="${param.boa_category == 4}">
           		 <h2>공지</h2>
       		 </c:when>
        	<c:when test="${param.boa_category == 5}">
           		 <h2>QnA</h2>
       		 </c:when>
    	</c:choose>
    	<c:choose>
        	<c:when test="${param.boa_category == 4}">
           		 <div class="site-breadcrumb">
				<a href="list2?boa_category=4">Home</a>  /
				<span>Notice</span>
			</div>
       		 </c:when>
        	<c:when test="${param.boa_category == 5}">
           		<div class="site-breadcrumb">
				<a href="list2?boa_category=5">Home</a>  /
				<span>QnA</span>
			</div>
       		 </c:when>
    	</c:choose>
		</div>
</section>
<section class="blog-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
<div class="page-main">
	<form action="list2" id="search_form" method="get">
		<input type="hidden" name="boa_category" value="${param.boa_category}">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
					<option value="2"<c:if test="${param.keyfield == 2}">selected</c:if>>내용</option>
					<option value="3"<c:if test="${param.keyfield == 3}">selected</c:if>>제목+내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
			</li>
		</ul>
		<div class="align-right">
			<select id="order" name="order">
				<option value="1"<c:if test="${param.order == 1}">selected</c:if>>최신순</option>
				<option value="2"<c:if test="${param.order == 2}">selected</c:if>>조회수</option>
				<option value="3"<c:if test="${param.order == 3}">selected</c:if>>좋아요</option>
				<option value="4"<c:if test="${param.order == 4}">selected</c:if>>댓글수</option>
			</select>
			<script type="text/javascript">
				$('#order').change(function(){
					location.href='list2?boa_category=${param.boa_category}&keyfield='
							+$('#keyfield').val()+'&keyword='
							+$('#keyword').val()+'&order='
							+$('#order').val();
				});
			</script>
			<c:choose>
	    		<c:when test="${param.boa_category == 4}">
					<c:if test="${!empty user && user.mem_auth == 9}">
						<input type="button" value="글쓰기" onclick="location.href='write2?boa_category=4'">
					</c:if>
	   			</c:when>   
	   			<c:when test="${param.boa_category == 5}">
					<c:if test="${!empty user}">
						<input type="button" value="글쓰기" onclick="location.href='write2?boa_category=5'">
					</c:if>
	  			</c:when> 
			</c:choose>
		</div>
	</form>
	<c:if test="${count==0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div class="chart-table">
	<table>
		<thead>
		<tr>
			<th>번호</th>
			<th class="chart-th-title">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>좋아요수</th>
		</tr>
		</thead>
		<c:forEach var="board" items="${list}">
		<tr>
			<td class="align-center">${board.boa_num}</td>
			<td class="align-left chart-th-title"><a href="detail2?boa_num=${board.boa_num}">${board.boa_title}(${board.re_cnt})</a></td>
			<td class="align-center">
				<c:if test="${empty board.mem_nickname}">${board.mem_email}</c:if>
				<c:if test="${!empty board.mem_nickname}">${board.mem_nickname}</c:if>
			</td>
			<td class="align-center">${board.boa_rdate}</td>
			<td class="align-center">${board.boa_hit}</td>
			<td class="align-center">${board.fav_cnt}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	<div class="align-center">
	<div class="blog-pagination">${page}</div>
	</div>
	</c:if>
</div>
</div>
</div>
</div>
</div>
</section>

<!-- 게시판 목록 끝 -->













