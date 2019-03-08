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
				table.eq(i).find("td").eq(s).find("input[type=hidden]").val(tempArr[s]);
				table.eq(i).find("td").eq(s).find("div#seat__").removeClass("wall");
				if(tempArr[s] == "a") {
					table.eq(i).find("td").eq(s).find("div#seat__").addClass("plain").css("cursor", "pointer");
					table.eq(i).find("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'></span>");
				}
				if(tempArr[s] == "b"){
					table.eq(i).find("td").eq(s).find("div#seat__").addClass("special").css("cursor", "pointer");
					table.eq(i).find("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'></span>");
				}
				if(tempArr[s] == "c"){
					table.eq(i).find("td").eq(s).find("div#seat__").addClass("couple").css("cursor", "pointer");
					table.eq(i).find("td").eq(s).find("div#seat__").append("<span id='seatNo' name='seatNo'></span>");
				}
				if(tempArr[s] == "d") table.eq(i).find("td").eq(s).find("div#seat__").addClass("toilet");
				if(tempArr[s] == "e") table.eq(i).find("td").eq(s).find("div#seat__").addClass("exit");
				if(tempArr[s] == "f") table.eq(i).find("td").eq(s).find("div#seat__").addClass("counter");
				if(tempArr[s] == "g") table.eq(i).find("td").eq(s).find("div#seat__").addClass("kiosk");
				if(tempArr[s] == "h") table.eq(i).find("td").eq(s).find("div#seat__").addClass("water");
				if(tempArr[s] == "i") table.eq(i).find("td").eq(s).find("div#seat__").addClass("air");
				if(tempArr[s] == "j") table.eq(i).find("td").eq(s).find("div#seat__").addClass("smoking");
				if(tempArr[s] == "k") table.eq(i).find("td").eq(s).find("div#seat__").addClass("etc");
				if(tempArr[s] == "z") table.eq(i).find("td").eq(s).find("div#seat__").addClass("wall");
			}
		}
	}
	
	var pmTd_ = $("td").length;
	var currValNum = 0;
	
	/* 좌석누르면 좌석번호 생성 */
	$(".plain, .special, .couple").on("click", function(){
		$(this).find("span").html(++currValNum);
		$(this).find("span").val(currValNum);
		
		$(this).off("click");
	});	

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
	$("button#resetSeatNo").on("click", function(){
		var temp = confirm("정말 초기화 하시겠습니까?");
		if(!temp) return;
		else window.location.reload(true);
	});
	
	/* 등록 */
	$("button#submitSeatNo").on("click", function(){
		var temp = confirm("좌석번호를 저장하시겠습니까?");
		if(!temp) return;
		else{
			var hiddenPmContentWithSeatNo = $(".hiddenPmContentWithSeatNo");
			var tempContent_ = "";
			
			var hiddenPmRow_ = $(".hiddenPmRow");
			var hiddenPmCol_ = $(".hiddenPmCol");
			
			for(var i=0; i<tableLength; i++){
				var thisTableTdCount = parseInt(hiddenPmRow_.eq(i).val()) * parseInt(hiddenPmCol_.eq(i).val());
				
				for(var j=0; j<thisTableTdCount; j++){
					var tdList = table.eq(i).find("td");
					var tdListLength = table.eq(i).find("td").length;
					
					if(j == parseInt(tdListLength)-1){
						if(tdList.eq(j).find("span#seatNo").length != 0){
							tempContent_ += tdList.eq(j).find("input[type=hidden]").val();										
							tempContent_ += parseInt(tdList.eq(j).find("span#seatNo").html());
						}
						else{
							tempContent_ += tdList.eq(j).find("input[type=hidden]").val();										
						}
					}
					else {
						if(tdList.eq(j).find("span#seatNo").length != 0){
							tempContent_ += tdList.eq(j).find("input[type=hidden]").val();										
							tempContent_ += parseInt(tdList.eq(j).find("span#seatNo").html()) + ",";
						}
						else{
							tempContent_ += tdList.eq(j).find("input[type=hidden]").val() + ",";										
						}
					}
				}
				
				hiddenPmContentWithSeatNo.eq(i).val(tempContent_);
				tempContent_ = "";
			}
			
			////////////////
			var seatMapList_ = new Array();
			
			for(var i=0; i<tableLength; i++){
				var object = {
					pmRow_ : $("table").eq(i).find("tr").length,
					pmCol_ : $("table").eq(i).find("tr:first-of-type td").length,
					floorNum_ : $("input.hiddenFloorNum").eq(i).val(),
					pmContent_ : $("input.hiddenPmContentWithSeatNo").eq(i).val(),
					seatCount_ : $("input.hiddenSeatCount").eq(i).val()
				};
				
				seatMapList_.push(object);
			}
			
			console.log(JSON.stringify(seatMapList_));

			$.ajax({
				url : "${pageContext.request.contextPath}/manager/pcRoomForm_step7.do",
				data : JSON.stringify(seatMapList_),
				traditional : true,
				type : "post",
				contentType : "application/json; charset=utf-8",
				success : function(){
					console.log("AJAX SUCCEED");
					location.href = "${pageContext.request.contextPath}/manager/pcRoomForm_end.do";
				},
				error : function(){
					console.log("AJAX FAILED");
				}
			});
			
			///////////////
		};
	});
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

<h3 id="seatNo-help-legend">&lt; 좌석번호 입력 &gt;</h3>
<div id="seatNo-help">
	<h4>- 일반석, 특별석, 다인석에만 좌석번호 부여가 가능합니다.</h4>
	<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(일반석 : 흰색, 특별석 : 빨간색, 다인석 : 노란색)</h4>
	<h4>- 좌석을 누를때마다 숫자가 1씩 증가합니다.</h4>
	<h4>- 되돌리기 : <u>큰 숫자부터 하나씩</u> 좌석번호가 사라집니다.</h4>
	<h4>- 자동으로 번호 생성 : <u>가로방향 기준</u>으로 자동으로 번호가 생성됩니다.</h4>
</div>
		
<div id="seatNo-status">
	<button id="ctrlZ">되돌리기</button>
	<button id="makeAutoSeatNo">자동으로 번호 생성</button>
</div>
<c:forEach var="seatMap" items="${sessionScope.seatMapList }" varStatus="cnt">
	<input type="hidden" class="hiddenPmContent" value="${seatMap.pmContent_ }"/>
	<input type="hidden" class="hiddenFloorNum" value="${seatMap.floorNum_ }"/>
	<input type="hidden" class="hiddenPmRow" value="${seatMap.pmRow_ }"/>
	<input type="hidden" class="hiddenPmCol" value="${seatMap.pmCol_ }"/>
	<input type="hidden" class="hiddenSeatCount" value="${seatMap.seatCount_ }"/>
	
	<input type="hidden" class="hiddenPmContentWithSeatNo"/>
	<h2 class="floorNum_">${seatMap.floorNum_ } 층</h2>
	<table id="placement">
		<c:forEach var="i" begin="1" end="${seatMap.pmRow_ }" step="1">
			<tr>
				<c:forEach var="j" begin="1" end="${seatMap.pmCol_ }" step="1">
					<td>
						<div id="seat__" class="seat wall">
							<input type="hidden"/>									
						</div>
					</td>
				</c:forEach>
			</tr>		
		</c:forEach>
	</table>
	<br><br><br>
</c:forEach>

<div id="pm-button-container">
	<button class="formBtn" id="resetSeatNo">초기화</button>
	<button class="formBtn" id="submitSeatNo">등록</button>
</div>
</body>
</html>