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
<style>
form#loginFrm{
	width: 300px;
	margin: 0 auto;
	border : 2px solid #A0A3A5;
	box-shadow : 3px 3px 5px gray;
	padding: 20px;
}
</style>
<form id="loginFrm" action="${pageContext.request.contextPath }/loginReq.do" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">ID</label>
    <input type="text" name="userId" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter ID"
    value="${savedId != null ?savedId:'' }">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="userPwd" class="form-control" id="exampleInputPassword1" placeholder="Password">
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
  <div style="text-align: center;">
  	<button type="submit" class="btn btn-primary">Login</button>
  	<button type="button" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/signUp.do'">SignUp</button>
  </div>
</form>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>