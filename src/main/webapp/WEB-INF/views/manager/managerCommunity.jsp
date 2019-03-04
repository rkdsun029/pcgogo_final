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
	<jsp:param value="사장님 커뮤니티" name="smallTitle"></jsp:param>
</jsp:include>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<style>
<style>
table#lnfList{
	margin:0 auto;
	text-align:center;
	width:1000px;
}
</style>



<table id="crawling_List">
			<tr>
				<th>오늘의핫딜</th>
			</tr>
</table>
<div class="result" id="crawling-result">

</div>
<script>
$("#crawling_List").on("click", function(){
	$.ajax({
		url: "${pageContext.request.contextPath}/manager/managerCommunity123.do/",
		dataType: "json",
		type: "get",
		success: function(data){
			console.log(data);
        	var html = "<table id='crawling_List'>";
         	html+="<tr><th>내용</th><th>가격</th></tr>";
            for(var i in data.list){
            	html += "<tr><td>"+data.list[i].goodds_name+"</td>";
            	html += "<td>"+data.list[i].price_type1+"</td></tr>";
            }
            html+="</table>";
            $("#crawling-result").html(html);
			},
			error : function(jqxhr, textStatus, errorThrown){
            console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
        }
	});
});
</script>

<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>