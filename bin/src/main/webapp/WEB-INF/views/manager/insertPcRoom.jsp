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
	<jsp:param value="PC방 등록하기" name="smallTitle"></jsp:param>
</jsp:include>

<style>
div#open-container{
	width:600px;
	min-height:300px;
	margin:0 auto;
	text-align:center;
}
div#open-container h3{
	color:red;
	margin-top:50px;
}
button#open-Window{
	width:200px;
	height:50px;
	color:white;
	font-size:17px;
	font-family:'Nanum Gothic', sans-serif;
	background:rgb(255, 40, 40, .7);
	border:1px rgb(255, 40, 40, .7);
	border-radius:10px;
	margin-top:40px;
	cursor:pointer;
}
ul#warning{
	list-style-type:decimal;
	width:450px;
	margin:0 auto;
}
ul#warning li{
	float:left;
	margin-bottom:20px;
	font-weight:bold;
}
</style>


<div id="open-container">
	<h3>아래의 주의사항을 반드시 숙지 후 진행하여 주십시오.</h3>
	<br><br>
	<ul id="warning">
		<li>&nbsp;작업 중 팝업을 닫으시면 입력했던 정보가 복구되지 않습니다.</li>
		<li>&nbsp;자리배치도 미등록시 자리예약 서비스를 이용할 수 없습니다.</li>
		<li>&nbsp;정확한 정보가 아닐 시 관리자에 의해 임의로 삭제될 수 있습니다.</li>
	</ul>
	<button id="open-Window" onclick="startInsert();">등록 시작하기</button>
</div>

<script>
function startInsert(){
	window.open("${pageContext.request.contextPath}/manager/pcRoomForm_step1.do",
					"startInsert", "width=1000, height=700, left=50, top=20");
}
</script>
<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>