<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="분실물 찾기" name="lostandfound"></jsp:param>
</jsp:include>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<style>
div#lostandfound-container{
	font-family:'Nanum Gothic', sans-serif;	
}
table#lostandfound-help{
	width:350px;
	margin:0 auto;
	font-size:17px;
	text-align:center;
	margin-top:20px;
	float: left;
	margin-left: 140px;
}
table#lostandfound-help th, table#lostandfound-help td{
	height:30px;
	margin:15px;
}
table#lostandfound-help th{
	border-bottom:1px solid #c8c8c8;
}
div#search-bar{
	position:relative;
	text-align:center;
	width:900px;
	margin:0 auto;
	margin-top:30px;
	margin-bottom:30px;
	padding-top: 70px;
}
div#search-bar h3{
	display:inline-block;
}
div#search-bar select{
	display:inline-block;
	width:250px;
	height:30px;
	font-family:'Nanum Gothic', sans-serif;
	font-size:15px;
}
div#search-bar input{
	display:inline-block;
	width:250px;
	height:30px;
	font-family:'Nanum Gothic', sans-serif;
	font-size:15px;
	border-style:none;
	border-bottom:1px solid gray;
}
div#search-bar button{
	display:inline-block;
	width:70px;
	height:35px;
	border-radius:5px;
	border: 1px rgba(255, 40, 40, .7);
	background:rgba(255, 40, 40, .7);
	color:white;
	font-size:18px;
	font-family:'Nanum Gothic', sans-serif;
	cursor:pointer;
}
div#map{
	position:relative;
	width:300px;
	height:300px;
}
table#lnfList{
	margin:0 auto;
	text-align:center;
	width:1000px;
}
input#btn-add{
	float:right; 
	margin: 0 0 15px;
	margin-right:70px;
	display:inline-block;
	width:100px;
	height:35px;
	border-radius:5px;
	border: 1px rgba(255, 40, 40, .7);
	background:rgba(255, 40, 40, .7);
	color:white;
	font-size:12px;
	font-family:'Nanum Gothic', sans-serif;
	cursor:pointer;
}
p{
margin-left:70px;
}

</style>

<div id="lostandfound-container">
	<table id="lostandfound-help">
		<tr><th colspan="2">분류번호를 이용하면 빠르게 찾을 수 있습니다.</tr>
		<tr><td>분류(L1)</td><td>핸드폰 / 지갑 / 가방</td></tr>
		<tr><td>분류(L2)</td><td>충전기 / USB</td></tr>
		<tr><td>분류(L3)</td><td>카드 / 신분증 / 면허증</td></tr>
		<tr><td>분류(L4)</td><td>악세사리 / 의류</td></tr>
		<tr><td>분류(L5)</td><td>기타</td></tr>
	</table>
	<div id="search-bar">
		<h3>분실물 검색</h3>
		&nbsp;&nbsp;&nbsp;
		<select name="optioName" id="optionSelector">
			<option value="" disabled selected>분류를 선택해 주세요.</option>
			<option value="L1" id="value1">분류1 : 핸드폰 / 지갑 / 가방</option>
			<option value="L2" id="value2">분류2 : 충전기 / USB</option>
			<option value="L3" id="value3">분류3 : 카드 / 신분증 / 면허증</option>
			<option value="L4" id="value4">분류4 : 악세사리 / 의류</option>
			<option value="L5" id="value5">분류5 : 기타</option>
		</select>
		&nbsp;&nbsp;&nbsp;
		<br><br>
		<form name="lofSearchNameFrm" id="lofSearchNameFrm" onsubmit="return false;">
		<input type="text" id="lnfName" name="lnfName" placeholder="물품을 입력해주세요."/>
		&nbsp;&nbsp;&nbsp;
		<button class="btn-send">찾기</button>
		</form>
		
		
		
		
		<script>

		</script>
	</div>   
	<div><br><br><br><br>
	<c:if test="${loggedInUser.isSocial == 'admin' }">
	<input type="button" value="분실물 등록" id="btn-add" class="btn btn-outline-success" onclick="fn_golnfForm();"/>
	</c:if>
	</div>
	<div id="lnfList-container">
	
	<p>총 <strong>${totalContents }</strong>건의 분실물이 있습니다.</p>
	
		<table id="lnfList" class="table table-hover">
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>물품명</th>
				<th>보관 중인 pc방</th>
				<th>습득날짜</th>
				<th>상태</th>
			</tr>
			
			<c:forEach items="${list}" var="lnf"> 
			<tr no="${lnf.LNFNO}">
				<td>${lnf.LNFNO}</td>
				<td>${lnf.LNFTYPE}</td>
				<td><strong>${lnf.LNFNAME}</strong></td>
				<td>${lnf.LNFPCROOMNAME}</td>		
				<td><fmt:formatDate value="${lnf.LNFGETDATE}" 
							 	type="date"/></td>
				<td>${lnf.LNFSTATUS}</td>
			</tr>
			</c:forEach> 
		</table>
		<br>
		<br>
		<br>
	
	<% 
		//int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
		//int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
		int totalContents = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		
		//파라미터 cPage가 null이거나 "", "가나다"일때는 기본값 1로 세팅함.  
		String cPageTemp = request.getParameter("cPage");
		int cPage = 1;
		try{
			cPage = Integer.parseInt(cPageTemp);
		} catch(NumberFormatException e){
			
		}
		
	%>
	<%= project.go.pcgogo.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "lnfList.do") %>
	
	</div>
	<div class="result" id="lnfType-result"></div>	
	<div class="result" id="lnfName-result"></div>
<!-- 	<div class="result" id="lnfName-result">	
	
	</div> -->
</div>

<script>
/* 분류 선택 */
	$("#optionSelector").on("change", function(){	

		$("#lnfList-container").hide(1000);
		$("#lnfName-result").hide(1000);
		$("#lnfType-result").show(1000);
		  		$.ajax({
		  			url: "${pageContext.request.contextPath}/lostandfound/lnfList/"+$(this).val(),
		  			dataType: "json",
		  			type: "get",
		  			success: function(data){
		  				console.log(data);
		                var html = "<p>총 <strong>"+data.selectContents+"</strong>건의 분실물이 있습니다.</p><table id='lnfList' class='table table-hover'>";
		                html+="<tr><th>번호</th><th>분류</th><th>물품명</th><th>보관중인 pc방</th><th>습득날짜</th><th>상태</th></tr>";
		                for(var i in data.list){
		                	html += "<tr no='" + data.list[i].lnfNo + "'><td>"+data.list[i].lnfNo+"</td>";
		                    html += "<td>"+data.list[i].lnfType+"</td>";
		                    html += "<td><strong>"+data.list[i].lnfName+"</strong></td>";
		                    html += "<td>"+data.list[i].lnfPcRoomName+"</td>";
		                    html += "<td>"+new Date(data.list[i].lnfGetDate).toISOString().slice(0,10)+"</td>";
		                    html += "<td>"+data.list[i].lnfStatus+"</td></tr>";
		                }
		                html+="</table>";
		                
		                $("#lnfType-result").html(html);
		  			},
		  			error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
		            }
		});
  	});
	
	
	/* 물품명 검색 */
	$(".btn-send").on("click",function(){
		$("#lnfList-container").hide(1000);
		$("#lnfType-result").hide(1000);
		$("#lnfName-result").show(1000);
		
			var lnfName = $("#lofSearchNameFrm [name=lnfName]").val();

			$.ajax({
	            url:"${pageContext.request.contextPath}/bbb/aaa/lnfName/"+lnfName,
	            dataType:"json",
	            type:"get",
	            success:function(data){
	                console.log(data);
	                //리턴데이터가 null인 경우, json으로 변환불가. 빈 Menu객체를 전달함.
	        		var html = "<p>총 <strong>"+data.selectLnfNameCount+"</strong>건의 분실물이 있습니다.</p><table id='lnfList' class='table table-hover'>";	        		
		                html+="<tr><th>번호</th><th>분류</th><th>물품명</th><th>보관중인 pc방</th><th>습득날짜</th><th>상태</th></tr>";
		                for(var i in data.selectList){
		                    html += "<tr ><td>"+data.selectList[i].lnfNo+"</td>";
		                    html += "<td>"+data.selectList[i].lnfType+"</td>";
		                    html += "<td><strong>"+data.selectList[i].lnfName+"</strong></td>";
		                    html += "<td>"+data.selectList[i].lnfPcRoomName+"</td>";
		                    html += "<td>"+new Date(data.selectList[i].lnfGetDate).toISOString().slice(0,10)+"</td>";
		                    html += "<td>"+data.selectList[i].lnfStatus+"</td></tr>";
		             	
	        		}
	                html+="</table>";
	                $("#lnfName-result").html(html);  
	            },
	            error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
	            }

	        });
		});	
	
$(function(){
	$("tr[no]").on("click",function(){
		var lnfNo = $(this).attr("no");
		console.log("lnfNo = "+lnfNo);
		location.href = "${pageContext.request.contextPath}/lostandfound/lnfView.do?no="+lnfNo;
	});
});

function fn_golnfForm(){
	location.href="${pageContext.request.contextPath}/lostandfound/lnfForm.do";
}


</script>

<!-- new Date(data[i].lnfGetDate.toISOString().slice(0,10) -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>