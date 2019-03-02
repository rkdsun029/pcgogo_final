<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
div#main-outer-container{
	position:relative;
	width:100%;
	text-align:center;
}
img#main_home{
	position:relative;
	width:100%;
	margin:0 auto;
	top:-20px;
}
img#messenger_banner{
	position:relative;
	width:900px;
	margin:0 auto;
	cursor:pointer;
}
div.games{
	position:relative;
	display:inline-block;
	width:200px;
	height:70px;
	border:1px solid;
}
div#padding hr:first-of-type{display:none;}
div#links_{
	position:relative;
	width:100%;
	height:500px;
}
div#links1, div#links2{
	position:relative;
	display:inline-block;
	width:450px;
	height:500px;
}
</style>

<div id="main-outer-container">
	<img id="main_home" src="${pageContext.request.contextPath }/resources/image/main/temphome.png" alt="" />
	<hr />
	<div id="links_">
		<div id="links1">
			<h2>간편검색</h2>
			분실물 찾기: <input type="text" /><button>검색</button><br />
			PC방 검색: <input type="text" /><button>검색</button>
		</div>
		<div id="links2">
			<h2>인기게임 홈페이지 링크</h2>
			<div class="games"></div>
			<div class="games"></div>
			<div class="games"></div>
			<div class="games"></div>
			<div class="games"></div>
			<div class="games"></div>
		</div>
	</div>
	<br /><br />
	<img id="messenger_banner" src="${pageContext.request.contextPath }/resources/image/main/banner.png" alt="" />
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>