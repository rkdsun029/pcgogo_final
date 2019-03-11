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
	<jsp:param value="예약현황" name="smallTitle"></jsp:param>
</jsp:include>

<style>
table#paymentList{
	position:relative;
	width:100%;
	border-collapse:collapse;
}
</style>

<h4>리스트는 최근시간 순으로 자동정렬 됩니다.</h4>
<br>
<select name="" id="">
	<option value="">아이디</option>
	<option value="">좌석번호</option>
	<option value="">금액</option>
</select>
<input type="text" id="searchById"/>
<input type="number" id="searchBySeatNo"/>

<input type="checkbox" id="searchByPrice" value="1000"/>
<input type="checkbox" id="searchByPrice" value="2000"/>
<input type="checkbox" id="searchByPrice" value="3000"/>
<input type="checkbox" id="searchByPrice" value="5000"/>
<br>                                      
<input type="checkbox" id="searchByPrice" value="10000"/>
<input type="checkbox" id="searchByPrice" value="20000"/>
<input type="checkbox" id="searchByPrice" value="30000"/>
<input type="checkbox" id="searchByPrice" value="50000"/>

<br>
<table id="paymentList">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>결제금액</th>
		<th>좌석번호</th>
		<th>결제시간</th>
	</tr>
	<%-- <c:forEach var="payment" items="#"></c:forEach> --%>
	<tr>
		<td>11</td>
		<td>22</td>
		<td>33</td>
		<td>44</td>
		<td>55</td>
	</tr>

</table>
<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>