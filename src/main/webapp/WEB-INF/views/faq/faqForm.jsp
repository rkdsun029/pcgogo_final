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
<style>
div{
	font-family:'Nanum Gothic', sans-serif;		
}
textarea {
	margin: top;
	style: 3px; 
	width: 1004px; 
	height: 506px; 
	resize:none;"
}
</style>
<script>
$(document).ready(function(){
	// 문의글 등록
	$("#btn-submit").click(function(){
		// var title = document.faqFrm.postTitle.value; -> name 속성으로 처리시
		// var content = document.faqFrm.postContent.value;
		// var writer = document.faqFrm.postWriter.value;
		var title = $("#postTitle").val();
		var content = $("#postContent").val();
		// var wrtier = $("#postWriter").val();
		if(title == "") {
			alert("제목을 입력하세요.");
			document.faqFrm.title.focus();
			return;
		}
		if(content == "") {
			alert("내용을 입력하세요.")
			document.faqFrm.content.focus();
			return;
		}
		document.faqFrm.action="${pageContext.request.contextPath }/faq/insertFaq.do"
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
	
});

// 부트스트랩 : 파일 변경시 파일명 보이기
$(function(){
	$("[name=upFile]").on('change', function(){
		console.log($(this));
		var fileName = $(this).prop("files")[0].name;
		$(this).next(".custom-file-label").html(fileName);
	});
});

/*
// 게시글 공개 설정
function postOpened(){
	var postOpened1 = document.getElementBy("postOpened1");
	var postOpened2 = document.getElementBy("postOpened2");
	
	if(postOpened1.checked) {
		$.ajax({
			type: "get", 
			url: "",
			success: function(){
				
			}
		});
	} else if(postOpened2.checked) {
		$.ajax({
			type: "get", 
			url: "", 
			success: function(){
				
			}
		});
	} else {
		$.ajax({
			type: "get", 
			url: "", 
			success: function(){
				
			}
		});
	} 

} */
</script>
<div id="faq-container">
	<form name="faqFrm" action="${pageContext.request.contextPath }/faq/insertFaq.do"
	 method="post"
	 enctype="multipart/form-data">
	 <div id="category-container">
	 	분류
	 	<input type="radio" name="category" id="F1" value="F1" checked="checked"/>
	 	<label for="F1">이용문의</label>
	 	<input type="radio" name="category" id="F2" value="F2"/>
	 	<label for="F2">가입 / 로그인</label>
	 	<input type="radio" name="category" id="F3" value="F3"/>
	 	<label for="F3">PC방 찾기 / 예약</label>
	 	<input type="radio" name="category" id="F4" value="F4"/>
	 	<label for="F4">채팅</label>
	 	<input type="radio" name="category" id="F5" value="F5"/>
	 	<label for="F5">업주 전용 기능</label>
	 	<input type="radio" name="category" id="F6" value="F6"/>
	 	<label for="F6">기타</label>
	 </div>
	 <br />
  	<div>
 		<input type="hidden" placeholder="게시물 번호" name="postNo" id="postNo" readonly/>
 	</div>
 	<br />
 	<div id="postTitle-container"> 	
	  	제목
	 	<input type="text" name="postTitle" id="postTitle" rows="20" required/>
 	</div>
 	<br />
	 <div id="postContent-container">
		 내용
		<textarea name="postContent" id="postContent" cols="100" rows="20" required></textarea>	 
	 </div>
	 <br />
	 
  	<!-- 공개/비공개 설정 -->
	<div id="postOpened-container">
		<input type="radio" name="postOpened" id="postOpened1" value="y" checked="checked"/>
		<label for="postOpened1">전체 공개</label>
		<input type="radio" name="postOpened" id="postOpened2" value="n"/>
		<label for="postOpened2">관리자에게만 공개</label>
	</div>
	 <br />
	 
 		<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
 		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일</span>
			  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요.</label>
		  </div>
		</div>
		
		<br />
		<input type="submit" id="btn-submit" value="작성">
		<button id="btn-cancel">취소</button>
	</form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>