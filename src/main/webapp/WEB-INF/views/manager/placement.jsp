<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="사장님 모드" name="pageTitle"></jsp:param>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/managerFixMenu.jsp">
	<jsp:param value="자리배치도" name="smallTitle"></jsp:param>
</jsp:include>

<style>
span#help{
	font-size:13px;
	cursor:pointer;
}

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
div#seats{
    display:inline-block;
    width:850px;
    height:500px;
    border:1px solid;
    margin:0 auto;
    margin-top:50px;
}
</style>

<span id="help"><u>도움이 필요하시면 여기를 클릭해주세요.</u></span>
<br><br>

<div id="seat-outer-container">
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


<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>