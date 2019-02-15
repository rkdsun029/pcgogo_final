<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="FAQ 상세보기" name="pageTitle"/>
</jsp:include>
<script>

</script>
<div id="faq-container">
	<input type="text" class="form-control" placeholder="제목" name="postTitle" id="postTitle" 
	 value="${f.postTitle }" required/>
	<input type="text" class="form-contrl" name="postWriter" value="${memberLoggedIn.memberId}"
	 readonly required/>
	  
	<c:forEach items="${Post}" var="p" varStatus="vs">
		<button type="button" 
				class="btn btn-outline-success btn-block"
				onclick="fileDownload('${p.originalFileName}','${p.renamedFileName }');">
			첨부파일${vs.count} - ${p.originalFileName }
		</button>
	</c:forEach>
	
	<textarea class="form-control" name="faqContent" placeholder="내용" required>
	${faq.postContent }</textarea>
		
</div>

<script>
function fileDownload(oName, rName){
	// 한글 파일명에 대비한 인코딩
	oName = encodeURIComponent(oName);
	location.href="${pageContext.request.contextPath}/faq/fileDownload.do?oName="+oName+"&rName="+rName;
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>