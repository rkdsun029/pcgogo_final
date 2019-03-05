<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8"/>
<html>
<head>
<meta charset="UTF-8">
<title>신규 PC방 등록</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script>
$(function(){
	console.log($("#hiddenPmContent").val());
	var tempArr = $("#hiddenPmContent").val().split(",");
	for(var i=0; i<tempArr.length; i++){
		console.log(tempArr[i]);
		$("td").eq(i).find("input[type=hidden]").val(tempArr[i]);
		$("td").eq(i).find("div#seats").removeClass("wall");
		if(tempArr[i] == "a") {
			$("td").eq(i).find("div#seats").addClass("plain").css("cursor", "pointer");
			$("td").eq(i).find("div#seats").append("<span id='seatNo' name='seatNo'></span>");
		}
		if(tempArr[i] == "b"){
			$("td").eq(i).find("div#seats").addClass("special").css("cursor", "pointer");
			$("td").eq(i).find("div#seats").append("<span id='seatNo' name='seatNo'></span>");
		}
		if(tempArr[i] == "c"){
			$("td").eq(i).find("div#seats").addClass("couple").css("cursor", "pointer");
			$("td").eq(i).find("div#seats").append("<span id='seatNo' name='seatNo'></span>");
		}
		if(tempArr[i] == "d") $("td").eq(i).find("div#seats").addClass("toilet");
		if(tempArr[i] == "e") $("td").eq(i).find("div#seats").addClass("exit");
		if(tempArr[i] == "f") $("td").eq(i).find("div#seats").addClass("counter");
		if(tempArr[i] == "g") $("td").eq(i).find("div#seats").addClass("kiosk");
		if(tempArr[i] == "h") $("td").eq(i).find("div#seats").addClass("water");
		if(tempArr[i] == "i") $("td").eq(i).find("div#seats").addClass("air");
		if(tempArr[i] == "j") $("td").eq(i).find("div#seats").addClass("smoking");
		if(tempArr[i] == "k") $("td").eq(i).find("div#seats").addClass("etc");
		if(tempArr[i] == "z") $("td").eq(i).find("div#seats").addClass("wall");	
	}
});
/* $(function(){
	console.log($("#hiddenSitted").val());
	var tempArr1 = $("#hiddenSitted").val().split(",");
	for(var i=0; i<tempArr1.length; i++){
		console.log(tempArr1[i]);
		$("td").eq(i).find("input[type=hidden]").val(tempArr[i]);

		if(tempArr1[i] == "o") $("td").eq(i).find("div#seats").addClass("sitted");
		if(tempArr1[i] == "x") $("td").eq(i).find("div#seats").addClass("unSitted");

	}
}); */
var max = 0;
//예약할 사람 최대 숫자 설정
$("#num").change(function(){
    max = $("#num").val();
});


var cnt=0;
$("#seats").click(function(){
    if(max>cnt){	//최대치까지 눌렸는지?
        if($(this).prop("class")=="seats"){//
            $(this).attr("class","sitted");
            cnt++;
        }else if($(this).prop("class")=="sitted"){
            $(this).attr("class","chair");
            cnt--;}
        }
    else if(max<=cnt){
        if($(this).prop("class")=="sitted"){
            $(this).attr("class","chair");
            cnt--;
        }else{
            alert("설정하신 인원수인 "+max+"명을 초과하였습니다.");}
    }
});

</script>
<style>
div.seat {
    display: block;
    width: 30px;
    height: 30px;
    /* margin: 1px; */
    cursor: pointer;
}
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
<c:forEach var="rsv" items="${rsv }" varStatus="cnt">
	<input type="hidden" id="hiddenPmContent" value="${rsv.pmContent }"/>
	<input type="hidden" id="hiddenSeated" value="${rsv.seated }"/>
	<h2 class="floorNum_">${rsv.pmFloor } 층</h2>
	<table id="placement">
		<c:forEach var="i" begin="1" end="${rsv.pmRow }" step="1">
			<tr>
				<c:forEach var="j" begin="1" end="${rsv.pmCol }" step="1">
					<td>
						<%-- <c:if test="${rsv. eq '홍길동'}">
						</c:if> --%>

						<div id="seats" class="seat wall">
							<input type="hidden"/>
						</div>
					</td>
				</c:forEach>
			</tr>		
		</c:forEach>
	</table>
	<br><br><br>
</c:forEach>
</body>
</html>