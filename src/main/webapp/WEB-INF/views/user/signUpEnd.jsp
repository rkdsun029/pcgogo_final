<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="회원가입 완료" name="pageTitle"></jsp:param>
</jsp:include>
<style>
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
.btn_goLogin{ 
  border:dotted 0px white; 
  background:#f67001;
  color:#fff;    
  border-radius:7px 7px 7px 7px;  
  width:115px; 
  height:34px;   
  font-size: 15px;
}
.btn_goMain{
  border:dotted 0px white; 
  background:#cecece;
  color:#fff;    
  border-radius:7px 7px 7px 7px;   
  width:115px; 
  height:34px;  
  font-size: 15px;
}
.btn_goLogin:hover, .btn_goMain:hover{background:#f67001; cursor:pointer;}
</style>
<center>
	<div class="stepLine">
  		<div title="분류선택" class="stepDot"></div>
  		<div title="이용약관" class="stepDot"></div>
  		<div title="정보입력" class="stepDot"></div>
 	 	<div title="가입완료" class="stepDot activeStep"></div>
	</div>
</center><br><br><br>
<div style="text-align: center;">
<c:if test="${requestScope.result == 1}">
	<h1>회원가입을 진심으로 환영합니다.</h1>
	<c:if test="${requestScope.flag eq 'manager'}">
		<h1>pc방 심사 후 서비스를 이용하실 수 있습니다.</h1>
	</c:if>
	<img src="${pageContext.request.contextPath}/resources/image/user/register/success.png" alt="" />
	<div>
		<button type="button" class="btn_goLogin" style="margin-top:40px;"
		onclick="location.href='${pageContext.request.contextPath}/login.do'">로 그 인</button>
		<button type="button" class="btn_goMain" style="margin-top:40px;"
		onclick="location.href='${pageContext.request.contextPath}/'">메 인 으 로</button>
	</div>
</c:if>
<script>
console.log("${requestScope.result}");
console.log("${requestScope.flag}");
</script>
<c:if test="${requestScope.result}==0">
	<h1>일시적인 오류로 회원가입에 실패하셨습니다.</h1>
	<h1>불편을 드려 죄송합니다.</h1>
		<img src="${pageContext.request.contextPath}/resources/image/user/register/failed.png" alt="" />
		<div>
			<button type="button" class="btn_goLogin" style="margin-top:40px;"
			onclick="location.href='${pageContext.request.contextPath}/signUp.do'">회 원 가 입</button>
			<button type="button" class="btn_goMain" style="margin-top:40px;"
			onclick="location.href='${pageContext.request.contextPath}/'">메 인 으 로</button>
		</div>
</c:if>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>