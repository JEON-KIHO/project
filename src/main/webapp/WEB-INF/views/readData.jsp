<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> READ </title>
<style>
	#calendar {width:308px; overflow:hidden; left:10%;}
	.none {width:42px; height:50px; float:left; margin:1px;}
	.wom1, .wom2, .wom3, .wom4, .wom5, .wom6 {width:40px; height:50px; float:left; border:dotted 1px black; margin:1px;}
	
	#readData {text-align:center;}
</style>
<%
	GregorianCalendar cal = new GregorianCalendar();
	String thisYear = cal.get(GregorianCalendar.YEAR)+"";
	String thisMonth = cal.get(GregorianCalendar.MONTH)+1+"";
	String thisDay = cal.get(GregorianCalendar.DAY_OF_MONTH)+"";
%>
</head>
<body>
	
	<select id="choose">
		<option value="salesData.json" selected>매출</option>
		<option value="refundData.json">환불</option>
		<option value="costData.json">비용</option>
		<option value="depositData.json">예금</option>
		<option value="loansData.json">대출</option>
		<option value="invenData.json">재고</option>
	</select>
	
	<div id="calendarView"></div>
	<table id="readData"></table>
	
</body>
<script>
var choose = "salesData.json";
var year = <%=thisYear%>-1;
var month = <%=thisMonth%>;
var day = <%=thisDay%>;
for(var i = 1; i <= 9; i++) {
	if(day == i) {
		day = "0" + day;
	}
}
calendar();
setTimeout(updateData, 300);

$("#choose").on("change", function() {
	choose = $("#choose").val();
	$("#readData").html("");
	setTimeout(updateData, 100);
});

<%-- var year = <%=thisYear%>-1; --%>
// getMonth();
<%-- var month = <%=thisMonth%>; --%>
// var date = year +"/"+ month;
// getDay();
<%-- var day = <%=thisDay%>; --%>

// $("#btn").on("click", function() {
// 	getInvenList();
// });

$("#calendarView").on("click", "#calendar [name=wom]", function() {
	var addList = "";
	var date = $(this).find(".pleaseData").attr("id");
	if($(this).attr("style").split("background: ")[1] != "white;") {
		var URL = $("#choose option:selected").val().split("D")[0];
		
		if(URL.charAt(0) == "s" || URL.charAt(0) == "r") {
			URL = URL.charAt(0).toUpperCase() + URL.substring(1);
			URL = "read" + URL + ".json";
			$.ajax({
				type:"get",
				url:URL,
				data:{"date":date},
				success:function(data) {
					addList += "<tr><td width=300>제품</td><td width=100>결제방법</td><td width=50>수량</td><td width=100>가격</td><td width=50>유형</td></tr>";
					$(data).each(function() {
						addList += "<tr><td>"+this.CATEGORYNAME.split("/")[2]+"</td>";
						addList += "<td>"+this.PAYTYPE+"</td>";
						addList += "<td>"+this.SALESCOUNT+"</td>";
						addList += "<td>"+this.SALESAMOUNT+"</td>";
						addList += "<td>"+this.SALESTYPE+"</td></tr>";
					});
					$("#readData").html(addList);
				}
			});
		}
		if(URL.charAt(0) == "c") {
			URL = URL.charAt(0).toUpperCase() + URL.substring(1);
			URL = "read" + URL + ".json";
			$.ajax({
				type:"get",
				url:URL,
				data:{"date":date},
				success:function(data) {
					addList += "<tr><td width=150>비용내역</td><td width=100>금액</td></tr>";
					$(data).each(function() {
						addList += "<tr><td>"+this.COSTACCOUNTNAME+"</td>";
						addList += "<td>"+this.COSTAMOUNT+"</td></tr>";
					});
					$("#readData").html(addList);
				}
			});
		}
		if(URL.charAt(0) == "d") {
			URL = URL.charAt(0).toUpperCase() + URL.substring(1);
			URL = "read" + URL + ".json";
			$.ajax({
				type:"get",
				url:URL,
				data:{"date":date},
				success:function(data) {
					addList += "<tr><td width=150>계좌</td><td width=100>은행명</td><td width=150>기초잔액</td><td width=100>예금유형</td><td width=150>발생금액</td><td width=150>기말잔액</td><td width=100>이율</td></tr>";
					$(data).each(function() {
						addList += "<tr><td>"+this.DEPOSITACCOUNTCODE+"</td>";
						addList += "<td>"+this.DEPOSITACCOUNTBANKNAME+"</td>";
						addList += "<td>"+this.STARTBALANCE+"</td>";
						addList += "<td>"+this.DEPOSITTYPE+"</td>";
						addList += "<td>"+this.DEPOSITAMOUNT+"</td>";
						addList += "<td>"+this.ENDBALANCE+"</td>";
						addList += "<td>"+this.DEPOSITRATE+"</td></tr>";
					});
					$("#readData").html(addList);
				}
			});
		}
		if(URL.charAt(0) == "l") {
			URL = URL.charAt(0).toUpperCase() + URL.substring(1);
			URL = "read" + URL + ".json";
			$.ajax({
				type:"get",
				url:URL,
				data:{"date":date},
				success:function(data) {
					addList += "<tr><td width=200>계좌</td><td width=100>상환일</td><td width=150>원금</td><td width=150>상환금</td><td width=150>잔금</td></tr>";
					$(data).each(function() {
						addList += "<tr><td>"+this.LOANSACCOUNTCODE+"</td>";
						addList += "<td>"+date+"</td>";
						addList += "<td>"+this.LOANSACCOUNTAMOUNT+"</td>";
						addList += "<td>"+this.LOANSAMOUNT+"</td>";
						addList += "<td>"+this.LOANSBALANCE+"</td></tr>";
					});
					$("#readData").html(addList);
				}
			});
		}
		if(URL.charAt(0) == "i") {
			URL = URL.charAt(0).toUpperCase() + URL.substring(1);
			URL = "read" + URL + ".json";
			$.ajax({
				type:"get",
				url:URL,
				data:{"date":date},
				success:function(data) {
					addList += "<tr><td width=300>재고명</td><td width=100>기초재고</td><td width=100>입고</td><td width=100>출고</td><td width=100>기말재고</td></tr>";
					$(data).each(function() {
						addList += "<tr><td>"+this.INVENACCOUNTNAME.split("/")[1]+"</td>";
						addList += "<td>"+this.STARTINVEN+"</td>";
						addList += "<td>"+this.INVENIN+"</td>";
						addList += "<td>"+this.INVENOUT+"</td>";
						addList += "<td>"+this.ENDINVEN+"</td></tr>";
					});
					$("#readData").html(addList);
				}
			});
		}
	}
});

function updateData() {
	var date = year +"/"+ month;
	$("#calendarView").find("#calendar").find("[name=wom]").css("background", "white");
	$.ajax({
		type:"get",
		url:choose,
		data:{"date":date},
		success:function(data) {
			$(data).each(function() {
				var d = this.day;
				$("#calendarView").find("#calendar").find("[name=wom]").each(function() {
					if($(this).find(".pleaseData").attr("id") == d) {
						if(choose == "salesData.json") {
							$(this).css("background", "pink");
						}
						if(choose == "refundData.json") {
							$(this).css("background", "red");
						}
						if(choose == "costData.json") {
							$(this).css("background", "green");
						}
						if(choose == "invenData.json") {
							$(this).css("background", "yellow");
						}
						if(choose == "depositData.json") {
							$(this).css("background", "navy");
						}
						if(choose == "loansData.json") {
							$(this).css("background", "lightgray");
						}
					}
				});
			});
		}
	});
}

function calendar() {
	var date = year +"/"+ month;
	var addCalendar = "<div id='calendar'>";
	var cnt = 0;
	var cnt1 = 0;
	$.ajax({
		url:"daily.json",
		type:"get",
		data:{"date":date},
		success:function(data) {
			$(data).each(function() {
				if(this.wom == 1) {
					cnt++;
				}
			});
			
			if(cnt != 7) {
				for(var i = 0; i <7-cnt; i++) {
					addCalendar += "<div class='none'></div>";
				}
			}
			
			$(data).each(function() {
				if(this.wom == 1) {
					addCalendar += "<div class='wom1' name='wom' style='color:black;'>"+this.day.split("-")[2].substring(0,2)+"<div class='pleaseData' id='"+date+"/"+this.day.split("-")[2].substring(0,2)+"'></div></div>";
				}
				if(this.wom == 2) {
					addCalendar += "<div class='wom2' name='wom' style='color:black;'>"+this.day.split("-")[2].substring(0,2)+"<div class='pleaseData' id='"+date+"/"+this.day.split("-")[2].substring(0,2)+"'></div></div>";
				}
				if(this.wom == 3) {
					addCalendar += "<div class='wom3' name='wom' style='color:black;'>"+this.day.split("-")[2].substring(0,2)+"<div class='pleaseData' id='"+date+"/"+this.day.split("-")[2].substring(0,2)+"'></div></div>";
				}
				if(this.wom == 4) {
					addCalendar += "<div class='wom4' name='wom' style='color:black;'>"+this.day.split("-")[2].substring(0,2)+"<div class='pleaseData' id='"+date+"/"+this.day.split("-")[2].substring(0,2)+"'></div></div>";
				}
				if(this.wom == 5) {
					addCalendar += "<div class='wom5' name='wom' style='color:black;'>"+this.day.split("-")[2].substring(0,2)+"<div class='pleaseData' id='"+date+"/"+this.day.split("-")[2].substring(0,2)+"'></div></div>";
				}
				if(this.wom == 6) {
					addCalendar += "<div class='wom6' name='wom' style='color:black;'>"+this.day.split("-")[2].substring(0,2)+"<div class='pleaseData' id='"+date+"/"+this.day.split("-")[2].substring(0,2)+"'></div></div>";
				}
			});
			addCalendar += "</div>";
// 			alert(addCalendar);
			$("#calendarView").html(addCalendar);
		}
	});
}
</script>
</html>