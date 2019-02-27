<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="FAQ" name="pageTitle"/>
</jsp:include>
<style>
div#nav, #search-container, #faq-container{
	font-family:'Nanum Gothic', sans-serif;		
	margin: 0;
	padding: 0;
}
div#nav{
	position:relative;
	display:inline-block;
	width:600px;
	height:300px;
}
</style>
<div id="nav">
	<ul>
		<li><a href="#search-container">검색하기</a></li>
	    <li><a href="#faq-container">목록 보기</a></li>
		<li><a href="${pageContext.request.contextPath }/faq/faqForm.do">문의하기</a></li>
	</ul>
</div>
<!-- 전체 FAQ 리스트 -->
<section id="faq-container">
	<div id="faq-category">
		<ul>
			<li class="category" id="F01" ><a href="#">이용문의</a></li>
			<li class="category" id="F02"><a href="#">가입 / 로그인</a></li>
			<li class="category" id="F03"><a href="#">PC방 찾기 / 예약</a></li>
			<li class="category" id="F04"><a href="#">채팅 기능</a></li>
			<li class="category" id="F05"><a href="#">업주 전용 기능</a></li>
			<li class="category" id="F06"><a href="#">기타</a></li>
		</ul>
	</div>
	<div id="faq-list">
	<!-- <p>총 ${totalContents }건의 게시물이 있습니다.</p> -->
	<input type="button" value="문의하기" id="btn-add" onclick="fn_goFaqForm();"/>
		<table id="tbl-faq" class="table table-striped table-hover">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>댓글</th>
					<th>첨부파일</th>
					<th>조회수</th>
					<th>공개여부</th>
				</tr>
		<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list}" var="p"> 
				<tr no="${p.POSTNO}">
					<td>${p.POSTNO}</td>
					<td>${p.POSTITLE }</td>
					<td>${p.POSTWRITER }</td>
					<td><fmt:formatDate value="${p.POSTDATE}" type="date"/></td>
					<c:if test="${p.COMMENTNUM>0}">
						<td>${p.COMMENTNUM }</td>
					</c:if>
					<c:if test="${p.ATTACHNO>0}">
						<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/image/file.png" width=16px>
					</c:if>
					<td>${p.POSTREADCOUNT}</td>
					<td>${p.POSTREADCOUNT}</td>
					<td>${p.POSTOPENED }</td>  
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="8">게시글이 없습니다.</td>
			<tr>
		</c:otherwise>
		</table>
		<!-- 페이지바 입력란-->
		<!-- FAQ검색창 -->
		<div id="search-container">
		<form action="/faq/faqSearch.do" method="post">
		<input type="text" name="searchKeyword" size="15" maxlength="30"/>
			<button id="btn-search" onclick="onSearchSubmit();"></button>
		</form>
		</div>
		<!-- FAQ검색결과 -->
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>댓글</th>
				<th>첨부파일</th>
				<th>조회수</th>				
				<th>공개여부</th>
			</tr>
		<c:when test="${fn:length(searchList)>0}">
			<c:forEach items="${searchList}" var="p"> 
				<tr no="${p.POSTNO}">
					<td>${p.POSTNO}</td>
					<td>${p.POSTITLE }</td>
					<td>${p.POSTWRITER}</td>
					<td><fmt:formatDate value="${p.POSTDATE}" type="date"/></td>
					<c:if test="${p.COMMENTNUM>0}">
						<td>${p.COMMENTNUM }</td>
					</c:if>
					<c:if test="${p.ATTACHNO>0}">
						<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/image/file.png" width=16px>
					</c:if>
					<td>${p.POSTREADCOUNT}</td>
					<td>${p.POSTREADCOUNT}</td>
					<td>${p.POSTOPENED }</td>  
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="8">검색 결과가 없습니다.</td>
			<tr>
		</c:otherwise>
		</table>
	</div>
</section>
<script>
// 글쓰기 게시판으로 이동
function fn_goFaqForm() {
	location.href = "${pageContext.request.contextPath}/faq/faqForm.do";
}

// 상세보기 페이지로 이동
$(function(){
	$("tr[postNo]").on("click",function(){
		var postNo = $(this).attr("postNo");
		console.log("postNo="+postNo);
		location.href = "${pageContext.request.contextPath}/faq/faqView.do?no="+${p.POSTNO};
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>