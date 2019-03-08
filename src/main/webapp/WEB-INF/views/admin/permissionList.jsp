<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="승인대기 목록입니다." name="pageTitle"></jsp:param>
</jsp:include>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
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
		<div class="division ${division=='manager'?'clicked':''}" id="manager">승인대기 사장님</div>
		<div class="division ${division=='pcRoom'?'clicked':''}" id="pcRoom">승인대기 PC방</div>
	</div>
	<script>
	$("#divisionBar div").on("click", function(){
		location.href='${pageContext.request.contextPath}/admin/permissionList.do?division='+$(this).prop("id");
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
		<c:if test="${empty permissionList}">
			<tr>
				<td colspan="9"><strong>승인 대기중인 사장님이 없습니다.</strong></td>
			</tr>
		</c:if>
		<c:if test="${!empty permissionList}">
			<c:forEach var="item" items="${permissionList }" varStatus="var">
			<tr>
				<td>${var.count}</td>
				<td>${item.MANAGERID}</td>
				<td>${item.MANAGERNAME}</td>
				<td>${item.MANAGERCODE}</td>
				<td><button class="btn btn-secondary" onclick="showManagerCodeImg('${item.MANAGERCODEIMGRENAMED}');">보기</button></td>
				<td>${item.MANAGERPHONE}</td>
				<td>${item.MANAGEREMAIL}</td>
				<td>${item.MANAGERENROLLDATE}</td>
				<td>
					<div class="btn-group">
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal"
						onclick="saveValue('${item.MANAGERID}');">승인</button>
						<button class="btn btn-danger">취소</button>
					</div>
				</td>
			</tr>
			</c:forEach>
			<script>
			function saveValue(value){
				$("#temp").val(value);
				$(".modal-body").text(value+"님을 정말로 승인하시겠습니까?");
			}
			</script>
		</c:if>
	</c:if>
	<c:if test="${division == 'pcRoom' }">
		<tr style="text-align: center;">
			<th>구 분</th>
			<th>아이디</th>
			<th>PC방 이름</th>
			<th>PC방 주소</th>
			<th>PC방 사장님</th>
			<th>승인 여부</th>
		</tr>
		<c:if test="${empty permissionList}">
			<tr>
				<td colspan="6"><strong>승인 대기중인 PC방이 없습니다.</strong></td>
			</tr>
		</c:if>
		<c:if test="${!empty permissionList}">
			<c:forEach var="item" items="${permissionList }" varStatus="var">
			<tr>
				<td>${var.count}</td>
				<td>${item.PCROOMNAME}</td>
				<td>${item.PCROOMADDRESS}</td>
				<td>${item.PCROOMMANAGERID}</td>
				<td>
					<div class="btn-group">
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">승인</button>
						<button class="btn btn-danger">취소</button>
					</div>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</c:if>
	</table>
</div>
<input type="hidden" value="" id="temp"/>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">승인하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="permit();">승인하기</button>
      </div>
    </div>
  </div>
</div>
<script>
function showManagerCodeImg(fileName){
	if(fileName)
		open("${pageContext.request.contextPath}/resources/upload/register/"+fileName, "", "width=400px, height=600px");
	else
		alert("사업자등록증 사본이 없습니다.");
}

function permit(){
	var value = $("#temp").val();
	location.href='${pageContext.request.contextPath}/admin/permit/${division}?target='+value;
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>