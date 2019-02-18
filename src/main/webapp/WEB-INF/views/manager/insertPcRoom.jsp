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
	height:200px;
	margin:0 auto;
	text-align:center;
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
	cursor:pointer;
}
</style>


<div id="open-container">
	<br><br><br>
	<span>작업 중 팝업을 닫으시면 입력했던 정보가 복구되지 않습니다.</span>
	<br><br><br>
	<button id="open-Window" onclick="startInsert();">등록 시작하기</button>
</div>

<script>
function startInsert(){
	window.open("${pageContext.request.contextPath}/manager/pcRoomForm.do",
					"startInsert", "width=1000, height=700, left=50, top=20");
}
</script>
<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>