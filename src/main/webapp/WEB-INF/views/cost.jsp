<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="../resources/icono.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/style.css">
<link rel="stylesheet" href="../resources/icono.css">
<title>Insert title here</title>
<%
   GregorianCalendar cal = new GregorianCalendar();
   String thisYear = cal.get(GregorianCalendar.YEAR) + "";
   String thisMonth = cal.get(GregorianCalendar.MONTH) + 1 + "";
   String thisDay = cal.get(GregorianCalendar.DAY_OF_MONTH) + "";
%>
</head>
<style>

#invenDetail { text-align:center; width:1300px; height:600px; font-size:18px; margin-top:20px; margin-left:240px;}
  #costDetail{width:1300px; height:150px; margin:0;text-align:center; font-size:20px;
  margin-left:40px;margin-top:80px;}
#calendar {
   width: 600px;
   overflow: hidden;
   margin-left:100px; 
   border:solid 1px #F6F6F6;
}

.wom1, .wom2, .wom3, .wom4, .wom5, .wom6 {
   width: 80px;
   height: 60px;
   float: left;
   border:solid 1px #EAEAEA;
   background-color:white;
   font-size:17px;
   margin:1px;
}

#datePage {
   overflow: hidden;
   margin:15px 0px 15px 550px;
   height:60px;
   width:580px;
   text-align:center;
   
}

#pre{
margin-top:100px;
   width: 110px;
   float: left;
   text-align:center;
}
#next {width: 110px; margin-top:100px; float:right; text-align:center; margin-left:100px;}
#sel {
   overflow: hidden;
}

   #yearList, #monthList {float:left; width:75px;}
   #selDate {float:left; width:150px; height:50px; cursor:default; font-size:30px;}
#selDate:hover {transform: scale(0.5, 0.5); text-decoration:underline; color:#547484;}

.costAccountName, .costAmount, .totalCost, .monthlyCost {
   float: left;
   padding: 0px 0px 8px 0px;
   border:1px solid #ccc;
   color:#669;
}

.costAccountName {
   width: 200px;
}

.costAmount {
   width: 200px;
}
.costAmount:hover {color:#191919; font-weight:bold; cursor:default;}

.totalCost {
   width: 200px;
}
.monthlyCost {
   width: 200px;
}

#data {
margin-left:130px;
   over-flow:hidden;
   width: 1000px;
}

#calendarView {
   float:left;
   width: 600px;
}

.pleaseData {
   height: 37px;
}

#divCenter {
   width: 1300px;
   height: 1600px;
   margin-top: 150px;
   margin-left: 320px;
   margin-bottom:100px;
   background-color:#F6F6F6;
   border:1px solid #597484;
   
}

*:focus { outline: none; }
   .yData:hover{ text-decoration:underline; color:#ccc; cursor:default;}
   .mData:hover{ text-decoration:underline; color:#ccc; cursor:default;}
#preYear {border:0; background:#F6F6F6; font-size:30px;}
#preYear:focus{outline: none;}
#preMonth {border:0; background:#F6F6F6;font-size:30px;}
#preMonth:focus{outline: none;}
#nextMonth {border:0; background:#F6F6F6;font-size:30px;}
#nextMonth:focus{outline: none;}
#nextYear {border:0; background:#F6F6F6;font-size:30px;}
#nextYear:focus{outline: none;}
.totalCost {color:red}
.monthlyCost {color:red; width:200px;}
.costAccountName,.totalCost{font-weight:800;}
.costAccountName {color:black;}
 .abc1,.abc2,.abc3{width:200px;border:1px solid;float:left;
   padding: 0px 0px 8px 0px;
   border:1px solid #ccc;
   height:27px;
   }
select {
  width: 100px;
  padding: .8em .5em;
  font-family: inherit;
  font-size:15px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #597484;
  border-radius: 5px;
  text-align:center;
  }
  span {color:black;}
  hr {width:80%; margin-top:400px; background-color:#F6F6F6;}
  .inven0,.inven1,.inven2,.inven3,.inven4,.inven5,.inven6,.inven7,.inven8{border:1px solid #ccc;padding: 0px 10px 8px 10px; color:#669;}
  .inven0,.inven6,.inven7,.inven8{font-size:22px;font-weight:800; color:black;}
  tr:hover{color:#191919; font-weight:bold; cursor:default;}
</style>
<body>
   <div id="divCenter">
      <div id="datePage">

         <div id="sel">
      <div id="selDate"></div>
      <div id="yearList"></div>
      <div id="monthList"></div>
   </div>
      </div>
      <div id="data">
      <div id="pre">
            <input type="button" value="《" id="preYear">
            <input type="button" value="〈" id="preMonth">
         </div>
            
         <div id="calendarView"></div>
         
         <div id="next">
            <input type="button" value="〉" id="nextMonth">
            <input type="button" value="》" id="nextYear">
         </div>
                  </div>
                  <div id="Detail">
                  <hr>
                  <div id="costDetail"></div><div id="invenDetail"></div>
                  </div>
               </div>

   <jsp:include page="menu.jsp"></jsp:include>
<div id="footer"><jsp:include page="footer.jsp" /></div>
</body>
<script>
var monthlyCost;
$("#selDate").html(<%=thisYear%>-1 +"/"+ "12");
$("#yearList").hide();
$("#monthList").hide();
let year = $("#selDate").html().split("/")[0];
year = year.trim();
let month = $("#selDate").html().split("/")[1];
month = month.trim();
let date = year +"/"+ month;
getYear();
getMonth();
start();

$("#selDate").on("click", function() {
   $("#yearList").slideDown();
   $("#monthList").slideDown();
});

$("#data").on("click", function() {
   $("#yearList").slideUp();
   $("#monthList").slideUp();
});

$("#yearList").on("click", "#year .yData", function() {
   year = $(this).attr("id");
   getMonth();
});

$("#monthList").on("click", "#month .mData", function() {
   $("#costDetail").html("");
   $("#invenDetail").html("");
   month = $(this).attr("id");
   $("#selDate").html(year +"/"+ month);
   $("#yearList").slideUp();
   $("#monthList").slideUp();
   start();
});


$("#calendarView").on("click", "#calendar [name=wom]", function() {
   $("#costDetail").show();
   $("#invenDetail").show();
   dayDate = $(this).find(".pleaseData").attr("id");
   var addList = "";
   if($(this).attr("style").split("background: ")[1] != "white;") {
         $.ajax({
            type:"get",
            url:"readInven.json",
            data:{"date":dayDate},
            success:function(data) {
               addList += "<tr><td class='inven0' name='inven' width=300>재고명</td><td class='inven6' width=100>기초재고</td><td class='inven7' width=100>입고</td><td class='inven8' width=100>출고</td><td class='inven8' width=100>기말재고</td></tr>";
               $(data).each(function() {
                  addList += "<tr><td class='inven1' name='inven'>"+this.INVENACCOUNTNAME.split("/")[1]+"</td>";
                  addList += "<td class='inven2' name='inven'>"+this.STARTINVEN+"</td>";
                  addList += "<td class='inven3' name='inven'>"+this.INVENIN+"</td>";
                  addList += "<td class='inven4' name='inven'>"+this.INVENOUT+"</td>";
                  addList += "<td class='inven5' name='inven'>"+this.ENDINVEN+"</td></tr>";
               });
               $("#invenDetail").html(addList);
            }
         });
   }
   if($(this).attr("style").split("background: ")[1] == "white;") {
      $("#invenDetail").html("");
   }
   getData();
   
});


function start() {
	lightBox();
	setTimeout(outLightBox, 1000);
   yearCount();
   monthCount();
   calendar();
   setTimeout(updateData, 200);
}

$("#preYear").on("click", function() {
   $("#costDetail").html("");
   $("#invenDetail").html("");
      year--;
      preMonthControl();
      date = year +"/"+ month;
      $("#selDate").html(year +"/"+ month);
   });

   $("#nextYear").on("click", function() {
      $("#costDetail").html("");
      $("#invenDetail").html("");
      year++;
      nextMonthControl();
      date = year +"/"+ month;
      $("#selDate").html(year +"/"+ month);
   });

   $("#preMonth").on("click", function() {
      $("#costDetail").html("");
      $("#invenDetail").html("");
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
      $("#costDetail").html("");
      $("#invenDetail").html("");
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
   
   function updateData() {
      $("#calendarView").find("#calendar").find("[name=wom]").css("background", "white");
      $.ajax({
         type:"get",
         url:"invenData.json",
         data:{"date":date},
         success:function(data) {
            $(data).each(function() {
               var d = this.day;
               $("#calendarView").find("#calendar").find("[name=wom]").each(function() {
                  if($(this).find(".pleaseData").attr("id") == d) {
                        $(this).css("background", "green");
                  }
               });
            });
         }
      });
   }
   
function costList() {
   YM();
   var amount = 0;
      $.ajax({
         type:"get",
         url:"monthlyCostList.json",
         data:{"date":date},
         success:function(data) {
               monthlyCost = data.COSTAMOUNT;
            $.ajax({
                type:"get",
                url:"costList.json",
                data:{"date":date},
                success:function(data) {
                   $(data).each(function() {
                      var amount = this.costAmount;
                      var costYear = this.day.split("-")[0];
                      var costMonth = this.day.split("-")[1];
                      var costDay = this.day.split("-")[2].substring(0,2);
                      var cdate = costYear +"/"+ costMonth +"/"+ costDay;
                      $("#calendarView").find("#calendar").find("[name=wom]").each(function() {
                         if($(this).find(".pleaseData").attr("id") == cdate) {
                            function changeChart(){
                                google.charts.load('current', {'packages':['corechart']});
                                google.charts.setOnLoadCallback(drawVisualization);
                                     function drawVisualization() {
                                        $.ajax({
                                            type:"get",
                                            url:"costGraphList.json",
                                            dataType:"json",
                                            data:{"date":cdate},
                                            success:function(result){
//                                              var result = [["과목","점수"],["국어",90],["영어",80]];
                                                var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                                                var options = {
                                                      vAxis : {
                                                      },
                                                      hAxis : {
                                                         maxValue : monthlyCost,
                                                         minValue : 0,
                                                         ticks : ['0%', '100%']
                                                      },
                                                      series : {
                                                         0: {color: 'red'}
                                                         
                                                      },
                                                      bar : {
                                                         groupWidth : '70%' // 그래프 너비 설정 %
                                                      },
                                                      legend : 'none'
                                                      }; /* 옵션 셋팅 */
                                                var chart = new google.visualization.BarChart(document.getElementById(cdate));
                                                   chart.draw(data, options); /* 차트 그리기 */
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

function getData() {
   var cnt = 0;
   var amount = 0;
   var addCost = "<div id='costList'>";
   $.ajax({
      type:"get",
      url:"cDataList.json",
      data:{"date":dayDate},
      success:function(data) {
         $(data).each(function() {
            var costAccountName = this.COSTACCOUNTNAME;
            var costAmount = this.COSTAMOUNT;
            amount = amount + costAmount;
            addCost += "<div class='costAccountName'>"+costAccountName+"</div>";
            var costAmountFormat = costAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            addCost += "<div class='costAmount'>"+costAmountFormat+"원</div>";
            cnt++;
         });
         if(cnt%3==1) {
             addCost += "<div class='abc1'></div><div class='abc1'></div>";
          }
          if(cnt%3==0) {
             addCost += "<div class='abc2'></div><div class='abc3'></div><div class='abc2'></div><div class='abc3'></div>";
          }
         var amountFormat = amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         addCost += "<div class='totalCost' style='color:red'>비용 총액</div><div class='monthlyCost'>"+amountFormat+"원</div>";
         addCost += "</div>";
         $("#costDetail").html(addCost);
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
         $("#calendarView").html(addCalendar);
         date = year +"/"+ month;
           costList();
      }
   });
}

function getYear() {
   var yearList = "<div id='year'>";
   var y = 0;
   $.ajax({
      type:"get",
      url:"costDailyYearList.json",
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
      url:"costDailyMonthList.json",
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

function preMonthControl() {
      $.ajax({
           type:"get",
           url:"costYearList.json",
           success:function(data) {
              let yArray = new Array();
              $(data).each(function() {
                yArray.push(this);
              });
              var first = "20" + yArray[0];
              var last = "20" + yArray[yArray.length-1];
                 $.ajax({
                    type:"get",
                    url:"costMonthList.json",
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
           url:"costYearList.json",
           success:function(data) {
              let yArray = new Array();
              $(data).each(function() {
                yArray.push(this);
              });
              var first = "20" + yArray[0];
              var last = "20" + yArray[yArray.length-1];
                 $.ajax({
                    type:"get",
                    url:"costMonthList.json",
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

function yearCount() {
      $.ajax({
        type:"get",
        url:"costYearList.json",
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
      $.ajax({
           type:"get",
           url:"costYearList.json",
           success:function(data) {
              let yArray = new Array();
              $(data).each(function() {
                yArray.push(this);
              });
              var first = "20" + yArray[0];
              var last = "20" + yArray[yArray.length-1];
              
                 $.ajax({
                    type:"get",
                    url:"costMonthList.json",
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

function YM() {
    year = $("#selDate").html().split("/")[0];
      year = year.trim();
      month = $("#selDate").html().split("/")[1];
      month = month.trim();
      date = year +"/"+ month;
}
</script>
</html>