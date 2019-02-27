<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="분실물 view" name="lostandfound"></jsp:param>
</jsp:include>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<style>
div#lnf-container {
	width: 600px;
	padding: 15px;
	margin: 0 auto;
	border: 1px solid lightgray;
	border-radius: 10px;
	text-align:center;
}
div.col-sm-10 {
    padding-left: 70px;
    padding-right: 50px;
	text-align:center;
}
input#btn-add{
text-align:center;
float:center; 
	margin: 0 0 15px;
	display:inline-block;
	width:100px;
	height:35px;
	border-radius:5px;
	border: 1px rgba(255, 40, 40, .7);
	background:rgba(255, 40, 40, .7);
	color:white;
	font-size:12px;
	font-family:'Nanum Gothic', sans-serif;
	cursor:pointer;
}
button#btn-add{
text-align:center;
	float:center; 
	margin: 0 0 15px;
	display:inline-block;
	width:100px;
	height:35px;
	border-radius:5px;
	border: 1px rgba(255, 40, 40, .7);
	background:rgba(255, 40, 40, .7);
	color:white;
	font-size:12px;
	font-family:'Nanum Gothic', sans-serif;
	cursor:pointer;
}
</style>


<div id="lnf-container">
	<!-- https://getbootstrap.com/docs/4.1/components/forms/#readonly-plain-text -->
	<form id="devFrm">
	<c:forEach items="${list}" var="list" varStatus="vs">
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">등록자</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnf" name="lnfEnrollName" value="${list.lnfEnrollName}" >
			</div>
		</div>
		<!-- 딱히 등록번호가 필요해보이진않음.... -->
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">등록번호</label>
			<div class="col-sm-10" >
				<input type="text" class="form-control" id="lnf" name="lnfNo" value="${list.lnfNo}" style="text-align:center;" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">분류</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnf" name="lnfType" value="${list.lnfType}" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">물품명</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnf" name="lnfName" value="${list.lnfName}" >
			</div>
		</div>
		<!-- https://getbootstrap.com/docs/4.1/components/forms/#inline -->
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">보관장소</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnf" name="lnfPcRoomName" value="${list.lnfPcRoomName}">
			</div>
		</div>
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">처리상태</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnfStatus" name="lnfStatus" value="${list.lnfStatus}" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">등록일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnf" name="lnfGetDate" value="${list.lnfGetDate}" readonly="readonly">
			</div>
		</div>
	   <c:forEach items="${imgList}" var="imgList" varStatus="vs"> 
			<div class="form-group row">
				<label for="lnf" class="col-sm-2 col-form-label">물품등록사진</label>
				<div class="col-sm-10">
					<img alt="물품 등록사진" name="renamedFileName" src="${pageContext.request.contextPath}/resources/upload/board/${imgList.renamedFileName}" style="width:350px; height:300px;">
				</div>
			</div>
			</c:forEach>
		</c:forEach>
		<input type="button" id="btn-add" class="completeDev" value="수정">
		<input type="button" id="btn-add" class="deleteDev" value="삭제"> 
	</form>
</div>
<script>
		$("#devFrm .completeDev").on("click", function(){
			var param = {
				lnfEnrollName: $("#devFrm [name=lnfEnrollName]").val(),
				lnfNo: $("#devFrm [name=lnfNo]").val(),
				/* lnfType: $("#devFrm [name=lnfType]").val(), */
				lnfName: $("#devFrm [name=lnfName]").val(),
				lnfPcRoomName: $("#devFrm [name=lnfPcRoomName]").val()	
				/* lnfStatus: $("#devFrm [name=lnfStatus]").val(),	 */
				/* lnfGetDate: $("#devFrm [name=lnfGetDate]").val(), */	
				/* renamedFileName: $("#devFrm [name=renamedFileName]").val() */
	  		}
	  		console.log(param);
	  		var jsonStr = JSON.stringify(param);
	  		console.log(jsonStr);		
	  	
	  		$.ajax({
	  			url: "${pageContext.request.contextPath}/lostandfound/completeDev",
	  			data: jsonStr,
	  			type: "put",
	  			dataType: "json", 
	  			contentType: "application/json; charset=utf-8",
	  			success: function(data){
	  				console.log(data);
	  				//입력성공후 form 초기화(jquery)
	  				$("#devFrm")[0].reset();
	  			},
	  			error: function(){
	  				console.log("ajax 처리 에러!!");
	  			}
	  		});
		});
		
		$("#devFrm .deleteDev").on("click", function(){
			if(!confirm("정말 삭제하시겠습니까?"))
				return;
			var lnfNo = $("#devFrm [name=lnfNo]").val();
			$.ajax({
				url: "${pageContext.request.contextPath}/lostandfound/deleteDev?lnfNo="+lnfNo,
				type: "delete",
				dataType: "json",
				success: function(data){
					alert(data.msg);
					$("#devFrm")[0].reset();
				},
				error: function(){
					console.log("ajax 처리 실패!");
				}
			});
			
		});
		</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>