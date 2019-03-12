<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="로그인" name="pageTitle"></jsp:param>
</jsp:include>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="522789660173-lpfikvtl76o0p15h09bva0v7m905jjqv.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<style>
form#loginFrm{
	width: 350px;
	margin: 0 auto;
	margin-top:50px;
	margin-bottom:20px;
	box-shadow : 3px 3px 10px gray;
	padding: 20px;
}
div#loginToSocial{
	text-align: center;	
}
div#loginToSocial>*{
	width: 200px;
	height: 45px;
	margin-bottom: 5px;
	display: inline-block;
}
div#loginToSocial>div#naverIdLogin>a>img{width: 200px;}
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
	<img src="${pageContext.request.contextPath}/resources/image/user/login/kakao.png" onclick="login_kakao()"/>
	<div class="g-signin2" data-onsuccess="onSignIn" data-width="200" data-height="45"></div>
  </div>
 <!--  <span>소셜 로그인으로 편하게 이용하세요.</span> -->
 
  <script>
  var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "oh0_gJOPYDMSR3t2vWwl",
			callbackUrl: "http://localhost:9090/pcgogo/login/naver",
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 45} /* 로그인 버튼의 타입을 지정 */
		}
  );
  naverLogin.init();
	
  function login_kakao(){
      Kakao.init('b0d1d7505f46a344dbdd4ff7a064f2f7');
	
	  Kakao.Auth.loginForm({
		  success: function(authObj){
			  console.log(authObj.access_token);
				   $.ajax({
				   url: "${pageContext.request.contextPath}/login/kakao/getUserInfo",
				   type: "post",
				   data: "access_token="+authObj.access_token,
				   dataType: "json",
				   success: function(data){
					 if(data.kakao_account.has_email){
					  	 console.log(data);
						 console.log(data.kakao_account.email);
						 location.href="${pageContext.request.contextPath}/login/kakao?userId="+data.kakao_account.email;
					 }
				  }
			  }); 
		}
	});

  }
  
  function onSignIn(googleUser) {
      // Useful data for your client-side scripts:
      var profile = googleUser.getBasicProfile();
      console.log("ID: " + profile.getId()); // Don't send this directly to your server!
      console.log('Full Name: ' + profile.getName());
      console.log('Given Name: ' + profile.getGivenName());
      console.log('Family Name: ' + profile.getFamilyName());
      console.log("Image URL: " + profile.getImageUrl());
      console.log("Email: " + profile.getEmail());
	  location.href="${pageContext.request.contextPath}/login/google?userId="+profile.getEmail();
    }
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