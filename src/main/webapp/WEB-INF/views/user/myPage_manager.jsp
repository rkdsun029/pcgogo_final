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
input[type=text], input[type=password]{width: 250px;}
fieldset input{width: 220px !important;}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="내 정보" name="pageTitle"></jsp:param>
</jsp:include>
<form action="${pageContext.request.contextPath}/myPage/update/manager" method="post" enctype="multipart/form-data">
<div id="enroll-container" style="width:600px; margin-left:320px;">
	<div class="col-md-5 mb-3">
		<label for="managerId_">아이디</label>
		<input type="text" class="form-control" name="managerId" id="managerId_" readOnly value="${loggedInUser.managerId }"/>
	</div>
    <div class="col-md-5 mb-3">
      <label for="changePwd">패스워드</label>
      <input type="button" class="btn btn-secondary" id="changePwd" value="변경하기">
    </div>
    <div class="col-md-5 mb-3">
      <label for="checkRealName">본인인증</label>
      <input type="button" class="btn btn-secondary" id="checkRealname" value="인증완료" disabled>
    </div>
    <c:if test="${loggedInUser.managerPermitted == 'Y' }">
  	<div class="form-row" style="height: 350px;">
  		<div class="col-md-4 mb-3">
  			<label for="managerCode_">사업자등록번호</label>
  			<input type="text" class="form-control" name="managerCode" id="managerCode_"
  			value="${loggedInUser.managerCode }" readonly/>
  		</div>
  		<div class="col-md-6 mb-3" style="margin-left:60px;">
  			<label for="managerCodeImg">사업자등록증 사본</label>
  			<img src="${pageContext.request.contextPath }/resources/upload/register/${loggedInUser.managerCodeImgRenamed}" 
  			id="managerCodeImg" style="width: 200px; height: 300px;"/>
  		</div>
  	</div>
    </c:if>
    
    <c:if test="${loggedInUser.managerPermitted == 'N' }">
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
    </c:if>
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
	  		<label for="managerPhone">전화번호</label>
	  		<input type="text" class="form-control" name="managerPhone" id="managerPhone_" placeholder="'-'없이 입력"
	  		value="${loggedInUser.managerPhone }"/>
	  	</div>
  	</div>
  	<div class="form-row">
	  	<div class="col-md-5 mb-3">
	  		<label for="managerEmail_">이메일</label>
	  		<input type="email" class="form-control" name="managerEmail" id="managerEmail_" placeholder="email@example.com"
	  		value="${loggedInUser.managerEmail }"/>
	  	</div>
  	</div>
	<div style="width:276px; margin:0 auto;">
		<button type="submit" class="btn_order2" style="margin:10px;" onclick="return validate();">수 정 하 기</button>
		<button type="button" class="btn_cancel1" style="margin:10px;">취 소 하 기</button>
	</div>
</div>
</form>
<script>
$(".btn_cancel1").on('click', function(){location.href="${pageContext.request.contextPath}"});
$("#changePwd").on('click', function(){
	var url = '${pageContext.request.contextPath}/update/password?userId=${loggedInUser.managerId}'; 
	open(url,"패스워드 변경","width=350, height=150");
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>