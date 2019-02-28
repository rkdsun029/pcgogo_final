<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
<style>
h1{font-size:1.5rem;}
[class*=btn_order]{ 
  border:dotted 0px white; 
  background:#f67001;
  color:#fff;    
  border-radius:7px 7px 7px 7px;  
  width:115px; 
  height:34px;   
  font-size: 15px;
}
.btn_cancel1{
  border:dotted 0px white; 
  background:#cecece;
  color:#fff;    
  border-radius:7px 7px 7px 7px;   
  width:115px; 
  height:34px;  
  font-size: 15px;
}
.btn_order, .btn_cancel1:hover{background:#f67001; cursor:pointer;}
div.mb-3{padding:0px;}
.btn-secondary{height:38px; margin:30px 0 0 10px;}
div#enroll-container>*:not(span){
	margin: 0 auto;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="내 정보" name="pageTitle"></jsp:param>
</jsp:include>
<form action="${pageContext.request.contextPath}/update/member" method="post">
<div id="enroll-container" style="width:381px; margin: 0 auto;">
	<div class="col-md-5 mb-3">
		<label for="memberId_">아이디 </label>
		<input type="text" class="form-control" name="memberId" id="memberId_" 
		value="${loggedInUser.memberId }" readonly/>
		<div class=""></div>
	</div>
    <div class="col-md-5 mb-3">
      <label for="changePwd">패스워드</label>
      <input type="button" class="btn btn-secondary" id="changePwd" value="변경하기"
      style="margin: 0;">
  	</div>
	<div class="col-md-5 mb-3">
      <label for="checkRealName">본인인증</label>
      <input type="button" class="btn btn-secondary" id="checkRealname" value="인증완료" disabled
      style="margin: 0;">
    </div>
	  	<div class="col-md-5 mb-3">
	  		<label for="memberEmail_">이메일</label>
	  		<input type="email" class="form-control" name="memberEmail" id="memberEmail_" placeholder="email@example.com"
	  		value="${loggedInUser.memberEmail==null?'':loggedInUser.memberEmail }"
	  		${loggedInUser.isSocial!='member'?'readonly':'' }/>
	  	</div>
  	<c:if test="${loggedInUser.isSocial!='member' }">
		<span style="margin-left: 28px;">소셜 로그인 회원은 정보를 수정할 수 없습니다.</span>
  	</c:if>
	<div style="text-align: center;">
		<c:if test="${loggedInUser.isSocial == 'member' }">
			<button type="submit" class="btn_order2" style="margin:10px;">수 정 하 기</button>
			<button type="button" class="btn_cancel1" style="margin:10px;">취 소 하 기</button>
		</c:if>
		<c:if test="${loggedInUser.isSocial != 'member' }">
			<button type="button" class="btn_cancel1" style="margin:10px;">메 인 으 로</button>
		</c:if>
	</div>
</div>
</form>
<script>
$(".btn_cancel1").on('click', function(){location.href="${pageContext.request.contextPath}"});
$("#changePwd").on('click', function(){
	var url = '${pageContext.request.contextPath}/update/password?userId=${loggedInUser.memberId}'; 
	open(url,"패스워드 변경","width=350, height=150");
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>