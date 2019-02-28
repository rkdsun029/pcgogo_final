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

<script>
$("lnfList").on("change", function(){
	$.ajax({
		url: "${pageContext.request.contextPath}/manager/managerCommunity.do/",
		dataType: "json",
		type: "get",
		success: function(data){
			console.log(data);
        	var html = "<table id='lnfList'>";
         	html+="<tr><th>내용</th></tr>";
            for(var i in data){
            	html += "<tr><td>"+data"</td></tr>";
            }
            html+="</table>";
            
            $("#lnfList").html(html);
			},
			error : function(jqxhr, textStatus, errorThrown){
            console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
        }
	});
});
</script>

<table id="lnfList">
			<tr>
				<th>내용</th>
			</tr>
</table>


<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>