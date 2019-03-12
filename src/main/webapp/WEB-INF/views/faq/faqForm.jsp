<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="문의하기" name="pageTitle"></jsp:param>
</jsp:include>
<jsp:include page="/WEB-INF/views/faq/sessionCheck.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous" />
<style>
div{
	font-family:'Nanum Gothic', sans-serif;		
}
div#faq-container{
	width: 75%;
	padding: 15px;
	margin: 0 auto;
	border: 1px solid lightgray;
	border-radius: 10px;
	text-align:center;
}
div#faq-container input{
	margin-bottom:15px;
}
div#faq-category {
	width: 100%;
}
textarea {
	margin: top;
	style: 3px; 
	width: 100%; 
	height: 100%; 
	resize:none;"
}
div#input-file{
	width: 100%;
	text-align:center;
}
input#btn-submit{
	align: center;
	margin: 0 0 15px;
	display:inline-block;
	width:100px;
	height:35px;
	border-radius:5px;
	border: 1px rgba(255, 40, 40, .7);
	background:rgba(255, 40, 40, .7);
	color:white;
	font-size:12px;
	font-family:'Nanum Gothic', sans-serif;
	cursor:pointer;
}
button#btn-cancel{
	align: center;
	margin: 0 0 15px;
	display:inline-block;
	width:100px;
	height:35px;
	border-radius:5px;
	border: 1px rgba(255, 40, 40, .7);
	background:rgba(255, 40, 40, .7);
	color:white;
	font-size:12px;
	font-family:'Nanum Gothic', sans-serif;
	cursor:pointer;
}
</style>
<script>
$(document).ready(function(){
	// 문의글 등록
	$("#btn-submit").click(function(){
		// var title = document.faqFrm.postTitle.value; -> name 속성으로 처리시
		// var content = document.faqFrm.postContent.value;
		// var writer = document.faqFrm.postWriter.value;
		// var content = document.faqFrm.category.value;
		// var postOpened = document.faqFrm.category.value;
		
		var category = $("F1").val();
		var title = $("#postTitle").val();
		var content = $("#postContent").val();
		// var wrtier = $("#postWriter").val();
		var postOpened = $("#postOpened1").val();

		// 카테고리 설정
		if($("#F2").is(":checked")){
			category = $("F2").val();;
		}
		if($("#F3").is(":checked")){
			category = $("F3").val();;
		}
		if($("#F4").is(":checked")){
			category = $("F4").val();;
		}
		if($("#F5").is(":checked")){
			category = $("F5").val();;
		}
		if($("#F6").is(":checked")){
			category = $("F6").val();;
		}
		if(title == "") {
			alert("제목을 입력하세요.");
			document.faqFrm.title.focus();
			return false;
		}
		if(content == "") {
			alert("내용을 입력하세요.")
			document.faqFrm.content.focus();
			return false;
		}
		// 게시글 공개 설정
		if($("#postOpened2").is(":checked")){
			postOpened = $("postOpened2").val();
		}
		document.faqFrm.action="${pageContext.request.contextPath }/faq/insertFaq.do";
		// 폼에 입력한 데이터를 서버로 전송
		document.faqFrm.submit;
	});

	//등록취소
	$("#btn-cancel").click(function(){
		if(confirm("등록을 취소하시겠습니까?")){
			location.href="${pageContext.request.contextPath }/faq/faq.do";
		} else {
			return false;
		}
	});

</script>
<form name="faqFrm" 
	  action="${pageContext.request.contextPath }/faq/insertFaq.do" 
	  method="post" 
	  enctype="multipart/form-data">
<div id="faq-container">
 	<div id="faq-category">
 		<strong>분류&nbsp;</strong>
 		<br />
 		
	 	<input type="radio" name="category" id="F1" value="F1" checked="checked"/>
	 	<label for="F1"><strong>F1:</strong> 이용문의&nbsp;</label>
	 	<input type="radio" name="category" id="F2" value="F2"/>
	 	<label for="F2"><strong>F2:</strong> 가입 / 로그인&nbsp;</label>
	 	<input type="radio" name="category" id="F3" value="F3"/>
	 	<label for="F3"><strong>F3:</strong> PC방 찾기 / 예약&nbsp;</label>	 	
	 	<input type="radio" name="category" id="F4" value="F4"/>
	 	<label for="F4"><strong>F4:</strong> 채팅&nbsp;</label>
	 	<input type="radio" name="category" id="F5" value="F5"/>
	 	<label for="F5"><strong>F5:</strong> 업주 전용 기능&nbsp;</label>
	 	<input type="radio" name="category" id="F6" value="F6"/>
	 	<label for="F6"><strong>F6:</strong> 기타&nbsp;</label>
	 </div>

	 <div id="faq-no">
 		<input type="hidden" placeholder="게시물 번호" name="postNo" id="postNo" value="" readonly/>
	</div>
	 	<br />
	<div id="faq-title">
	 	<label for="postTitle"><strong>제목&nbsp;</strong></label>
	 	<input type="text" class="form-control" name="postTitle" id="postTitle" placeholder="제목을 입력해주세요." required/>
	</div>
	 	<br />
	 <div id="faq-content">
		<label for="postContent"><strong>내용&nbsp;</strong></label>
		<textarea name="postContent" id="postContent" cols="100" rows="20" placeholder="내용을 입력해주세요." required></textarea>	 
	</div>
	<br />
	 
   	<!-- 공개/비공개 설정 -->
	<div id="faq-postOpened">
		<strong>공개 설정&nbsp;</strong>
		<input type="radio" name="postOpened" id="postOpened1" value="y" checked="checked"/>
		<label for="postOpened1">전체 공개</label>
		<input type="radio" name="postOpened" id="postOpened2" value="n"/>
		<label for="postOpened2">관리자에게만 공개</label>
	</div>
	 <br />
	 
 		<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
 		<div id="input-file">
 		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일</span>
			  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요.</label>
		  </div>
		</div>
		</div>
		<br />
		
		<input type="submit" id="btn-submit" value="작성">
		<button id="btn-cancel">취소</button>
<script>
//부트스트랩 : 파일변경시 파일명 보이기
$(function(){
	$("[name=upFile]").on('change', function(){
		//var fileName = $(this).val();
		console.log($(this));
		var fileName = $(this).prop("files")[0].name;
		$(this).next(".custom-file-label").html(fileName);
	});
});

</script>
</div> 
</form>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>