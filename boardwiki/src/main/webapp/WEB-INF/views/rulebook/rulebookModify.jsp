<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 룰북 수정 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include ckeditor js -->
<script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<section class="page-top-section set-bg" data-setbg="/img/page-top-bg/4.jpg">
		<div class="page-info">
			<h2>글 수정</h2>
		</div>
</section>
<section class="blog-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">	
<div class="page-main">
	<form:form action="rulebookUpdate" id="rulebook_modify"
	           enctype="multipart/form-data"
	                            modelAttribute="rulebookVO" >
		<form:hidden path="rulB_num"/>
		<ul>
			<li>
				<form:textarea path="rulB_content"/>
				<form:errors path="rulB_content" cssClass="error-color"/>
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#rulB_content' ),{
		            	extraPlugins: [MyCustomUploadAdapterPlugin]
		            })
		            .then( editor => {
						window.editor = editor;
					} )
		            .catch( error => {
		                console.error( error );
		            } );
			    </script> 
			</li>
			<li>
				<form:label path="upload" style="color:white;" >파일업로드</form:label>
				<input type="file" name="upload" id="upload" style="color:white;">
				<c:if test="${!empty rulebookVO.filename}">
				<div id="file_detail">
					(${rulebookVO.filename})파일이 등록되어 있습니다.
					<input type="button" value="파일 삭제" id="file_del">
				</div>
				<script type="text/javascript">
					$(function(){
						$('#file_del').click(function(){
							const choice = confirm('삭제하시겠습니까?');
							if(choice){
								$.ajax({
									url:'deleteRulebookFile',
									data:{rulB_num:${rulebookVO.rulB_num}},
									type:'post',
									dataType:'json',
									success:function(param){
										if(param.result == 'logout'){
											alert('로그인 후 사용하세요');
										}else if(param.result == 'wrongAccess'){
											alert('잘못된 접속입니다.');
										}else if(param.result == 'success'){
											$('#file_detail').hide();
										}else{
											alert('파일 삭제 오류 발생');
										}
									},
									error:function(){
										alert('네트워크 오류 발생');
									}
								});
							}
						});
					});
				</script>
				</c:if>
			</li>
		</ul> 
		<div class="align-center">
			<form:button class="default-btn">전송</form:button>
			<input type="button" value="목록"
			  class="default-btn"
			  onclick="location.href='rulebookList'">
		</div>                           
	</form:form>
</div>
</div>
</div>
</div>
</section>
<!-- 룰북 수정 끝 -->









