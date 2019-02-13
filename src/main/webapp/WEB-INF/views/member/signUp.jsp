<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<style>
div#select-container{position: relative; text-align: center; top: 150px;}
div#reg-manager, div#reg-member{
    position: relative;
    border: 1.5px solid black;
    display: inline-block;
    cursor: pointer;
    box-shadow: 2px 2px 5px gray;
    text-align: center;
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 24px;
    transition: all 0.3s ease-in-out;
    margin-bottom: 70px;
}
div#reg-manager{margin-right: 90px;}
div#reg-manager img, div#reg-member img{
    position: relative;
    width: 150px;
    height: 150px;
    margin-top: 20px;
    margin-bottom: 10px;
    display: block;
}
div#reg-manager:hover, div#reg-member:hover{
	box-shadow: 4px 4px 10px gray;
	transform: scale(1.1);
}
section{height: 700px;}
div#step-container{width: 300px; height: 50px; border: 1px solid black; margin: 0 auto;}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div id="step-container">
	
</div>
<div id="select-container">
    <div id="reg-manager">
        <img src="${pageContext.request.contextPath }/resources/image/member/register/manager2.png" alt="">
        <span>사장님</span>
    </div>
    <div id="reg-member">
        <img src="${pageContext.request.contextPath }/resources/image/member/register/member2.png" alt="">
        <span>일반회원</span>
    </div>
<h1>회원 구분을 선택해주세요.</h1>
<script>
$("#reg-manager").click(function(){
	location.href = "${pageContext.request.contextPath}/signUp/manager.do";
});
</script>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>