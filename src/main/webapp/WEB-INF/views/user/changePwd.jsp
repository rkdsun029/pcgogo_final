<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<style>
body{
	background-color: skyblue;
}
table{margin: 0 auto; width: 320px; height: 100px;}
tr{margin-bottom: 10px;}
</style>
<body>
<form id="updatePwdFrm" action="${pageContext.request.contextPath }/updateEnd/${loggedInUser.isSocial }/${param.userId}">
	<table>
		<tr>
			<th>현재 비밀번호</th>
			<td><input type="password" name="curPwd" placeholder="특수문자 포함 10~16자"/></td>
		</tr>
		<tr>
			<th>새 비밀번호</th>
			<td><input type="password" name="newPwd"/></td>
		</tr>
		<tr>
			<th>새 비밀번호 확인</th>
			<td><input type="password" name="newPwd_"/></td>
		</tr>
		<tr>
			<td><br /></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<button type="submit" onclick="return update();">수정하기!</button>
				<button onclick="self.close()">취소!</button>
			</td>
		</tr>
	</table>
</form>
	<script>
	function update(){
		var flag = true;
		var $target = $("[name=curPwd]");
		var mPwd_ = $target.val().trim();
		var exp = /^.*(?=^.{10,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-]).*$/g;
		
		if(exp.exec(mPwd_)) {}
		else{alert("현재 비밀번호를 확인해주세요."); flag=false;}
		
		var mPwd1 = $("[name=newPwd]").val();
		var mPwd2 = $("[name=newPwd_]").val();
		
		var exp = /^.*(?=^.{10,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-]).*$/g;
		if(exp.exec(mPwd1) != null) {}
		else{alert("새 비밀번호를 확인해주세요."); flag = false;}
		
		if(mPwd1 != mPwd2){alert("새 비밀번호가 일치하지 않습니다."); flag = false;}
		if(mPwd1.length == 0 || mPwd2.length == 0) {alert("새 비밀번호를 입력해주세요."); flag = false;}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/update/checkPwd",
			type: "post",
			async: false,
			data: {
				userId : '${param.userId}',
				type : '${loggedInUser.isSocial}',
				curPwd : mPwd_
			},
			success: function(data){
				if(data) {
					$("updatePwdFrm").submit();
				}else{
					alert("현재 비밀번호가 다릅니다.");
					flag = false;
				}
			}
		});
		
		return flag;
	}
	</script>
</body>