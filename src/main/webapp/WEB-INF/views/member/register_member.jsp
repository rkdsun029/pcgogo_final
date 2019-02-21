<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
<style>
h1{font-size:1.5rem;}
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
input[type=text], input[type=password]{width: 250px;}
fieldset input{width: 220px !important;}
.btn-secondary{height:38px; margin:30px 0 0 10px;}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="pageTitle"></jsp:param>
</jsp:include>
<center>
	<div class="stepLine">
  		<div title="분류선택" class="stepDot"></div>
  		<div title="이용약관" class="stepDot"></div>
  		<div title="정보입력" class="stepDot activeStep"></div>
 	 	<div title="가입완료" class="stepDot"></div>
	</div>
</center><br><br><br>
<form action="${pageContext.request.contextPath}/signUpEnd/member" method="post">
<div id="enroll-container" style="width:600px; margin-left:320px;">
	<div class="col-md-5 mb-3">
		<label for="memberId_">아이디 *</label>
		<input type="hidden" value="0"/>
		<input type="text" class="form-control" name="memberId" id="memberId_" placeholder="영문,숫자 8자 이상" required>
		<div class=""></div>
	</div>
	<script>
	function activeFeedback(target, message){
		target.removeClass("is-valid, is-invalid");
		if(!message){
			target.addClass("is-valid");
			if(target.prev()!=null) target.prev().val(1);
		} else {
			target.addClass("is-invalid");
			target.next().addClass("invalid-feedback").html(message);
			if(target.prev()!=null) target.prev().val(0);
		}
	}
	
	$("#memberId_").on('keyup', function(){
		var $target = $(this);
		var mId = $target.val().trim();
		var exp = /^[A-Za-z0-9]{8,}$/g;
		if(exp.exec(mId)) activeFeedback($target);
		else activeFeedback($target, '아이디를 확인해주세요.');
	});
	</script>
  	<div class="form-row">
	    <div class="col-md-5 mb-3">
	      <label for="memberPassword_">패스워드 *</label>
	      <input type="hidden" value="0" />
	      <input type="password" class="form-control" name="memberPassword" id="memberPassword_" placeholder="특수문자 포함 10~16자" required>
	      <div class=""></div>
	    </div>
	<script>
	$("#memberPassword_").on('keyup', function(){
		var $target = $(this);
		var mPwd = $target.val().trim();
		var exp = /^.*(?=^.{10,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-]).*$/g;
		if(exp.exec(mPwd)) activeFeedback($target);
		else activeFeedback($target, "비밀번호를 확인해주세요.");
	});
	</script>
	    <div class="col-md-5 mb-3">
	      <label for="memberPasswordCheck">패스워드 확인 *</label>
	      <input type="hidden" value="0" />
	      <input type="password" class="form-control" id="memberPasswordCheck" required>
	      <div class=""></div>
	    </div>
  	</div>
	<script>
	$("#memberPasswordCheck").on('keyup', function(){
		var $target = $(this);
		var mPwd1 = $("#memberPassword_").val();
		var mPwd2 = $target.val();
		if(mPwd1 != mPwd2) activeFeedback($target, '비밀번호가 다릅니다.');
		else activeFeedback($target);
	});
	</script>
  	<div class="form-row">
	  	<div class="col-md-5 mb-3">
	  		<label for="memberPhone">휴대폰번호 *</label>
	  		<input type="text" class="form-control" name="phone" id="memberPhone_" placeholder="'-'없이 입력" required/>
	  		<div class=""></div>
		  	<span style="margin: -15px 0px 12px 5px;
			        	 color: gray; font-size: 13px;">&nbsp;3분 이내로 입력해주세요.</span>
	  	</div>
	  	<button type="button" class="btn btn-secondary" id="btn-send" onclick="send_token();">인증번호 발송</button>
  	</div>
  	<input type="hidden" name="memberPhone" value=""/>
  	<script>
  	function disableAuth(){
  		var $target = $("#memberPhone_");
  		$("#auth-container").slideDown();
  		$("[name=memberPhone]").val($target.val());
  		$target.prop("disabled", true);
  		$target.next().next().hide();
  		$("#btn-send").hide();
		activeTimmer();
  	}
  	function ableAuth(){
  		var $target = $("#memberPhone_");
  		$("#auth-container").slideUp();
  		$("[name=memberPhone]").val("");
  		$target.prop("disabled", false).val("").focus();
  		$target.next().next().show();
  		$("#btn-send").show();
  		$("#timer").val(180);
  	}
  	function send_token(){
		var $target = $("#memberPhone_")
   	
  		if($target.val().trim().length!=11){
  			activeFeedback($target, "올바른 휴대폰번호를 입력해주세요.");
  			return;
  		} else $target.removeClass("is-invalid");
  		
  		$.ajax({
  			url: "${pageContext.request.contextPath}/signUp/sendToken",
  			type: "post",
  			data: "phone="+$target.val().trim(),
  			success:function(data){
  				console.log(data);
  				if(data.result>0){
  					alert("인증요청에 실패하였습니다. 다시 시도해주세요.");
  					ableAuth();
  					return;
  				}
  				
  				alert("인증번호를 발송하였습니다. 3분 이내로 입력해주세요.");
  		  		disableAuth();
  		  		auth_token(data.token);
  			}
  		});
  	}
  	</script>
  	<div class="form-row" id="auth-container" style="display:none;">
	  	<div class="col-md-5 mb-3">
	  		<input type="hidden" value="0" />
		  	<input type="text" class="form-control" placeholder="인증번호 입력"/>
		  	<div class=""></div>
		  	<span id="timer" style="margin: -15px 0px 12px 5px;
							        color: gray; font-size: 13px;">&nbsp;03:00</span>
			<input type="hidden" value="180"/>
	  	</div>
	  	<button type="button" class="btn btn-secondary" id="btn-auth" style="margin-top: 0px;">인증번호 확인</button>
  	</div>
  	<script>
  	function activeTimmer(){
		var $target = $("#timer");
	  	var timer = setInterval(function(){
	  		var sec = $target.next().val();
	  		if(sec==0) {
	  			alert("인증시간을 초과했습니다. 다시 시도해주세요.");
	  			clearInterval(timer);
	  			ableAuth();
	  		}
	  		$target.next().val(sec-1);
	  		var m = "0" + Math.floor(sec/60);
	  		if(sec!=180)
	  			$target.html("&nbsp;" + m + ":" + (sec%60<10?"0"+sec%60:sec%60));
	  	}, 1000);
  	}
  	function auth_token(token){
  		$("#btn-auth").on('click', function(){
  			$target = ;
  			var token_ = $("#timer").prev().prev().val();
  			if(token!=token_){
  				activeFeedback($("#timer").prev().prev(), "인증번호가 일치하지 않습니다.");
  			}else{
  				
  				$("#timer").remove();
  				$("#auth-container *").prop("disabled", true);
  			}
  		});
  	}
  	</script>
  	<div class="form-row">
	  	<div class="col-md-5 mb-3">
	  		<label for="memberEmail_">이메일</label>
	  		<input type="email" class="form-control" name="memberEmail" id="memberEmail_" placeholder="email@example.com"/>
	  	</div>
  	</div>
  	<span>* 표시 항목은 필수 입력입니다.</span>
	<div style="width:276px; margin:0 auto;">
		<button type="submit" class="btn_order2" style="margin:10px;" onclick="return validate();">가 입 하 기</button>
		<button type="button" class="btn_cancel1" style="margin:10px;">취 소 하 기</button>
	</div>
</div>
</form>
<script>
$(".btn_cancel1").on('click', function(){location.href="${pageContext.request.contextPath}"});
function validate(){
	if($("[type=hidden]").eq(0).val()==0 ||
	   $("[type=hidden]").eq(1).val()==0 ||
	   $("[type=hidden]").eq(2).val()==0 ||
	   $("[type=hidden]").eq(3).val()==0){alert("정보를 다시 확인해주세요."); return false;}
	return true;
};
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>