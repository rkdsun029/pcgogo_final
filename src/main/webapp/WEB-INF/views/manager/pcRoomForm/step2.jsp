<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 PC방 등록</title>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/pcRoomForm.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<style>
div#outer-container{
	width:600px;    
	height: 600px;
	margin-top:120px;
}
table#basic-info{
	width:415px;
	margin:0 auto;
}
table#basic-info th{text-align:right;}
table#basic-info td{text-align:left;}
table#basic-info input{
	margin-left:20px;
	margin-bottom:7px;
	font-family:'Nanum Gothic', sans-serif;
	font-size:14px;
}
input[name=pcRoomName], input[name=mainAddress], input[name=detailAddress]{
	width:300px;
}
input[name=postCode]{
	width:150px;
}
button#postcodify_search_button{
	width:120px;
	height:30px;
	color:white;
	margin-left:10px;
	background:rgb(255, 40, 40, .7);
	border:1px rgb(255, 40, 40, .7);
	border-radius:5px;
	cursor:pointer;
	font-family:'Nanum Gothic', sans-serif;
	font-size:14px;
}
button#test{
    position: relative;
	display:inline-block;
	width:120px;
	height:30px;
	color:white;
	margin-left:10px;
	background:rgb(255, 40, 40, .7);
	border:1px rgb(255, 40, 40, .7);
	border-radius:5px;
	cursor:pointer;
	font-family:'Nanum Gothic', sans-serif;
	font-size:14px;
    top: -200px;
    left: 146px;
}
div#txt{
	position: relative;
	display:inline-block;
	width:190px;
	height:60px;
	font-family:'Nanum Gothic', sans-serif;
	font-size:9px;
	top: -62px;
}
div#test{
height:210px;
}
</style>
</head>
<body>
<!-- 기본정보 : 상호명, 주소 입력 -->
<div id="outer-container">
	<h1 id="head-title">PCGOGO.COM</h1>
	<h3>기본정보를 입력해 주세요.</h3>
	<form action="${pageContext.request.contextPath }/manager/pcRoomForm_step3.do" method="POST">
		<input type="hidden" name="xLoc" value="" />
		<input type="hidden" name="yLoc" value="" />
		<table id="basic-info">
			<tr>
				<th>상호명</th>
				<td><input type="text" name="pcRoomName" required/></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" id="search-addr" name="postCode" class="postcodify_postcode5 form-control" required readonly/>
					<button id="postcodify_search_button">우편번호 검색</button>
				</td>
			</tr>
			<tr>
				<th>도로명주소</th>
				<td><input type="text" id="address" name="mainAddress" class="postcodify_address form-control" placeholder="우편번호 검색하기를 클릭하세요." readonly/></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" id="details" name="detailAddress" class="postcodify_details form-control" placeholder="직접 입력해주세요." required/></td>
			</tr>
		</table>
		<div id="test">
		
			<div id="map" style="width:50%;height:200px;display:inline-block;"></div>
			<div id="txt">도로명주소가 기입된 후에 <br>
							지도 위치를 확인하신 후<br>
							정확한 위치를 클릭해주세요</div>
			
		</div>
		<button type="submit" class="submit-info">다음단계로 이동하기 →</button>
		
	</form>
		<button id="test" onclick="test();">위치 확인하기</button>
</div>
	        		

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec95021a67763d0b8e870b0e01a6797c&libraries=services"></script>
<script>

$(".postcodify_search_result postcode_search_result").click(function(){
	console.log(adr);	
	
})

function test(){
	var adr = $("#address").val();
    geocoder.addressSearch(adr, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === daum.maps.services.Status.OK) {

            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
            
            map.setCenter(coords);
        } 
    });    
}
	

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();


var marker = new daum.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);


daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var x = latlng.getLng();
    var y = latlng.getLat();
    var message = 'x= ' + x ;
    message += 'y= ' + y ;
    var resultDiv = document.getElementById('clickLatlng'); 
    $("input[name=xLoc]").val(x);
    console.log( $("input[name=xLoc]").val())
    $("input[name=yLoc]").val(y);
    console.log( $("input[name=yLoc]").val())
});
   
   
</script>
</body>
</html>