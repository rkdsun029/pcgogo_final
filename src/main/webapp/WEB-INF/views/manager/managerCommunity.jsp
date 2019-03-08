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
/* table.table td{
	text-align: center;
} */
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
	padding: 0px;
}
#hotdeal{
	text-align: center;
}

</style>
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">오늘의 핫딜</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">오늘의 IT뉴스</a>
   <!--  <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</a> -->
  </div>
</nav>



<div class="result" id="crawling-hotdeal"></div>
<div class="result" id="crawling-news"></div>
<div class="result" id="crawling-gameNews"></div>

<script>


 $("#nav-home-tab").on("click", function(){
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

</script>

<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>