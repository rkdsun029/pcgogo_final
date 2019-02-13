<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
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
.btn-secondary{height:38px; margin:30px 0 0 20px;}
</style>
<table width=960px align=center>
	<tr>
		<td align=center>
		  <center>
		  	<div class="stepLine">
		    	<div title="이용약관" class="stepDot"></div>
		    	<div title="정보입력" class="stepDot activeStep"></div>
		   	 	<div title="가입완료" class="stepDot"></div>
		  	</div>
		  </center><br><br><br>
		</td>
	</tr>
</table>
<form action="${pageContext.request.contextPath}/signUpEnd/manager" method="post">
<div id="enroll-container" style="width:600px; margin:0 auto; border:1px solid black;">
	<div class="col-md-5 mb-3">
		<label for="managerId_">아이디 *</label>
		<input type="text" class="form-control" name="managerId" id="managerId_" placeholder="영문,숫자 8자 이상" required>
		<div class=""></div>
	</div>
  	<div class="form-row">
	    <div class="col-md-5 mb-3">
	      <label for="managerPassword_">패스워드 *</label>
	      <input type="password" class="form-control" name="managerPassword" id="managerPassword_" placeholder="특수문자 포함 11자 이상" required>
	    </div>
	    <div class="col-md-5 mb-3">
	      <label for="managerPasswordCheck">패스워드 확인 *</label>
	      <div class="input-group">
	        <input type="password" class="form-control" id="managerPasswordCheck" required>
	        <div class=""></div>
	      </div>
	    </div>
  	</div>
  	<div class="form-row">
	  	<div class="col-md-5 mb-3">
	  		<label for="managerCode_">사업자등록번호 *</label>
	  		<input type="text" class="form-control" name="managerCode" id="managerCode_" placeholder="'-'없이 입력" required/>
	  	</div>
  		<button type="button" class="btn btn-secondary">인증받기</button>
  	</div>
  	<div class="form-row">
	  	<div class="col-md-5 mb-3">
	  		<label for="managerPhone">휴대폰번호 *</label>
	  		<input type="text" class="form-control" name="managerPhone" id="managerPhone_" placeholder="'-'없이 입력" required/>
	  	</div>
  		<button type="button" class="btn btn-secondary">인증번호 발송</button>
  	</div>
  	<div class="form-row">
	  	<div class="col-md-5 mb-3">
	  		<label for="managerEmail_">이메일</label>
	  		<input type="email" class="form-control" name="managerEmail" id="managerEmail_" placeholder="email@example.com"/>
	  	</div>
  	</div>
  	<div class="form-row">
  		<div class="col-md-5 mb-3">
  			<label for="search-addr">우편번호 *</label>
	  		<input type="text" id="search-addr" class="postcodify_postcode5 form-control" required/>
  		</div>
		<button id="postcodify_search_button" class="btn btn-secondary">검색</button>
  	</div>
  	<div class="form-row">
  		<div class="col-md-5 mb-4">
  			<label for="address">도로명주소</label>
			<input type="text" id="address" class="postcodify_address form-control" readonly/>
  		</div>
  		<div class="col-md-5 mb-4">
  			<label for="details">상세주소 *</label>
			<input type="text" id="details" class="postcodify_details form-control" required/>
  		</div>
  	</div>
	<div style="width:276px; margin:0 auto;">
		<button type="submit" class="btn_order2" style="margin:10px;" onclick="return validate();">가 입 하 기</button>
		<button type="reset" class="btn_cancel1" style="margin:10px;">취 소 하 기</button>
	</div>
</div>
</form>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
$(".btn_cancel1").on('click', function(){location.href="${pageContext.request.contextPath}"})
$(".btn_order").on('click', function(){
	var check1 = $("input[type=checkbox]:first").is(":checked");
	var check2 = $("input[type=checkbox]:last").is(":checked");
	if(check1&&check2){
		
	}else if(check1&&!check2){alert("개인정보 수집 및 이용에 대한 안내에 동의해주세요.");}
	else{alert("이용약관에 동의해주세요.");}
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>