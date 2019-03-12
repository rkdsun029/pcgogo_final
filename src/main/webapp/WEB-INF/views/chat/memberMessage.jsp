<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 맨 앞의 '/'는 webapp을 가리킨다. -->
<fmt:requestEncoding value="UTF-8"/>
<jsp:include page="/WEB-INF/views/common/messageHeader.jsp">
	<jsp:param value="PCGOGO 쪽지" name="pageTitle"/>
</jsp:include>

<style>

	#navbar {
		width : 500px;
		margin : 0 auto;
	}

	.table {
		text-align : center;
		margin : 0 auto;
		width : 500px;
	}
	
	.table td {
		font-family: 'Nanum Gothic', sans-serif;
		font-weight : bold;
		background : rgb(255, 40, 40, 0.1);
		color : #1A2F4D;
	}
</style>

<nav class="navbar navbar-light bg-light" id="navbar">
		<form class="form-inline">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">@</span>
				</div>
				<input type="text" class="form-control" placeholder="회원아이디로 검색" name="memberId">
			</div>
		</form>
		
		<button type="submit" class="btn btn-primary" id="btn-search">검색</button>
	</nav>
	
   <div class="result" id="srchName-result">
		<input type="hidden" name="fromId" value="${loggedInUser.memberId}" />
   </div>
   
   <script>
   $("#btn-search").click(function() {  
       var memberId = $("input[name=memberId]").val();
       
       $.ajax({
          url: "${pageContext.request.contextPath}/chat/selectByName.do",
          data: {
             memberId : memberId
          },
          dataType: "json",
          type: "get",
          success: function(data) {
             var html = "<table class=table>";
             
             for(var i in data) {
                
                var member = data[i];
                
                 html += "<tr><td><input type='hidden' name='toId' value='" + member.memberId + "'></td>";
                 html += "<td>" + member.memberId + "</td>";
                 html += "<td>" + member.memberEmail + "</td>";
                 html += "<td><button type='button' class='btn btn-primary' id='btn-chatting'>쪽지 쓰기</button></td></tr>";
             }
             
             html += "</table>";
             
             $("#srchName-result").html(html);
             
             var fromId = $("input[name=fromId]").val();
             var toId = $("input[name=toId]").val();
             
             $("#btn-chatting").on("click", function() {
               var url = "${pageContext.request.contextPath}/chat/messageRoom.do?toId=" + toId;
               var title = "PCGOGO 쪽지";
               var status = "left=300px, top=100px, width=500px, height=850px";
                
               open(url, title, status);
             });
          },
          error : function() {
             console.log("ajax 에러!");
          }
       });
    });
   </script>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   