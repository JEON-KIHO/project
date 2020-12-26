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
   <link rel="stylesheet" href="../resources/style.css">
<link rel="stylesheet" href="../resources/icono.css">
<title>매출/환불</title>
<%
   GregorianCalendar cal = new GregorianCalendar();
   String thisYear = cal.get(GregorianCalendar.YEAR)+"";
   String thisMonth = cal.get(GregorianCalendar.MONTH)+1+"";
   String thisDay = cal.get(GregorianCalendar.DAY_OF_MONTH)+"";
%>
<style>
#datePage {overflow:hidden; text-align:center; margin-left:400px; margin-bottom:20px;}
   #pre, #next {width:160px; float:left;}
   #sel {float:left; overflow:hidden; width:150px; text-align:center; cursor:default; z-index:500;}
   #selDate {float:left; width:150px;}
   #yearList, #monthList {float:left; width:75px;}
   #divCenter {text-align:center; margin-left:300px; margin-top:200px; margin-bottom:150px; width: 1200px;}
   .payTypeGraph, .mcGraph, .st, .total, .lTotal {width:500px; height:60px;}
   #salesList{color:#669;}
*:focus {outline: none;}
#tabs li {

   border: 1px solid #597484;
   border-radius: 5px;
   text-align: center;
   background-color: white;
   cursor: pointer;
     width:100px;
     height:25px;
     padding:10px;
     margin:5px;
     
}
   td {border:1px solid #ccc;}
  #tabs {position:fixed; z-index:1020;}
  .tab {margin-top:140px; z-index:1100;}
  #tabs li:hover{background-color: #547484; color:white;}
  #tabs li:active {transform: translateY(4px);}
  #totalAmount {margin-left:280px; width:840px; border:1px solid #ccc;}
#preYear {border:0; background:white; font-size:25px;}
#preYear:focus{outline: none;}
#preMonth {border:0; background:white;font-size:25px;}
#preMonth:focus{outline: none;}
#nextMonth {border:0; background:white;font-size:25px;}
#nextMonth:focus{outline: none;}
#nextYear {border:0; background:white;font-size:25px;}
#nextYear:focus{outline: none;}
 #btnUp{float:right;margin-left:70px;position:fixed;margin-top:80px; border:0; background:white; cursor: pointer;}
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
   margin-left:870px;
   background: rgba(0, 0, 0, 0.5);
}
</style>
</head>
<body>
<div id="divCenter">
<div id="tabbed round" style="float: left;">
         <ul class="tab" id="tabs" style="float: left;"></ul>
         <div id="upDown">
            <button id="btnUp" onclick="scrollUp();">
               <i class="icono-caretUpCircle"></i><br/>
            </button>
         </div>
      </div>
<div id="datePage">
   <div id="pre">
      <input type="button" value="《" id="preYear">
      <input type="button" value="〈" id="preMonth">
   </div>
   <div id="sel">
      <div id="selDate"></div>
      <div id="dailyLightBox">
      <div id="dailyBox">
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
<div id="salesList"></div>
</div>

<jsp:include page="menu.jsp"></jsp:include>
<div id="footer"><jsp:include page="footer.jsp" /></div>

</body>
<script type="text/javascript">
$("#dailyLightBox").hide();
$("#selDate").html(<%=thisYear%> +" / "+ "03");
let year = $("#selDate").html().split("/")[0];
year = year.trim();
let month = $("#selDate").html().split("/")[1];
month = month.trim();
let date = year +"/"+ month;
let amount;
getYear();
getMonth();

$("#tabs").on("click",function(){
      scrollUp();
   });
   function scrollUp(){
      $('html').scrollTop(0);
   }
   function scrollDown(){
      var scrollHeight=$(document).height();
      $('html').animate({scrollTop:scrollHeight},0);
   }
   
$(document).ready(function() {
$("#tabs").on("click", "li", function() {
   var tbl = $(this).attr("id");
   $(this).parent().parent().parent().find("#salesList").find("table").each(function() {
      if(tbl == 'allAround') {
         $(this).show();
      }
      if(tbl != "allAround") {
         var table = $(this).attr("id");
         $(this).hide();
         if(tbl == table) {
            $(this).show();
         }
      }
   });
});
});

$("#selDate").on("click", function() {
	$("#dailyLightBox").show();
});

$("#salesList").on("click", function() {
   $("#yearList").slideUp();
   $("#monthList").slideUp();
});

$("#yearList").on("click", "#year .yData", function() {
   year = $(this).attr("id");
   getMonth();
});

$("#monthList").on("click", "#month .mData", function() {
   month = $(this).attr("id");
   $("#selDate").html(year +" / "+ month);
   $("#dailyLightBox").hide();
   start();
});

start();

function start() {
	lightBoxController();
   yearCount();
   monthCount();
    getSalesCategoryCount();
      setTimeout(getPayTypeList, 200);
      setTimeout(getMCategoryList, 300);
      setTimeout(getSubTotalList, 400);
      setTimeout(getTotalList, 500);
}

   $("#preYear").on("click", function() {
      year--;
      preMonthControl();
      start();
   });

   $("#nextYear").on("click", function() {
      year++;
      nextMonthControl();
      start();
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
      $("#selDate").html(year +" / "+ month);
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
      $("#selDate").html(year +" / "+ month);
      start();
   });
   
    function yearCount() {
         $.ajax({
           type:"get",
           url:"SRYearList.json",
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
              url:"SRYearList.json",
              success:function(data) {
                 let yArray = new Array();
                 $(data).each(function() {
                   yArray.push(this);
                 });
                 var first = "20" + yArray[0];
                 var last = "20" + yArray[yArray.length-1];
                 
                    $.ajax({
                       type:"get",
                       url:"SRMonthList.json",
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
              url:"SRYearList.json",
              success:function(data) {
                 let yArray = new Array();
                 $(data).each(function() {
                   yArray.push(this);
                 });
                 var first = "20" + yArray[0];
                 var last = "20" + yArray[yArray.length-1];
                  year--;
                    $.ajax({
                       type:"get",
                       url:"SRMonthList.json",
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
                             $("#selDate").html(year +" / "+ mFirst);
                          }
                          if(year != first) {
                             $("#selDate").html(year +" / "+ month);
                          }
                          
                       }
                    });
              }
            });
      }
      
      function nextMonthControl() {
         $.ajax({
              type:"get",
              url:"SRYearList.json",
              success:function(data) {
                 let yArray = new Array();
                 $(data).each(function() {
                   yArray.push(this);
                 });
                 var first = "20" + yArray[0];
                 var last = "20" + yArray[yArray.length-1];
                  year++;
                    $.ajax({
                       type:"get",
                       url:"SRMonthList.json",
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
                             $("#selDate").html(year +" / "+ mLast);
                          }
                          if(year != last) {
                             $("#selDate").html(year +" / "+ month);
                          }
                       }
                    });
              }
            });
      }
   
       function getSalesCategoryCount() {
          $("#salesList").html("");
           var dataCnt = 0;
           var cnt = 0;
           var oldCategory;
           var lCategory;
           var maxCnt = 0;
           $.ajax({
              type:"get",
              url:"salesCategoryCount.json",
              success:function(data) {
                 var mCategoryArray = new Array();
                 $(data).each(function() {
                    mCategoryArray.push(this.CATEGORY.split("/")[1]);
                 });
                 var lCategoryArray = new Array();
                 var mCategoryCountArray = new Array();
                 $(data).each(function() {
                    dataCnt++;
                    var lCategory = this.CATEGORY.split("/")[0];
                       if(lCategory != oldCategory) {
                          lCategoryArray.push(lCategory);
                          cnt = 0;
                          cnt++;
                       }if(lCategory == oldCategory) {
                          cnt++;
                       }
                       
                       if(cnt < maxCnt) {
                          mCategoryCountArray.push(maxCnt);
                       }
                       maxCnt = cnt;
                       if(mCategoryArray.length == dataCnt) {
                          mCategoryCountArray.push(maxCnt);
                       }
                    oldCategory = lCategory;
                 });
                 
                 var cnt = 0;
                 var payArray = ['현금', '카드', '기타'];
                 var addSalesList = "";
                 var addLi = "<li id='allAround'>전체보기</li>";
                 for(var i = 0; i < lCategoryArray.length; i++) {
                    addSalesList += "<table id=tbl"+lCategoryArray[i]+" style='margin-left:280px; width:840px; border:1px solid #ccc;'>";
                    addSalesList += "<tr class='"+lCategoryArray[i]+"'><td width=120 rowspan='"+(mCategoryCountArray[i]+3)+"'>"+lCategoryArray[i]+"</td>";
                    addSalesList += "<td rowspan='3'>결제방법</td>";
                    
                    for(var a = 0; a < payArray.length; a++) {
                       var salesLcategoryId = lCategoryArray[i]+"/"+payArray[a];
                       if(a == 0) {
                          addSalesList += "<td class='payType'>"+payArray[a]+"</td><td id='"+salesLcategoryId+"' code='"+salesLcategoryId+"' class='payTypeGraph' name='graph'></td>";
                       }
                       if(a != 0) {
                          addSalesList += "<tr class='"+lCategoryArray[i]+"'><td class='payType'>"+payArray[a]+"</td><td id='"+salesLcategoryId+"' code='"+salesLcategoryId+"' class='payTypeGraph' name='graph'></td></tr>";
                       }
                    }
                    
                    addSalesList += "</tr>";
                    addSalesList += "<tr class='"+lCategoryArray[i]+"'><td rowspan='"+(mCategoryCountArray[i])+"'>상품명</td>";
                    
                    for(var z = 0; z < mCategoryCountArray[i]; z++) {
                        var salesMcategoryId = lCategoryArray[i] +"/"+ mCategoryArray[cnt];
                        if(z==0){
                           addSalesList += "<td class='mc'>"+mCategoryArray[cnt]+"</td><td id ='"+salesMcategoryId+"' mCode ='"+salesMcategoryId+"' class='mcGraph' name='graph'></td></tr>";
                        }
                        if(z!=0){
                           addSalesList += "<tr class='"+lCategoryArray[i]+"'><td class='mc'>"+mCategoryArray[cnt]+"</td><td id ='"+salesMcategoryId+"' mCode ='"+salesMcategoryId+"' class='mcGraph' name='graph'></td></tr>";
                        }
                        cnt++;
                     }
                 
                    var salesSubId = lCategoryArray[i];
                    addSalesList += "<td colspan=3>소계</td><td id ='"+salesSubId+"' sCode ='"+salesSubId+"' class ='st' name='graph'></td></tr>"
                    addSalesList += "</table>";
                    addLi += "<li id='tbl"+lCategoryArray[i]+"'>"+lCategoryArray[i]+"</li>";
                    $("#salesList").append(addSalesList);
                    addSalesList = "";
                 }
                 
                 for(var a = 0; a < payArray.length; a++) {
                    var salesTotalId = payArray[a];
                    if(a == 0) {
                       addSalesList += "<table id = 'totalAmount' border=1>";
                       addSalesList += "<tr class='totalAmount'><td width=120 rowspan='"+lCategoryArray.length+3+"'>합계</td><td rowspan='3'>결제별</td><td>"+payArray[a]+"</td><td id='"+salesTotalId+"' totalType ='"+salesTotalId+"' class='total' name='graph'></td></tr>";
                    }
                    if(a != 0) {
                       addSalesList += "<tr class='totalAmount'><td>"+payArray[a]+"</td><td id='"+salesTotalId+"' totalType ='"+salesTotalId+"' class='total' name='graph'></td></tr>";
                    }
                 }
                 
                 for(var a = 0; a < lCategoryArray.length; a++) {
                    if(a == 0) {
                         addSalesList += "<tr class='lCategoryTotal'><td rowspan='"+lCategoryArray.length+"'>대분류</td><td>"+lCategoryArray[a]+"</td><td id='lc"+lCategoryArray[a]+"' totalType ='"+lCategoryArray[a]+"' class='lTotal' name='graph'></td></tr>";
                      }
                      if(a != 0) {
                         addSalesList += "<tr class='lCategoryTotal'><td>"+lCategoryArray[a]+"</td><td id='lc"+lCategoryArray[a]+"' totalType ='"+lCategoryArray[a]+"' class='lTotal' name='graph'></td></tr>";
                      }
                 }
                 addSalesList += "</table>";
                 addLi += "<li id='totalAmount'>합계</li>";
                 $("#tabs").html(addLi);
                 $("#salesList").append(addSalesList);
                 
              }
              });
            }
       
   function getPayTypeList() {
      YM();
      $.ajax({
         type:"get",
         url:"monthlyTotalAmount.json",
         data:{"date":date},
         success:function(data) {
            var amount = data;
            $("#salesList tr").each(function() {
               var lCategory = $(this).attr("class");
               var payType = $(this).find(".payType").html();
               var LP = lCategory +"/"+ payType;
               if($(this).find(".payTypeGraph").attr("code") == LP) {
                  $.ajax({
                     type:"get",
                     url:"salesPayTypeList.json",
                     data:{"date":date, "payType":payType, "lCategory":lCategory},
                     success:function(result) {
                        function changeChart(){
                               google.charts.load('current', {'packages':['corechart']});
                               google.charts.setOnLoadCallback(drawVisualization);
                                    function drawVisualization() {
                                               var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                                               var options = {
                                                     vAxis : {
                                                     },
                                                     hAxis : {
                                                        maxValue : amount,
                                                        minValue : 0,
                                                        ticks : ['0%', '100%']
                                                     },
                                                     series : {
                                                        0 : {color: 'red'},
                                                        1 : {color: 'blue'}
                                                        
                                                     },
                                                     bar : {
                                                        groupWidth : '60%' // 그래프 너비 설정 %
                                                     },
                                                     legend : 'none'
                                                     }; /* 옵션 셋팅 */
                                               var chart = new google.visualization.BarChart(document.getElementById(LP));
                                                  chart.draw(data, options); /* 차트 그리기 */
                                   }
                            }
                        $(this).find(".payTypeGraph").html(changeChart());
                     }
                  });
               }
            });
         }
      });
   }

   function getMCategoryList() {
      YM();
      $.ajax({
         type:"get",
         url:"monthlyTotalAmount.json",
         data:{"date":date},
         success:function(data) {
            var amount = data;
            $("#salesList tr").each(function() {
               var lCategory = $(this).attr("class");
               var mCategory = $(this).find(".mc").html();
               var LM = lCategory +"/"+ mCategory;
               if($(this).find(".mcGraph").attr("mcode") == LM) {
                  $.ajax({
                     type:"get",
                     url:"salesMCategoryList.json",
                     data:{"date":date, "mCategory":mCategory, "lCategory":lCategory},
                     success:function(result) {
                        function changeChart(){
                               google.charts.load('current', {'packages':['corechart']});
                               google.charts.setOnLoadCallback(drawVisualization);
                                    function drawVisualization() {
//                                             var result = [["과목","점수"],["국어",90],["영어",80]];
                                               var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                                               var options = {
                                                     vAxis : {
                                                     },
                                                     hAxis : {
                                                        maxValue : amount,
                                                        minValue : 0,
                                                        ticks : ['0%', '100%']
                                                     },
                                                     series : {
                                                        0 : {color: 'red'},
                                                        1 : {color: 'blue'}
                                                        
                                                     },
                                                     bar : {
                                                        groupWidth : '60%' // 그래프 너비 설정 %
                                                     },
                                                     legend : 'none'
                                                     }; /* 옵션 셋팅 */
                                               var chart = new google.visualization.BarChart(document.getElementById(LM));
                                                  chart.draw(data, options); /* 차트 그리기 */
                                   }
                            }
                        $(this).find(".mcGraph").html(changeChart());
                     }
                  });
               }
            });
         }
      });
   }
   
   function getSubTotalList() {
      YM();
      $.ajax({
         type:"get",
         url:"monthlyTotalAmount.json",
         data:{"date":date},
         success:function(data) {
            var amount = data;
            $("#salesList tr").each(function() {
               if($(this).find(".st").attr("scode") != null) {
                  var lCategory = $(this).find(".st").attr("scode");
                  $.ajax({
                     type:"get",
                     url:"salesSubTotalList.json",
                     data:{"date":date, "lCategory":lCategory},
                     success:function(result) {
                        function changeChart(){
                               google.charts.load('current', {'packages':['corechart']});
                               google.charts.setOnLoadCallback(drawVisualization);
                                    function drawVisualization() {
//                                             var result = [["과목","점수"],["국어",90],["영어",80]];
                                               var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                                               var options = {
                                                     vAxis : {
                                                     },
                                                     hAxis : {
                                                        maxValue : amount,
                                                        minValue : 0,
                                                        ticks : ['0%', '100%']
                                                     },
                                                     series : {
                                                        0 : {color: 'red'},
                                                        1 : {color: 'blue'}
                                                        
                                                     },
                                                     bar : {
                                                        groupWidth : '60%' // 그래프 너비 설정 %
                                                     },
                                                     legend : 'none'
                                                     }; /* 옵션 셋팅 */
                                               var chart = new google.visualization.BarChart(document.getElementById(lCategory));
                                                  chart.draw(data, options); /* 차트 그리기 */
                                   }
                            }
                        $(this).find(".st").html(changeChart());
                     }
                  });
               }
            });
         }
      });
   }
   
   function getTotalList() {
      YM();
      $.ajax({
         type:"get",
         url:"monthlyTotalAmount.json",
         data:{"date":date},
         success:function(data) {
            var amount = data;
            $("#salesList tr").each(function() {
               if($(this).attr("class") == "totalAmount") {
                  var payType = $(this).find(".total").attr("totalType");
                  $.ajax({
                     type:"get",
                     url:"salesPayTypeTotalList.json",
                     data:{"date":date, "payType":payType},
                     success:function(result) {
                        function changeChart(){
                               google.charts.load('current', {'packages':['corechart']});
                               google.charts.setOnLoadCallback(drawVisualization);
                                    function drawVisualization() {
//                                             var result = [["과목","점수"],["국어",90],["영어",80]];
                                               var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                                               var options = {
                                                     vAxis : {
                                                     },
                                                     hAxis : {
                                                        maxValue : amount,
                                                        minValue : 0,
                                                        ticks : ['0%', '100%']
                                                     },
                                                     series : {
                                                        0 : {color: 'red'},
                                                        1 : {color: 'blue'}
                                                        
                                                     },
                                                     bar : {
                                                        groupWidth : '60%' // 그래프 너비 설정 %
                                                     },
                                                     legend : 'none'
                                                     }; /* 옵션 셋팅 */
                                               var chart = new google.visualization.BarChart(document.getElementById(payType));
                                                  chart.draw(data, options); /* 차트 그리기 */
                                   }
                            }
                        $(this).find(".total").html(changeChart());

                     }
                  });
               }
               if($(this).attr("class") == "lCategoryTotal") {
                  var lCategory = "lc"+$(this).find(".lTotal").attr("totalType");
                  var idLCategory = $(this).find(".lTotal").attr("totalType");
                  $.ajax({
                     type:"get",
                     url:"salesLCategoryTotalList.json",
                     data:{"date":date, "lCategory":idLCategory},
                     success:function(result) {
                        function changeChart(){
                               google.charts.load('current', {'packages':['corechart']});
                               google.charts.setOnLoadCallback(drawVisualization);
                                    function drawVisualization() {
//                                             var result = [["과목","점수"],["국어",90],["영어",80]];
                                               var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                                               var options = {
                                                     vAxis : {
                                                     },
                                                     hAxis : {
                                                        maxValue : amount,
                                                        minValue : 0,
                                                        ticks : ['0%', '100%']
                                                     },
                                                     series : {
                                                        0 : {color: 'red'},
                                                        1 : {color: 'blue'}
                                                        
                                                     },
                                                     bar : {
                                                        groupWidth : '40%' // 그래프 너비 설정 %
                                                     },
                                                     legend : 'none'
                                                     }; /* 옵션 셋팅 */
                                               var chart = new google.visualization.BarChart(document.getElementById(lCategory));
                                                  chart.draw(data, options); /* 차트 그리기 */
                                   }
                            }
                        $(this).find(".lTotal").html(changeChart());

                     }
                  });
               }
            });
         }
      });
   }
   
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
   
   function YM() {
       year = $("#selDate").html().split("/")[0];
         year = year.trim();
         month = $("#selDate").html().split("/")[1];
         month = month.trim();
         date = year +"/"+ month;
   }
   
</script>
</html>