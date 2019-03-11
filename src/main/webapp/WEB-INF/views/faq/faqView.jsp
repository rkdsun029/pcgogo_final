<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="FAQ 상세보기" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/faq/sessionCheck.jsp"></jsp:include>
<style>
div{
	font-family:'Nanum Gothic', sans-serif;
}
</style>
<script>
/*
//첨부파일 다운
function fileDownload(oName, rName){
	// 한글 파일명에 대비한 인코딩
	oName = encodeURIComponent(oName);
	location.href="${pageContext.request.contextPath}/faq/downloadFaqFile.do?oName="+oName+"&rName="+rName;
	
	event.prenventDefault();
	var file = event.originalevent.dataTransfer.files
	var form = document.getElementById("downloadFileFrm");
	form.oName.value = oName;
	form.submit();
}

//첨부파일 수정
$("#updateFile").on("click", function(){
	if(!confirm("첨부파일을 수정하시겠습니까?")) {
	return;
	}
});

//첨부파일 삭제
$("#deleteFile").on("click", function(){
	if(!confirm("첨부파일을 삭제하시겠습니까?")) {
	return;
	}
});

//글 수정 & 삭제
$(document).ready(function(){
	// 글 수정
	$("#btn-update").click(function(){
		// var title = document.faqUpdateFrm.postTitle.value; -> name 속성으로 처리시
		// var content = document.faqUpdateFrm.postContent.value;
		// var writer = document.faqUpdateFrm.postWriter.value;
		var title = $("#postTitle").val();
		var content = $("#postContent").val();
		// var wrtier = $("#postWriter").val();
		if(title == "") {
			alert("제목을 입력하세요.");
			document.faqUpdateFrm.title.focus();
			return;
		}
		if(content == "") {
			alert("내용을 입력하세요.")
			document.faqDeleteFrm.content.focus();
			return;
		}
		document.faqUpdateFrm.action = "${pageContext.request.contextPath}/faq/updateFaq.do";
		// 폼에 입력한 데이터를 서버로 전송
		document.faqUpdateFrm.submit;
	});
	
	// 글 삭제
	$("#btn-delete").click(function(){
		if(!confirm("정말로 삭제하시겠습니까?"))
			document.faqDeleteFrm.action = "${pageContext.request.contextPath}/faq/deleteFaq.do";
			// 폼에 입력한 데이터를 서버로 전송
			document.faqDeleteFrm.submit;
	});
});

//댓글 목록 불러오기(controller 사용)
//ajax 사용
function commentList(){
	$.ajax({
		type: "get", 
		url: "${pageContext.request.contextPath}/faq/faqView.do?postNo=${p.POSTNO}", 
		success: function(result) {
			$("#commentList").html(result);
		}
	});
}

//댓글 목록(json-restcontroller 사용)
//ajax 사용, html 코드
/* function commentList_2(){
	$.ajax({
		type: "get", 
		url: "${pageContext.request.contextPath}/faq/faqJson.do?postNo=${p.POSTNO}",
		success: function(result) {
			console.log(result)
			var output = "<table>";
			for (var i in result) {
				output += "<tr>";
				output += "<td>";
				output += "";
				output += "</td>";
				output += "</tr>";
			}
			output = "</table>";
			$("#commentList").html(output);
		} 
		
	});
}

//댓글 입력
$("#insertComment").on("click", function(){
	var cmt = $("#postComment").val().trim();
	
	// 댓글 입력시 공백 확인
	if(cmt.length==0) {
		alert("댓글은 1자 이상 입력해주세요.");
		$("#postComment").val().focus();
		return false;
	}
	
	document.faqInsertFrm.action = "${pageContext.request.contextPath}/faq/insertFaqCmt.do";
	document.faqInsertFrm.submit();
});

//댓글 수정
//ajax 사용
$("#updateComment").on("click", function(){
	var no = $(this).attr("#c_postno");
	var cmt = $("#postComment").val().trim();
	
	// 댓글 입력시 공백 확인
	if(cmt.length==0) {
		alert("댓글을 1자 이상 입력해주세요.");
		$("#postComment").val().focus();
		return false;
	}
	
	$("#commentUpdateEnd").on("click", function() {
	if(!confirm("댓글을 수정하시겠습니까?")) {
		return;
	}
	document.faqDeleteFrm.action = "${pageContext.request.contextPath}/faq/updateFaqCmt.do";
	$("[name=CommentUpdFrm]").submit();
	});
});

//댓글 삭제하기
$("#deleteComment").on("click", function(){
	if(!confirm("댓글을 삭제하시겠습니까?")) {
		return;
	}
	document.CommentDelFrm = "${pageContext.request.contextPath}/faq/deleteFaqCmt.do";
	$("[name=CommentDelFrm]").submit();
	
});

//답글 달기
$("#replyComment").on("click", function(){
	var c_postcontent = $("#c_postcontect").val();
	var postno = "${p.c_postno}";
	var param = "c_postcontent="+c_postcontent+"&c_postno"+c_postno;
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/faq/updateFaqCmt.do",
			data: param,
			success: function(){
				alert("답글이 등록되었습니다.");
				commentList_2();
			}
		})
});
*/
</script>

<div id="faq-container">
<form name="faqUpdateFrm" method="post">
 	 <c:forEach items="${list}" var="p">
 	<div>
 		글 번호 ${p.POSTNO }
 	</div>
 	<div>
 		제목: <input type="text" placeholder="제목" name="postTitle" id="postTitle" value="${p.POSTTITLE }" required/>
 	</div>
	<div>
		작성 날짜 ${p.POSTWRITER }
	</div>
	<div>
		작성일 <fmt:formatDate value="${p.POSTDATE }" pattern="yyyy-MM-dd HH:mm:ss"/>
	</div>
	<div>
		<p>조회수 ${p.POSTREADCOUNT }</p>
	</div>
	<div>
		<textarea name="postContent" id="postContent" placeholder="내용" required>${p.POSTCONTENT }</textarea>
	</div>
	
	<!-- 공개/비공개 설정 -->
	<div>
		<input type="text" value="${p.POSTOPENED }"/>
		<input type="radio" id="postOpened1" value="y"/>
		<label for="postOpened1">전체 공개</label>
		<input type="radio" id="postOpened2" value="n"/>
		<label for="postOpened2">관리자에게만 공개</label>
	</div>
	 </c:forEach>

	<br />
	<!-- 첨부파일 -->
	<c:forEach items="${attachList}" var="a" varStatus="vs">
		<button type="button"
				onclick="downloadFile('${a.originalFileName}','${a.renamedFileName }');">
			첨부파일${vs.downloadCount} - ${a.originalFileName }
		</button>
	</c:forEach>
	<!-- 본인, 관리자만 첨부파일 올리기, 수정, 삭제 가능 -->
	<c:forEach items="${post}" var="p">
	<c:if test="${loggedInUser == p.postWriter || loggedInUser == 'admin' }">
		<button id="btn-updateFile" onclick="updateFile();">파일 수정</button>
		<button id="btn-deleteFile" onclick="deleteFile();">파일 삭제</button>
	</c:if>
 	<br />
	<!-- 본인이 작성한 게시글만 수정, 삭제 가능 -->
	<c:if test="${loggedInUser == p.postWriter }">
		<button id="btn-delete">수정</button>
		<button id="btn-update">삭제</button>
	</c:if>
	</c:forEach>
	</form>
</div>
<br />
<div id="faq-commemt-list">
	<c:forEach items="${commentList}" var="c">
	<!-- 게시글 작성자가 본인/관리자일 때만 댓글 달기 가능 -->
	<c:if test="${loggedInUser != c.c_postWriter || loggedInUser == 'admin' }">
	<div id="faq-comment-container">
		<textarea row="5" cols="60" id="postComment" placeholder="댓글을 작성해주세요."></textarea>
		<button id="insertComment">댓글 작성</button>
	</div>
	<br />
	<div id="commentList">
	</div>
		<table>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>내용</th>
			</tr>
		<c:when test="${fn:length(commentList) > 0}">
		<c:forEach items="list" var="p">
			<tr>
				<td>${c.C_POSTNO }</td>
				<td>${c.C_POSTWRITER }</td>
				<td>${c.C_POSTENROLLDATE }</td>
				<td><textarea id="postComment" required></textarea>${c.C_CONTENT }</td>
			</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="4">댓글이 없습니다.</td>
			<tr>
		</c:otherwise>
		</table>
		</c:if>
		<!-- 게시글 작성자가 본인/관리자일 때만 답글 달기 가능 -->
		<c:if test="${loggedInUser != c.c_postWriter || loggedInUser == 'admin' }">
		<button id="replyComment">답글</button>
		</c:if>
		<!-- 본인 댓글/관리자만 수정 삭제 가능 -->
		<c:if test="${loggedInUser == c.c_postWriter || loggedInUser == 'admin' }">
			<button id="updateComment">수정</button>
			<button id="deleteComment">삭제</button>
		</c:if>
		</c:forEach>
	</div>
	<!-- 댓글 페이징-->
	<% 
	int totalContents = (int)request.getAttribute("totalContents");
	int numPerPage = (int)request.getAttribute("numPerPage");

	// 파라미터 cPage가 null이거나 "", "가나다"일때는 기본값 1로 세팅함.  
	String cPageTemp = request.getParameter("cPage");
	int cPage = 1;
	try{
		cPage = Integer.parseInt(cPageTemp);
	} catch(NumberFormatException e){
		
	}
	%>
		
	<%=project.go.pcgogo.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "faqView.do") %>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>