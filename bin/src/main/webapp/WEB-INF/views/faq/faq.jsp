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
}

div#nav {
	display:inline-block;
	margin-top:20px;
	width:230px;
	min-height:40px;
}
</style>

<div id="nav">
	<ul>
		<li><a href="${pageContext.request.contextPath }/faq/faqSearch.do">검색하기</a></li>
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
	<p>총 ${totalContents }건의 게시물이 있습니다.</p>
	<input type="button" value="문의하기" id="btn-add" onclick="goFaqForm();"/>
		<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			<c:forEach items="${post}" var="p"> 
				<tr no="${p.POSTNO}">
					<td>${p.POSTNO}</td>
					<td>${p.POSTTITLE}</td>
					<td>${p.POSTWRITER}</td>
					<td><fmt:formatDate value="${p.POSTDATE}" type="date"/></td>
					<td>${p.POSTREADCOUNT}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</section>

<script>
// 글쓰기 게시판으로 이동
function goFaqForm() {
	location.href = "${pageContext.request.contextPath}/faq/faqForm.do";
}

// 상세보기 페이지로 이동
$(function(){
	$("tr[no]").on("click",function(){
		var postNo = $(this).attr("no");
		console.log("postNo="+postNo);
		location.href = "${pageContext.request.contextPath}/faq/faqView.do?no="+postNo;
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>