<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="사장님 메뉴" name="pageTitle"></jsp:param>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/managerFixMenu.jsp">
	<jsp:param value="자리배치도" name="smallTitle"></jsp:param>
</jsp:include>

<style>
div#outer-container-placement{
	position:relative;
	margin:0 auto;
	width:500px;
	height:200px;
	text-align:center;
	margin-top:10px;
}
button#updatePlacement, button#getPlacement{
	position:relative;
	width:200px;
	height:50px;
	color:white;
	background:rgb(255, 40, 40, .7);
	border:1px rgb(255, 40, 40, .7);
	border-radius:7px;
	cursor:pointer;
	margin:0 auto;
	margin-bottom:20px;
	font-family:'Nanum Gothic', sans-serif;
	font-size:15px;
}
h4.help_help{
	text-align:center;
}
</style>
<br>
<h4 class="help_help">배치도는 수정하는 즉시 검색결과로 노출됩니다.</h4>
<h4 class="help_help">신중히 수정해주시기 바랍니다.</h4>
<br>
<div id="outer-container-placement">
	<button id="getPlacement">현재 매장 자리배치도 보기</button>
	<br>
	<button id="updatePlacement">자리배치도 수정하기</button>
</div>
<script>
	$("button#getPlacement").on("click", function(){
		window.open("${pageContext.request.contextPath}/manager/readPlacement.do",
				"자리배치도 확인하기", "width=1000, height=700, left=50, top=20");
	});
	
	$("button#updatePlacement").on("click", function(){
		window.open("${pageContext.request.contextPath}/manager/updatePlacement.do",
				"자리배치도 수정하기", "width=1000, height=700, left=50, top=20");
	});
</script>
<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>