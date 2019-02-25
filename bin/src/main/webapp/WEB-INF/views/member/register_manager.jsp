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
<form action="${pageContext.request.contextPath}/signUpEnd/manager" method="post" enctype="multipart/form-data">
<div id="enroll-container" style="width:600px; margin-left:320px;">
	<div class="col-md-5 mb-3">
		<label for="managerId_">아이디 *</label>
		<input type="hidden" value="0"/>
		<input type="text" class="form-control" name="managerId" id="managerId_" placeholder="영문,숫자 8자 이상" required>
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
	
	$("#managerId_").on('keyup', function(){
		var $target = $(this);
		var mId = $target.val().trim();
		var exp = /^[A-Za-z0-9]{8,}$/g;
		if(exp.exec(mId)) activeFeedback($target);
		else activeFeedback($target, '아이디를 확인해주세요.');
	});
	</script>
  	<div class="form-row">
	    <div class="col-md-5 mb-3">
	      <label for="managerPassword_">패스워드 *</label>
	      <input type="hidden" value="0" />
	      <input type="password" class="form-control" name="managerPassword" id="managerPassword_" placeholder="특수문자 포함 10~16자" required>
	      <div class=""></div>
	    </div>
	<script>
	$("#managerPassword_").on('keyup', function(){
		var $target = $(this);
		var mPwd = $target.val().trim();
		var exp = /^.*(?=^.{10,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-]).*$/g;
		if(exp.exec(mPwd)) activeFeedback($target);
		else activeFeedback($target, "비밀번호를 확인해주세요.");
	});
	</script>
	    <div class="col-md-5 mb-3">
	      <label for="managerPasswordCheck">패스워드 확인 *</label>
	      <input type="hidden" value="0" />
	      <input type="password" class="form-control" id="managerPasswordCheck" required>
	      <div class=""></div>
	    </div>
	<script>
	$("#managerPasswordCheck").on('keyup', function(){
		var $target = $(this);
		var mPwd1 = $("#managerPassword_").val();
		var mPwd2 = $target.val();
		if(mPwd1 != mPwd2) activeFeedback($target, '비밀번호가 다릅니다.');
		else activeFeedback($target);
	});
	</script>
  	</div>
  	<input type="hidden" name="managerName" />
  	<fieldset style="border: 1px solid black; padding-left: 30px; margin-bottom: 10px;">
  		<input type="hidden" value="0" />
  		<legend style="width:85px; font-size: 1rem;">&nbsp;&nbsp;&nbsp;본인인증</legend>
  		<span style="color: gray;">※ 계좌번호 실명인증을 시행하고 있습니다.</span><br /><br />
	  	<div class="form-row">
		  	<div class="col-md-5 mb-3">
				<label for="managerName_">예금주명 *</label>
				<input type="text" class="form-control" id="managerName_" required>
				<div class=""></div>
		  	</div>
		  	<div class="col-md-5 mb-3">
		  		<label for="managerBirth_">생년월일 *</label>
		  		<input type="text" class="form-control" name="managerBirth" id="managerBirth_" placeholder="생년월일 6자리"/>
				<div class=""></div>
			</div>
	  	</div>
	  	<div class="form-row">
	  		<div class="col-md-3 mb-3">
		  		<label for="bank" style="margin-bottom: 10px;">은행</label><br />
			  	<select class="custom-select custom-select-sm" id="bank" style="width: 130px;">
					<option selected>선택해주세요.</option>
					<option value="002">KDB산업</option>
				  	<option value="003">IBK기업</option>
				  	<option value="004">KB국민</option>
				  	<option value="007">수협중앙</option>
				  	<option value="011">NH농협</option>
				  	<option value="020">우리은행</option>
				  	<option value="023">SC제일</option>
				  	<option value="031">대구은행</option>
				  	<option value="032">부산은행</option>
				  	<option value="034">광주은행</option>
				  	<option value="035">제주은행</option>
				  	<option value="037">전북은행</option>
				  	<option value="039">경남은행</option>
				  	<option value="081">KEB하나</option>
				  	<option value="088">신한은행</option>
				</select>
	  		</div>
		  	<div class="col-md-5 mb-3">
				<label for="accountNumber">계좌번호 *</label>
				<input type="text" class="form-control" id="accountNumber" placeholder="'-'없이 입력" required>
				<div class=""></div>
		  	</div>
	  		<button type="button" class="btn btn-secondary" onclick="auth();" style="margin-left:0px;">인증하기</button>
	  	</div>
	  	<script>
	  	function auth(){
			var token = auth_getToken();
			auth_realName(token);
	  	}
	  	
	  	function auth_getToken(){
	  		var token;
	  		$.ajax({
	  			url: "${pageContext.request.contextPath}/signUp/getToken",
	  			type: "post",
	  			dataType: "json",
	  			async: false,
	  			success: function(data){token = data.access_token;}
	  		});
	  		return token;
	  	}
	  	
	  	function auth_realName(token){
	  		var today = new Date()
	  		var y = today.getFullYear();
	  		var M = (today.getMonth()+1)<10?"0"+(today.getMonth()+1):(today.getMonth()+1);
	  		var d = today.getDate();
	  		var h = today.getHours()<10?"0"+today.getHours():today.getHours();
	  		var m = today.getMinutes()<10?"0"+today.getMinutes():today.getMinutes();
	  		var s = today.getSeconds()<10?"0"+today.getSeconds():today.getSeconds();
	  		var dTime = y+""+M+""+d+""+h+""+m+""+s;
	  		
	  		var obj = {
	  			'bank_code_std':$("#bank").val(),
	  			'account_num':$("#accountNumber").val(),
	  			'account_holder_info':$("#managerBirth_").val(),
	  			'tran_dtime': dTime
	  		}
	  		
	  		$.ajax({
	  			url:"${pageContext.request.contextPath}/signUp/realName",
	  			type: "post",
	  			data: {
	  				"data":JSON.stringify(obj),
	  				"token":token
	  			},
	  			dataType: "json",
	  			success: function(data){
	  				var code = data.rsp_code;
	  				var $target;
	  				var msg;
	  				if(code=="A0000"){
	  					if(data.account_holder_name!=$("#managerName_").val()){
	  						alert("본인인증 실패.(일치하는 정보가 없습니다.)");
	  						return;
	  					}
	  					alert("본인인증 성공!");
	  					$("[name=managerName]").val($("#managerName_").val());
	  			  		$("fieldset").prop("disabled", true).find(":first").val(1);
	  				}else{
		  				if(code=="A0321") {
		  					$target=$("#managerBirth_"); 
		  					msg="올바른 생년월일을 입력해주세요.";
		  					activeFeedback($target, msg);
		  				}
	  					alert("본인인증 실패.(일치하는 정보가 없습니다.)");
	  				}
	  			}
	  		});
	  	}
	  	</script>
  	</fieldset>
  	<div class="form-row" style="height: 70px;">
  		<div class="col-md-4 mb-3">
  			<label for="managerCode_">사업자등록번호*</label>
  			<input type="text" class="form-control" name="managerCode" id="managerCode_" placeholder="'-'없이 입력"/>
  		</div>
  		<div class="col-md-6 mb-3" style="margin-left:60px;">
  			<label for="uploadFile">사업자등록증 사본*</label>
	  		<div class="input-group mb-3" id="uploadFile">
			    <div class="custom-file">
			      <label class="custom-file-label" for="inputGroupFile01">파일 선택...</label>
			      <input type="file" class="custom-file-input" name="managerCodeImg" id="upFile" 
			      aria-describedby="inputGroupFileAddon01" accept=".jpg, .jpeg, .png, .bmp">
			    </div>
			</div>
  		</div>
  	</div>
  	<span style="color: gray; margin-bottom: 15px; display:block;"> - PC방 인증을 위해 최대 2일 소요 될 수 있습니다.</span>
  	<script>
	$("#upFile").on('change', function(){
		var obj = this;
	    var file_kind = obj.value.lastIndexOf('.');
	    var file_name = obj.value.substring(file_kind+1,obj.length);
	    var file_type = file_name.toLowerCase();
        
        
	    var check_file_type=['jpg','png','jpeg','bmp'];
        
	    if(check_file_type.indexOf(file_type)==-1){
	    	alert('이미지 파일만 선택할 수 있습니다.');
	    	var parent_Obj=obj.parentNode
	    	var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
	    	return false;
	    }
		var fileName = $(this).prop("files")[0].name;
		$(this).prev().html(fileName);
	});
  	</script>
  	<div class="form-row">
	  	<div class="col-md-5 mb-3">
	  		<label for="managerPhone">전화번호 *</label>
	  		<input type="text" class="form-control" name="managerPhone" id="managerPhone_" placeholder="'-'없이 입력"/>
	  	</div>
  	</div>
  	<div class="form-row">
	  	<div class="col-md-5 mb-3">
	  		<label for="managerEmail_">이메일</label>
	  		<input type="email" class="form-control" name="managerEmail" id="managerEmail_" placeholder="email@example.com"/>
	  	</div>
  	</div>
  	<div class="form-row">
  		<div class="col-md-5 mb-3">
  			<label for="search-addr">pc방 우편번호 *</label>
	  		<input type="text" id="search-addr" class="postcodify_postcode5 form-control" required/>
  		</div>
		<button id="postcodify_search_button" class="btn btn-secondary">검색</button>
  	</div>
  	<div class="form-row">
  		<div class="col-md-5 mb-4">
  			<label for="address">도로명주소</label>
			<input type="text" id="address" name="address" class="postcodify_address form-control" readonly/>
  		</div>
  		<div class="col-md-5 mb-4">
  			<label for="details">상세주소 *</label>
			<input type="text" id="details" name="address" class="postcodify_details form-control" required/>
  		</div>
  	</div>
  	<span>* 표시 항목은 필수 입력입니다.</span>
	<div style="width:276px; margin:0 auto;">
		<button type="submit" class="btn_order2" style="margin:10px;" onclick="return validate();">가 입 하 기</button>
		<button type="button" class="btn_cancel1" style="margin:10px;">취 소 하 기</button>
	</div>
</div>
</form>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
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