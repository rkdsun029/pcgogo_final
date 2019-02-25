faqform.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="문의하기" name="pageTitle"></jsp:param>
</jsp:include>
<style>
</style>
<div id="faq-container">
	<form name="faqFrm" action="${pageContext.request.contextPath }/faq/insertFaq.do"
	 method="post"
	 onsubmit="return validate();"
	 enctype="multipart/form-data">
	 <input type="text" class="form-control" placeholder="제목" name="faqTitle"
	  id="faqTitle" required/>
	 <input type="text" class="form-control" name="faqWriter" value="${memberLoggedIn.memberId}"
	  readonly required/>
 		<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일 1</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요.</label>
		  </div>
		</div>
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일 2</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile2" multiple>
		    <label class="custom-file-label" for="upFile2">파일을 선택하세요.</label>
		  </div>
		</div>
		
	    <textarea class="form-control" name="boardContent" placeholder="내용" required></textarea>
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" >
	  
	</form>
</div>
<script>
// 공백이 입력될 경우를 대비한 유효성 검사
function validate(){
	var content = $("[name=postContent]").val();
	if(content.trim().length==0){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

// 부트스트랩 : 파일 변경시 파일명 보이기
$(function(){
	$("[name=upFile]").on('change', function(){
		//var fileName = $(this).val();
		console.log($(this));
		var fileName = $(this).prop("files")[0].name;
		$(this).next(".custom-file-label").html(fileName);
	});
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>