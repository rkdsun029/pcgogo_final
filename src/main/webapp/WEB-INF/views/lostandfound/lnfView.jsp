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
input{
text-align:center;
}
</style>


<div id="lnf-container">
	<!-- https://getbootstrap.com/docs/4.1/components/forms/#readonly-plain-text -->
	<form id="devFrm">
	<c:forEach items="${list}" var="list" varStatus="vs">
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">등록자</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnf" name="lnfGetDate" value="${list.lnfEnrollName}">
			</div>
		</div>
		<!-- 딱히 등록번호가 필요해보이진않음.... -->
		<%-- <div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">등록번호</label>
			<div class="col-sm-10" >
				<input type="text" class="form-control" id="lnf" name="lnfNo" value="${list.lnfNo}" style="text-align:center;">
			</div>
		</div> --%>
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">분류</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnf" name="lnfType" value="${list.lnfType}">
			</div>
		</div>
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">물품명</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnf" name="lnfName" value="${list.lnfName}">
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
				<input type="text" class="form-control" id="lnfStatus" name="lnfStatus" value="${list.lnfStatus}">
			</div>
		</div>
		<div class="form-group row">
			<label for="lnf" class="col-sm-2 col-form-label">등록일</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="lnf" name="lnfGetDate" value="${list.lnfGetDate}">
			</div>
		</div>
			<c:forEach items="${imgList}" var="imgList" varStatus="vs">
			<div class="form-group row">
				<label for="lnf" class="col-sm-2 col-form-label">물품등록사진</label>
				<div class="col-sm-10">
					<img alt="물품 등록사진" src="${pageContext.request.contextPath }/resources/upload/board/${imgList.renamedFileName}" style="width:350px; height:300px;">
				</div>
			</div>
			</c:forEach>
		
		
		</c:forEach>
		
	</form>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>