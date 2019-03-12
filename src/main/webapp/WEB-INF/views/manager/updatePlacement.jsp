<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자리배치도 수정하기</title>
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
					table.eq(i).find("td").eq(s).find("div#seat__").addClass("plain").css("cursor", "pointer");
				}
				if(temp___ == "b"){
					table.eq(i).find("td").eq(s).find("div#seat__").addClass("special").css("cursor", "pointer");
				}
				if(temp___ == "c"){
					table.eq(i).find("td").eq(s).find("div#seat__").addClass("couple").css("cursor", "pointer");
				}
				if(temp___ == "d") table.eq(i).find("td").eq(s).find("div#seat__").addClass("toilet").css("cursor", "pointer");
				if(temp___ == "e") table.eq(i).find("td").eq(s).find("div#seat__").addClass("exit").css("cursor", "pointer");
				if(temp___ == "f") table.eq(i).find("td").eq(s).find("div#seat__").addClass("counter").css("cursor", "pointer");
				if(temp___ == "g") table.eq(i).find("td").eq(s).find("div#seat__").addClass("kiosk").css("cursor", "pointer");
				if(temp___ == "h") table.eq(i).find("td").eq(s).find("div#seat__").addClass("water").css("cursor", "pointer");
				if(temp___ == "i") table.eq(i).find("td").eq(s).find("div#seat__").addClass("air").css("cursor", "pointer");
				if(temp___ == "j") table.eq(i).find("td").eq(s).find("div#seat__").addClass("smoking").css("cursor", "pointer");
				if(temp___ == "k") table.eq(i).find("td").eq(s).find("div#seat__").addClass("etc").css("cursor", "pointer");
				if(temp___ == "z") table.eq(i).find("td").eq(s).find("div#seat__").addClass("wall").css("cursor", "pointer");
			}
		}
	}
	
	$("select#classification").on("change", function(){
		var status = $(this).val();
		console.log(status);
		
		$("div#status").removeClass();
		$("div#status").addClass(status);
		
		$("div#seat__").on("click", function(){
			$(this).removeClass();
			$(this).addClass("seat");
			$(this).addClass(status);
			
			if(status == "plain") $(this).find("input[type=hidden]").val("a");
			if(status == "special") $(this).find("input[type=hidden]").val("b");
			if(status == "couple") $(this).find("input[type=hidden]").val("c");
			if(status == "toilet") $(this).find("input[type=hidden]").val("d");
			if(status == "exit") $(this).find("input[type=hidden]").val("e");
			if(status == "counter") $(this).find("input[type=hidden]").val("f");
			if(status == "kiosk") $(this).find("input[type=hidden]").val("g");
			if(status == "water") $(this).find("input[type=hidden]").val("h");
			if(status == "air") $(this).find("input[type=hidden]").val("i");
			if(status == "smoking") $(this).find("input[type=hidden]").val("j");
			if(status == "etc") $(this).find("input[type=hidden]").val("k");
			if(status == "wall") $(this).find("input[type=hidden]").val("z");
		});

	});
	
	$("button#resetPlacement").on("click", function(){
		var temp = confirm("정말 초기화 하시겠습니까?");
		if(!temp) return;
		else window.location.reload(true);
	});
	
	$("button#submitPlacement").on("click", function(){
		var temp = confirm("배치도를 저장하시겠습니까?");
		
		if(!temp) return;
			
		else{
			/* var pmRow_ = $("tr").length;
			var pmCol_ = $("tr:first-of-type td").length;
			var pmTd_ = $("td").length;
			var pmContent_ = "";
			
			for(var s=0; s<pmTd_; s++){
				if(s == parseInt(pmTd_)-1)pmContent_ += $("td").eq(s).find("input[type=hidden]").val();				
				else pmContent_ += $("td").eq(s).find("input[type=hidden]").val() + ",";
			}
			
			$("input[name=pmRow_]").val(pmRow_);
			$("input[name=pmCol_]").val(pmCol_);
			$("input[name=pmContent_]").val(pmContent_);*/
			
			$("table").each(function(){
				var html1 = "<input type='hidden' class='table_tdContent' value='";
				var html2 = "<input type='hidden' class='seat_tdCount' value='";
				$(this).find("td").each(function(){
					html1 += $(this).find("input[type=hidden]").val() + ",";
				});
				
				var temp_html2 = $(this).find("[class*=plain], [class*=special], [class*=couple]").length;
				html2 += temp_html2;
				
				html1 += "'/>";
				html2 += "'/>";
				
				$("body").append(html1);
				$("body").append(html2);
			});
			
			var tableLength = $("table").length;
			
			var seatMapList_ = new Array();
			
			for(var i=0; i<tableLength; i++){
				var object = {
					pmRow_ : $("table").eq(i).find("tr").length,
					pmCol_ : $("table").eq(i).find("tr:first-of-type td").length,
					floorNum_ : $("input.hiddenFloorNum").eq(i).val(),
					pmContent_ : $("input.table_tdContent").eq(i).val(),
					seatCount_ : $("input.seat_tdCount").eq(i).val()
				}
				
				seatMapList_.push(object);
			}
			
			console.log(JSON.stringify(seatMapList_));

			$.ajax({
				url : "${pageContext.request.contextPath}/manager/pcRoomForm_savePlacement.do",
				data : JSON.stringify(seatMapList_),
				traditional : true,
				type : "post",
				contentType : "application/json; charset=utf-8",
				success : function(){
					console.log("AJAX SUCCEED");
					location.href = "${pageContext.request.contextPath}/manager/pcRoomForm_step6.do";
				},
				error : function(){
					console.log("AJAX FAILED");
				}
			});
		}
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
h2#pcRoomName__{
	text-align:center;
	font-family:'Nanum Gothic', sans-serif;
}
h4#help_help{
	text-align:center;
	font-family:'Nanum Gothic', sans-serif;
}
</style>
</head>
<body>
<h1 id="head-title">PCGOGO.COM</h1>
<h2 id="pcRoomName__">${selectedPcRoom.pcRoomName }</h2>
<h4 id="help_help">자리배치도 수정시 좌석번호를 다시 부여해야합니다. 양해 부탁드립니다.</h4>
<br><br>
<c:forEach var="p" items="${selectedPlacementList}" varStatus="cnt">
	<input type="hidden" class="hiddenPmContent" value="${p.pmContent }"/>
	<input type="hidden" class="hiddenFloorNum" value="${p.pmFloor }"/>
	<input type="hidden" class="hiddenPmRow" value="${p.pmRow }"/>
	<input type="hidden" class="hiddenPmCol" value="${p.pmCol }"/>
	<input type="hidden" class="hiddenSeatCount" value="${p.pmSeats }"/>
	
	<input type="hidden" class="hiddenPmContentWithSeatNo"/>
	<h2 class="floorNum_">${p.pmFloor } 층</h2>
	<div id="ready-placement">
		<label for="classification">구분&nbsp;&nbsp;&nbsp;</label>
		<select name="classification" id="classification">
			<option value="default" disabled selected>구분을 선택해 주세요.</option>
			<option value="plain">일반석</option>
			<option value="special">특별석</option>
			<option value="couple">다인석(커플, 3인 등)</option>
			<option value="toilet">화장실</option>
			<option value="exit">출입구</option>
			<option value="counter">카운터</option>
			<option value="kiosk">무인기</option>
			<option value="water">정수기</option>
			<option value="air">에어컨, 히터</option>
			<option value="smoking">흡연실</option>
			<option value="etc">기타</option>
			<option value="wall">벽</option>
		</select>
		<fieldset id="status-container">
			<legend>&nbsp;선택&nbsp;</legend>
			<div id="status"></div>
		</fieldset>
	</div>
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

<div id="pm-button-container">
	<button class="formBtn" id="resetPlacement">초기화</button>
	<button class="formBtn" id="submitPlacement">등록</button>
</div>
</body>
</html>