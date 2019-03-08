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
input.hour, input.minute{
	width:35px;
	text-align:center;
}
</style>

<h4 class="help_help">가격표를 따로 등록하지 않을 시, PCGOGO의 기본 가격 정책에 따릅니다. (1,000원에 1시간)</h4>
<h4 class="help_help">터무니없이 비싼 가격이거나, 가격담합이 의심될 시 관리자에 의해 경고 또는 삭제 조치될 수 있습니다.</h4>
<br>
<table id="priceList">
	<tr>
		<th>요금</th>
		<th>시간</th>
	</tr>
	<tr>
		<td>1,000원 권</td>
		<td>
			<input type="number" class="hour" min="0" step="1" value="1"/>&nbsp;&nbsp;:&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>
		</td>
	</tr>
	<tr>
		<td>2,000원 권</td>
		<td>
			<input type="number" class="hour" min="0" step="1" value="2"/>&nbsp;&nbsp;:&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>
		</td>
	</tr>
	<tr>
		<td>3,000원 권</td>
		<td>
			<input type="number" class="hour" min="0" step="1" value="3"/>&nbsp;&nbsp;:&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>
		</td>
	</tr>
	<tr>
		<td>5,000원 권</td>
		<td>
			<input type="number" class="hour" min="0" step="1" value="5"/>&nbsp;&nbsp;:&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>
		</td>
	</tr>
	<tr>
		<td>10,000원 권</td>
		<td>
			<input type="number" class="hour" min="0" step="1" value="10"/>&nbsp;&nbsp;:&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>
		</td>
	</tr>
	<tr>
		<td>20,000원 권</td>
		<td>
			<input type="number" class="hour" min="0" step="1" value="20"/>&nbsp;&nbsp;:&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>
		</td>
	</tr>
	<tr>
		<td>30,000원 권</td>
		<td>
			<input type="number" class="hour" min="0" step="1" value="30"/>&nbsp;&nbsp;:&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>
		</td>
	</tr>
	<tr>
		<td>50,000원 권</td>
		<td>
			<input type="number" class="hour" min="0" step="1" value="50"/>&nbsp;&nbsp;:&nbsp;
			<input type="number" class="minute" min="0" max="50" step="10" value="0"/>
		</td>
	</tr>
	<tr>
		<td><button class="" id="defaultPrice">기본값 적용</button></td>
		<td><button class="" id="submitPrice">가격 등록</button></td>
	</tr>
</table>

<script>
	$(function(){
		$("button#defaultPrice").on("click", function(){
			var temp = confirm("기본값으로 변경하시겠습니까?");
			if(!temp) return;
			else window.location.reload(true);
		});
		
		$("button#submitPrice").on("click", function(){
			var temp = confirm("해당 가격표를 등록하시겠습니까?");
			if(!temp) return;
			else {
				/* $.ajax({
					
				}); */
			}
		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>