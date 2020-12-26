<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
  
   <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        $.ajax({
             type : "get",
             url : "/depositpercent.json",
             success:function(result){
                alert("result" + result);
                var options = {
                       title: 'My Daily Activities'
                     };
                var data = google.visualization.arrayToDataTable(result);
                     var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                     chart.draw(data, options);
             }
          });
      }
    </script>
</html>