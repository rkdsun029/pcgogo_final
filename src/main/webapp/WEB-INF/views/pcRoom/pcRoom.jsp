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
    div.legend1{
        
        display:inline-block;
        width:12px;
        height:12px;
        border:1px solid;
        top:2px;
        margin-left:10px;
        position:absolute;
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
    div#seats{
        display:inline-block;
        width:850px;
        height:500px;
        border:1px solid;
        margin:0 auto;
        margin-top:50px;
    }
    </style>
 
	<section id="main-container">
        <div id="seat-outer-container">
            <h1>자리배치도</h1>
            <input type="text" id="pcRoom" name="pcRoom" placeholder="피시방이름" />
           	<button id="nowPcRoom">검색</button>
           	<a href="${pageContext.request.contextPath}/pcRoom/pcListAdd.do">피시방추가</a>
           	
            <div id="seat-container">
                <div id="seat-legend">
                    <ul>
                        <li>일반석 <div class="legend plain"></div></li>
                        <li>특별석 <div class="legend special"></div></li>
                        <li>화장실 <div class="legend toilet"></div></li>
                        <li>출입구 <div class="legend exit"></div></li>
                        <li>카운터 <div class="legend counter"></div></li>
                        <li>무인기 <div class="legend kiosk"></div></li>
                        <li>정수기 <div class="legend water"></div></li>
                        <li>흡연실 <div class="legend smoking"></div></li>
                        <li>기　타 <div class="legend etc"></div></li>
                        <li>　벽　 <div class="legend wall"></div></li>
                    </ul>
                </div>
                <div id="seats">
	               
                </div>
                
            </div>
        </div>
    </section>   
    <script>
    $("#nowPcRoom").on("click", function(){
    	var pcRoom = $("#pcRoom").val();
    	$.ajax({
    		url:"${pageContext.request.contextPath}/pcRoom/pcList.do",
    	    data: {pcRoom : pcRoom},
    	    dataType: "json",
    		type: "get",
    		success : function(data){
    			var html = "";
    			for(var i in data){
    				html += "<div class='legend1 "+data[i].legend+"' style = 'left : "+data[i].xLoc+"px; top : "+data[i].yLoc+"px;'></div>";
    			}
    			$("#seats").html(html);
    		},
    		error: function(){
    			console.log("error");
    			
    		}
    		
    	});
    	
    	
    });
    
    
    </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>