<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<c:if test="${loggedInUser == null }">
	<script>
		alert("로그인을 하신 후에 이용할 수 있습니다.")
		location.href="${pageContext.request.contextPath}/login.do";
	</script>
</c:if>