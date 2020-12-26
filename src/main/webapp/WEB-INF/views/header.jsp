<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><%
   GregorianCalendar cal = new GregorianCalendar();
   String thisYear = cal.get(GregorianCalendar.YEAR)+"";
   String thisMonth = cal.get(GregorianCalendar.MONTH)+1+"";
%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/style.css">
<style>
#profile {
   float: left;
   margin-top: 30px;
}

#darken-backgrounds {
   position: absolute;
   top: 0px;
   left: 0px;
   right: 0px;
   height: 100%;
   display: none;
   background: rgba(0, 0, 0, 0);
   z-index: 1000;
   overflow: hidden;
}

#lightboxs {
   right: 1350px;
   z-index: 1000;
   position: fixed;
   width: 400px;
   margin: 20px auto;
   padding: 25px;
   border: 1px solid #333333;
   border-radius: 5px;
   background: white;
   box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
   text-align: center;
}

span {
   float: left;
   color:black;
}

#btnProfile {
   margin-bottom: 50px;
   margin-right: 50px;
}

#divicon {
   margin-right: 10px;
   border: 1px solid lightgray;
   margin-top: 100px;
   padding: 25px 15px 25px 15px;
}

img {
   margin-left:24%;
   align: center;
   width: 200px;
   height: 120px;
}

   #thisMonthList {text-align:center; font-size:14px; height:100px; z-index:11111111111111;
   color:black; float:right; margin-right:80px; margin-top:10px;}
   .type {width:100px;}
   .amount {width:120px;}
   .rate {width:100px;}
   .lastRate {width:100px;}
   #mlist{margin-bottom:200px; width:600px; height:100px; float:right;}
</style>
</head>
<body>



   <div id="header">
      <img src="../resources/Triple sss.png" onclick="location.href= 'main'">
      <div id="mlist"><table id="thisMonthList"></table></div>
         <button type="button" class="button" id="profile"
         style="width: 60px; float: left; margin-left: 1px;">
         <i class="icono-user"></i>
      </button>
   <div id="darken-backgrounds">
      <div id="lightboxs">
         <div id="btnId">
            <button type="button" class="button" id="btnProfile"
               style="width: 60px; float: left; margin-left: 1px;">
               <i class="icono-user"></i>
               <c:if test="${adminId!=null}">
                  <span style="font-size: 13px; margin-top: 15px;">${adminId}</span>
               </c:if>
            </button>

         </div>
         <div id="divName" style="margin-left: 20px;">
            <c:if test="${companyName!=null}">
               <span><b style="font-size: 20px;">${companyName}</b>&nbsp;&nbsp;님
                  <br /> 환영합니다. </span>
            </c:if>
         </div>
         <div id="divicon">
            <button type="button" class="button" id="btnChange"
               style="width: 100px; color: white; background: #547484; margin-right: 50px; margin-bottom: 20px;">비밀번호
               변경</button>
            
            <button type="button" class="button" id="logout"
               style="width: 100px; color: white; background: #547484; margin-right: 50px; padding: 15px 15px 15px 15px;">로그
               아웃</button>
         </div>
      </div>
   </div>   
   </div>
   
<input type="hidden" id="value">
</body>
<script>
var openWin;
setInterval(interval, 1000);
//비밀번호 변경
$("#btnChange").on("click", function() {
         openWin = window.open("pwUpdate", "btnChange", 'left='
               + (screen.availWidth + 660) / 7
               + ', width=500px, height=250px');
      });
      
      
//로그아웃
$("#logout").click(function() {
   if(!confirm("로그아웃 하시겠습니까?")) return; 
      location.href = "logout";
});

$(document).ready(function() {
   function showLightBoxs() {
      //라이트박스를 보이게 한다. 
      $("#darken-backgrounds").show();
   }
   function hideLightBoxs() {
      $("#darken-backgrounds").hide();
   }
   $("#darken-backgrounds").click(function() {
      hideLightBoxs();
   });
   $("#profile").on("click", function() {
      showLightBoxs();
   });
});

function interval() {
	if($("#value").val() != "") {
		alert("로그인창으로 넘어갑니다.");
		location.href="logout";
	}
}

getThisMonthList();

function getThisMonthList() {
   $.ajax({
      type:"get",
      url:"thisMonthList.json",
      success:function(data) {
         var addList = "";
         $(data).each(function() {
            var date = "20" + this.date;
            var salesAmount = this.salesAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            var refundAmount = this.refundAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            var costAmount = this.costAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            var lastSalesAmount = this.lastSalesAmount;
            var lastRefundAmount = this.lastRefundAmount;
            var lastCostAmount = this.lastCostAmount;
            var targetSales = this.targetSales;
            var targetCost = this.targetCost;
            var strSalesRate = (this.salesAmount/targetSales)*100;
            var salesRate = strSalesRate.toFixed(1);
            var strCostRate = (this.costAmount/targetCost)*100;
            var costRate = strCostRate.toFixed(1);

            var strLastSalesRate = (this.salesAmount/this.lastSalesAmount)*100;
            var lastSalesRate = strLastSalesRate.toFixed(1);
            var strLastRefundRate = (this.refundAmount/lastRefundAmount)*100;
            var lastRefundRate = strLastRefundRate.toFixed(1);
            var strLastCostRate = (this.costAmount/lastCostAmount)*100;
            var lastCostRate = strLastCostRate.toFixed(1);
            addList += "<tr class='tr'><td class='type'>"+date+"</td><td class='amount'>이번달 발생 금액</td><td class='rate'>목표 대비 비율</td><td class='lastRate'>전월 대비 비율</td></tr>";
            addList += "<tr class='tr' id='salesTR'><td class='type'>매출</td><td class='amount'>￦ "+salesAmount+"</td><td class='rate' id='salesRate'>"+salesRate+"%</td><td class='lastRate' id='salesLastRate'>"+lastSalesRate+"%</td></tr>";
            addList += "<tr class='tr' id='refundTR'><td class='type'>환불</td><td class='amount'>￦ "+refundAmount+"</td><td class='rate'></td><td class='lastRate' id='refundLastRate'>"+lastRefundRate+"%</td></tr>";
            addList += "<tr class='tr' id='costTR'><td class='type'>비용</td><td class='amount'>￦ "+costAmount+"</td><td class='rate' id='costRate'>"+costRate+"%</td><td class='lastRate' id='costLastRate'>"+lastCostRate+"%</td></tr>";
         });
         $("#thisMonthList").html(addList);
         
         
         $("#thisMonthList").each(function() {
            $(this).find("#salesTR").each(function() {
               var strSR = $(this).find("#salesRate").html();
               var SR = strSR.split(".")[0];
               if(SR.length >= 3) {
                  $(this).find("#salesRate").css("color", "blue");
               }
               
               var strLR = $(this).find("#salesLastRate").html();
               var LR = strLR.split(".")[0];
               if(LR.length >= 3) {
                  $(this).find("#salesLastRate").css("color", "blue");
               }
            });
            
            $(this).find("#refundTR").each(function() {
               var strLR = $(this).find("#refundLastRate").html();
               var LR = strLR.split(".")[0];
               if(LR.length >= 3) {
                  $(this).find("#refundLastRate").css("color", "red");
               }
            });
            
            $(this).find("#costTR").each(function() {
               var strSR = $(this).find("#costRate").html();
               var SR = strSR.split(".")[0];
               if(SR.length >= 3) {
                  $(this).find("#costRate").css("color", "red");
               }
               
               var strLR = $(this).find("#costLastRate").html();
               var LR = strLR.split(".")[0];
               if(LR.length >= 3) {
                  $(this).find("#costLastRate").css("color", "red");
               }
            });
         });
      }
   });
}
</script>
</html>