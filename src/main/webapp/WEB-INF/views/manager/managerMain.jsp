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
	<jsp:param value="안녕하십니까, ${loggedInUser.managerId }님 ? 오늘의 예약손님 통계를 활용해 보세요." name="smallTitle"></jsp:param>
</jsp:include>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.js"></script>

<style>
div.container{
	position:relative;
	width:700px;
	margin:0 auto;
	font-family:'Nanum Gothic', sans-serif;
}
div.panel-group{
	position:relative;
	width:100%;
	margin:0 auto;
}
</style>


<script>
var barChartData = {
	labels: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
	datasets: [{
		label: '건 수',
		backgroundColor: "#33E240",
		data: 
			[20, 25, 19, 30, 33, 27, 34],				
		
	},  ]
};
	
window.onload = function() {
	var ctx = document.getElementById("canvas").getContext("2d");
	window.myBar = new Chart(ctx, {
		type: 'bar',
		data: barChartData,
		options: {
			responsive: true,
			maintainAspectRatio:true,
			legend: {
				position: 'top',
				fontSize: 30,
			},
			tooltips: {
				mode: 'index',
				intersect: false
			},
			responsive: true,
			scales: {
				xAxes: [{
					stacked: true,
					scaleLabel: {
						display: true,
						labelString: '요일'
					}
				}],
				yAxes: [{
					stacked: true,
					scaleLabel: {
						display: true,
						labelString: '건수'
					}
				}]
			}
		}
});}
</script>

<br><br>
<h4 id="title_help" style="text-align:center; padding-top:10px;">지난 1주일 예약 건수 그래프</h4>
<div class="container">
    <div class="panel-group">
		<div class="panel panel-primary">
            <div class="panel-body">											
                <canvas id="canvas"></canvas>
            </div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/managerFixMenu_foot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>