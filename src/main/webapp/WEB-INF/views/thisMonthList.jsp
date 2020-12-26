<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%
	GregorianCalendar cal = new GregorianCalendar();
	int thisYear = cal.get(GregorianCalendar.YEAR);
	int thisMonth = cal.get(GregorianCalendar.MONTH)+1;
%>
<title>Insert title here</title>
<style>
	#thisMonthList {text-align:center; font-size:14px; height:100px;}
	.type {width:100px;}
	.amount {width:120px;}
	.rate {width:100px;}
	.lastRate {width:100px;}
	
</style>
</head>
<body>
<table id="thisMonthList"></table>
</body>
<script>
<%-- let year = <%=thisYear%>; --%>
// let month = "02";
// let date = year +"/"+ month;

// getThisMonthList();

// function getThisMonthList() {
// 	$.ajax({
// 		type:"get",
// 		url:"thisMonthList.json",
// 		success:function(data) {
// 			var addList = "";
// 			$(data).each(function() {
// 				var date = this.date;
// 				var salesAmount = this.salesAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// 				var refundAmount = this.refundAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// 				var costAmount = this.costAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// 				var lastSalesAmount = this.lastSalesAmount;
// 				var lastRefundAmount = this.lastRefundAmount;
// 				var lastCostAmount = this.lastCostAmount;
// 				var targetSales = this.targetSales;
// 				var targetCost = this.targetCost;
// 				var strSalesRate = (this.salesAmount/targetSales)*100;
// 				var salesRate = strSalesRate.toFixed(1);
// 				var strCostRate = (this.costAmount/targetCost)*100;
// 				var costRate = strCostRate.toFixed(1);

// 				var strLastSalesRate = (this.salesAmount/this.lastSalesAmount)*100;
// 				var lastSalesRate = strLastSalesRate.toFixed(1);
// 				var strLastRefundRate = (this.refundAmount/lastRefundAmount)*100;
// 				var lastRefundRate = strLastRefundRate.toFixed(1);
// 				var strLastCostRate = (this.costAmount/lastCostAmount)*100;
// 				var lastCostRate = strLastCostRate.toFixed(1);
// 				addList += "<tr class='tr'><td class='type'>"+date+"</td><td class='amount'>이번달 발생 금액</td><td class='rate'>목표 대비 비율</td><td class='lastRate'>전월 대비 비율</td></tr>";
// 				addList += "<tr class='tr' id='salesTR'><td class='type'>매출</td><td class='amount'>￦ "+salesAmount+"</td><td class='rate' id='salesRate'>"+salesRate+"%</td><td class='lastRate' id='salesLastRate'>"+lastSalesRate+"%</td></tr>";
// 				addList += "<tr class='tr' id='refundTR'><td class='type'>환불</td><td class='amount'>￦ "+refundAmount+"</td><td class='rate'></td><td class='lastRate' id='refundLastRate'>"+lastRefundRate+"%</td></tr>";
// 				addList += "<tr class='tr' id='costTR'><td class='type'>비용</td><td class='amount'>￦ "+costAmount+"</td><td class='rate' id='costRate'>"+costRate+"%</td><td class='lastRate' id='costLastRate'>"+lastCostRate+"%</td></tr>";
// 			});
// 			$("#thisMonthList").html(addList);
			
			
// 			$("#thisMonthList").each(function() {
// 				$(this).find("#salesTR").each(function() {
// 					var strSR = $(this).find("#salesRate").html();
// 					var SR = strSR.split(".")[0];
// 					if(SR.length >= 3) {
// 						$(this).find("#salesRate").css("color", "blue");
// 					}
					
// 					var strLR = $(this).find("#salesLastRate").html();
// 					var LR = strLR.split(".")[0];
// 					if(LR.length >= 3) {
// 						$(this).find("#salesLastRate").css("color", "blue");
// 					}
// 				});
				
// 				$(this).find("#refundTR").each(function() {
// 					var strLR = $(this).find("#refundLastRate").html();
// 					var LR = strLR.split(".")[0];
// 					if(LR.length >= 3) {
// 						$(this).find("#refundLastRate").css("color", "red");
// 					}
// 				});
				
// 				$(this).find("#costTR").each(function() {
// 					var strSR = $(this).find("#costRate").html();
// 					var SR = strSR.split(".")[0];
// 					if(SR.length >= 3) {
// 						$(this).find("#costRate").css("color", "red");
// 					}
					
// 					var strLR = $(this).find("#costLastRate").html();
// 					var LR = strLR.split(".")[0];
// 					if(LR.length >= 3) {
// 						$(this).find("#costLastRate").css("color", "red");
// 					}
// 				});
// 			});
// 		}
// 	});
// }

</script>
</html>