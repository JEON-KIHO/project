<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.GregorianCalendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
   GregorianCalendar cal = new GregorianCalendar();
   String thisYear = cal.get(GregorianCalendar.YEAR)+"";
   String thisMonth = cal.get(GregorianCalendar.MONTH)+1+"";
   String thisDay = cal.get(GregorianCalendar.DAY_OF_MONTH)+"";
%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/style.css">
<link rel="stylesheet" href="../resources/icono.css">
<title>자산</title>
<style>
#Totaltbl {
   border: 1px solid #444444;
}

#total_chart {
   margin-left: 30px;
   margin-top: 250px;
}



#btDeposit {
   float: right;
   border-radius: 20px;
   background-color: white;
   cursor: pointer;
}

#Desposit {
   margin: 10px 10%;
   margin-left: 150px;
   margin-top:50px;
   width:1300px;
   
}

#btLoans {
   float: right;
   border-radius: 20px;
   background-color: white;
   cursor: pointer;
}

#Loans {
   margin: 10px 10%;
   margin-top:300px;
   width:1300px;
   
}

#divCenter {
   width: 1500px;
   height: 900px;
   margin-left: 200px;
}

#selYear {
   float: left;
   margin-left: 610px;
   margin-top: 30px;
}

#selMonth {
   float: left;
   margin-top: 30px;

}

select {
   width: 100px;
   padding: .5em .3em;
   font-size: 15px;
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   border: 1px solid #597484;
   border-radius: 5px;
   text-align: center;
}

table #Desposit, table #Loans{
   width: 1400px;
   margin-top:30px;
   text-align: center;
}
td {text-align: center; border-bottom: 1px solid #ccc;}
.dtd, .ltd {
   width: 1400px;
   height: 30px;
   text-align: center;
   
   
}
.ltd{height:40px;}
span {
   color: black;
}

   *:focus { outline: none; }
a:hover{color:red;}

</style>
</head>

<body>

      <jsp:include page="menu.jsp"></jsp:include>
    <div id="divTop"></div>
    <div id="divCenter">

   <div id = "total_chart" style="width:1500px; height:300px;"></div>
   <div id="sel">
      <div id="selYear"></div>
      <div id="selMonth"></div>
      </div>   
 
   <div id = "Desposit">
      <table style = "border-collapse:collapse; border: 1px solid #ccc; float:left;">
         <tr>
            <td colspan ="4">예금<input type = "button" value = "그래프" id = "btDeposit"></td>
         </tr>
         <tr>
            <td class="dtd" style="background-color:#EAEAEA">은행명</td>
            <td class="dtd" style="background-color:#EAEAEA">계좌번호</td>
            <td class="dtd" style="color:red; background-color:#EAEAEA;">통장잔액</td>
            <td class="dtd" style="background-color:#EAEAEA">이율</td>
         </tr>
         <c:forEach items = "${Dlist}" var = "vo">
            <tr>
               <td class="dtd">${vo.depositAccountBankName}</td>
               <td class="dtd" style="cursor: pointer;"><a onclick = "window.open('depositassets?depositAccountCode=${vo.depositAccountCode}','예금계좌내역', 'width=700, height=600');">${vo.depositAccountCode}</a></td><td style="color:red;"><fmt:formatNumber value="${vo.depositBalance}" pattern="#,###"/>원</td>
               <td class="dtd">${vo.depositAccountRate}%</td>
            </tr>
         </c:forEach>
      </table>
   </div>
   <div id = "Loans">
      <table style = "border-collapse:collapse; border: 1px solid #ccc; margin-top:300px;">
         <tr>
            <td colspan = "8">대출<input type ="button" value = "그래프" id ="btLoans"></td>
         </tr>
         <tr>
            <td class="ltd" style="background-color:#EAEAEA">은행명</td>
            <td class="ltd" style="background-color:#EAEAEA">계좌 번호</td>
            <td class="ltd" style="background-color:#EAEAEA">시작일</td>
            <td class="ltd" style="background-color:#EAEAEA">만료일</td>
            <td class="ltd" style="background-color:#EAEAEA">이율</td>
            <td class="ltd" style="color:red; background-color:#EAEAEA;">대출원금</td>
            <td class="ltd" style="background-color:#EAEAEA">상환금액</td>
            <td class="ltd" style="color:red; background-color:#EAEAEA;">대출잔액</td>
         </tr>
         <c:forEach items = "${Llist}" var = "vo">
            <tr>
               <td class="ltd">${vo.loansAccountBankName}</td>
               <td class="ltd" style="cursor: pointer;"><a onclick = "window.open('loansassets?loansAccountCode=${vo.loansAccountCode}','대출계좌내역', 'width=700, height=600');">${vo.loansAccountCode}</a></td>               <td>${vo.loansAccount_startDay.substring(0,11)}</td>
               <td class="ltd">${vo.loansAccount_endDay.substring(0,11)}</td>
               <td class="ltd">${vo.loansAccountRate}%</td>
               <td class="ltd" style="color:red;"><fmt:formatNumber value="${vo.loansAccountAmount}" pattern="#,###"/>원</td>
               <td class="ltd"><fmt:formatNumber value="${vo.loansAmount}" pattern="#,###"/>원</td>
               <td class="ltd" style="color:red;"><fmt:formatNumber value="${vo.loansBalance}" pattern="#,###"/>원</td>
            </tr>
         </c:forEach>
      </table>
   </div>
   </div>
   <div id="footer"><jsp:include page="footer.jsp" /></div>
</body>
<script>
var companyCode = "347-88-00867";
getYear();
var year = <%=thisYear%>-1;
getMonth();
var month = <%=thisMonth%>;
var date = year +"/"+ month;

   $("#sel").on("change", "#selYear #year", function() {
      year = $(this).val();
      getMonth();
      month = $(this).parent().parent().find("#selMonth").find("#month").val();
      date = year+"/"+month;
      drawChart();
   });

   $("#sel").on("change", "#selMonth #month", function() {
      year = $(this).parent().parent().find("#selYear").find("#year").val();
      month = $(this).val();
      date = year+"/"+month;
      drawChart();
   });
   
   function getYear() {
         var yearOption = "<select name='year' id='year' class='selDate'>";
         var daily;
         var cnt = 0;
         var y = 0;
         $.ajax({
            type:"get",
            url:"dailyYear.json",
            dataType:"json",
            success:function(data) {
               $(data).each(function() {
                  daily = this.day;
                  var year = daily.split("-")[0];
                  var oldY = year;
                  if(cnt == 0) {
                     yearOption += "<option value='"+oldY+"'>"+oldY+"</option>";
                  } else {
                     if(oldY != y) {
                        yearOption += "<option value='"+oldY+"'>"+oldY+"</option>";
                     }
                  }
                  y = oldY;
                  cnt++;
               });
               yearOption += "</select>";
               $("#selYear").html(yearOption);
               $("#sel").find("#selYear").find("#year").val(<%=thisYear%>-1).prop("selected", true);
            }
         });
      }

      function getMonth() {
         var monthOption = "<select name='month' id='month' class='selDate'>";
         var daily;
         var cnt = 0;
         var m = 0;
         $.ajax({
            type:"get",
            url:"dailyMonth.json",
            dataType:"json",
            data:{"date":year},
            success:function(data) {
               $(data).each(function() {
                  daily = this.day;
                  var month = daily.split("-")[1];
                  var oldM = month;
                  if(cnt == 0) {
                     monthOption += "<option value='"+oldM+"'>"+oldM+"</option>";
                  } else {
                     if(oldM != m) {
                        monthOption += "<option value='"+oldM+"'>"+oldM+"</option>";
                     }
                  }
                  m = oldM;
                  cnt++;
               });
               monthOption += "</select>";
               $("#selMonth").html(monthOption);
               $("#sel").find("#selMonth").find("#month").val(<%=thisMonth%>).prop("selected", true);
            }
         });
      }

      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
//          var date = year + "/" + month;
//         alert(date);
         
           $.ajax({
             type : "get",
             url : "total.json",
//              data : {"date":date},
             success:function(result){
                
                var options = {
                     title: '예금 & 대출 총액',
                     chartArea : {width:'80%', height:'80%'},
                     hAxis : {
                         minValue : 0
                      },
                      series : {
                    	  0 : {color: '#A19CFF'},
                          1 : {color: '#CEFFC7'}
                          
                       },
                  };
                
                var data = google.visualization.arrayToDataTable(result);
                   var chart = new google.visualization.BarChart(document.getElementById('total_chart'));
                  chart.draw(data, options);
             }
        });
     }
</script>
<script>   
   $("#btDeposit").on('click', function(){
      window.open("depositpercent","예금퍼센트", "width=600, height=600")
   });
   
   $("#btLoans").on('click', function(){
      window.open("loanspercent", "대출퍼센트", "width=600, height=600")
   });
</script>

</html>