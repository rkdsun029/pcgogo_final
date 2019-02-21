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
div.plain{background:url("${pageContext.request.contextPath}/resources/image/manager/plain.png");}
div.special{background:url("${pageContext.request.contextPath}/resources/image/manager/special.png");}
div.couple{background:url("${pageContext.request.contextPath}/resources/image/manager/couple.png");}
div.wall{background:url("${pageContext.request.contextPath}/resources/image/manager/wall.png");}
</style>

<script>
$(function(){
	var pmRow_ = $("tr").length;
	var pmCol_ = $("tr:first-of-type td").length;
	var plainSize = $(".plain").length;
	var specialSize = $(".special").length;
	var pmTd_ = $("td").length;
	var pmContent_ = "";

	$("h4#table-legend").children("span#pmRow_").html(pmRow_);
	$("h4#table-legend").children("span#pmCol_").html(pmCol_);
	$("h4#table-legend").children("span#plainSize").html(plainSize);
	$("h4#table-legend").children("span#specialSize").html(specialSize);
	
	$("select#classification").on("change", function(){
		var status = $(this).val();
		console.log(status);
		
		$("div#status").removeClass();
		$("div#status").addClass(status);
		
		$("div#seat__").on("click", function(){
			$(this).removeClass();
			$(this).addClass("seat");
			$(this).addClass(status);
			
			/* console.log($(this)); */
			
			if(status == "plain") $(this).find("input").val() == "a";
			if(status == "special") $(this).find("input").val() == "b";
			if(status == "couple") $(this).find("input").val() == "c";
			if(status == "toilet") $(this).find("input").val() == "d";
			if(status == "exit") $(this).find("input").val() == "e";
			if(status == "counter") $(this).find("input").val() == "f";
			if(status == "kiosk") $(this).find("input").val() == "g";
			if(status == "water") $(this).find("input").val() == "h";
			if(status == "air") $(this).find("input").val() == "i";
			if(status == "smoking") $(this).find("input").val() == "j";
			if(status == "etc") $(this).find("input").val() == "k";
			if(status == "wall") $(this).find("input").val() == "0";
		});
	});

	$("table#placement").on("click", function(){
		var pmRow_ = $("tr").length;
		var pmCol_ = $("tr:first-of-type td").length;
		var plainSize = $(".plain").length;
		var specialSize = $(".special").length;

		$("h4#table-legend").children("span#pmRow_").html(pmRow_);
		$("h4#table-legend").children("span#pmCol_").html(pmCol_);
		$("h4#table-legend").children("span#plainSize").html(plainSize);
		$("h4#table-legend").children("span#specialSize").html(specialSize);
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
			var pmRow_ = $("tr").length;
			var pmCol_ = $("tr:first-of-type td").length;
			var pmTd_ = $("td").length;
			var pmContent_ = "";
			
			for(var s=0; s<pmTd_; s++){
				console.log("찍기:",s,":", $("td").eq(s).find("input").val());
 				/* if($("td:" + t + "th-child").val() == 1) */
				/* pmContent_ += $("td:nth-child(" + parseInt(t) + ")").find("input").val() + ","; */
			}
			
			alert("fasdfasdf");	
			location.href = "${pageContext.request.contextPath}/manager/pcRoomForm_step6.do";
		}
	});

});
</script>
</head>
<body>
<h1 id="head-title">PCGOGO.COM</h1>
<br>
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

<h4 id="table-legend">행 개수 : <span id="pmRow_"></span>, &nbsp; 열 개수 : <span id="pmCol_"></span>, &nbsp; 
					일반석 : <span id="plainSize"></span>, &nbsp; 특별석 : <span id="specialSize"></span></h4><br>

<table id="placement">
	<c:forEach var="i" begin="1" end="${pmRow }" step="1">
		<tr>
			<c:forEach var="j" begin="1" end="${pmCol }" step="1">
				<td>
					<div id="seat__" class="seat wall">
						<!-- <input type="hidden" id="pmpm" value="eval('i*j')"/> -->
						<input type="hidden" value="zzz"/>
					</div>
				</td>
			</c:forEach>
		</tr>		
	</c:forEach>
</table>
<button class="formBtn" id="resetPlacement">초기화</button>
<button class="formBtn" id="submitPlacement">등록</button>

</body>
</html>