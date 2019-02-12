<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css" />
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
    <div id="head-container">
        <a href="#"><h1 id="head-title">PCGOGO.COM</h1></a>
        <ul id="main-menu">
            <li>PC방 검색</li>
            <li>인기 PC방</li>
            <li>분실물찾기</li>
            <li>고객센터</li>
        </ul>

    </div>
    <div id="quick-menu">
        <div class="quick" id="menu1">로그인</div>
        <div class="quick" id="menu2">회원가입</div>
        <div class="quick" id="menu3">FAQ</div>
        <div id="goToTop">▲ TOP</div>
    </div>

    <section id="main-container">