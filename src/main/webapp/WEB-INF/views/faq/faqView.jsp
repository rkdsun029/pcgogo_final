<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="FAQ 보기" name="pageTitle"/>
</jsp:include>
<!-- faq 게시글 보기, 수정, 삭제, 댓글 달기 등 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>