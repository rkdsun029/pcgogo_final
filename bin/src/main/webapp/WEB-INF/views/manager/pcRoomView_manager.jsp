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
	<jsp:param value="기본정보" name="smallTitle"></jsp:param>
</jsp:include>

<style>
table#pc-info{
	font-family:'Nanum Gothic', sans-serif;
}
</style>
<table id="pc-info">
	<tr>
		<th>상호명</th>
		<td>ROMARU PC CAFE</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>서울시 서초구 강남대로 531 삼영빌딩</td>
	</tr>
</table>

<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>