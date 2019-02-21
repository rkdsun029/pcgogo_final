<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 PC방 등록</title>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/pcRoomForm.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script>
$(function(){
	$(".toilet").css("cursor", "default");
	$(".exit").css("cursor", "default");
	$(".counter").css("cursor", "default");
	$(".kiosk").css("cursor", "default");
	$(".water").css("cursor", "default");
	$(".air").css("cursor", "default");
	$(".smoking").css("cursor", "default");
	$(".etc").css("cursor", "default");
	$(".wall").css("cursor", "default");
	
	var pmContent = $("#hiddenPmContent").val();
	var tempArr = pmContent.split(",");
	for(var s=0; s<tempArr.length; s++){
		/* console.log("찍기 : ",s,":", tempArr[s]); */
		$("td").eq(s).find("input[type=hidden]").val(tempArr[s]);
		$("td").eq(s).find("div#seat__").removeClass("wall");
		if(tempArr[s] == "a") {
			$("td").eq(s).find("div#seat__").addClass("plain");
			$("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'>88</span>");
		}
		if(tempArr[s] == "b"){
			$("td").eq(s).find("div#seat__").addClass("special");
			$("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'>88</span>");
		}
		if(tempArr[s] == "c"){
			$("td").eq(s).find("div#seat__").addClass("couple");
			$("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'>88</span>");
		}
		if(tempArr[s] == "d") $("td").eq(s).find("div#seat__").addClass("toilet");
		if(tempArr[s] == "e") $("td").eq(s).find("div#seat__").addClass("exit");
		if(tempArr[s] == "f") $("td").eq(s).find("div#seat__").addClass("counter");
		if(tempArr[s] == "g") $("td").eq(s).find("div#seat__").addClass("kiosk");
		if(tempArr[s] == "h") $("td").eq(s).find("div#seat__").addClass("water");
		if(tempArr[s] == "i") $("td").eq(s).find("div#seat__").addClass("air");
		if(tempArr[s] == "j") $("td").eq(s).find("div#seat__").addClass("smoking");
		if(tempArr[s] == "k") $("td").eq(s).find("div#seat__").addClass("etc");
		if(tempArr[s] == "z") $("td").eq(s).find("div#seat__").addClass("wall");		
	}
});
</script>
<style>
div.plain{background:url("${pageContext.request.contextPath}/resources/image/manager/plain.png");}
div.special{background:url("${pageContext.request.contextPath}/resources/image/manager/special.png");}
div.couple{background:url("${pageContext.request.contextPath}/resources/image/manager/couple.png");}
div.wall{background:url("${pageContext.request.contextPath}/resources/image/manager/wall.png");}
span#seatNo{
	position:relative;
	top:3px;
	text-align:center;
	display:block;
}
div#seatNo-help{
	margin:0 auto;
}
div#seatNo-help h3{
	font-family:'Nanum Gothic', sans-serif;
}
</style>
</head>
<body>
<input type="hidden" id="hiddenPmContent" value="${requestScope.pmContent }"/>
<div id="seatNo-help">
	<h3>도움말</h3>
	<h3>일반석, 특별석, 다인석에만 좌석번호 부여가 가능합니다.</h3>
	<h3>(일반석 : 흰색, 특별석 : 빨간색, 다인석 : 노란색)</h3>
	<h3>좌석을 누를때마다 숫자가 1씩 증가하며, <u>xx개 되돌리기</u>를 누르면 <u>해당 숫자만큼 뒤에서부터</u> 번호가 사라집니다.</h3>
	<h3>(현재번호:5인 상태에서 3개 되돌리기를 누르면 5번, 4번, 3번이 사라집니다.)</h3>
	<h3><u>자동으로 번호 생성</u>을 실행하시면 <u>가로방향 기준</u>으로 자동으로 번호가 생성됩니다.</h3>
	<h3>현재번호 : <span></span></h3>	
	<button>되돌리기</button>
	<button>자동으로 번호 생성</button>
</div>

<table id="placement">
	<c:forEach var="i" begin="1" end="${requestScope.pmRow }" step="1">
		<tr>
			<c:forEach var="j" begin="1" end="${requestScope.pmCol }" step="1">
				<td>
					<div id="seat__" class="seat wall">
						<input type="hidden"/>									
					</div>
				</td>
			</c:forEach>
		</tr>		
	</c:forEach>
</table>


<button>초기화</button>
<button>등록</button>
</body>
</html>