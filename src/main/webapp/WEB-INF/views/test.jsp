<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
<title>Insert title here</title>
<%
	GregorianCalendar cal = new GregorianCalendar();
	String thisYear = cal.get(GregorianCalendar.YEAR)+"";
	String thisMonth = cal.get(GregorianCalendar.MONTH)+1+"";
	String thisDay = cal.get(GregorianCalendar.DAY_OF_MONTH)+"";
%>
<style>
	#datePage {overflow:hidden;}
	#pre, #next {width:160px; float:left;}
	#sel {float:left; overflow:hidden; width:150px; text-align:center; cursor:default;}
	#selDate {float:left; width:150px;}
	#yearList, #monthList {float:left; width:75px;}
	
</style>
</head>
<body>
<div id="datePage">
	<div id="pre">
		<input type="button" value="preYear" id="preYear">
		<input type="button" value="preMonth" id="preMonth">
	</div>
	<div id="sel">
		<div id="selDate"></div>
		<div id="yearList"></div>
		<div id="monthList"></div>
	</div>
	<div id="next">
		<input type="button" value="nextMonth" id="nextMonth">
		<input type="button" value="nextYear" id="nextYear">
	</div>
</div>
</body>
<script type="text/javascript">
$("#selDate").html(<%=thisYear%> +" / "+ <%=thisMonth%>);
$("#yearList").hide();
$("#monthList").hide();
let year = $("#selDate").html().split("/")[0];
year = year.trim();
let month = $("#selDate").html().split("/")[1];
month = month.trim();
getYear();
getMonth();

$("#selDate").on("click", function() {
	$("#yearList").slideDown();
	$("#monthList").slideDown();
	
});

$("#yearList").on("click", "#year .yData", function() {
	year = $(this).attr("id");
	getMonth();
});

$("#monthList").on("click", "#month .mData", function() {
	month = $(this).attr("id");
	$("#selDate").html(year +" / "+ month);
	$("#yearList").slideUp();
	$("#monthList").slideUp();
});

function getYear() {
	var yearList = "<div id='year'>";
	var y = 0;
	$.ajax({
		type:"get",
		url:"SRdailyYearList.json",
		dataType:"json",
		success:function(data) {
			let yArray = new Array();
			$(data).each(function() {
				y = this.year;
				yearList += "<div id='"+y+"' class='yData'>"+y+"</div>";
			});
			yearList += "</div>";
			$("#yearList").html(yearList);
		}
	});
}

function getMonth() {
	var monthList = "<div id='month'>";
	var m = 0;
	$.ajax({
		type:"get",
		url:"SRdailyMonthList.json",
		dataType:"json",
		data:{"year":year},
		success:function(data) {
			$(data).each(function() {
				m = this.month;
				monthList += "<div id='"+m+"' class='mData'>"+m+"</div>";
			});
			monthList += "</div>";
			$("#monthList").html(monthList);
		}
	});
}
</script>
</html>