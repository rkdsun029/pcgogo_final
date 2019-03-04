<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <script>
    $(function(){
        $("div#head-container").on("mouseenter", function(){
            $("div#head-container").css({
                "background": "white",
                "animation": "colorAni1 .5s 1 forwards" 
            });
            $("a").css("color", "rgba(255, 40, 40, .7)");
        });
        $("div#head-container").on("mouseleave", function(){
            $("div#head-container").css({
                "background": "rgba(30, 30, 30, .3)",
                "animation": "colorAni2 .5s 1 forwards" 
            });
            $("a").css("color", "white");
        });

        $("#goToTop").on("click", function(){
            $("html, body").animate({
                scrollTop : 0
            }, 400);
        });

        $(window).scroll(function(){
            var top = $(document).scrollTop();
            $("#quick-menu").animate({"top": (top+100)}, 50);
        });
    });
    </script>
</head>
<body>
	<style>
    .nowSitting{
        animation-name: nowSitting;
        animation-duration: .5s;
        animation-iteration-count: infinite;      
    }
    @keyframes nowSitting{
        0%{border:1px solid white}
        100%{border:1px solid black}
    }
    #seatsTable tr td{
        width: 20px;
        height: 20px;

    }
    </style>
 
	<section id="main-container">
        <div id="container">
            <h1>자리현황</h1>
           	<button onclick="srcPcRoom()">내 주변 검색</button>
			<select name="setArea" id="setArea">
				<option value="" disabled selected>지역 선택</option>
				<option area_seq="1" value="서울">서울</option>
				<option area_seq="2" value="경기">경기</option>
				<option area_seq="3" value="인천">인천</option>
				<option area_seq="4" value="강원">강원</option>
				<option area_seq="5" value="부산">부산</option>
				<option area_seq="6" value="대구">대구</option>
				<option area_seq="7" value="경북">경북</option>
				<option area_seq="8" value="울산">울산</option>
				<option area_seq="9" value="대전">대전</option>
				<option area_seq="10" value="충남">충남</option>
				<option area_seq="11" value="충북">충북</option>
				<option area_seq="12" value="광주">광주</option>
				<option area_seq="13" value="전남">전남</option>
				<option area_seq="14" value="전북">전북</option>
				<option area_seq="15" value="제주">제주</option>
			</select>
			<input type="text" id="mapSrc" name="mapSrc" placeholder="피씨방 이름" />
           	<button onclick="mapSrc()">피씨방 검색 </button>
			</div>
        <div id="map" style="width:300px;height:300px;"></div>
			<div id="seats"></div>
    </section>   

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec95021a67763d0b8e870b0e01a6797c&libraries=services"></script>
<script>
function srcPcRoom(){
	if(!!navigator.geolocation){//gps 사용할 수 있는지 여부 확인
		navigator.geolocation.getCurrentPosition(suc,err);
	}else{
		alert("현재 위치를 가져올 수 없습니다.\n 브라우저 설정의 위치정보 사용을 허용으로 바꾸어 주시거나 GPS 사용을 On으로 변경 후 다시 시도해주세요!");
	}	
};



var area = "";
$("#setArea").change(function(){
    area = $("#setArea>option:selected").html();
});

//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
var pcRoomName ="";
function mapSrc(){
	map = new daum.maps.Map(mapContainer, mapOption); 
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places(); 
	pcRoomName = $("#mapSrc").val();
	// 키워드로 장소를 검색합니다
	ps.keywordSearch(pcRoomName, placesSearchCB);
  	
	
};




// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
	
	
	//----------내 db 마커 찍기 보류----
/* 	console.log("@@@@@@@"+data,status,pagination);
    
    	$.ajax({
    		url:"${pageContext.request.contextPath}/pcRoom/pcRoomList.do",
    	    data: {pcRoomName : pcRoomName},
    	    dataType: "json",
    		type: "get",
    		success: function(data1){
    			console.log("asdasd");
    			
    			var bounds = new daum.maps.LatLngBounds();
    			for(var i=0; i<data1.length; i++){
    				console.log(data1[i]);
    				displayMarker(data1[i]);
    				bounds.extend(new daum.map.latLng(data1[i].y, data1[i].x));//y,x 좌표에 마커 위치하기 
    				
    			}
    			
    	        map.setBounds(bounds);
    			
    		},
    	    error: function(){
    	    	console.log("error");
    	    }
    	}); */
    	
    	 
    	if (status === daum.maps.services.Status.OK) {
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();
        
		//지도 마커에 표시할 데이터를 보내는 곳 데이터는 
        for (var i=0; i<data.length; i++) {
        	//console.log(data[i]);
        	var c = data[i].category_name;
        	console.log(c)
        	var b = data[i].address_name; 	//지역 이름
        	if(c.indexOf('PC방')>-1){
        	if(b.indexOf(area)>-1){			//지역이름에 검색할 옵션의 지역이름이 포함되면
        		displayMarker(data[i]);  	//마커표시
                bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        	}
        	}
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

function rsv(){
	window.open("${pageContext.request.contextPath}/pcRoom/pcRoomRsv.do",
			"뿌뿌링", "width=1000, height=700, left=50, top=20");
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        var pcRoomName = place.place_name;
        
        $.ajax({
        	url:"${pageContext.request.contextPath}/pcRoom/nowPcStatus.do",
    	    data: {pcRoomName : pcRoomName},
    		type: "get",
    		success : function(data){
    			console.log(data, typeof data);
    			console.log("@@@@@"+place.place_name);
    			if(data!=''){
    				infowindow.setContent(
    					place.place_name+'<div class="txt">피시방의 전체 좌석수 </div>'
    					+data[0].totalSeat+'<div class="txt">중 </div>'
    					+data[0].usingSeat+'<div class="txt">자리가 이용 중이며 </div>'
    					+data[0].unUsingSeat+'<div class="txt">자리가 이용 가능합니다.</div>'
    					+'<button onclick="rsv();">좌석확인/예약하기</button>'
    					);
    			}else{
        			infowindow.setContent(
    					pcRoomName+'<div class="txt">피시방은 Pcgogo에 등록되어있지 않는 지점입니다.</div>'
    				);
    			}
    			
    		},
    		error : function(){
    			console.log("error!!");
    		}
        })
        
        infowindow.open(map, marker);
        
        //var pcRoom = place.place_name;
        /* $.ajax({
    		url:"${pageContext.request.contextPath}/pcRoom/pcList.do",
    	    data: {pcRoom : pcRoom},
    	    dataType: "json",
    		type: "get",
    		success : function(data){
    			var html = "<table id='seatsTable'>"
   				for(var j=1; j<4; j++){//j=y값
    				html += "<tr id='tr"+j+"'>";
	    			for(var i = 1; i<21; i++){// i=x값 i는 있는데 datak xloc 은 없어 
	    				for(var k in data){
        					var x = data[k].xLoc;
        					var y = data[k].yLoc;
        					if(j==y && i==x){
        						var a = data[k].nowSitting;
	        					console.log("j="+j+", y="+y+", i="+i+", x="+x+", a="+a);
        						if(a=='y'){
        	    					html += "<td id='td"+x+"'><div class='nowSitting legend "+data[i].legend+"'></div></td>";}
                				else if(a=='n'){
        	    					html += "<td id='td"+x+"'><div class='legend "+data[i].legend+"'></div></td>";}
        					}
        					//else if(j==y || i!=x){
        						//html += "<td id='td"+x+"'><div class='legend empty'></div></td>";}
						}
    				}
    					html +="</tr>";
    			}
    			html +="</table>";
    			$("#seats").html(html);
    		},
    		error: function(){
    			console.log("error");
    		}
    	}); */
    });
    
}
//---------------------------------보류상태--------------------------------내위치 찾기 기능 더 덧붙이기
function suc(position){
    var lat = position.coords.latitude;
	var lng = position.coords.longitude;
	var container = document.getElementById('map');
    var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(lat, lng), //지도의 중심좌표.
    		level: 3 //지도의 레벨(확대, 축소 정도)
    	};
	map = new daum.maps.Map(container, options);
};
function err(){
    	alert('현재 위치를 가져올 수 없습니다.');
};
</script>
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>