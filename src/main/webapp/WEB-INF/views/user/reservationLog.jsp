<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="예약내역" name="pageTitle"></jsp:param>
</jsp:include>
<style>
body{font-family: Nanum Gothic, sans-serif;}
div#container{
	max-width: 700px;
	height: 400px;
	margin: 0 auto;
}
table.table-striped{
	text-align: center;
	white-space: nowrap;
}
table.table-striped th, table.table-striped td{
	padding: 10px;
}
</style>
<div id="container">
<table class="table table-striped">
	<tr>
		<th>구분</th>
		<th>PC방이름</th>
		<th>시작시간</th>
		<th>종료시간</th>
		<th>예약날짜</th>
	</tr>
	<c:if test="${!empty reservationLog }">
	<c:forEach  var="r" items="${reservationLog }" varStatus="var">
		<tr>
			<td>${var.count }</td>
			<td>${r.PCROOMNAME}</td>
			<td>
				<fmt:formatDate value="${r.RESERVEDTIME }" pattern="yyyy/MM/dd HH:mm"/>
			</td>
			<td>
				<fmt:formatDate value="${r.RESERVEDENDTIME }" pattern="yyyy/MM/dd HH:mm"/>
			</td>
			<td>
				<fmt:formatDate value="${r.RESERVEDTIME }" pattern="yyyy/MM/dd"/>
			</td>
		</tr>
	</c:forEach>
	</c:if>
	<c:if test="${empty reservationLog }">
		<tr>
			<td colspan="5">아직 이용하신 내역이 없습니다. <br />
				<a href="${pageContext.request.contextPath }/pcRoom/pcRoom.do">여기</a>
				를 클릭하여 이용해주세요.
			</td>
		</tr>
	</c:if>
</table>
<hr />
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>