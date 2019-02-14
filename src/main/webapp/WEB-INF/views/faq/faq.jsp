<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="FAQ" name="pageTitle"/>
</jsp:include>
<h1>자주 묻는 질문</h1>
    <div class="skip-nav"><a href="#search-container">바로가기</a></div>

	<section id="search-container">
	<div class="search-div">
		<form action="/faqSearch.do" method="post">
			<input type="text" id="search_faq" class="search_faq" placeholder="무엇이 궁금하신가요?" onkeypress="return onSearchSubmit();">
			<button class="btn-search" id="btn-search"><span class="hide">검색</span></button>
		</form>
	</div>
	</section>

	
	<section id="faq-container">
	<div class="faqs-list">
		<ul class="">
			<li name="category" id="F01" class="on"><a href="#">이용문의</a></li>
			<li name="category" id="F02"><a href="#">가입/로그인</a></li>
			<li name="category" id="F03"><a href="#">PC방 찾기/예약</a></li>
			<li name="category" id="F04"><a href="#">채팅 기능</a></li>
			<li name="category" id="F05"><a href="#">업주 전용 기능</a></li>
			<li name="category" id="F06"><a href="#"></a></li>
		</ul>
	</div>
	<!-- 검색된 FAQ 보여주기 -->
	<div>
	</div>
	
	<div class="wrap-arcodian">
		<ul class="list-arcodian">
			<li>
			<a href="#" class="arcodian-top">
			질문
			</a>
		<div class="arcodian-body">
			<p>답변(누르면 펴짐)</p>
		</div>
			</li>
		</ul>
	</div>
	<div class="wrap-arcodian">
		<ul class="list-arcodian">
			<li>
			<a href="#" class="arcodian-top">
			질문
			</a>
		<div class="arcodian-body">
			<p>답변(누르면 펴짐)</p>
		</div>
			</li>
		</ul>
	</div>
	<div class="wrap-arcodian">
		<ul class="list-arcodian">
			<li>
			<a href="#" class="arcodian-top">
			질문
			</a>
		<div class="arcodian-body">
			<p>답변(누르면 펴짐)</p>
		</div>
			</li>
		</ul>
	</div>
	<div class="wrap-arcodian">
		<ul class="list-arcodian">
			<li>
			<a href="#" class="arcodian-top">
			질문
			</a>
		<div class="arcodian-body">
			<p>답변(누르면 펴짐)</p>
		</div>
			</li>
		</ul>
	</div>

	<!-- 회원 작성 FAQ 게시판 -->
	<div>
	<!-- 작성된 문의글 목록 보여주기 -->
	</div>
	</section>
<script>
function onSearchSubmit() {
var keyCode = window.event.keyCode;

// 검색란에서 공백인 채로 엔터 누를시: "검색어를 입력해주세요." 표시 후 되돌아가기
// 검색란에서 검색어 입력하고 엔터 누를 시: 검색결과 표시

/* if(keyCode==13){
// 보여주기
alert("검색어를 입력해주세요.");
return false;
} else {
return true;
} */
	
}

// 게시글 보기
/*
 * if(memberId=="") {
	 alert("로그인된 회원만 게시글을 볼 수 있습니다.")
	 location.href("/login.do");
	 return;
 }
 */
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>