<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="분실물 등록" name="lostandfound"></jsp:param>
</jsp:include>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<style>
div#board-container{width:400px; margin:0 auto; text-align:center;}
div#board-container input{margin-bottom:15px;}
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}

</style>

<script>

//부트스트랩 : 파일변경시 파일명 보이기
$(function(){
	$("[name=upFile]").on('change', function(){
		//var fileName = $(this).val();
		console.log($(this));
		var fileName = $(this).prop("files")[0].name;
		$(this).next(".custom-file-label").html(fileName);
	});
});

</script>


<div id="board-container">
	<form name="boardFrm" 
		  action="${pageContext.request.contextPath}/lostandfound/insertFrm.do" 
		  method="post" 
		  enctype="multipart/form-data">
		
		
		<input type="text" class="form-control" placeholder="물품 등록한 사람" name="lnfEnrollName" id="lnfEnrollName" required>
		
		<select name="lnfType" id="lnfType" class="form-control">
			<option value="" disabled selected>분류를 선택해 주세요.</option>
			<option value="L1" id="value1">분류1 : 핸드폰 / 지갑 / 가방</option>
			<option value="L2" id="value2">분류2 : 충전기 / USB</option>
			<option value="L3" id="value3">분류3 : 카드 / 신분증 / 면허증</option>
			<option value="L4" id="value4">분류4 : 악세사리 / 의류</option>
			<option value="L5" id="value5">분류5 : 기타</option>
		</select>
		<br>
		<input type="text" class="form-control" placeholder="물품명" name="lnfName" id="lnfName" required>
		
		<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile" multiple>
		    <label class="custom-file-label" for="upFile">파일을 선택하세요</label>
		  </div>
		</div>
		<input type="text" class="form-control" placeholder="보관중인 PC방 이름" name="lnfPcRoomName" id="lnfPcRoomName" required>
		
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" >
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>