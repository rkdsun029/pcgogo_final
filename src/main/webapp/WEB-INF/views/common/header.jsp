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
});
</script>
</head>
<body>
    <div id="head-container">
        <a href="#" id="main-title"><h1 id="head-title">PCGOGO.COM</h1></a>
        <ul id="main-menu">
            <li><a href="#">PC방 검색</a></li>
            <li><a href="#">인기 PC방</a></li>
            <li><a href="#">분실물 찾기</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>

    </div>
    <div id="quick-menu">
        <div class="quick" id="menu1">로그인</div>
        <div class="quick" id="menu2">회원가입</div>
        <div class="quick" id="menu3">FAQ</div>
        <div id="goToTop">▲ TOP</div>
    </div>

    <section id="main-container">