<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="로그인" name="pageTitle"></jsp:param>
</jsp:include>
<style>
form#loginFrm{
	width: 300px;
	margin: 0 auto;
	border : 2px solid #A0A3A5;
	box-shadow : 3px 3px 5px gray;
	padding: 20px;
}
div#loginToSocial{
	border: 1px solid black;
	height: 55px;
}
div#loginToSocial img{
	/* width: 55px; */
}
div#loginToSocial+span{
	font-size: 13px;
	color: gray;
	margin-left: 25px;
}
div#loginToSocial img:hover{
	cursor: pointer;
}
</style>
<form id="loginFrm" action="${pageContext.request.contextPath }/loginReq.do" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">ID</label>
    <input type="text" name="userId" class="form-control" id="userId" aria-describedby="emailHelp" placeholder="Enter ID"
    value="${savedId != null ?savedId:'' }">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="userPwd" class="form-control" id="userPwd" placeholder="Password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" name="saveId" class="form-check-input" id="exampleCheck1" value="N"
    ${savedId != null ?'checked':'' }>
    <label class="form-check-label" for="exampleCheck1">Save ID</label>
  </div>
  
  <script>
  $("#exampleCheck1").click(function(){
	  if($(this).is(":checked")) $(this).val("Y");
	  else $(this).val("N");
  });
  </script>
  
  <div style="text-align: center; margin-bottom: 13px;">
  	<button type="submit" class="btn btn-primary" onclick="return validate();">Login</button>
  	<button type="button" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/signUp.do'">SignUp</button>
  </div>
  <div id="loginToSocial">
	<div id="naverIdLogin"></div>
  </div>
  <span>소셜 로그인으로 편하게 이용하세요.</span>
  
  <script>
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "oh0_gJOPYDMSR3t2vWwl",
				callbackUrl: "http://localhost:9090/pcgogo/login/naver",
				isPopup: true, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 55} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();	
  </script>
  <script>
  function validate(){
	  var uId = $("#userId").val().trim();
	  var uPwd = $("#userPwd").val().trim();
	  if(uId.length==0){
		  alert("아이디를 입력해주세요.");
		  return false;
	  }
	  if(uPwd.length==0){
		  alert("비밀번호를 입력해주세요.");
		  return false;
	  }
	  return true;
  }
  </script>
  
</form>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>