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
	var pmTd_ = $("td").length;
	var currValNum = 0;
	
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
			$("td").eq(s).find("div#seat__").addClass("plain").css("cursor", "pointer");
			$("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'></span>");
		}
		if(tempArr[s] == "b"){
			$("td").eq(s).find("div#seat__").addClass("special").css("cursor", "pointer");
			$("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'></span>");
		}
		if(tempArr[s] == "c"){
			$("td").eq(s).find("div#seat__").addClass("couple").css("cursor", "pointer");
			$("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'></span>");
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
	
	/* 되돌리기 */
	$("button#ctrlZ").on("click", function(){
		
	});
	
	/* 자동번호 생성 */
	$("button#makeAutoSeatNo").on("click", function(){
		for(var i=0; i<pmTd_; i++){
			var tempVal_td = $("td").eq(i).find("input[type=hidden]").val();
			if(tempVal_td == "a" || tempVal_td == "b" || tempVal_td == "c"){
				$("td").eq(i).find("span#seatNo").html(++currValNum);	
			}
		}
	});
	
	/* 초기화 */
	
	/* 등록 */
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
h1#head-title{display:block;}
div#seatNo-help{
	width:530px;
	height:190px;
	margin:0 auto;
	font-family:'Nanum Gothic', sans-serif;
	border:1px solid #c8c8c8;
	border-radius:10px;
}
div#seatNo-help h4{
	margin:0px;
	margin-bottom:10px;
	margin-left:27px;
}
div#seatNo-help h4:first-of-type{
	margin-top:27px;
}
div#seatNo-status{
	width:370px;
	height:60px;
	margin:0 auto;
	text-align:center;
	margin-top:30px;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:bold;
}
h3#seatNo-help-legend{
	font-family:'Nanum Gothic', sans-serif;
	text-align:center;
}
input#currVal{
	width:40px;
	outline:none;
	border:none;
	color:red;
	font-size:17px;
	font-weight:bold;
	font-family:'Nanum Gothic', sans-serif;
}
</style>
</head>
<body>
<h1 id="head-title">PCGOGO.COM</h1>
<input type="hidden" id="hiddenPmContent" value="${requestScope.pmContent }"/>
<h3 id="seatNo-help-legend">&lt; 좌석번호 입력 &gt;</h3>
<div id="seatNo-help">
	<h4>- 일반석, 특별석, 다인석에만 좌석번호 부여가 가능합니다.</h4>
	<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(일반석 : 흰색, 특별석 : 빨간색, 다인석 : 노란색)</h4>
	<h4>- 좌석을 누를때마다 숫자가 1씩 증가합니다.</h4>
	<h4>- 되돌리기 : <u>큰 숫자부터 하나씩</u> 좌석번호가 사라집니다.</h4>
	<h4>- 자동으로 번호 생성 : <u>가로방향 기준</u>으로 자동으로 번호가 생성됩니다.</h4>
</div>
		
<div id="seatNo-status">
	<span>현재번호 : <input type="number" id="currVal" value="0" readonly/></span>
	<button id="ctrlZ">되돌리기</button>
	<button id="makeAutoSeatNo">자동으로 번호 생성</button>
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

<div id="pm-button-container">
	<button class="formBtn" id="resetSeatNo">초기화</button>
	<button class="formBtn" id="submitSeatNo">등록</button>
</div>
</body>
</html>