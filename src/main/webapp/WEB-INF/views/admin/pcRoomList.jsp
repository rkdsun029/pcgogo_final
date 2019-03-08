<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="업체 목록입니다." name="pageTitle"></jsp:param>
</jsp:include>
<style>
body{font-family:'Nanum Gothic', sans-serif;}
div#container{
	position: relative;
}
div#divisionBar{
	width: 40%;
	height: 30px;
	text-align: center;
	margin: 15px auto;
	font-weight: bold;
}
div.division{
	position : relative;
	display: inline-block;
	width: 30%;
	height: 100%;
	border-radius: 4px;
	padding-top: 3px;
}
div.division:hover{
	cursor: pointer;
	background: #CFD8DF;
	opacity: .8;
	color: white;
}
.clicked{
	border-bottom: 2px solid black;
}
table.table tr>th, table.table tr>td{text-align: center; white-space: nowrap;}
</style>
<div id="container">
	<div id="divisionBar">
		<div class="division ${division=='manager'?'clicked':''}" id="manager">사장님 목록</div>
		<div class="division ${division=='pcRoom'?'clicked':''}" id="pcRoom">pc방 목록</div>
	</div>
	<script>
	$("#divisionBar div").on("click", function(){
		location.href='${pageContext.request.contextPath}/admin/pcRoomList.do?division='+$(this).prop("id");
	});
	</script>
	<table id="list-tbl" class="table">
	<c:if test="${division == 'manager' }">
		<tr style="text-align: center;">
			<th>구 분</th>
			<th>아이디</th>
			<th>이 름</th>
			<th>사업자등록번호</th>
			<th>사업자등록증</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>가입일</th>
			<th>승인 여부</th>
		</tr>
		<c:if test="${empty divisionList}">
			<tr>
				<td colspan="9"><strong>등록된 사장님이 없습니다.</strong></td>
			</tr>
		</c:if>
		<c:if test="${!empty divisionList}">
			<c:forEach var="item" items="${divisionList }" varStatus="var">
			<tr>
				<td>${var.count}</td>
				<td>${item.MANAGERID}</td>
				<td>${item.MANAGERNAME}</td>
				<td>${item.MANAGERCODE==null?'-':item.MANAGERCODE}</td>
				<td><button class="btn btn-secondary" onclick="showManagerCodeImg('${item.MANAGERCODEIMGRENAMED}');">보기</button></td>
				<td>${item.MANAGERPHONE==null?'-':item.MANAGERPHONE}</td>
				<td>${item.MANAGEREMAIL==null?'-':item.MANAGEREMAIL}</td>
				<td>
					<fmt:formatDate value="${item.MANAGERENROLLDATE}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					<c:if test="${item.MANAGERPERMITTED=='Y' }">
					<button type="button" class="btn btn-success">승인</button>
					</c:if>
					<c:if test="${item.MANAGERPERMITTED=='N' }">
					<button type="button" class="btn btn-danger">미승인</button>
					</c:if>
				</td>
			</tr>
			</c:forEach>

		</c:if>
	</c:if>
	<c:if test="${division == 'pcRoom' }">
		<tr style="text-align: center;">
			<th>구 분</th>
			<th>PC방 이름</th>
			<th>PC방 주소</th>
			<th>PC방 사장님</th>
			<th>승인 여부</th>
		</tr>
		<c:if test="${empty divisionList}">
			<tr>
				<td colspan="6"><strong>등록된 PC방이 없습니다.</strong></td>
			</tr>
		</c:if>
		<c:if test="${!empty divisionList}">
			<c:forEach var="item" items="${divisionList }" varStatus="var">
			<tr>
				<td>${var.count}</td>
				<td>${item.PCROOMNAME}</td>
				<td>${item.PCROOMADDRESS}</td>
				<td>${item.PCROOMMANAGERID}</td>
				<td>
					<c:if test="${item.PCROOMPERMITTED=='Y' }">
					<button type="button" class="btn btn-success">승인</button>
					</c:if>
					<c:if test="${item.PCROOMPERMITTED=='N' }">
					<button class="btn btn-danger">미승인</button>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</c:if>
	</table>
</div>
<hr />
<script>
function showManagerCodeImg(fileName){
	if(fileName)
		open("${pageContext.request.contextPath}/resources/upload/register/"+fileName, "", "width=400px, height=600px");
	else
		alert("사업자등록증 사본이 없습니다.");
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>