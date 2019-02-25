<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="PC방 검색" name="pageTitle"></jsp:param>
</jsp:include>

<style>
div#search-container{
	font-family:'Nanum Gothic', sans-serif;
	
}
div#location-search-bar{
	position:relative;
	display:inline-block;
	width:600px;
	height:300px;
}
div#location-search-bar select{
	display:inline-block;
	width:150px;
	height:30px;
	font-family:'Nanum Gothic', sans-serif;
	font-size:15px;
}
div#map{
	position:absolute;
	display:inline-block;
	width:500px;
	height:500px;
}
</style>

<div id="search-container">
	<div id="location-search-bar">
		<h3>지역 검색</h3>
		<form action="#">
			<select name="areaOption1" id="areaOption1">
				<option value="" selected>전체 시/도</option>
				<option value="">서울</option>
				<option value="">경기</option>
				<option value="">인천</option>
				<option value="">강원</option>
				<option value="">부산</option>
				<option value="">경남</option>
				<option value="">대구</option>
				<option value="">경북</option>
				<option value="">울산</option>
				<option value="">대전</option>
				<option value="">충남</option>
				<option value="">충북</option>
				<option value="">광주</option>
				<option value="">전남</option>
				<option value="">전북</option>
				<option value="">제주</option>
			</select>
			<select name="areaOption2" id="areaOption2">
				<option value="" selected>전체 군/구</option>
			</select>
			<select name="areaOption3" id="areaOption3">
				<option value="" selected>전체 읍/면/동</option>
			</select>
		</form>
	</div>   
	
	<div id="map"></div>
</div>
<script>
var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 10
  });
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDhQad7S4xXIkneESjk3RiR1X9TakmSQfA&callback=initMap" async defer></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>