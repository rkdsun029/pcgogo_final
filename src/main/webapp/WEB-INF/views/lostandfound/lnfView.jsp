<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="분실물 view" name="lostandfound"></jsp:param>
</jsp:include>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<style>
div#board-container{width:400px; margin:0 auto; text-align:center;}
div#board-container input,div#board-container button{margin-bottom:15px;}
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}
</style>


<script>
function fileDownload(oName, rName){
	//한글파일명이 있을 수 있으므로, 명시적으로 encoding
	oName = encodeURIComponent(oName);
	location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
}
</script>

<div id="board-container">
	<input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" value="${board.boardTitle }" required>
	<input type="text" class="form-control" name="boardWriter" value="${memberLoggedIn.memberId}" readonly required>

	<c:forEach items="${attachmentList}" var="a" varStatus="vs">
		<button type="button" 
				class="btn btn-outline-success btn-block"
				onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">
			첨부파일${vs.count} - ${a.originalFileName }
		</button>
	</c:forEach>
	
    <textarea class="form-control" name="boardContent" placeholder="내용" required>${board.boardContent }</textarea>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>