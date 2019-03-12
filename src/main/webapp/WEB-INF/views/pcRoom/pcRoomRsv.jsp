<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>

<fmt:requestEncoding value="UTF-8"/>
<html>
<head>
<meta charset="UTF-8">
<title>피시방 예약하기</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
<style>


</style>
<script>

$(function(){
	console.log($("#hiddenPmContent").val());
	var tempArr = $("#hiddenPmContent").val().split(",")


	for(var i=0; i<tempArr.length; i++){
		console.log(tempArr[i]);
		var tempStr = tempArr[i].substr(0,1);
		var seatNum = tempArr[i].substr(1,);
		console.log("tempStr = "+tempStr);
		console.log("seatNum = "+ seatNum)
		
		
		$("td").eq(i).find("input[type=hidden]").val(tempStr);
		$("td").eq(i).find("div#seats").removeClass("wall");
		if(tempStr == "a") {
			$("td").eq(i).find("div#seats").addClass("plain").css("cursor", "pointer");
			$("td").eq(i).find("#legend").val(tempStr);
			$("td").eq(i).find("div#seats").append("<span id='seatNo' name='seatNo'>"+seatNum+"</span>");
		}
		if(tempStr == "b"){
			$("td").eq(i).find("#legend").val(tempStr);
			$("td").eq(i).find("div#seats").addClass("special").css("cursor", "pointer");
			$("td").eq(i).find("div#seats").append("<span id='seatNo' name='seatNo'>"+seatNum+"</span>");
		}
		if(tempStr == "c"){
			$("td").eq(i).find("#legend").val(tempStr);
			$("td").eq(i).find("div#seats").addClass("couple").css("cursor", "pointer");
			$("td").eq(i).find("div#seats").append("<span id='seatNo' name='seatNo'>"+seatNum+"</span>");
		}
		if(tempStr == "d") {$("td").eq(i).find("div#seats").addClass("toilet");$("td").eq(i).find("#legend").val(tempStr);}
		if(tempStr == "e") {$("td").eq(i).find("div#seats").addClass("exit");$("td").eq(i).find("#legend").val(tempStr);}
		if(tempStr == "f") {$("td").eq(i).find("div#seats").addClass("counter");$("td").eq(i).find("#legend").val(tempStr);}
		if(tempStr == "g") {$("td").eq(i).find("div#seats").addClass("kiosk");$("td").eq(i).find("#legend").val(tempStr);}
		if(tempStr == "h") {$("td").eq(i).find("div#seats").addClass("water");$("td").eq(i).find("#legend").val(tempStr);}
		if(tempStr == "i") {$("td").eq(i).find("div#seats").addClass("air");$("td").eq(i).find("#legend").val(tempStr);}
		if(tempStr == "j") {$("td").eq(i).find("div#seats").addClass("smoking");$("td").eq(i).find("#legend").val(tempStr);}
		if(tempStr == "k") {$("td").eq(i).find("div#seats").addClass("etc");$("td").eq(i).find("#legend").val(tempStr);}
		if(tempStr == "z") {$("td").eq(i).find("div#seats").addClass("wall");	$("td").eq(i).find("#legend").val(tempStr);}
	}
});
$(function(){
	console.log($("#hiddenSitted").val());
	
	
	var tempArr1 = $("#hiddenSitted").val().split(",");
	for(var i=0; i<tempArr1.length; i++){
		console.log(tempArr1[i]);
		$("td").eq(i).find("#isSitted").val(tempArr1[i]);

		if(tempArr1[i] == "o") $("td").eq(i).find("div#seats").addClass("sitted");
		if(tempArr1[i] == "s") $("td").eq(i).find("div#seats").addClass("reserved");

	}
});


</script>
<style>
body{
    background:skyblue;
    font-family: 'Nanum Pen Script', cursive;
    display: inline-block;
}

.reserved{
	opacity:0.3;
}
.sitted{
	opacity:0.3;

}
.selected{
	animation: selected .5s infinite;
}
@keyframes selected{
	0%{opacity:0.3}
	100%{opacity:1}
}    
div.seat {
    display: block;
    width: 30px;
    height: 30px;
    /* margin: 1px; */
    cursor: pointer;
}

div.plain{background:url("${pageContext.request.contextPath}/resources/image/manager/plain.png");}
div.special{background:url("${pageContext.request.contextPath}/resources/image/manager/special.png");}
div.couple{background:url("${pageContext.request.contextPath}/resources/image/manager/couple.png");}
div.wall{background:url("${pageContext.request.contextPath}/resources/image/manager/wall.png");}
span#seatNo{
	position:relative;
	top:3px;
	text-align:center;
	display:block;
}
div#seatNo-help{
	margin:0 auto;
}
div#seatNo-help h3{
	font-family:'Nanum Gothic', sans-serif;
}
h1#head-title{display:block;}
div#seatNo-help{
	width:530px;
	height:190px;
	margin:0 auto;
	font-family:'Nanum Gothic', sans-serif;
	border:1px solid #c8c8c8;
	border-radius:10px;
}
div#seatNo-help h4{
	margin:0px;
	margin-bottom:10px;
	margin-left:27px;
}
div#seatNo-help h4:first-of-type{
	margin-top:27px;
}
div#seatNo-status{
	width:370px;
	height:60px;
	margin:0 auto;
	text-align:center;
	margin-top:30px;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:bold;
}
h3#seatNo-help-legend{
	font-family:'Nanum Gothic', sans-serif;
	text-align:center;
}
input#currVal{
	width:40px;
	outline:none;
	border:none;
	color:red;
	font-size:17px;
	font-weight:bold;
	font-family:'Nanum Gothic', sans-serif;
}
div#productTable{
 background-color : rgba(255,255,255,0.3);
 border-radius: 10%;
 text-align : center;
 width: 450px;
 height: 270px;
}
#productT {
    display: inline-block;
    position: relative;
    left: -0px;
	font-family:'Nanum Gothic', sans-serif;
}
#productT th td tr{
    border : 1px solid black;
    
}
#placementHead{
	border-radius: 10% 10% 0% 0%;
    background-color : rgba(255,255,255,0.3);
    height:25px;
    
}
#placementFood{

	border-radius: 0% 0% 10% 10% ;
    background-color : rgba(255,255,255,0.3);
    height:25px;
}
#placementT{
    background-color : rgba(255,255,255,0.3);
 border-radius: 0;
 text-align : center;
 width: 450px;
 height: 270px;
}
#myCash{
    display:inline-block;
    text-align: center;    background-color : rgba(255,255,255,0.3);
 border-radius: 10%;
 color:rgba(255,255,255,0.9);
}
#cash{
    display :inline-block;
    color:darkblue;
    text-decoration: underline;
}
img{
	opacity: .5;
}
input{
 radius: 10%;
 width: 50px;
  border-radius: 10px;
  background-color: rgba(255,255,255,0.5);


}
input[type=button]{
    width:75px;
}
#ppNum{
    background-color: rgba(255,255,255,0.3);
    width: 270px;
    height: 30px;
    border-radius: 10px;
    left: 82px;
    position: relative;
    
}
#bodyNext{
        text-align: center;
    position: relative;
    left: 60%;
}
.floorNum_{
	height:30px;
}
</style>
</head>
<body>
<div id="myCash">
현재<div id="cash">${memberId }</div>님의 잔여케쉬는 <div id="cash">${cash }</div>입니다.
</div>
<div id="bodyNext">
<div id="ppNum">
<label for="">
    자리를 예약할 사람의 수: 
    </label>
    <input type="number" class="num" id="num" name="num"/>명
</div>
<img src="${pageContext.request.contextPath }/resources/image/pcRoom/let.png">
<c:forEach var="rsv" items="${rsv }" varStatus="cnt">
	<input type="hidden" id="hiddenPmContent" value="${rsv.pmContent }"/>
	<input type="hidden" id="hiddenSitted" value="${rsv.sitted }"/>
	<input type="hidden" id="pcRoomNo" value="${rsv.pmPcRoomNo }"/>
    
    <div id="placementT">
	    <table id="placement">
	    
        <h2 class="floorNum_">${rsv.pmFloor } 층</h2>
		    <c:forEach var="i" begin="1" end="${rsv.pmRow }" step="1">
			    <tr>
				    <c:forEach var="j" begin="1" end="${rsv.pmCol }" step="1">
					    <td>
						    <div id="seats" class="seat wall">
							    <input type="hidden" id="legend"/>
							    <input type="hidden" id="isSitted" />
						    </div>
					    </td>
    				</c:forEach>
	    		</tr>		
		    </c:forEach>
	    </table>
    
    <br><br><br>
	</div>
    
</c:forEach>

<img src="${pageContext.request.contextPath }/resources/image/pcRoom/let.png">
<div id="productTable">
	<table id="productT">
		<tr>
			<th>가격</th>
			<th>상품이름</th>
			<th>갯수</th>
		</tr>
	<c:forEach var="prd" items="${product }" varStatus="cnt">
		<tr id="productTr">
			<td id="price">1000원</td>
			<td id="prdTime">${prd.pl1000 }분</td>
			<td><input type="number" id="productEA"/></td>
		</tr>
		<tr id="productTr">
			<td id="price">2000원</td>
			<td id="prdTime">${prd.pl2000 }분</td>
			<td><input type="number" id="productEA"/></td>
		</tr>
		<tr id="productTr">
			<td id="price">3000원</td>
			<td id="prdTime">${prd.pl3000 }분</td>
			<td><input type="number" id="productEA"/></td>
		</tr>
		<tr id="productTr">
			<td id="price">5000원</td>
			<td id="prdTime">${prd.pl5000 }분</td>
			<td><input type="number" id="productEA"/></td>
		</tr>
		<tr id="productTr">
			<td id="price">10000원</td>
			<td id="prdTime">${prd.pl10000 }분</td>
			<td><input type="number" id="productEA"/></td>
		</tr>
		<tr id="productTr">
			<td id="price">20000원</td>
			<td id="prdTime">${prd.pl20000 }분</td>
			<td><input type="number" id="productEA"/></td>
		</tr>
		<tr id="productTr">
			<td id="price">30000원</td>
			<td id="prdTime">${prd.pl30000 }분</td>
			<td><input type="number" id="productEA"/></td>
		</tr>
		<tr id="productTr">
			<td id="price">50000원</td>
			<td id="prdTime">${prd.pl50000 }분</td>
			<td><input type="number" id="productEA"/></td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="3"><input type="button" onclick="letRsv()" value="예약하기"></input></td>
		</tr>
	</table>
</div>
</div>
 </body>
 
 
 
 
 
 
<script>

var max = 0;
//예약할 사람 최대 숫자 설정
$("#num").change(function(){
  max = $("#num").val();
	console.log("max="+max);
});
var totalPrice = 0;
var totalTime = 0;
function test(){
	var tempPrice =0;
	var tempTime =0;
	$("Tr[id=productTr]").each(function(){
			var b = $(this).find("#price").html().replace(/[^0-9]/g,'');
			console.log("가격"+b);
			var c = $(this).find("#productEA").val();
			console.log("갯수"+c);
			tempPrice += b*c;
			var e = $(this).find("#prdTime").html();
			var d = e.replace(/[^0-9]/g,'');
			tempTime += d*c;
	});
	tempPrice = tempPrice*max;
	tempTimea = tempTime/60+"시간"+tempTime%60+"분";
	if(confirm("총 "+max+"명의 "+tempTimea+"을 합한 가격"+tempPrice+"입니다. 확인해주세요.")){
		totalPrice = tempPrice;
		totalTime = tempTime;
		}
};
var selectedArr = new Array();
var cnt=0;
$(".seat").click(function(){
	
	var class_=$(this).prop("class");
	var seatNo = $(this).find("#seatNo").html();

	if(class_.indexOf("sitted")>-1){
		alert("현재 이용중인 좌석입니다.");
	}else if(class_.indexOf("reserved")>-1){
		alert("예약된 자석입니다.");
	}else{
  		if(max>cnt){
	      	if(class_.indexOf("selected")<0){	
	          $(this).addClass("selected");
	  		  $(this).find("#isSitted").val("s"); //예약된 자리는 s로 표시
	          
	          selectedArr.push(seatNo);
	          
	          
	          cnt++;
	      	}else if(class_.indexOf("selected")>-1){
	          $(this).removeClass("selected");

	  		  $(this).find("#isSitted").val("x");

	          var selectedTemp = new Array();
	          
	          for(var i=0;i<selectedArr.length;i++){
	        	 if(selectedArr[i]!=seatNo){
	        		selectedTemp.push(selectedArr[i]);  
	        	  }
	          }
	          selectedArr = selectedTemp;
	          console.log(selectedArr);
	          cnt--;
	      	}
  		}else if(max<=cnt){
      		if(class_.indexOf("selected")>-1){
          		$(this).removeClass("selected");
          		cnt--;
      		}else{
          		alert("설정하신 인원수인 "+max+"명을 초과하였습니다.");}
  		}
	}
});

var pmContent = "";
var sitted = "";
var pcRoomNo = $(document).find("#pcRoomNo").val();	
var memberId = "${memberId}";
var cash = $("#cash").html();
function letRsv(){
	var timeSet = $("#time").val();
	var rsvNo = selectedArr.valueOf();
	var tempPrice =0;
	var tempTime =0;
	$("Tr[id=productTr]").each(function(){
			var b = $(this).find("#price").html().replace(/[^0-9]/g,'');
			console.log("가격"+b);
			var c = $(this).find("#productEA").val();
			console.log("갯수"+c);
			tempPrice += b*c;
			var e = $(this).find("#prdTime").html();
			var d = e.replace(/[^0-9]/g,'');
			tempTime += d*c;
	});
	tempPrice = tempPrice*max;
	tempTimea = tempTime/60+"시간"+tempTime%60+"분";
	if(confirm("총 "+max+"명의 "+tempTimea+"을 합한 가격"+tempPrice+"입니다. 확인해주세요.")){
		totalPrice = tempPrice;
		totalTime = tempTime;
		}
	
	if(cnt!=max){alert("좌석 수를 확인해주세요.")}
	else{
		if(totalPrice > cash){alert("케쉬가 부족합니다.")}
		else{
			var sittedTemp = "";
				$("table[id=placement]").each(function(){
					$(this).find("td").each(function(){
						sittedTemp += $(this).find("input[id=isSitted]").val()+ ",";
					});
					sitted = sittedTemp.substr(0,sittedTemp.length-1);
					console.log("pmContent = "+pmContent+",   sitted = "+sitted);
				});
				var seatNo = "";
				for(var a=0 ; a<selectedArr.length; a++){
					seatNo += selectedArr[a]+",";
				}
				$.ajax({
					url : "${pageContext.request.contextPath}/pcRoom/pcRoomRsvSet.do",
					data : {sitted : sitted, pcRoomNo : pcRoomNo, timeSet : timeSet, rsvNo : seatNo},
					type : "post",
					success:function(){
						
						opener.location.href="${pageContext.request.contextPath}/pcRoom/pcRoomRsvEnd.do"
						window.close();
					},
					error : function(){
						console.log("실패");
					}
				});
			}
		
	}
};

</script>
</html></html>