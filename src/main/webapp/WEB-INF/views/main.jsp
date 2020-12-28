<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<title>Triple S</title>
<link rel="stylesheet" href="../resources/style.css">
<link rel="stylesheet" href="../resources/icono.css">
<%
   GregorianCalendar cal = new GregorianCalendar();
   String thisYear = cal.get(GregorianCalendar.YEAR)+"";
   String thisMonth = cal.get(GregorianCalendar.MONTH)+1+"";
   String thisDay = cal.get(GregorianCalendar.DAY_OF_MONTH)+"";
%>
</head>
<style>
   #btnUpdate{margin-left:10px;margin-top:10px;}
   #calendar {width:1344px; overflow:hidden;margin-left:50px;margin-top:20px; border:solid 1px white;}
   .wom1, .wom2, .wom3, .wom4, .wom5, .wom6 {width:190px; height:130px; float:left; border:solid 1px #EAEAEA; background-color:white;}
   #datePage {overflow: hidden;margin:15px 0px 0px 450px;height:60px;width:600px; text-align:center;}
   
	#yearList, #monthList {float:left; width:75px;}
	
	#pre, #next {width:160px; float:left;}
   #sel {float:left; overflow:hidden; width:150px; text-align:center; cursor:default; z-index:500;}
   #selDate {float:left; width:150px; font-size:25px;}
   #close:hover, .yData:hover, .mData:hover, #selDate:hover {color:#ccc;}
   
   #costDetail {overflow:hidden; width:400px;}
   .costAccountName, .costAmount, .total, .monthlyCost {float:left;}
   .costAccountName {width:200px;}
   .costAmount {width:200px;}
   .total {width:200px;}
   .monthlyCode {width:200px;}
   #data {overflow:hidden; width:1600px;}
   #calendarView, #costDetail {float:left;}
   #calendarView {width:1344px;}
   #costDetail {margin-left:20px; width:400px;}
   .pleaseData {height:100px;}
   #costList{width:200px;height:350px;float:right;padding:30px 15px 30px 15px; font-size:20px;
   margin-top:100px;margin-bottom:150px;}
   #detail{float:right;height:309;font-size:20px;}
 
 #preYear {border:0; background:#f0f1f4; font-size:25px;}
#preYear:focus{outline: none;}
#preMonth {border:0; background:#f0f1f4;font-size:25px;}
#preMonth:focus{outline: none;}
#nextMonth {border:0; background:#f0f1f4;font-size:25px;}
#nextMonth:focus{outline: none;}
#nextYear {border:0; background:#f0f1f4;font-size:25px;}
#nextYear:focus{outline: none;}



   #darken-background {
 position:absolute;
 top:0px;
 left:0px;
 right:0px;
 height:100%;
 display:none;
 background:rgba(0, 0, 0, 0.5);
 z-index:10000;
 overflow:hidden;
 }
 #lightbox {
 width:900px;
 margin:20px auto;
 margin-top:70px;
 padding:15px;
 border-radius:5px;
 background:white;
 box-shadow:0px 5px 5px rgba(34, 25, 25, 0.4);
 text-align:center;
 overflow:hidden;
 
 }
#typeList{border:1px solid black;width:850px;margin-top:50px;padding:20px 0px 20px 0px;}

  .selDate{text-align:center;}
  #frm{width:600px;height:500px; float:left;margin-left:20px;}
  #frm1{width:600px;height:300px; float:left;margin-left:20px;}
  #divCenter {
   width: 1450px;
   height: 950px;
   margin-top: 170px;
   margin-left: 230px;
   margin-bottom:100px;
   background-color:#f0f1f4;
   border:1px solid #597484;
}
   *:focus { outline: none; }

   span {color:black;}
   
   #divClose {width:150px; overflow:hidden;}
  #close {float:right; margin:5px 15px 0px 0px; font-size:20px;}
   
    #dailyLightBox {
   position: absolute;
   top: 0px;
   left: 0px;
   right: 0px;
   height: 100%;
   display: none;
   background: rgba(0, 0, 0, 0.1);
   z-index: 10000;
   overflow: hidden;
}

#dailyBox {
   margin: 235px auto;
   margin-left:855px;
   width:150px;
   height:300px;
   color:white;
   background: rgba(0, 0, 0, 0.8);
}
   
</style>
<body>
   <jsp:include page="menu.jsp"></jsp:include>
   <div id="divCenter">
   <div id="datePage">
   <div id="pre">
      <input type="button" value="《" id="preYear">
      <input type="button" value="〈" id="preMonth">
   </div>
   <div id="sel">
		<div id="selDate"></div>
		<div id="dailyLightBox">
      <div id="dailyBox">
      <div id="divClose"><div id="close">X</div></div>
	      <div id="yearList"></div>
      	  <div id="monthList"></div>
      	  </div>
      </div>
	</div>
   <div id="next">
      <input type="button" value="〉" id="nextMonth">
      <input type="button" value="》" id="nextYear">
   </div>
</div>
<!--라이트 박스-->
<div id="darken-background">
 <div id="lightbox">
 <button id="btnCancel" 
style="border: 0; background: white; color: gray; font-size: 20px; float: right; color: gray;">X</button>
 <div id="frm"></div>
 <div id="detail"></div>
 <div id="frm1"></div>
 </div>
 </div>
<div id="data">
   <div id="calendarView"></div>
</div>
</div>
   <div id="footer"><jsp:include page="footer.jsp" /></div>
</body>
   <script>
   $("#dailyLightBox").hide();
   $("#selDate").html(<%=thisYear%>-1 +"/"+ <%=thisMonth%>);
   let year = $("#selDate").html().split("/")[0];
   year = year.trim();
   let month = $("#selDate").html().split("/")[1];
   month = month.trim();
   let date = year +"/"+ month;
   let amount;
   getYear();
   getMonth();
   start();
   
      
function start() {
	lightBoxController();
	yearCount();
	monthCount();
	calendar();
}

      $(document).ready(function(){
          function showLight(){
           $("#darken-background").show();
          }
         function hideLight() {
          $("#darken-background").hide();
         }
          $("#data").on("click", "#calendarView #calendar [name=wom] .pleaseData", function() {
            if($(this).html()) {
               showLight();
            }
         });
          $("#btnCancel").on("click", function() {
             hideLight();
          });
          $("#darken-background").on("click", function() {
        	  $("#darken-background").hide(); 
          });
      });

//       $("#calendarView").on("click", "#calendar [name=wom]", function() {
//             date = $(this).find(".pleaseData").attr("id");
//             getData();
//          });
      
    //매출,환불총액
      $("#calendarView").on("click", "#calendar [name=wom] .pleaseData", function() {
    	  date = $(this).attr("id");
    	  setTimeout(getCostRefundList, 100);
    	  setTimeout(getCategoryList, 150);
    	  getData();
      });

      
      
      
      $("#close").click(function() {
    		$("#dailyLightBox").hide();
    	});
      
      $("#selDate").on("click", function() {
    	  $("#dailyLightBox").show();
    	});

    	$("#yearList").on("click", "#year .yData", function() {
    		year = $(this).attr("id");
    		getMonth();
    	});

    	$("#monthList").on("click", "#month .mData", function() {
    		month = $(this).attr("id");
    		$("#selDate").html(year +"/"+ month);
    		$("#dailyLightBox").hide();
    		start();
    	});
    	
  	$("#preYear").on("click", function() {
  			year--;
  			date = year +"/"+ month;
  			$("#selDate").html(year +"/"+ month);
  			preMonthControl();
  		});

  		$("#nextYear").on("click", function() {
  			year++;
  			date = year +"/"+ month;
  			$("#selDate").html(year +"/"+ month);
  			nextMonthControl();
  		});

  	$("#preMonth").on("click", function() {
  		   month = $("#selDate").html().split("/")[1];
  		   month = month.trim();
  		if(month == 01 || month == 1) {
  			year--;
  			getMonth();
  			month = "12";
  		} else {
  			month--;
  			for(var i = 1; i <= 9; i++) {
  				if(month == i) {
  					month = "0" + i;
  				}
  			}
  		}
  		date = year +"/"+ month;
  		$("#selDate").html(year +"/"+ month);
  		start();
  	});
  	
  	$("#nextMonth").on("click", function() {
  		month = $("#selDate").html().split("/")[1];
  		   month = month.trim();
  		if(month == 12) {
  			year++;
  			getMonth();
  			month = "01";
  		} else {
  			month++;
  			for(var i = 1; i <= 9; i++) {
  				if(month == i) {
  					month = "0" + i;
  				}
  			}
  		}
  		date = year +"/"+ month;
  		$("#selDate").html(year +"/"+ month);
  		start();
  	});
      
      function yearCount() {
		   $.ajax({
			  type:"get",
			  url:"mainYearList.json",
			  success:function(data) {
				  let yArray = new Array();
				  $(data).each(function() {
					 yArray.push(this);
				  });
				  var first = "20" + yArray[0];
				  var last = "20" + yArray[yArray.length-1];
				  
				  if(year == first) {
					  $("#preYear").prop("disabled", true);
				  }
				  if(year != first) {
					  $("#preYear").prop("disabled", false);
				  }
				  if(year == last) {
					  $("#nextYear").prop("disabled", true);
				  }
				  if(year != last) {
					  $("#nextYear").prop("disabled", false);
				  }
			  }
		   });
	   }

	   function monthCount() {
		   YM();
		   $.ajax({
				  type:"get",
				  url:"mainYearList.json",
				  success:function(data) {
					  let yArray = new Array();
					  $(data).each(function() {
						 yArray.push(this);
					  });
					  var first = "20" + yArray[0];
					  var last = "20" + yArray[yArray.length-1];
					  
						  $.ajax({
							  type:"get",
							  url:"mainMonthList.json",
							  data:{"year":year},
							  success:function(data) {
								  let mArray = new Array();
								  $(data).each(function() {
									  mArray.push(this);
								  });
								  var mFirst = mArray[0];
								  for(var i = 1; i <= 9; i++) {
									  if(mFirst == i) {
										  mFirst = "0" + mFirst;
									  }
								  }
								  var mLast = mArray[mArray.length-1];
								  for(var i = 1; i <= 9; i++) {
									  if(mLast == i) {
										  mLast = "0" + mLast;
									  }
								  }
								  
								  if(year == first) {
									  $("#nextMonth").prop("disabled", false);
								  	if(month == mFirst) {
									 	 $("#preMonth").prop("disabled", true);
								  	}
								  	if(month != mFirst) {
									  	$("#preMonth").prop("disabled", false);
								 	 }
							 	  }
								  if(year == last) {
									  $("#preMonth").prop("disabled", false);
									  if(month == mLast) {
										  $("#nextMonth").prop("disabled", true);
									  }
									  if(month != mLast) {
										  $("#nextMonth").prop("disabled", false);
									  }
								  }
							  }
						  });
				  }
			   });
	   }
      
      function preMonthControl() {
		   $.ajax({
				  type:"get",
				  url:"mainYearList.json",
				  success:function(data) {
					  let yArray = new Array();
					  $(data).each(function() {
						 yArray.push(this);
					  });
					  var first = "20" + yArray[0];
					  var last = "20" + yArray[yArray.length-1];
						  $.ajax({
							  type:"get",
							  url:"mainMonthList.json",
							  data:{"year":year},
							  success:function(data) {
								  if(year == first) {
									  let mArray = new Array();
									  $(data).each(function() {
										  mArray.push(this);
									  });
									  var mFirst = mArray[0];
									  for(var i = 1; i <= 9; i++) {
										  if(mFirst == i) {
											  mFirst = "0" + mFirst;
										  }
									  }
									  $("#selDate").html(year +"/"+ mFirst);
									  start();
								  }
								  if(year != first) {
									  $("#selDate").html(year +"/"+ month);
									  start();
								  }
								  
							  }
						  });
				  }
			   });
	   }
	   
	   function nextMonthControl() {
		   $.ajax({
				  type:"get",
				  url:"mainYearList.json",
				  success:function(data) {
					  let yArray = new Array();
					  $(data).each(function() {
						 yArray.push(this);
					  });
					  var first = "20" + yArray[0];
					  var last = "20" + yArray[yArray.length-1];
						  $.ajax({
							  type:"get",
							  url:"mainMonthList.json",
							  data:{"year":year},
							  success:function(data) {
								  if(year == last) {
									  let mArray = new Array();
									  $(data).each(function() {
										  mArray.push(this);
									  });
									  var mLast = mArray[mArray.length-1];
									  for(var i = 1; i <= 9; i++) {
										  if(mLast == i) {
											  mLast = "0" + mLast;
										  }
									  }
									  $("#selDate").html(year +"/"+ mLast);
									  start();
								  }
								  if(year != last) {
									  $("#selDate").html(year +"/"+ month);
									  start();
								  }
							  }
						  });
				  }
			   });
	   }
      
      
      
      
      
      
      
      
      
      
      
      function getCostRefundList() {
         $.ajax({
            type:"get",
            url:"costrefundList.json",
            data:{"date":date},
            success:function(result) {
               function changeChart() {
                  google.charts.load('current',{'packages' : [ 'corechart' ]});
                  google.charts.setOnLoadCallback(drawVisualization);
                  function drawVisualization() {
                     var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                     var options = {vAxis : {},
                           hAxis : {
                              minValue : 0
                                 },
                              series : {
                                 0 : {color : 'pink'},
                                 1 : {color : 'lightgray'},
                                 },
                              bar : {groupWidth : '30%' // 그래프 너비 설정 %
                                 // 그래프 너비 설정 %
                                 },
                              legend : 'none'
                                 }; /* 옵션 셋팅 */
                                 var chart = new google.visualization.BarChart(document.getElementById('frm1'));
                                 chart.draw(data,options); /* 차트 그리기 */
                  }
               }
               $("#frm1").html(changeChart());
            }
         });
      }
      
    function getCategoryList() {
         $.ajax({
            type:"get",
            url:"categoryList.json",
            data:{"date":date},
            success:function(result) {
               function changeChart() {
                  google.charts.load('current',{'packages' : [ 'corechart' ]});
                  google.charts.setOnLoadCallback(drawVisualization);
                  function drawVisualization() {
                     var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                     var options = {vAxis : {},
                           hAxis : {
                              minValue : 0
                                 },
                              series : {
                                 0 : {color : 'pink'},
                                 1 : {color : 'lightgray'}
                                 },
                              bar : {groupWidth : '70%' // 그래프 너비 설정 %
                                 // 그래프 너비 설정 %
                                 },
                              legend : 'none'
                                 }; /* 옵션 셋팅 */
                                 var chart = new google.visualization.BarChart(document.getElementById('frm'));
                                 chart.draw(data,options); /* 차트 그리기 */
                  }
               }
               $("#frm").html(changeChart());
            }
         });
	}
         
      function getData() {
            var amount = 0;
            var addCost = "<div id='costList'>";
            $.ajax({
               type:"get",
               url:"dataLists.json",
               data:{"date":date},
               success:function(data) {
                  $(data).each(function() {
                     var costAccountName = this.COSTACCOUNTNAME;
                     var costAmount = this.COSTAMOUNT;
                     amount = amount + costAmount;
                     addCost += "<div class='costAccountName'>"+costAccountName+"</div>";
                     var costAmountFormat = costAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                     addCost += "<div class='costAmount'>"+costAmountFormat+"원</div>";
                  });
                  var amountFormat = amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                  
                  addCost += "</div>";
                  addCost += "<div class='totalCost' style='color:red'>비용 총액</div>"+amountFormat+"원";
                  $("#detail").html(addCost);
               }
            });
         }


      function totalList() {
    	  $.ajax({
    		 type:"get",
    		 url:"mainMonthlyAmount.json",
    		 data:{"date":date},
    		 success:function(data) {
    			 var monthlyAmount = data;
    			 $.ajax({
                     type : "get",
                     url : "costList.json",
                     data : {
                        "date" : date
                     },
                     success : function(data) {
                        $(data).each(function() {
                                       var amount = this.costAmount;
                                       var costYear = this.day.split("-")[0];
                                       var costMonth = this.day.split("-")[1];
                                       var costDay = this.day.split("-")[2]
                                             .substring(0, 2);
                                       var date = costYear + "/"
                                             + costMonth + "/" + costDay;
                                       $("#calendarView").find("#calendar").find("[name=wom]").each(function() {
                                                      if ($(this).find(".pleaseData").attr("id") == date) {
                                                         function changeChart() {
                                                            google.charts.load('current',{'packages' : [ 'corechart' ]});
                                                            google.charts.setOnLoadCallback(drawVisualization);
                                                            function drawVisualization() {
                                                               $.ajax({
                                                                        type : "get",
                                                                        url : "GraphList.json",
                                                                        dataType : "json",
                                                                        data : {
                                                                           "date" : date
                                                                        },
                                                                        success : function(
                                                                              result) {
                                                                           //                                    var result = [["과목","점수"],["국어",90],["영어",80]];
                                                                           var data = google.visualization
                                                                                 .arrayToDataTable(result); /* 데이터 셋팅 */
                                                                           var options = {
                                                                              vAxis : {},
                                                                              hAxis : {
                                                                                 maxValue : monthlyAmount,
                                                                                 minValue : 0,
                                                                                 ticks : [
                                                                                       '0%',
                                                                                       '100%' ]
                                                                              },
                                                                              series : {
                                                                                 0 : {
                                                                                    color : 'pink'
                                                                                 },
                                                                                 1 : {
                                                                                    color : 'lightgray'
                                                                                 },
                                                                                 2 : {
                                                                                    color : 'skyblue'
                                                                                 },

                                                                              },
                                                                              bar : {
                                                                                 groupWidth : '70%' // 그래프 너비 설정 %
                                                                              },
                                                                              legend : 'none'
                                                                           }; /* 옵션 셋팅 */
                                                                           
                                                                           var chart = new google.visualization.BarChart(
                                                                                 document
                                                                                       .getElementById(date));
                                                                           chart
                                                                                 .draw(
                                                                                       data,
                                                                                       options); /* 차트 그리기 */
                                                                           
                                                                        }
                                                                     });
                                                            }
                                                         }

                                                         $(this).find(".pleaseData").text(changeChart());
                                                      }
                                                   });
                                    });
                     }
                  });
    		 }
    	  });
      }
      
      function calendar() {
    	  YM();
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
                     addCalendar += "<div class='wom1'></div>";
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
//                alert(addCalendar);
               $("#calendarView").html(addCalendar);
               date = year +"/"+ month;
               totalList();
            }
         });
      }
      
      function getYear() {
  		var yearList = "<div id='year'>";
  		var y = 0;
  		$.ajax({
  			type:"get",
  			url:"mainDailyYearList.json",
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
  			url:"mainDailyMonthList.json",
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
  	
  	function YM() {
  		 year = $("#selDate").html().split("/")[0];
  		   year = year.trim();
  		   month = $("#selDate").html().split("/")[1];
  		   month = month.trim();
  		   date = year +"/"+ month;
  	}

      

   </script>
</html>