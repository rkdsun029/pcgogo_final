<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="FAQ 검색하기" name="pageTitle"></jsp:param>
</jsp:include>
<style>

</style>

<div id="nav">
	<ul>
		<li><a href="#search-container">검색하기</a></li>
	    <li><a href="${pageContext.request.contextPath }/faq/faq.do">목록 보기</a></li>
		<li><a href="${pageContext.request.contextPath }/faq/faqForm.do">문의하기</a></li>
	</ul>
</div>

<!-- FAQ 검색 -->
<section id="search-container">
	<form action="/faq/faqSearch.do" method="post">
	<div id="search-form">
		<input type="text" />
			<select name="search-category" id="search-category">
				<option value="postTitle">제목</option>
				<option value="postContent">내용</option>
				<option value="postTitle+postContent">제목+내용</option>
				<option value="postWriter">작성자</option>
			</select>
		<input type="text" id="search_faq" class="search_faq" placeholder="무엇이 궁금하신가요?" onkeypress="return onSearchSubmit();">
			<button id="btn-search"><span class="hide">검색</span></button>
	</div>
	</form>
	<!-- 검색된 FAQ 보여주기 -->
	<div id="search-result">
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
		<!-- 페이지바-->
		<%
			int totalContents = (int)request.getAttribute("totalContents");
			int numPerPage = (int)request.getAttribute("numPerPage");
			String cPageTemp = request.getParameter("cPage");
			
			// 파라미터 cPage가 null이거나 "", "가나다"일 때는 기본값을 1로 세팅.
			int cPage = 1;
			try{
				cPage = Integer.parseInt(cPageTemp);
			} catch(NumberFormatException e){
				
			}
		%>
		<%=project.go.pcgogo.common.Util.getPageBar(totalContents, cPage, numPerPage, "boardList.do")%>
	</div>
</section>

<script>
//검색하기
function onSearchSubmit() {
	
}

//글쓰기 게시판으로 이동
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