<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>코인 충전</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/chargeCoin.css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">
</head>
<body>
	<div id="chargeCoin-Container">
		<h2>&lt; 케쉬 충전 &gt;</h2>
		<form action="<%=request.getContextPath()%>/member/chargeCoinEnd"
			name="chargeCoinFrm" id="chargeCoinFrm" method="post">
			<input type="hidden" name="memberId" id="memberId" value="${memberId }" />
			<table>
				<tr>
					<td>
						<input type="number" name="cash" step="1000">원 충전
						
				<button id="check_module" type="button">결제하기</button>
				

		</form>
	</div>
	<script>
	$("#check_module").click(function() {
        var IMP = window.IMP; // 생략가능
        var radioVal = $('input[name="cash"]').val();
        var productName = $('input[name="cash"]').val()+"원 충전";
        IMP.init('imp92461404'); // 부여받은 "가맹점 식별코드"를 사용
        IMP.request_pay({
           pg : 'html_5inicis', // version 1.1.0부터 지원. html5_inicis':이니시스(웹표준결제)
           pay_method : 'card', // 'card':신용카드, 
           merchant_uid : 'EscapeRoom_' + new Date().getTime(),
           name : productName, //결제창에서 보여질 이름
           amount : radioVal, //가격 
           buyer_email : '', // 구매자 이메일
           // 구매자명	
           buyer_name : '${memberId}', 
           buyer_tel : '' // 구매자 연락처
        }, function(rsp) {
           if (rsp.success) {
              var msg = '결제가 완료되었습니다.';
              
              msg += '고유ID : ' + rsp.imp_uid;
              msg += '상점 거래ID : ' + rsp.merchant_uid;
              msg += '결제 금액 : ' + rsp.paid_amount;
              msg += '카드 승인번호 : ' + rsp.apply_num;
        	  location.href ="${pageContext.request.contextPath}/pcRoom/buyCashEnd.do?memberId=${memberId}&cash="+radioVal;

           } else {
              var msg = '결제에 실패하였습니다.';
              msg += '에러내용 : ' + rsp.error_msg;
	          alert(msg);
           }
        });
     });
	</script>
</body>
</html>


	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>	