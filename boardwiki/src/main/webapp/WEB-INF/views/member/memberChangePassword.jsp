<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 비밀번호 변경 시작 -->

		<!-- Page top section -->
	<section class="page-top-section set-bg" data-setbg="/img/page-top-bg/4.jpg">
		<div class="page-info">
			<h2>Contact</h2>
			<div class="site-breadcrumb">
				<a href="">Home</a>  /
				<span>Contact</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->
	<section class="blog-page">
<div class="container">
	<div class="row">
<div class="page-main">
	<h2>비밀번호 변경</h2>
	<form:form action="changePassword" id="member_change"
	                            modelAttribute="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="now_passwd">현재 비밀번호</form:label>
				<form:password path="now_passwd"/>
				<form:errors path="now_passwd" cssClass="error-color"/>                             
			</li>
			<li>
				<form:label path="mem_passwd">새비밀번호</form:label>
				<form:password path="mem_passwd"/>
				<form:errors path="mem_passwd" cssClass="error-color"/>
			</li>
			<li>
				<label for="confirm_passwd">새비밀번호 확인</label>
				<input type="password" id="confirm_passwd">
				<span id="message_password"></span>
			</li>
			<li>
				<div id="captcha_div">
					<img src="getCaptcha" id="captcha_img" width="200" height="90">
				</div>
				<input type="button" value="새로고침" id="reload_btn">
				<script>
					$(function(){
						$('#reload_btn').click(function(){
							$.ajax({
								url:'getCaptcha',
								type:'get',
								success:function(){
									$('#captcha_div').load(location.href+' #captcha_div');
								},
								error:function(){
									alert('네트워크 오류 발생');
								}
							});
						});
					});
				</script>
			</li>
			<li>
				<form:label path="captcha_chars">캡챠 문자 확인</form:label>
				<form:input path="captcha_chars"/>
				<form:errors path="captcha_chars"
				                 cssClass="error-color"/>				                      
			</li>
		</ul> 
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="MY페이지"
			             onclick="location.href='myPage'">
		</div>                           
	</form:form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.password.js"></script>	
</div>
</div>
</div>
</section>

<!-- 비밀번호 변경 끝 -->












