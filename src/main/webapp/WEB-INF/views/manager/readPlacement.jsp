<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자리배치도 보기</title>
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
	
	var pmContent = $(".hiddenPmContent");
	console.log(pmContent);
	
	var tableLength = $("table").length;
	var table = $("table");
	for(var i=0; i<tableLength; i++){
		var tempArr = pmContent.eq(i).val().split(",");
		console.log(tempArr);
		for(var s=0; s<tempArr.length; s++){
			/* console.log("찍기 : ",s,":", tempArr[s]); */
			if(tempArr[s] != ""){
				var temp___ = tempArr[s].charAt(0);
				table.eq(i).find("td").eq(s).find("input[type=hidden]").val(temp___);
				table.eq(i).find("td").eq(s).find("div#seat__").removeClass("wall");
				if(temp___ == "a") {
					table.eq(i).find("td").eq(s).find("div#seat__").addClass("plain");
					table.eq(i).find("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'>" + tempArr[s].charAt(1) + tempArr[s].charAt(2) + "</span>");
				}
				if(temp___ == "b"){
					table.eq(i).find("td").eq(s).find("div#seat__").addClass("special");
					table.eq(i).find("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'></span>");
				}
				if(temp___ == "c"){
					table.eq(i).find("td").eq(s).find("div#seat__").addClass("couple");
					table.eq(i).find("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'></span>");
				}
				if(temp___ == "d") table.eq(i).find("td").eq(s).find("div#seat__").addClass("toilet");
				if(temp___ == "e") table.eq(i).find("td").eq(s).find("div#seat__").addClass("exit");
				if(temp___ == "f") table.eq(i).find("td").eq(s).find("div#seat__").addClass("counter");
				if(temp___ == "g") table.eq(i).find("td").eq(s).find("div#seat__").addClass("kiosk");
				if(temp___ == "h") table.eq(i).find("td").eq(s).find("div#seat__").addClass("water");
				if(temp___ == "i") table.eq(i).find("td").eq(s).find("div#seat__").addClass("air");
				if(temp___ == "j") table.eq(i).find("td").eq(s).find("div#seat__").addClass("smoking");
				if(temp___ == "k") table.eq(i).find("td").eq(s).find("div#seat__").addClass("etc");
				if(temp___ == "z") table.eq(i).find("td").eq(s).find("div#seat__").addClass("wall");
			}
		}
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
h2#pcRoomName__{
	text-align:center;
	font-family:'Nanum Gothic', sans-serif;
}
</style>
</head>
<body>
<h1 id="head-title">PCGOGO.COM</h1>
<h2 id="pcRoomName__">${selectedPcRoom.pcRoomName }</h2>
<br>
<c:forEach var="p" items="${selectedPlacementList}" varStatus="cnt">
	<input type="hidden" class="hiddenPmContent" value="${p.pmContent }"/>
	<input type="hidden" class="hiddenFloorNum" value="${p.pmFloor }"/>
	<input type="hidden" class="hiddenPmRow" value="${p.pmRow }"/>
	<input type="hidden" class="hiddenPmCol" value="${p.pmCol }"/>
	<input type="hidden" class="hiddenSeatCount" value="${p.pmSeats }"/>
	
	<input type="hidden" class="hiddenPmContentWithSeatNo"/>
	<h2 class="floorNum_">${p.pmFloor } 층</h2>
	<table id="placement">
		<c:forEach var="i" begin="1" end="${p.pmRow }" step="1">
			<tr>
				<c:forEach var="j" begin="1" end="${p.pmCol }" step="1">
					<td>
						<div id="seat__" class="seat wall">
							<input type="hidden"/>									
						</div>
					</td>
				</c:forEach>
			</tr>		
		</c:forEach>
	</table>
	<br><br>
</c:forEach>
</body>
</html>