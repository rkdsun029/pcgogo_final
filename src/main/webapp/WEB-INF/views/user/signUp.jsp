<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<style>
div#select-container{position: relative; text-align: center; top: 100px;}
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
div.stepLine{
  display: inline-block;
  border-bottom: 1px solid #f67001;
  height: 0;
}
div.stepDot{
  width: 15px;
  height: 15px;
  background-color: #fff;
  border: 1px solid #cecece;
  border-radius: 50%;
  float: left;
  margin: -8px 40px 0px 40px;
  color:#cecece;
}
div.stepDot.activeStep{
  background-color:#f67001 !important;
  border-color: #f67001 !important;
  color: #f67001;
}
div.stepDot.activeStep ~ div.stepDot{
  background-color: #fff;
  border: 1px solid #f67001;
}
div.stepDot:after{
  content:  attr(title);
  white-space: nowrap;
  position: relative;
  top: 20px;
  right: 8px;
  font: 12px arial, sans-serif;  
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="pageTitle"></jsp:param>
</jsp:include>
<center>
	<div class="stepLine">
  		<div title="분류선택" class="stepDot activeStep"></div>
  		<div title="이용약관" class="stepDot"></div>
  		<div title="정보입력" class="stepDot"></div>
 	 	<div title="가입완료" class="stepDot"></div>
	</div>
</center><br><br><br>
<div id="select-container">
    <div id="reg-manager">
        <img src="${pageContext.request.contextPath }/resources/image/member/register/manager.png" alt="">
        <span>사장님</span>
    </div>
    <div id="reg-member">
        <img src="${pageContext.request.contextPath }/resources/image/member/register/member.png" alt="">
        <span>일반회원</span>
    </div>
<h1>회원 구분을 선택해주세요.</h1>
<form action="${pageContext.request.contextPath}/signUp/first" id="flagFrm" method="post">
	<input type="hidden" name="type" value=""/>
</form>
<script>
$("#reg-manager").click(function(){
	$("#flagFrm input").val("manager").parent().submit();
});
$("#reg-member").click(function(){
	$("#flagFrm input").val("member").parent().submit();
});
</script>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>