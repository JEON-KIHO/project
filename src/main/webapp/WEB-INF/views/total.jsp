<%@page import="java.util.GregorianCalendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="../resources/style.css">
<link rel="stylesheet" href="../resources/icono.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	GregorianCalendar cal = new GregorianCalendar();
	int thisYear = cal.get(GregorianCalendar.YEAR);
	int thisMonth = cal.get(GregorianCalendar.MONTH)+1;
%>
<title> 통계 </title>
<style>
   #yearlyData {margin-top:180px;}
   #yearlyData, #monthlyData, #DLData {margin-left:50px; margin-right:2%;}
   #yearlyData, #monthlyData, #DLData {overflow:hidden;}
   #yearlyAmountChart, #yearlyPayTypeChart, #monthlyAmountChart, #monthlyPayTypeChart, #yearlyCategoryChart, #monthlyCategoryChart {float:left;}
   #yearlyAmountChart, #monthlyAmountChart {width:900px; height:300px;}
   #totalMonthlyBalance {width:1500px; height:400px;}
   #yearlyPayTypeChart, #monthlyPayTypeChart, #yearlyCategoryChart, #monthlyCategoryChart {width:300px; height:300px;}
   #sel {margin-left:900px; overflow:hidden;}
   .sel, .selPayType {float:left;}
   #divCenter {width: 1600px; height:1000px; margin-top: 150px; margin-left: 200px; margin-bottom:100px;}
   span {color:black;}
   
      select {
  width: 60px;
  padding: .8em .5em;
  font-family: inherit;
  font-size:13px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #ccc;
  border-radius: 5px;
  text-align:center;
  }
  *:focus { outline: none; }
</style>
</head>
<body>
<div id="divCenter">
<div id="yearlyData">
   <div id="sel">
      <div id="selYear" class="sel"></div>
      <div id="selYearlyPayType" class="selPayType">
         <select id="yearlyPayType">
            <option value="매출" selected>매출</option>
            <option value="환불">환불</option>
         </select>
         <input type="hidden" id="btnYear">
         <input type="hidden" id="btnMonth">
      </div>
   </div>
   <div id="yearlyAmountChart"></div>
   <div id="yearlyPayTypeChart"></div>
   <div id="yearlyCategoryChart"></div>
</div>

<div id="monthlyData">
   <div id="sel">
      <div id="selMonth" class="sel"></div>
      <div id="selMonthlyPayType" class="selPayType">
         <select id="monthlyPayType">
            <option value="매출" selected>매출</option>
            <option value="환불">환불</option>
         </select>
      </div>
   </div>
   <div id="monthlyAmountChart"></div>
   <div id="monthlyPayTypeChart"></div>
   <div id="monthlyCategoryChart"></div>
</div>

<div id="DLData">
   <div id="totalMonthlyBalance"></div>
</div>
</div>
<jsp:include page="menu.jsp"></jsp:include>
<div id="footer"><jsp:include page="footer.jsp" /></div>
</body>
<script type="text/javascript">
// var Array = ['매출', '환불', '비용'];
let year = <%=thisYear%>;
let month = <%=thisMonth%>;
let date = year+"/"+month;
var yearlyPayTypeURL = "salesYearlyPayTypeList.json";
var monthlyPayTypeURL = "salesMonthlyPayTypeList.json";
var yearlyCategoryURL = "salesYearlyCategoryList.json";
var monthlyCategoryURL = "salesMonthlyCategoryList.json";
var yearlyPayTypeTitle = "연간 결제 타입별 매출";
var monthlyPayTypeTitle = "월간 결제 타입별 매출";
var yearlyCategoryTitle = "연간 상품별 매출";
var monthlyCategoryTitle = "월간 상품별 매출";

getYear();

yearStart();
monthStart();
lightBox();
setTimeout(outLightBox, 700);
// yearlyAmountChart();
// monthlyAmountChart();
// yearlyPayTypeChart();
// monthlyPayTypeChart();
// yearlyCategoryChart();
// monthlyCategoryChart();
// totalYearlyBalance();

function yearStart() {
	yearlyAmountChart();
	yearlyPayTypeChart();
	yearlyCategoryChart();
	totalYearlyBalance();
}

function monthStart() {
	month = $("#btnMonth").val();
	monthlyAmountChart();
	monthlyPayTypeChart();
	monthlyCategoryChart();
}

$("#yearlyPayType").on("change", function() {
	if($(this).val() == "매출") {
		yearlyPayTypeURL = "salesYearlyPayTypeList.json";
		yearlyCategoryURL = "salesYearlyCategoryList.json";
		yearlyPayTypeTitle = "연간 결제 타입별 매출";
		yearlyCategoryTitle = "연간 상품별 매출";
		$(this).prop("selected", true);
		yearlyPayTypeChart();
		yearlyCategoryChart();
	}
	if($(this).val() == "환불") {
		yearlyPayTypeURL = "refundYearlyPayTypeList.json";
		yearlyCategoryURL = "refundYearlyCategoryList.json";
		yearlyPayTypeTitle = "연간 결제 타입별 환불";
		yearlyCategoryTitle = "연간 상품별 환불";
		$(this).prop("selected", true);
		yearlyPayTypeChart();
		yearlyCategoryChart();
	}
});

$("#monthlyPayType").on("change", function() {
	if($(this).val() == "매출") {
		monthlyPayTypeURL = "salesMonthlyPayTypeList.json";
		monthlyCategoryURL = "salesMonthlyCategoryList.json";
		monthlyPayTypeTitle = "월간 결제 타입별 매출";
		monthlyCategoryTitle = "월간 상품별 매출";
		$(this).prop("selected", true);
		monthlyPayTypeChart();
		monthlyCategoryChart();
	}
	if($(this).val() == "환불") {
		monthlyPayTypeURL = "refundMonthlyPayTypeList.json";
		monthlyCategoryURL = "refundMonthlyCategoryList.json";
		monthlyPayTypeTitle = "월간 결제 타입별 환불";
		monthlyCategoryTitle = "월간 상품별 환불";
		$(this).prop("selected", true);
		monthlyPayTypeChart();
		monthlyCategoryChart();
	}
});

$("#selYear").on("change", "#year", function() {
	year = $(this).val();
	getMonth();
	yearlyPayTypeChart();
	yearlyCategoryChart();
	totalYearlyBalance();
});

$("#selMonth").on("change", "#month", function() {
	month = $(this).val();
	monthlyPayTypeChart();
	monthlyCategoryChart();
});

function totalYearlyBalance() {
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
   		function drawVisualization() {
         	$.ajax({
             	type:"get",
	            url:"totalMonthlyBalance.json",
	            dataType:"json",
	            data:{"year":year},
             	success:function(result){
//                  var result = [["과목","점수"],["국어",90],["영어",80]];
                 	var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                 	var options = {
                 			title : '자산 통계',
                 			vAxis : {
                 				minValue : 0
                 			},
                 			series : {
                 				0: {color: 'pink'},
                 				1: {color: 'lightgray'},
                 				2: {color: 'skyblue', type: 'line', lineWidth: 4}
                 				
                 			},
//                  			legend : 'none'
                 			}; /* 옵션 셋팅 */
                 	var chart = new google.visualization.AreaChart(document.getElementById('totalMonthlyBalance'));
                 		chart.draw(data, options); /* 차트 그리기 */
             	}
         	});
     	}
}

function yearlyCategoryChart() {
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
   		function drawVisualization() {
         	$.ajax({
             	type:"get",
	            url:yearlyCategoryURL,
	            dataType:"json",
	            data:{"year":year},
             	success:function(result){
//                  var result = [["과목","점수"],["국어",90],["영어",80]];
                 	var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                 	var options = {
                 			title : yearlyCategoryTitle,
                 			vAxis : {
                 				minValue : 0
                 			},
                 			series : {
                 				0: {color: 'pink'},
                 				1: {color: 'lightgray'},
                 				2: {color: 'skyblue', type: 'line', lineWidth: 4}
                 				
                 			},
                 			seriesType :'bars',
                 			bar : {
                 				groupWidth : '20%' // 그래프 너비 설정 %
                 			},
//                  			legend : 'none'
                 			}; /* 옵션 셋팅 */
                 	var chart = new google.visualization.PieChart(document.getElementById('yearlyCategoryChart'));
                 		chart.draw(data, options); /* 차트 그리기 */
             	}
         	});
     	}
}

function monthlyCategoryChart() {
	date = year +"/"+ month;
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
   		function drawVisualization() {
         	$.ajax({
             	type:"get",
	            url:monthlyCategoryURL,
	            dataType:"json",
	            data:{"date":date},
             	success:function(result){
//                  var result = [["과목","점수"],["국어",90],["영어",80]];
                 	var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                 	var options = {
                 			title : monthlyCategoryTitle,
                 			vAxis : {
                 				minValue : 0
                 			},
                 			series : {
                 				0: {color: 'pink'},
                 				1: {color: 'lightgray'},
                 				2: {color: 'skyblue', type: 'line', lineWidth: 4}
                 				
                 			},
                 			seriesType :'bars',
                 			bar : {
                 				groupWidth : '20%' // 그래프 너비 설정 %
                 			},
//                  			legend : 'none'
                 			}; /* 옵션 셋팅 */
                 	var chart = new google.visualization.PieChart(document.getElementById('monthlyCategoryChart'));
                 		chart.draw(data, options); /* 차트 그리기 */
             	}
         	});
     	}
}

function yearlyPayTypeChart() {
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
   		function drawVisualization() {
         	$.ajax({
             	type:"get",
	            url:yearlyPayTypeURL,
	            dataType:"json",
	            data:{"year":year},
             	success:function(result){
//                  var result = [["과목","점수"],["국어",90],["영어",80]];
                 	var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                 	var options = {
                 			title : yearlyPayTypeTitle,
                 			vAxis : {
                 				minValue : 0
                 			},
                 			series : {
                 				0: {color: 'pink'},
                 				1: {color: 'lightgray'},
                 				2: {color: 'skyblue', type: 'line', lineWidth: 4}
                 				
                 			},
                 			seriesType :'bars',
                 			bar : {
                 				groupWidth : '20%' // 그래프 너비 설정 %
                 			},
//                  			legend : 'none'
                 			}; /* 옵션 셋팅 */
                 	var chart = new google.visualization.PieChart(document.getElementById('yearlyPayTypeChart'));
                 		chart.draw(data, options); /* 차트 그리기 */
             	}
         	});
     	}
}

function monthlyPayTypeChart() {
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
   		function drawVisualization() {
         	$.ajax({
             	type:"get",
	            url:monthlyPayTypeURL,
	            dataType:"json",
	            data:{"year":year, "month":month},
             	success:function(result){
//                  var result = [["과목","점수"],["국어",90],["영어",80]];
                 	var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                 	var options = {
                 			title : monthlyPayTypeTitle,
                 			vAxis : {
                 				minValue : 0
                 			},
                 			series : {
                 				0: {color: 'pink'},
                 				1: {color: 'lightgray'},
                 				2: {color: 'skyblue', type: 'line', lineWidth: 4}
                 				
                 			},
                 			seriesType :'bars',
                 			bar : {
                 				groupWidth : '20%' // 그래프 너비 설정 %
                 			},
//                  			legend : 'none'
                 			}; /* 옵션 셋팅 */
                 	var chart = new google.visualization.PieChart(document.getElementById('monthlyPayTypeChart'));
                 		chart.draw(data, options); /* 차트 그리기 */
             	}
         	});
     	}
}

function monthlyAmountChart(){
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
   		function drawVisualization() {
         	$.ajax({
             	type:"get",
	            url:"totalMonthlyAmount.json",
	            dataType:"json",
	            data:{"year":year},
             	success:function(result){
//                  var result = [["과목","점수"],["국어",90],["영어",80]];
                 	var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                 	var options = {
                 			vAxis : {
                 				minValue : 0
                 			},
                 			series : {
                 				0: {color: 'pink'},
                 				1: {color: 'lightgray'},
                 				2: {color: 'skyblue', type: 'line', lineWidth: 4}
                 				
                 			},
                 			seriesType: 'bars',
                 			bar : {
                 				groupWidth : '20%' // 그래프 너비 설정 %
                 			},
//                  			legend : 'none'
                 			}; /* 옵션 셋팅 */
                 	var chart = new google.visualization.ComboChart(document.getElementById('monthlyAmountChart'));
                 		chart.draw(data, options); /* 차트 그리기 */
             	}
         	});
     	}
 }
 
function yearlyAmountChart(){
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
   		function drawVisualization() {
         	$.ajax({
             	type:"get",
	            url:"totalYearlyAmount.json",
	            dataType:"json",
             	success:function(result){
//                  var result = [["과목","점수"],["국어",90],["영어",80]];
                 	var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                 	var options = {
                 			vAxis : {
                 				minValue : 0
                 			},
                 			series : {
                 				0: {color: 'pink'},
                 				1: {color: 'lightgray'},
                 				2: {color: 'skyblue', type: 'line', lineWidth: 4}
                 				
                 			},
                 			seriesType :'bars',
                 			bar : {
                 				groupWidth : '20%' // 그래프 너비 설정 %
                 			},
//                  			legend : 'none'
                 			}; /* 옵션 셋팅 */
                 	var chart = new google.visualization.ComboChart(document.getElementById('yearlyAmountChart'));
                 		chart.draw(data, options); /* 차트 그리기 */
             	}
         	});
     	}
 }
 
function getYear() {
	var yearOption = "<select name='year' id='year' class='selDate'>";
	var daily;
	var y = 0;
	$.ajax({
		type:"get",
		url:"totalYearList.json",
		dataType:"json",
		success:function(data) {
			$(data).each(function() {
				daily = this.day;
				var year = daily.split("-")[0];
				var oldY = year;
				if(oldY != y) {
					yearOption += "<option value='"+oldY+"'>"+oldY+"년</option>";
				}
				y = oldY;
			});
			yearOption += "</select>";
			$("#selYear").html(yearOption);
			$("#selYear").find("#year").val(y).prop("selected", true);
			$("#btnYear").val(y);
			getMonth();
		}
	});
}

function getMonth() {
	var monthOption = "<select name='month' id='month' class='selDate'>";
	var daily;
	var m = 0;
	$.ajax({
		type:"get",
		url:"totalMonthList.json",
		dataType:"json",
		data:{"year":year},
		success:function(data) {
			$(data).each(function() {
				daily = this.day;
				var month = daily.split("-")[1];
				var oldM = month;
				if(oldM != m) {
					monthOption += "<option value='"+oldM+"'>"+oldM+"월</option>";
				}
				m = oldM;
			});
			monthOption += "</select>";
			$("#selMonth").html(monthOption);
			$("#selMonth").find("#month").val(m).prop("selected", true);
			$("#btnMonth").val(m);
			Month = m;
			monthStart();
		}
	});
}

</script>
</html>