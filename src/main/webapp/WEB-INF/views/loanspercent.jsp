<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div id="piechart" style="width:500px; height:500px;"></div>
</body>

   <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        $.ajax({
             type : "get",
             url : "/loanspercent.json",
             success:function(result){
                var options = {
                       title: '대출 퍼센트',
                       chartArea : {width:'100%', height:'80%'},
                       legend : {position : 'bottom'}
                     };
                var data = google.visualization.arrayToDataTable(result);
                     var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                     chart.draw(data, options);
             }
          });
      }
    </script>
</html>