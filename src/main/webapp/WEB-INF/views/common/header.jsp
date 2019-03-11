<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCGOGO.COM</title>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 <meta name="google-signin-client_id" content="522789660173-lpfikvtl76o0p15h09bva0v7m905jjqv.apps.googleusercontent.com">
 <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script>
$(function(){
    $("div#head-container").on("mouseenter", function(){
        $("div#head-container").css({
            "background": "white",
            "animation": "colorAni1 .5s 1 forwards" ,
        });
        $("div#head-container>a#main-title").css("color", "rgba(255, 40, 40, .7)");
        $("ul#main-menu li").css("visibility", "visible");
    });
    $("div#head-container").on("mouseleave", function(){
        $("div#head-container").css({
            "background": "rgba(30, 30, 30, .3)",
            "animation": "colorAni2 .5s 1 forwards" 
        });
        $("div#head-container>a#main-title").css("color", "white");
        $("ul#main-menu li").css("visibility", "hidden");
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
    
    /* $("img#goToTalk").on("click", function(){
    	location.href = "${pageContext.request.contextPath}/chat/chatting.do";
    }); */
});
</script>
</head>
<body>
    <div id="head-container">
        <a href="${pageContext.request.contextPath }" id="main-title"><h1 id="head-title">PCGOGO.COM</h1></a>
        <ul id="main-menu">
            <li><a href="${pageContext.request.contextPath }/pcRoom/pcRoom.do">PC방 검색</a></li>
            <li><a href="${pageContext.request.contextPath }/lostandfound/lnfList.do">분실물 찾기</a></li>
            <li><a href="${pageContext.request.contextPath }/manager/manager.do">사장님 메뉴</a></li>
            <li><a href="${pageContext.request.contextPath }/faq/faq.do">고객센터</a></li>
            <c:if test="${loggedInUser != null }">
            	<li><img id="goToTalk" src="${pageContext.request.contextPath }/resources/image/header/gogotalk_logo.png" alt="" /></li>
            </c:if>
        </ul>

    </div>
    <div id="quick-menu">
    <c:if test="${loggedInUser == null }">
        <div class="quick" id="menu1"><img src="${pageContext.request.contextPath }/resources/image/header/login.png" alt="" 
        onclick="location.href='${pageContext.request.contextPath}/login.do'"/>로그인</div>
        <div class="quick" id="menu2"><img src="${pageContext.request.contextPath }/resources/image/header/register.png" alt="" 
        onclick="location.href='${pageContext.request.contextPath}/signUp.do'"/>회원가입</div>
        <div class="quick" id="menu3"><img src="${pageContext.request.contextPath }/resources/image/header/help.png" alt="" />FAQ</div>
    </c:if>
    <c:if test="${loggedInUser != null }">
    	<c:if test="${loggedInUser.isSocial != 'admin' }">
	    	<div class="quick" id="menu1"><img src="${pageContext.request.contextPath }/resources/image/header/myInfo.png" alt="" 
	    	onclick="location.href='${pageContext.request.contextPath}/myPage'"/>내 정보</div>
	        <div class="quick" id="menu2"><img src="${pageContext.request.contextPath }/resources/image/header/logout.png" alt="" 
	        onclick="logout();" />로그아웃</div>
	        <c:if test="${loggedInUser.isSocial != 'manager'}">
	        	<div class="quick" id="menu3"><img src="${pageContext.request.contextPath }/resources/image/header/order.png" alt="" 
	        	onclick="location.href='${pageContext.request.contextPath}/reservationLog.do'"/>예약내역</div>
	        </c:if>
	        <c:if test="${loggedInUser.isSocial == 'manager'}">
		        <div class="quick" id="menu3"><img src="${pageContext.request.contextPath }/resources/image/user/register/manager.png" alt="" 
		        onclick="location.href='${pageContext.request.contextPath}/manager/manager.do'"/>사장님메뉴</div>
	        </c:if>
	        <div class="quick" id="menu4"><img src="${pageContext.request.contextPath }/resources/image/header/chat2.png" alt=""
	        id="letterSend"/>쪽지</div>
    	</c:if>
        <c:if test="${loggedInUser.isSocial == 'admin' }">
        	<div class="quick" id="menu2"><img src="${pageContext.request.contextPath }/resources/image/header/logout.png" alt="" 
	        onclick="logout();" />로그아웃</div>
        	<div class="quick"><img src="${pageContext.request.contextPath }/resources/image/header/building.png" alt="" 
        	onclick="location.href='${pageContext.request.contextPath}/admin/permissionList.do'"/>승인대기 목록</div>
        	<div class="quick"><img src="${pageContext.request.contextPath }/resources/image/header/building.png" alt="" 
        	onclick="location.href='${pageContext.request.contextPath}/admin/pcRoomList.do'"/>업체 목록</div>
        	<div class="quick" id="menu3"><img src="${pageContext.request.contextPath }/resources/image/header/help.png" alt="" />FAQ</div>
        </c:if>
    </c:if>
        <div id="goToTop">▲ TOP</div>
    </div>
    <script>
    function logout(){
    	if(confirm("정말로 로그아웃하시겠습니까?")){
	    	if("${loggedInUser.isSocial}"=="kakao"){
	    		kakao_logout();
	    	}else if("${loggedInUser.isSocial}"=="google"){
		    	google_logout();
	    	}else if("${loggedInUser.isSocial}"=="naver"){
	    		naver_logout();
	    	}
	    	
	    	location.href='${pageContext.request.contextPath}/logout.do';
		}
    }
    
    function kakao_logout(){
	    Kakao.init('b0d1d7505f46a344dbdd4ff7a064f2f7');
    	Kakao.Auth.logout(function(data){
    			if(data){}
    			else{
    				alert("다시 시도해주세요.");
    				return false;
    			}
    		
    	});
    }
    
    function google_logout(){
    	 gapi.auth2.getAuthInstance().signOut().then(function () {
			gapi.auth2.getAuthInstance().disconnect();
        });
    }
    
    function naver_logout(){
    	var popup = open("http://nid.naver.com/nidlogin.logout", "", "width=300, height=200");
    	setInterval(function(){
		   	popup.close();
    	}, 800);
    }
    
    function init() {
   	    gapi.load('auth2', function() {
   	    	gapi.auth2.init({
	        	client_id: '522789660173-lpfikvtl76o0p15h09bva0v7m905jjqv.apps.googleusercontent.com'
	     	});
   	    });
    }
    
    $("#goToTalk").on('click', function() {
    	
    	var url = "${pageContext.request.contextPath}/chat/chatting.do";
        var popOption = "width=500, height=900, status=no;";
        window.open(url, "", popOption);
    });
    
    $("#letterSend").on('click', function() {
    	var url = "${pageContext.request.contextPath}/common/messageHeader.do";
    	var popOption = "width=500, height=900, status=no;";
    	window.open(url, "", popOption);
    });
    
    </script>
    <section id="main-container">
    	<div id="padding">
	    	<h1 id="page-title">${param.pageTitle}</h1>
			<hr>