<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	$.ajax({
		url: "${pageContext.request.contextPath}/login/socialLoginEnd/google",
		data: "userId=${param.userId}",
		success: function(){
			location.href="${pageContext.request.contextPath}/";
		}
	});
</script>