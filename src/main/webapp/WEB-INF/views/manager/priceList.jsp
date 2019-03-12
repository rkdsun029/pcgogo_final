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
	<jsp:param value="가격표" name="smallTitle"></jsp:param>
</jsp:include>
<style>
h4.help_help{
	text-align:center;
}
table#priceList{
	margin:0 auto;
	border-collapse:collapse;
}
table#priceList th,  table#priceList td{
	padding-top:10px;
	padding-bottom:10px;
	text-align:center;
	width:170px;
}
table#priceList th{
	border-top:1px solid #c8c8c8;
	border-bottom:1px solid #c8c8c8;
}
table#priceList tr:last-of-type{
	border-top:1px solid #c8c8c8;
}
input.hour, input.minute{
	width:35px;
	text-align:center;
}
button.priceBtn{
	width:150px;
	height:40px;
	background:rgb(255, 40, 40, .7);
	border:1px rgb(255, 40, 40, .7);
	border-radius:7px;
	color:white;
	font-family:'Nanum Gothic', sans-serif;
	font-size:15px;
	cursor:pointer;
	margin-top:20px;
}
button#defaultPrice{
	background:#c8c8c8;
}
img#clockImg{
	display:block;
	margin:0 auto;
}
</style>
<script>
$(function(){
	var values = $(".selectedValue");
	
	for(var i=0; i<8; i++){
		var temp = parseInt(values.eq(i).val());
		$("input.hour").eq(i).val(temp/60);
		$("input.minute").eq(i).val(temp%60);
	}
	
	console.log($("input.hour"));
	console.log($("input.minute"));
});
</script>
<h4 class="help_help">가격표를 따로 등록하지 않을 시, PCGOGO의 기본 가격 정책에 따릅니다. (1,000원에 1시간)</h4>
<h4 class="help_help">터무니없이 비싼 가격이거나, 가격담합이 의심될 시 관리자에 의해 경고 또는 삭제 조치될 수 있습니다.</h4>
<br>
<img id="clockImg" src="${pageContext.request.contextPath }/resources/image/manager/priceList.png" alt="" />
<br>
<h2 style="text-align:center;">시간별 요금표</h2>
<br>
<table id="priceList">
	<tr>
		<th>요금</th>
		<th>시간</th>
	</tr>
	<tr>
		<td>1,000원 권</td>
		<td>
			<input type="hidden" class="selectedValue" value="${selectedPriceList.pl1000 }"/>
			<input type="number" class="hour" min="0" step="1" value="1"/>&nbsp;시간&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>&nbsp;분
		</td>
	</tr>
	<tr>
		<td>2,000원 권</td>
		<td>
			<input type="hidden" class="selectedValue" value="${selectedPriceList.pl2000 }"/>
			<input type="number" class="hour" min="0" step="1" value="2"/>&nbsp;시간&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>&nbsp;분
		</td>
	</tr>
	<tr>
		<td>3,000원 권</td>
		<td>
			<input type="hidden" class="selectedValue" value="${selectedPriceList.pl3000 }"/>
			<input type="number" class="hour" min="0" step="1" value="3"/>&nbsp;시간&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>&nbsp;분
		</td>
	</tr>
	<tr>
		<td>5,000원 권</td>
		<td>
			<input type="hidden" class="selectedValue" value="${selectedPriceList.pl5000 }"/>
			<input type="number" class="hour" min="0" step="1" value="5"/>&nbsp;시간&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>&nbsp;분
		</td>
	</tr>
	<tr>
		<td>10,000원 권</td>
		<td>
			<input type="hidden" class="selectedValue" value="${selectedPriceList.pl10000 }"/>
			<input type="number" class="hour" min="0" step="1" value="10"/>&nbsp;시간&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>&nbsp;분
		</td>
	</tr>
	<tr>
		<td>20,000원 권</td>
		<td>
			<input type="hidden" class="selectedValue" value="${selectedPriceList.pl20000 }"/>
			<input type="number" class="hour" min="0" step="1" value="20"/>&nbsp;시간&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>&nbsp;분
		</td>
	</tr>
	<tr>
		<td>30,000원 권</td>
		<td>
			<input type="hidden" class="selectedValue" value="${selectedPriceList.pl30000 }"/>
			<input type="number" class="hour" min="0" step="1" value="30"/>&nbsp;시간&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>&nbsp;분
		</td>
	</tr>
	<tr>
		<td>50,000원 권</td>
		<td>
			<input type="hidden" class="selectedValue" value="${selectedPriceList.pl50000 }"/>
			<input type="number" class="hour" min="0" step="1" value="50"/>&nbsp;시간&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>&nbsp;분
		</td>
	</tr>
	<tr>
		<td><button class="priceBtn" id="defaultPrice">기본값 적용</button></td>
		<td><button class="priceBtn" id="submitPrice">가격 등록</button></td>
	</tr>
</table>

<form id="hiddenDeleteForm" action="${pageContext.request.contextPath }/manager/deletePrice.do">
	<input type="hidden" name="pcRoomNo" id="pcRoomNo" value="${selectedPcRoom.pcRoomNo }"/>
</form>
<form id="hiddenInsertOrUpdateForm" action="${pageContext.request.contextPath }/manager/insertOrUpdatePrice.do">
	<input type="hidden" name="pcRoomNo" id="pcRoomNo" value="${selectedPcRoom.pcRoomNo }"/>
	<input type="hidden" name="priceArr" id="priceArr"/>
</form>

<script>
	$(function(){
		$("button#defaultPrice").on("click", function(){
			var temp = confirm("기본값으로 변경하시겠습니까?");
			if(!temp) return;
			else $("form#hiddenDeleteForm").submit();
		});
		
		$("button#submitPrice").on("click", function(){
			var temp = confirm("해당 가격표를 등록하시겠습니까?");
			if(!temp) return;
			else {
				var timeArr = new Array();
				var defaultTime = [60, 120, 180, 300, 600, 1200, 1800, 3000];
				
				var length = $("input.hour").length;
				var hourArr = $("input.hour");
				var minuteArr = $("input.minute");
				
				for(var i=0; i<length; i++){
					var time = parseInt(hourArr.eq(i).val()) * 60 + parseInt(minuteArr.eq(i).val());
					timeArr.push(time);
				}
				
				var tempNum = 0;
				for(var j=0; j<length; j++){
					if(timeArr[j] != defaultTime[j]) {
						break;
					}
					tempNum++;
				}
				
				if(tempNum == 8){
					alert("기본값과 동일합니다. 기본값적용 버튼을 눌러주세요.");
					return;
				}
				else{
					$("input#priceArr").val(timeArr.toString());
					$("form#hiddenInsertOrUpdateForm").submit();
				}				
			}
		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>