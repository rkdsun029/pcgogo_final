<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<style>
div#select-container{width: 500px; margin: 0 auto}
div#reg-manager, div#reg-member{
    position: relative;
    border: 2px solid black;
    display: inline-block;
    margin-right: 5%;
    cursor: pointer;
    border-radius: 10px;
    text-align: center;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 30px;
}
div#reg-manager img, div#reg-member img{
    position: relative;
    width: 150px;
    height: 150px;
    margin-top: 20px;
    margin-bottom: 35px;
    display: block;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div id="select-container">
    <div id="reg-manager">
        <img src="${pageContext.request.contextPath }/resources/image/member/register/manager.png" alt="">
        <span>사장님</span>
    </div>
    <div id="reg-member">
        <img src="${pageContext.request.contextPath }/resources/image/member/register/member.png" alt="">
        <span>일반회원</span>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>