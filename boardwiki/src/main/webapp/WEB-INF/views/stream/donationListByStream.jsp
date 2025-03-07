<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/boradchat.js"></script>
<script>
let strNum = ${param.str_num};

function resizeWindow() {
    // 페이지 내용의 높이와 너비를 계산
    var pageHeight = document.documentElement.scrollHeight;
    var pageWidth = document.documentElement.scrollWidth;

    window.resizeTo(pageWidth, pageHeight);
}

// DOM이 완전히 로드된 후 창 크기 조정
window.onload = resizeWindow;
</script>
<section class="blog-page">
<div class="container">
<div class="row">
		<div class="col-lg-12">
		<div class="game-main">
<h2>도네이션 목록 (방송 기준)</h2>
	<c:if test="${count == 0}">
        <div class="result-display">표시할 게시물이 없습니다.</div>
    </c:if>

    <c:if test="${count > 0}">
    <div class="chart-table">
        <table  id="donation-list2">
            <tr>
                <th>내용</th>
                <th>포인트</th>
                <th>유저</th>
                <th>날짜</th>
            </tr>
            <c:forEach var="donation" items="${list}">
                <tr>
                    <td class="align-center">${donation.don_content}</td>
                    <td class="align-center">${donation.don_point}</td>
                    <td class="align-center">${donation.mem_nickName}</td>
                    <td class="align-center">${donation.don_date}</td>
                </tr>
            </c:forEach>
        </table>
        </div>
        <div class="align-center">${page}</div>
    </c:if>
    </div>
    </div>
    </div>
    </div>
    </section>
    