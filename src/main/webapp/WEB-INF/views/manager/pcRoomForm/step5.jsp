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
<style>
h1#head-title{display:block;}
div.plain{background:url("${pageContext.request.contextPath}/resources/image/manager/plain.png");}
div.special{background:url("${pageContext.request.contextPath}/resources/image/manager/special.png");}
div.couple{background:url("${pageContext.request.contextPath}/resources/image/manager/couple.png");}
div.wall{background:url("${pageContext.request.contextPath}/resources/image/manager/wall.png");}
</style>
<script>
$(function(){	
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
			
			var pmContent_ = new Array;
			var seatCount_ = new Array;
			
			var tableLength = $("table").length;
			
			for(var i=0; i<tableLength; i++){
				pmContent_.push($("input.table_tdContent").eq(i).val());
				seatCount_.push($("input.seat_tdCount").eq(i).val());
			}
			
			console.log(pmContent_);
			console.log(seatCount_);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/manager/step6.do",
				data :{
					"pmContent_" : pmContent_,
					"seatCount_" : seatCount_,
					"seatMapList" : ${seatMapList}
				}
				success : function(data){
					console.log("AJAX SUCCEED");
				},
				error : function(){
					console.log("AJAX ERROR");
				}
			});
		}
	});

});
</script>
</head>
<body>
<h1 id="head-title">PCGOGO.COM</h1>
<br>

<h4 id="seatLegend">편의를 위하여 자리분류 선택바가 층마다 있습니다. 아무거나 이용하셔도 무관합니다.</h4>
<br>
<c:forEach var="seatMap" items="${seatMapList }" varStatus="cnt">
	<h2 class="floorNum_">${seatMap.floorNum }층</h2>
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
		<c:forEach var="i" begin="1" end="${seatMap.pmRow }" step="1">
			<tr>
				<c:forEach var="j" begin="1" end="${seatMap.pmCol }" step="1">
					<td class="${cnt.count }">
						<div id="seat__" class="seat wall">
							<input type="hidden" value="z"/>
						</div>
					</td>
				</c:forEach>
			</tr>		
		</c:forEach>
	</table>
	<br><br><br>
</c:forEach>

<div id="pm-button-container">
	<button class="formBtn" id="resetPlacement">초기화</button>
	<button class="formBtn" id="submitPlacement">등록</button>
</div>
</body>
</html>