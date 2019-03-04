<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="FAQ 상세보기" name="pageTitle"/>
</jsp:include>
<style>
commentUpdate{
	
}
</style>
<div id="faq-container">
	<input type="text" class="form-control" placeholder="제목" name="postTitle" id="postTitle" value="${post.postTitle }" required/>
	<input type="text" class="form-contrl" name="postWriter" value="" readonly required/>  <!-- ${memberLoggedIn.memberId } -->
	<input type="text" class="form-control" name="postDate" value="${post.postDate }"/>
	<input type="text" class="form-control" name="postReadCount" value="${post.postReadCount }"/>
	  
	<c:forEach items="${attachList}" var="p" varStatus="vs">
		<button type="button"
				class="btn btn-outline-success btn-block"
				onclick="fileDownload('${p.originalFileName}','${p.renamedFileName }');">
			첨부파일${vs.count} - ${p.originalFileName }
		</button>
	</c:forEach>
	
	<textarea class="form-control" name="faqContent" placeholder="내용" required>
	${p.postContent }</textarea>
	<!-- 수정, 삭제 -->
	<!-- 본인/관리자로 로그인 되었을 때만 수정, 삭제 가능 -->
	<button onclick="updateFaq();">수정</button>
	<button onclick="deleteFaq();">삭제</button>	
	<!-- 댓글창 -->
	<div id="faq-comment-container">
		<table>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>내용</th>
			</tr>
		<c:when test="${fn:length(list) > 0}">
		<c:forEach items="list" var="p">
			<tr>
				<td>${p.C_POSTNO }</td>
				<td>${p.C_POSTWRITER }</td>
				<td>${p.C_POSTENROLLDATE }</td>
				<td>${p.C_CONTENT }</td>
			</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="4">댓글이 없습니다.</td>
			<tr>
		</c:otherwise>
		</table>
	</div>
</div>

<script>
function fileDownload(oName, rName){
	// 한글 파일명에 대비한 인코딩
	oName = encodeURIComponent(oName);
	location.href="${pageContext.request.contextPath}/faq/fileDownload.do?oName="+oName+"&rName="+rName;
}

function downloadFile(fileName){
	var form = document.getElementById("downFrm");
	form.fileName.value = fileName;
	form.submit();
}

// 글 수정
function updateFaq() {
	location.href="${pageContext.request.contextPath}/faq/updateFaq?postNo="+${postNo};
}

// 글 삭제
function deleteFaq() {
	if(!confirm("정말로 삭제하시겠습니까?")){
		return;
	}
	location.href="${pageContext.request.contextPath}/faq/deleteFaq?postNo="+${postNo};
}

// 댓글 입력시 공백 확인
function valComment(){
	var cmt = $("[name=postCommentContent]").val().trim();
	if(cmt.length==0) {
		alert("댓글을 1자 이상 입력해주세요.");
		return;
	}

	$("[name=postCommentContent]").submit();
}

// 댓글 수정하기
$(".updateComment").on("click", function(){
	var no = $(this).attr("commentNo");
	var form = 

	$(".comment-content").hide(); // 원래 댓글 숨김
	$(".commentUpdate").css("display", "none");// 수정버튼
	$(".comment-update").css("display", "inline"); // 댓글 수정용 textarea
	$(".commentUpdateEnd").css("display", "inline"); // 댓글 수정 완료 버튼

	if(cmt.length==0) {
		alert("댓글을 1자 이상 입력해주세요.");
		return;
	}
	
	$(".commentUpdateEnd").on("click", function() {
	if(!confirm("이 내용으로 수정하시겠습니까?")) {
		return false;
	}
	$("[name=CommentUpdFrm]").submit();
	});
});

// 댓글 삭제하기
$(".deleteComment").on("click", function(){
	if(!confirm("정말 댓글을 삭제하시겠습니까?")) {
		return false;
	}
	$("[name=CommentDelFrm]").submit();
});

// 대댓글 달기
$(".replyComment").on("click", function) {
	
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>