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
div{
	font-family:'Nanum Gothic', sans-serif;		
}
div#faq-category{
	align:center;
	margin:0 auto;
	border-top:1px solid #020202;
	border-bottom: 1px solid #020202;
}
div#faq-list {
	margin-bottom: 35px;
	width:100%;
	align:center;
}
div#faq-list li {
	list-style: none;
}
table{
	margin:0 auto;
	text-align:center;
	width:1000px;
	border-top:1px solid #020202;
	border-bottom: 1px solid #020202;
}
button{
	hover: background:#f67001; 
	cursor:pointer;
}
</style>
<script>
$(document).ready(function(){
	$("#btn-search").on("click", function() {
		var keyword = $("#searchKeyword").val().trim();
		if(keyword.length == 0) {
			alert("검색어를 입력하세요.");
			return false;
		}
		self.location = "${pageContext.request.contextPath}/faq/faq.do?cPage=1&searchOption=${searchOption}&searchKeyword=${searchKeyword}";

	});
	
	$("#btn-add").click(function(){
		// 글쓰기 게시판으로 이동
		location.href = "${pageContext.request.contextPath}/faq/faqForm.do";
	});
	
	// 카테고리별로 글 선택해서 목록 보이기
	$("#categoryOption").on("change", function() {
		$ajax({
			url: "${pageContext.request.contextPath}/faq/faq.do?"+$(this).val(),
			dataType: "json", 
			type: "get", 
			success: function(data){
				console.log(data);
				var html = "<p>총 "+data.totalContents+"건의 게시글이 있습니다.</p><table id='tbl-faq'>";
                html+="<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>";
                for(var i in data.list){
                	html += "<tr no='" + data.list[i].postNo + "'><td>"+data.list[i].postTitle+"</td>";
                	html += "<td>"+data.list[i].postWriter+"</td>";
                    html += "<td>"+data.list[i].postDate+"</td>";
                    html += "<td>"+data.list[i].postReadCount+"</td>";
                    html += "<td>"+new Date(data.list[i].postDate).toISOString().slice(0, 10)+"</td>";
                }
                html+="</table>";
                $("#tbl-faq").html(html);
	  			},
  				error : function(jqxhr, textStatus, errorThrown){
                console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
			}
		});
	});
	
})
</script>
	<div id="faq-category">
	<form id="categorySelectFrm" onsubmit="return false;">
		<select id="categoryOption">
			<option value="F0">전체보기</option>
			<option value="F1">이용 문의</option>
			<option value="F2">가입 / 로그인</option>
			<option value="F3">PC방 찾기 / 예약</option>
			<option value="F4">채팅</option>
			<option value="F5">업주 전용 기능</option>
			<option value="F6">기타</option>
		</select>
	</form>
	</div>
<br />

<!-- FAQ검색창 -->
<div id="search-container">
	<form name="faqSearchFrm" id="faqSearchFrm" method="post" action="${pageContext.request.contextPath}/faq/faqSearch.do">
			<select name="searchOption" id="searchOption">
				<option value="title" id="title" <c:out value="${searchMap.searchOption == 'title'?'selected':''}"/> >제목</option>
				<option value="content" id="content" <c:out value="${searchMap.searchOption == 'content'?'selected':''}"/> >내용</option>
				<option value="titleAndContent" id="titleAndContent" <c:out value="${searchMap.searchOption == 'titleAndContent'?'selected':''}"/> >제목 + 내용</option>
				<option value="writer" id="writer" <c:out value="${searchMap.searchOption == 'writer'?'selected':''}"/> >아이디</option>
			</select>
		<input type="text" id="searchKeyword" name="searchKeyword" size="20" maxlength="30" value="${searchMap.searchKeyword }"/>		
		<input type="submit" id="btn-search" value="검색하기"/>
	</form>
</div>
<br />

<!-- FAQ게시판 목록 -->
<section id="faq-container">
	<div id="faq-list">
	<p>총 ${totalContents }건의 게시글이 있습니다.</p>
		<table id="tbl-faq">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			<c:forEach items="${list}" var="p"> 
				<tr>
					<td>${p.POSTNO}</td>
					<td><a href="${pageContext.request.contextPath}/faq/faqView.do?no=${p.POSTNO}">${p.POSTTITLE }</a>
					<c:if test="${p.ATTACHNO>0}">
						<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/image/faq/file.png" width=16px>
					</c:if>
					<c:if test="${p.POSTOPENED=='n'}">
						<img alt="비밀글" src="${pageContext.request.contextPath}/resources/image/faq/lock.png" width=16px>
					</c:if>
					</td>
					<td>${p.POSTWRITER }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${p.POSTDATE}" type="date"/></td>
					<c:if test="${p.COMMENTNUM>0}">
						<td> ${p.COMMENTNUM } </td>
					</c:if>
					<td>${p.POSTREADCOUNT}</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<!-- 페이지바 입력란-->
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
		
		<%= project.go.pcgogo.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "faq.do") %>		
		
		<!-- 로그인한 사용자만 글 작성할 수 있도록 버튼 활성 -->
		<c:if test="${loggedInUser != null }">
			<button id="btn-add">문의하기</button>
		</c:if>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>