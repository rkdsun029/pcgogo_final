<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="사장님 메뉴" name="pageTitle"></jsp:param>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/managerFixMenu.jsp">
	<jsp:param value="" name="smallTitle"></jsp:param>
</jsp:include>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<style>
table.table{
	text-decoration:none
}
#hotdeal_th{
	width:450px;
}
#news_th{
	width:300px;
}
table.table th{
	text-align: center;
	vertical-align: 0;
}
a {
    color: #000000;
    text-decoration: none;
}
td{
	margin: 0px;
	padding: 0;
	text-align: center;
}
#hotdeal{
	text-align: center;
}
.form-inline{
	margin-left: 150px;
}

</style>
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
   <a class="nav-item nav-link active" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">익명 커뮤니티</a>
    <a class="nav-item nav-link" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">오늘의 핫딜</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">오늘의 IT뉴스</a>
  </div>
</nav>

<div class="result" id="crawling-hotdeal"></div>
<div class="result" id="crawling-news"></div>
<div class="result" id="crawling-memo">
	<div id="memo-container">
	<br><br>
    <form action="${pageContext.request.contextPath}/manager/insertMemo.do" class="form-inline" method="post">
        <input type="text" class="form-control col-sm-6" name="memo" placeholder="메모" required/>&nbsp;
        <input type="password" class="form-control col-sm-2" name="password" maxlength="4" placeholder="비밀번호" required/>&nbsp;
        <button class="btn btn-outline-success" type="submit" >저장</button>
    </form>
    <br />
    <!-- 메모목록 -->
	<table class="table">
	    <tr>
	      <th>번호</th>
	      <th>메모</th>
	      <th>날짜</th>
	      <th>삭제</th>
	    </tr>
	    <c:forEach items="${memoList}" var="memo" varStatus="vs">
		    <tr>
		      <td>${memo.memoNo}</td>
		      <td>${memo.memo}</td>
		      <td>${memo.memoDate}</td>
		      <td>
		      <button type="button" class="btn btn-outline-danger" onclick="deleteMemo('${memo.memoNo}')">삭제</button>
		      </td>
 			</tr>
	    </c:forEach>
	</table>
</div>
<form name="memoDelFrm" action="deleteMemo.do" method="post">
	<input type="hidden" name="no" />
	<input type="hidden" name="password" />
</form>
<%-- <% 
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
	<%= project.go.pcgogo.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "lnfList.do") %> --%>
</div>

<script>
 $("#nav-home-tab").on("click", function(){
	 
	    $("#crawling-memo").hide(1000);
	    $("#crawling-hotdeal").hide(1000);
		$("#crawling-news").hide(1000);
		$("#crawling-hotdeal").show(1000);
 	$.ajax({
 		url: "${pageContext.request.contextPath}/manager/managerCommunityHotDeal.do/",
 		dataType: "json",
 		type: "get",
 		success: function(data){
 			console.log(data);
         	var html = "<table class='table table-hover'>";
          	html+="<thead><tr><th id='hotdeal_th'>내용</th><th>정상 가격</th><th>할인 가격</th></tr></thead><tbody>";
             for(i=1; i<data.list.length; i++){ //원래 for(var i in data.list) for in문인데 0번지 값이 자꾸 안긁어와줘서 어쩔수없이 1부터 출력
             	html += "<tr><td id='hotdeal1'><a href='"+data.list[i].aTag+"'>"+data.list[i].title+"</td>";
             	html += "<td id='hotdeal'>"+data.list[i].originalPrice+"</td>";
             	html += "<td id='hotdeal'>"+data.list[i].salePrice+"</td></tr>";
             }
             html+="</tbody></table>";
             $("#crawling-hotdeal").html(html);
 			},
 			error : function(jqxhr, textStatus, errorThrown){
             console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
         }
 	});
 });


$("#nav-profile-tab").on("click", function(){
	
	$("#crawling-memo").hide(1000);
	$("#crawling-hotdeal").hide(1000);
	$("#crawling-news").hide(1000);
	$("#crawling-news").show(1000);
	$.ajax({
		url: "${pageContext.request.contextPath}/manager/managerCommunityBigNews.do/",
		dataType: "json",
		type: "get",
		success: function(data){
			console.log(data);
			var html = "<table class='table table-hover'>";
         	html+="<tr><th id='news_th'>IT/과학 TOP10</th><th id='news_th'>게임/리뷰 TOP10</th></tr>";
         	for(var i=0; i<10; i++){
            	html += "<tr><td><a href='https://news.naver.com"+data.list[i].aTag+"'>"+data.list[i].hotTitle+"</a></td><td><a href='"+data.listGameNews[i].Tag+"'>"+data.listGameNews[i].title+"</a></td></tr>";   
            }
            html+="</table>";
            $("#crawling-news").html(html);
			},
			error : function(jqxhr, textStatus, errorThrown){
            console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
        }
	});
});

$("#nav-contact-tab").on("click", function(){
	$("#crawling-memo").hide(1000);
	$("#crawling-hotdeal").hide(1000);
	$("#crawling-news").hide(1000);
	$("#crawling-memo").show(1000);
});



function deleteMemo(no){
    var frm = document.memoDelFrm;
    frm.no.value = no;
    
    var password = prompt("비밀번호를 입력하세요.");
   // if(password.trim().length == 0) return;
    console.log(1111)
    frm.password.value = password;
    frm.submit();
}
</script>

<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>