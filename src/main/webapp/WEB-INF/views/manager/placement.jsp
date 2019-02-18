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
	<jsp:param value="자리배치도" name="smallTitle"></jsp:param>
</jsp:include>

<style>
span#help{
	font-size:13px;
	cursor:pointer;
}
div#seat-legend{
    display:inline-block;
    width:85px;
    margin:0 auto;
    background:white;
    position:relative;
    border:1px solid;
    top:130px;
    left:20px;
}
div#seat-container{
	position:relative;
    width:850px;
    height:600px;
    border-radius:10px;
    background:lightgray;
    font-size:12px;
}
div#seat-container h1{
	marign:0px;
	text-align:center;
	padding-top:20px;
}
div#seat-legend ul{
    list-style:none;
    padding-left:0;
}
div#seat-legend ul li{
	margin-left:10px;
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

button#updatePlacement{
	position:relative;
	right:30px;
	float:right;
	width:150px;
	height:30px;
	color:white;
	background:rgb(255, 40, 40, .7);
	border:1px rgb(255, 40, 40, .7);
	border-radius:5px;
	cursor:pointer;
}
</style>

<span id="help"><u>도움이 필요하시면 여기를 클릭해주세요.</u></span>
<br>
<button id="updatePlacement">자리배치도 수정하기</button>
<br><br>
<div id="seat-container">
	<h1>ROMARU PC CAFE &lt;B1층&gt;</h1>
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
</div>

<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>