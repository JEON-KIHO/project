<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.GregorianCalendar"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
   GregorianCalendar cal = new GregorianCalendar();
   String thisYear = cal.get(GregorianCalendar.YEAR)+"";
   String thisMonth = cal.get(GregorianCalendar.MONTH)+1+"";
   String thisDay = cal.get(GregorianCalendar.DAY_OF_MONTH)+"";
%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<head>
<style>
#preYear {border:0; background:white; font-size:25px;}
#preYear:focus{outline: none;}
#preMonth {border:0; background:white;font-size:25px;}
#preMonth:focus{outline: none;}
#nextMonth {border:0; background:white;font-size:25px;}
#nextMonth:focus{outline: none;}
#nextYear {border:0; background:white;font-size:25px;}
#nextYear:focus{outline: none;}
#datePage {overflow:hidden; text-align:center; margin-top:30px; margin-left:80px; height:100px;}
#tb {margin-left:60px; margin-top:40px; border:1px solid #ccc;}
td {border:1px solid #ccc;}
#pre , #next{width:160px; float:left;}
#sel {float:left; overflow:hidden; width:150px; text-align:center; cursor:default;}
	#selDate {float:left; width:150px;}
	#yearList, #monthList {float:left; width:75px;}

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
   margin: 70px auto;
   margin-left:260px;
   width:150px;
   height:300px;
   color:white;
   background: rgba(0, 0, 0, 0.8);
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거래 확인</title>
</head>
<body>
<jsp:include page="lightBox.jsp"></jsp:include>
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
      
      <table id = "tb" border = 1></table>
      <script id = "temp" type = "text/x-handlebars-template">
      <tr>
         <td>계좌번호</td>
         <td>은행명</td>
         <td>입/출금</td>
         <td>입/출금액</td>
         <td>잔액</td>
         <td>날짜</td>
      </tr>
      {{#each .}}
          <tr class = "row" style="{{printStyle depositType}}"> 
             <td>{{depositAccountCode}}</td> 
             <td>{{depositAccountBankName}}</td> 
             <td>{{depositType}}</td> 
             <td>{{fmtNumber depositAmount}}원</td> 
             <td>{{fmtNumber depositBalance}}원</td> 
             <td>{{trimString deposit_day}}</td> 
          </tr> 
       {{/each}} 
-    </script>
   <script>
         Handlebars.registerHelper("fmtNumber", function(depositAmount){
           return depositAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         });
         Handlebars.registerHelper("fmtNumber", function(depositBalance){
              return depositBalance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            });
   </script>
   <script>
      Handlebars.registerHelper('trimString', function(deposit_day){
         var day = deposit_day.substring(0,11);
         return new Handlebars.SafeString(day);
      });
   </script>
   <script>
      Handlebars.registerHelper("printStyle", function(depositType){
         if(depositType=='입금'){ 
            return "color:blue";
         }else{
            return "color:red";
         }
      });

   </script>
</body>
<script>
var depositAccountCode = "${vo.depositAccountCode}";

$("#selDate").html(<%=thisYear%> +" / "+ <%=thisMonth%>);
$("#dailyLightBox").hide();
let year = $("#selDate").html().split("/")[0];
year = year.trim();
let month = $("#selDate").html().split("/")[1];
month = month.trim();
let date = year +"/"+ month;
// let amount;
getYear();
getMonth();
getList();
yearCount();
monthCount();

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
   $("#selDate").html(year +" / "+ month);
   $("#dailyLightBox").hide();
   yearCount();
   monthCount();
   getList();
});

$("#preYear").on("click", function() {
	lightBox();
	setTimeout(outLightBox, 300);
    preYearControl();
    monthCount();
    yearCount();
    getList();
 });

 $("#nextYear").on("click", function() {
	 lightBox();
		setTimeout(outLightBox, 300);
    nextYearControl();
    yearCount();
    monthCount();
    getList();
 });

 $("#preMonth").on("click", function() {
	 lightBox();
		setTimeout(outLightBox, 300);
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
//    preMonthControl();
    monthCount();
    yearCount();
    getList();
 });

 $("#nextMonth").on("click", function() {
	 lightBox();
		setTimeout(outLightBox, 300);
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
//    nextMonthControl();
    monthCount();
    yearCount();
    getList();
 });

   
   function getList(){
      YM();
      var depositAccountCode = "${vo.depositAccountCode}"
      $.ajax({
         type : "get",
         url : "depositassetsread",
         data : {"depositAccountCode":depositAccountCode, "date":date},
         success:function(data){
            var temp=Handlebars.compile($("#temp").html());
            $("#tb").html(temp(data));
         }
      });
   }
   
   function getYear() {
         var yearList = "<div id='year'>";
         var y = 0;
         $.ajax({
            type:"get",
            url:"DEdailyYearList.json",
            data:{"depositAccountCode":depositAccountCode},
            dataType:"json",
            success:function(data) {
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
            url:"DEdailyMonthList.json",
            dataType:"json",
            data:{"year":year, "depositAccountCode":depositAccountCode},
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
      
      function yearCount() {
//          YM();
            $.ajax({
              type:"get",
              url:"DEYearList.json",
              data:{"depositAccountCode":depositAccountCode},
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
                 url:"DEYearList.json",
                 data:{"depositAccountCode":depositAccountCode},
                 success:function(data) {
                    let yArray = new Array();
                    $(data).each(function() {
                      yArray.push(this);
                    });
                    var first = "20" + yArray[0];
                    var last = "20" + yArray[yArray.length-1];
                       $.ajax({
                          type:"get",
                          url:"DEMonthList.json",
                          data:{"year":year, "depositAccountCode":depositAccountCode},
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
                             if(year == first && year== last){
                                if(month == mLast){
                                   $("#preMonth").prop("disabled", false);
                                   $("#nextMonth").prop("disabled", true);
                                }
                                if(month == mFirst){
                                   $("#preMonth").prop("disabled", true);
                                   $("#nextMonth").prop("disabled", false);
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
                                if(month == mFirst){
                                   $("#preMonth").prop("disabled", true);
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
         
         function preYearControl() {
            $.ajax({
                 type:"get",
                 url:"DEYearList.json",
                 data:{"depositAccountCode":depositAccountCode},
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
                          url:"DEMonthList.json",
                          data:{"year":year,"depositAccountCode":depositAccountCode},
                          success:function(data) {
                             if(year == first) {
                                let mArray = new Array();
                                $(data).each(function() {
                                   mArray.push(this);
//                                    
                                });
                                var mFirst = mArray[0];
                                for(var i = 1; i <= 9; i++) {
                                   if(mFirst == i) {
                                      mFirst = "0" + mFirst;
                                   }
                                }
                                $("#selDate").html(year +" / "+ mFirst);
                                getList();
                             }
                             if(year != first) {
                                
                                $("#selDate").html(year +" / "+ month);
                                getList();
                             }
                             
                          }
                       });
                 }
               });
         }
         
         function nextYearControl() {
            $.ajax({
                 type:"get",
                 url:"DEYearList.json",
                 data:{"depositAccountCode":depositAccountCode},
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
                          url:"DEMonthList.json",
                          data:{"year":year, "depositAccountCode":depositAccountCode},
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
                                getList();
                             }
                             if(year != last) {
                                $("#selDate").html(year +" / "+ month);
                                getList();
                             }
                          }
                       });
                 }
               });
         }
         
         
</script>
</html>