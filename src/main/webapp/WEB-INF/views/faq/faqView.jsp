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
	resize:none;
}
table{
	margin:0 auto;
	text-align:center;
	width: 75%;
	border-top:1px solid #020202;
	border-bottom: 1px solid #020202;
}
table th, td{
	height:30px;
	margin:15px;
	border-bottom:1px solid #c8c8c8;
	border-bottom:1px solid #c8c8c8;
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
button{
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
		var postOpened = $("#postOpened1").val();
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
		// 게시글 공개 설정
		if($("#postOpened2").is(":checked")){
			postOpened = $("postOpened2").val();
		}
		document.faqUpdateFrm.action = "${pageContext.request.contextPath}/faq/updateFaq.do";
		// 폼에 입력한 데이터를 서버로 전송
		document.faqUpdateFrm.submit;
	});
	
	// 글 삭제
	$("#btn-delete").click(function(){
		if(confirm("정말로 삭제하시겠습니까?"))
			document.faqDeleteFrm.action = "${pageContext.request.contextPath}/faq/deleteFaq.do";
			// 폼에 입력한 데이터를 서버로 전송
			document.faqDeleteFrm.submit;
	});
});

//댓글 목록 불러오기(controller 사용)
/* function commentList(){
	$.ajax({
		type: "get", 
		url: "${pageContext.request.contextPath}/faq/faqCmtList.do?postNo=${Post.postNo}", 
		success: function(result) {
			$("#commentList").html(result);
		}
	});
} */

/*
//댓글 목록(json-restcontroller 사용)
//ajax 사용, html 코드
function commentList_2(){
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
*/

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
$("#updateComment").on("click", function(){
	var no = $(this).attr("#c_postno");
	var cmt = $("#postComment").val().trim();
	
	// 댓글 입력시 공백 확인
	if(cmt.length==0) {
		alert("댓글을 1자 이상 입력해주세요.");
		$("#postComment").val().focus();
		return false;
	}
	/*
	$("#commentUpdateEnd").on("click", function() {
	if(confirm("댓글을 수정하시겠습니까?")) {
		document.faqCmtUpdateFrm.action = "${pageContext.request.contextPath}/faq/updateFaqCmt.do";
	$("[name=CommentUpdFrm]").submit();
	// }} else {
		// return });
	return;
}); */

//댓글 삭제하기
$("#deleteComment").on("click", function(){
	if(confirm("댓글을 삭제하시겠습니까?")) {
		document.faqCmtDeleteFrm.aciton = "${pageContext.request.contextPath}/faq/deleteFaqCmt.do";
		$("[name=CommentDelFrm]").submit();
	}
	return;
	
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

//첨부파일 다운
function fileDownload(originalFileName, renamedFileName){
	// 한글 파일명에 대비한 인코딩
	oName = encodeURIComponent(originalFileName);
	rName = encodeURIComponent(renamedFileName);
	location.href="${pageContext.request.contextPath}/faq/downloadFaqFile.do?originalFileName="+oName+"&renamedFileName="+rName;
	
	event.prenventDefault();
/*  	var file = event.originalevent.dataTransfer.files
	var form = document.getElementById("downloadFileFrm");
	var formData = new formData();
	formData.appned("file", file); */
	
	// console.log(file);
/* 	form.originalFileName.value = originalFileName; */
	
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/faq/downloadFaqFile.do?originalFileName="+oName+"&renamedFileName="+rName, 
		data: formData,
		dataType: "text",
		processData: false, 
		contentType: false, 
		success: function(data) {
			var str = "";
			str += "<div><a href='${pageContext.request.contextPath}/faq/downloadFaqFile.do?originalFileName="
					+data+"'>"
			str +=	"<img src='${pageContext.request.contextPath}/faq/downloadFaqFile.do?originalFileName="+data"'></a>";
		}
		
	})
	
	/* form.submit(); */
}

//첨부파일 수정
$("#btn-updateFile").on("click", function(){
	if(confirm("첨부파일을 수정하시겠습니까?")) {
		return;
	}
	return;
});

//첨부파일 삭제
$("#btn-deleteFile").on("click", function(){
	if(confirm("첨부파일을 삭제하시겠습니까?")){
		return;		
	}
	return;
		
});
</script>
<div id="faq-container">
<form name="faqUpdateFrm" method="post">
	<div id="faq-category">
		<strong>카테고리 &nbsp;</strong> ${Post.category }
	</div>
 	<div id="faq-no">
 		<strong>글 번호 &nbsp;</strong> ${Post.postNo }
 	</div>
 	<div id="faq-title">
	 	<label for="postTitle"><strong>제목&nbsp;</strong></label>
	 	<input type="text" class="form-control" name="postTitle" id="postTitle" value="${Post.postTitle }" required/>
 	</div>
	<div id="faq-writer">
		<strong>작성자 &nbsp;</strong> ${Post.postWriter }
	</div>
	<div id="faq-date">
		<strong>작성일 &nbsp;</strong> <fmt:formatDate value="${Post.postDate }" pattern="yyyy-MM-dd"/>
	</div>
	<div id="faq-readcount">
		<strong>조회수 &nbsp;</strong> ${Post.postReadCount }
	</div>
	<div id="faq-content">
		<label for="postContent"><strong>내용&nbsp;</strong></label>
		<textarea name="postContent" id="postContent" cols="100" rows="20" required>${Post.postContent }</textarea>	 
	</div>
   	<!-- 공개/비공개 설정 -->
	<div id="faq-postOpened">
		<strong>공개 설정&nbsp;</strong>
		<input type="radio" name="postOpened" id="postOpened1" value="y" checked="checked"/>
		<label for="postOpened1">전체 공개</label>
		<input type="radio" name="postOpened" id="postOpened2" value="n"/>
		<label for="postOpened2">관리자에게만 공개</label>
	</div>
	<br />
	
	<!-- 로그인된 아이디가 작성자 아이디와 같아도 수정, 삭제 버튼이 나오지 않음 -->
	<!-- 본인이 작성한 게시글만 수정, 삭제 가능 -->
	<c:if test="${loggedInUser == Post.postWriter }">
		<button id="btn-delete">수정</button>
		<button id="btn-update">삭제</button>
	</c:if>

	</form>
	
	<!-- 첨부파일 등록, 수정, 삭제 버튼이 나오지 않음 -->
	<!-- 다운로드 버튼 누를시 console창에서 Uncaught ReferenceError: fileDownload is not defined 에러 발생 -->
	<!-- 첨부파일 -->
	<c:forEach items="${attachList}" var="a" varStatus="vs">
		파일명: ${a.originalFileName } 
		<button type="button" onclick="fileDownload('${a.originalFileName}, ${a.renamedFileName}');">
		다운로드
		</button>
		<br />
	</c:forEach>
	<!-- 본인, 관리자만 첨부파일 올리기, 수정, 삭제 가능 -->
	<c:forEach items="${post}" var="p">
	<c:if test="${loggedInUser == p.postWriter || loggedInUser == 'admin' }">
		<button id="btn-updateFile" onclick="updateFile();">파일 수정</button>
		<button id="btn-deleteFile" onclick="deleteFile();">파일 삭제</button>
	</c:if>
 	<br />
	</c:forEach>

<!-- 댓글 페이징바만 불러오기가 되며 댓글 작성칸, 댓글 리스트가 뜨지 않음 -->
<div id="faq-commemt-list">
	<c:forEach items="${commentList}" var="c">
	<!-- 게시글 작성자가 본인/관리자일 때만 댓글 달기 가능 -->
	<c:if test="${loggedInUser != c.c_postWriter || loggedInUser == 'admin' }">
	<form id="faqInsertFrm" action="${pageContext.request.contextPath}/faq/insertFaqCmt.do">
	<div id="faq-comment-container">
		<textarea row="5" cols="60" id="postComment" placeholder="댓글을 작성해주세요."></textarea>
		<button id="insertComment">댓글 작성</button>
	</div>
	</form>
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
				<td>${c.c_postNo }</td>
				<td>${c.c_postWriter }</td>
				<td>${c.c_postEnrollDate }</td>
				<td><textarea id="postComment" required></textarea>${c.c_content }</td>
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
			<form name="CommentUpdFrm" action="${pageContext.request.contextPath}/faq/updateFaqCmt.do">
			<button id="updateComment">수정</button>
			</form>
			<form name="CommentDelFrm" action="${pageContext.request.contextPath}/faq/deleteFaqCmt.do">
			<button id="deleteComment">삭제</button>
			</form>
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
</div>
<br />
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>