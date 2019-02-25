<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
    html{
        margin:0px;
        padding:0px;
    }
    body{
        background:skyblue;
    }
    @keyframes colorAni1{
        0%{background:rgba(30, 30, 30, .3);}
        100%{background:white;}
    }
    @keyframes colorAni2{
        0%{background:white;}
        100%{background:rgba(30, 30, 30, .3);}
    }
    div#head-container{
        position:fixed;
        width:100%;
        height:70px;
        top:0px;
        left:0px;
        margin:0px;
        padding:0px;
        background:rgba(30, 30, 30, .3);
        white-space:nowrap;
    }
    h1#head-title{
        display:inline-block;
        font-family: 'Fredoka One', cursive; 
        font-size:30px;
        margin:0px;
        margin-left:150px;
        margin-top:15px;
    }
    a{
        text-decoration:none;
        color:white;
    }
    ul#main-menu{
        display:inline-block;
        font-family:'Nanum Gothic', sans-serif;
        font-size:15px;
        font-weight:bold;
        position:relative;
        top:-5px;
        margin-left:100px;
    }
    ul#main-menu li{
        display:inline-block;
        padding-right:30px;
        cursor:pointer;
    }
    ul#main-menu li:hover{
        color:rgba(255, 40, 40, .7);
    }
    section#main-container{
        /* width: 1008px; */
        width:1200px;
        /* min-height:100px; */
        height:2000px;
        margin:0 auto;
        margin-top:90px;
        background:white;
    }
    div#footer{
        position:absolute;
        width:100%;
        height:70px;
        left:0px;
        background:rgba(0, 0, 0, .3);
        margin:0px;
        margin-top:20px;
        padding:0px;
    }
    div#footer p{
        margin-left:150px;
        font-size:13px;
        color:white;
        font-family:'Nanum Gothic', sans-serif;
        position:relative;
        top:15px;
    }
    div#quick-menu{
        position: absolute;
        right:25px;
        width: 120px;
        height: 430px;
        background:gray;
        border:1px solid gray; 
        text-align:center;
        font-family:'Nanum Gothic', sans-serif;
        font-weight:bold;
        font-size:17px;
    }
    div#quick-menu .quick{
        position: relative;
        width: 100px;
        height: 110px;
        margin: 0 auto;
        margin-bottom: 15px;
        background:white;
        cursor:pointer;
    }
    div#quick-menu div:first-of-type{
        margin-top: 10px;
    }    
    div#goToTop{
        margin:0 auto;
        width:100px;
        height:30px;
        cursor:pointer;
        font-size:20px;
    }
    
    </style>
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
    div#seat-outer-container{
        font-family:'Nanum Gothic', sans-serif;
        text-align:center;
    }
    div#seat-legend{
        display:inline-block;
        width:120px;
        border-radius:10px;
        margin:0 auto;
        margin-right:30px;
        margin-top:20px;
        margin-bottom:20px;
        background:white;
        position:relative;
        top:-150px;
    }
    div#seat-container{
        background:lightgray;
        width:1100px;
        height:600px;
        border-radius:30px;
        margin:0 auto;
    }
    div#seat-legend ul{
        list-style:none;
        padding-left:0;
    }
    div#seat-legend ul li{
        margin-bottom:10px;
    }
    div.legend{
        display:inline-block;
        width:12px;
        height:12px;
        border:1px solid;
        position:relative;
        top:2px;
        margin-left:10px;
    }
    
    div.plain{background:white;}
    div.special{background:red;}
    div.toilet{background:purple;}
    div.exit{background:skyblue;}
    div.counter{background:orange;}
    div.kiosk{background:blue;}
    div.water{background:cyan;}
    div.smoking{background:brown;}
    div.etc{background:darkslategrey}
    div.wall{background:gray;}
    div.empty{border: 0px; background:rgba(0,0,0,0);}
    div#seats{
        display:inline-block;
        width:850px;
        height:500px;
        border:1px solid;
        margin:0 auto;
        margin-top:50px;
    }
    
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

function mapSrc(){
	map = new daum.maps.Map(mapContainer, mapOption); 
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places(); 
	var a = $("#mapSrc").val();
	// 키워드로 장소를 검색합니다
	ps.keywordSearch(a, placesSearchCB); 
};




// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();
        
		//지도 마커에 표시할 데이터를 보내는 곳 데이터는 
        for (var i=0; i<data.length; i++) {
        	var b = data[i].address_name; //지역 이름
        	if(b.indexOf(area)>-1){//지역이름에 검색할 옵션의 지역이름이 포함되면
        		displayMarker(data[i]);  //마커표시
                bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        	}
            
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
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
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
        
        var pcRoom = place.place_name;
        $.ajax({
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
    	});
    });
}
</script>
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>