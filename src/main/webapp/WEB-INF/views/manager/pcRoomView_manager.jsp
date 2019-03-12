<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="사장님 메뉴" name="pageTitle"></jsp:param>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/managerFixMenu.jsp">
	<jsp:param value="기본정보" name="smallTitle"></jsp:param>
</jsp:include>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<style>
table#pc-info{
	width:550px;
	border-collapse:collapse;
	text-align:center;
	margin:0 auto;
	font-family:'Nanum Gothic', sans-serif;
	font-size:17px;
}
table#pc-info tr{
	padding-bottom:30px;
}
div#map{
	border:1px solid;
	width:500px;
	height:500px;
	margin:0 auto;
}
table#pc-info input{
	postion: relative;
	width: 100%;
}
table#pc-info span{
	font-size: 13px;
	font-weight: bold;
	font-family:'Nanum Gothic', sans-serif;
	margin-left: 20px;
}
</style>
<table id="pc-info">
	<tr>
		<th>상호명</th>
		<td><input type="text" id="pcRoomName_" value="${selectedPcRoom.pcRoomName }"/></td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="address" value="${selectedPcRoom.pcRoomAddress }" 
			class="postcodify_address"/>
		</td>
		<td><button id="postcodify_search_button" class="btn btn-danger" onclick="$('#address').trigger('change');">주소 변경</button></td>
	</tr>
	<tr>
		<td colspan="2">
			<span>* 주소 변경 시 상세주소를 필히 입력해주세요.</span>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<button id="changePcRoomInfo" class="btn btn-success"
			style="margin-top: 20px;" onclick="updatePcRoomInfo();" disabled>정보 수정하기</button>
		</td>
	</tr>
</table>
<script>
$("#pcRoomName_").change(function(){
	$("#changePcRoomInfo").removeAttr("disabled");
});

$("#address").change(function(){
	$("#changePcRoomInfo").removeAttr("disabled");
});

function updatePcRoomInfo(){
	var reqData = "pcRoomNo=${selectedPcRoom.pcRoomNo}";
		reqData += "&pcRoomName="+$("#pcRoomName_").val();
		reqData += "&pcRoomAddress="+$("#address").val();
	location.href="${pageContext.request.contextPath}/manager/update?"+reqData;
}
</script>


<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>