<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> login </title>
<style>
	#mainThisMonthlyData {width:120px; height:100px;}
</style>
</head>
<body>
<!-- <table id="salesList" border=1></table> -->



<table id="tbl1" border=1></table>
<!-- <div id="mainThisMonthlyData"></div> -->
</body>
<script>

get();

function get() {
    var addList = "";
    var dataCnt = 0;
    var cnt = 0;
    var oldCategory;
    var lCategory;
    var category;
    var maxCnt = 0;
    let lCategoryArray = new Array();
    let mCategoryCountArray = new Array();
    $.ajax({
       type:"get",
       url:"lcategorylist.json",
       success:function(data) {
          let mCategoryArray = new Array();
          $(data).each(function() {
             mCategoryArray.push(this.CATEGORYNAME.split("/")[2]);
          });
          $(data).each(function() {
        	  dataCnt++;
        	  if(this.CATEGORYCODE.split("/")[2]!="000"){
             var lCategory = this.CATEGORYNAME.split("/")[1];
                if(lCategory != oldCategory) {
                   lCategoryArray.push(lCategory);
                   cnt = 0;
                   cnt++;
                }if(lCategory == oldCategory) {
                   cnt++;
                }
                
                if(cnt < maxCnt) {
 //                    alert(cnt +":"+ maxCnt);
                   mCategoryCountArray.push(maxCnt);
                }
                maxCnt = cnt;
                if(mCategoryArray.length == dataCnt) {
                   mCategoryCountArray.push(maxCnt);
                }
             oldCategory = lCategory;
          }
          });
          addList += "<thead><td width=100>대분류</td><td width=100>중분류 상품 코드</td><td width=200>중분류 상품 이름</td></thead></tbody id=''body>";
			cnt = 0;
			dataCnt = 0;
          $(data).each(function() {
          	category = this.CATEGORYNAME.split("/")[1];
             if(this.CATEGORYCODE.split("/")[2]!="000"){
          	   category = this.CATEGORYNAME.split("/")[1];
          	   if(category != oldCategory) {
          		   cnt = 0;
          	   }
          	   if(cnt == 0) {
          		   addList += "<tr frontCode='"+this.CATEGORYCODE.split("/")[0]+"/"+this.CATEGORYCODE.split("/")[1]+"' cnt='"+cnt+"' class='row' code='"+this.CATEGORYCODE+"' name='"+this.CATEGORYNAME.split("/")[1]+"'><td rowspan='"+mCategoryCountArray[dataCnt]+"' width=100 class='lcategoryname' >"+this.CATEGORYNAME.split("/")[1]+"<input type='button' class='btnaddrow' value='+'></td>";
  	               addList += "<td width=100 class='mcategorycode'>"+this.CATEGORYCODE.split("/")[2]+"</td>";
  	               addList += "<td width=100 class='mcategoryname' ><input type='text' size=30  class='midname' value="+this.CATEGORYNAME.split("/")[2]+"></td></tr>";
  	               dataCnt++;
          	   }
          	   if(cnt != 0) {
  	               addList += "<tr frontCode='"+this.CATEGORYCODE.split("/")[0]+"/"+this.CATEGORYCODE.split("/")[1]+"' cnt='"+cnt+"'><td width=100 class='mcategorycode'>"+this.CATEGORYCODE.split("/")[2]+"</td>";
  	               addList += "<td width=100 class='mcategoryname' ><input type='text' size=30  class='midname' value="+this.CATEGORYNAME.split("/")[2]+"></td></tr>";
          	   }
             cnt++;
             oldCategory = category;
             }
          }); 
             addList +="</tbody>";
             $("#tbl1").html(addList);
       }
    });
}

$("#tbl1").on("click", ".row .lcategoryname .btnaddrow", function() {
	var cnt;
	var rowspan = $(this).parent().attr("rowspan");
	var frontCode = $(this).parent().parent().attr("code").split("/")[0] +"/"+ $(this).parent().parent().attr("code").split("/")[1];
	$(this).parent().parent().parent().find("tr").each(function() {
		if($(this).attr("frontCode") == frontCode) {
			cnt = $(this).find(".mcategorycode").html();
		}
	});
	$(this).parent().parent().parent().find("tr").each(function() {
		if($(this).attr("frontCode") == frontCode) {
			if($(this).find(".mcategorycode").html() == cnt) {
				var intCnt = cnt;
				intCnt++;
				intCnt = intCnt+"";
				if(intCnt.length == 2) {
					intCnt = "0" + intCnt;
				}
				if(intCnt.length == 1) {
					intCnt = "00" + intCnt;
				}
				$(this).after("<tr frontCode='"+frontCode+"' cnt='"+intCnt+"'><td class='mcategorycode'>"+intCnt+"</td><td>"+intCnt+"</td></tr>");
			}
		}
	});
	rowspan++;
	$(this).parent().attr("rowspan", rowspan);
});



mainThisMonthlyData();
function mainThisMonthlyData() {
	var date = "2019/12";
	$.ajax({
		type:"get",
		url:"mainThisMonthlyTotal.json",
		data:{"date":date},
		success:function(result) {
			function changeChart(){
			       google.charts.load('current', {'packages':['corechart']});
			       google.charts.setOnLoadCallback(drawVisualization);
			      		function drawVisualization() {
//			                     var result = [["과목","점수"],["국어",90],["영어",80]];
			                    	var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
			                    	var options = {
			                    			vAxis : {
			                    			},
			                    			hAxis : {
			                    				maxValue : 500000000,
			                    				minValue : 0,
			                    				ticks : ['0%', '100%']
			                    			},
			                    			series : {
			                    				0: {color: 'red'}
			                    				
			                    			},
			                    			bar : {
			                    				groupWidth : '80%' // 그래프 너비 설정 %
			                    			},
			                    			legend : 'none'
			                    			}; /* 옵션 셋팅 */
			                    	var chart = new google.visualization.BarChart(document.getElementById('mainThisMonthlyData'));
			                    		chart.draw(data, options); /* 차트 그리기 */
			        	}
			    }
			$("#mainThisMonthlyData").html(changeChart());
		}
	});
}

getSalesCategoryCount();

function getSalesCategoryCount() {
    var addSalesList = "";
    var dataCnt = 0;
    var cnt = 0;
    var oldCategory;
    var lCategory;
    var maxCnt = 0;
    $.ajax({
       type:"get",
       url:"salesCategoryCount.json",
       success:function(data) {
          let mCategoryArray = new Array();
          $(data).each(function() {
             mCategoryArray.push(this.CATEGORY.split("/")[1]);
          });
          let lCategoryArray = new Array();
          let mCategoryCountArray = new Array();
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
 //                    alert(cnt +":"+ maxCnt);
                   mCategoryCountArray.push(maxCnt);
                }
                maxCnt = cnt;
                if(mCategoryArray.length == dataCnt) {
                   mCategoryCountArray.push(maxCnt);
                }
             oldCategory = lCategory;
          });
          
 //          alert(lCategoryArray);
 //          alert(mCategoryCountArray);
 //          alert(mCategoryArray.length);
          var cnt = 0;
          var mcTotal ="소계";
          var payArray = ['현금', '카드', '기타'];
          for(var i = 0; i < lCategoryArray.length; i++) {
             addSalesList += "<tr id='"+lCategoryArray[i]+"'><td width=150 rowspan='"+(mCategoryCountArray[i]+3)+"'>"+lCategoryArray[i]+"</td>";
             addSalesList += "<td width=150 rowspan='3'>결제방법</td>";
             
             for(var a = 0; a < payArray.length; a++) {
                var id = lCategoryArray[i]+"/"+payArray[a];
                if(a == 0) {
                	addSalesList += "<td class='payType'>"+payArray[a]+"</td><td id='"+id+"' code='"+id+"' class='payTypeGraph'></td>";
                }
                if(a != 0) {
                	addSalesList += "<tr><td class='payType'>"+payArray[a]+"</td><td id='"+id+"' code='"+id+"' class='payTypeGraph'></td></tr>";
                }
             }
             addSalesList += "</tr>";
             addSalesList += "<tr><td width=150 rowspan='"+(mCategoryCountArray[i])+"'>상품명</td>";
             for(var z = 0; z < mCategoryCountArray[i]; z++) {
            	 var id = lCategoryArray[i] +"/"+ mCategoryArray[z];
            	 if(z==0){
            		 addSalesList += "<td class='mc'>"+mCategoryArray[cnt]+"</td><td class='"+id+"'></td></tr>";
            	 }
            	 if(z!=0){
            		 addSalesList += "<tr><td class='mc'>"+mCategoryArray[cnt]+"</td><td class='"+id+"'></td></tr>";
            	 }
                cnt++;
             }
             var sid = lCategoryArray[i];
             addSalesList += "<td colspan=3>소계</td><td id ='"+sid+"' sCode ='"+sid+"' class ='st'></td></tr>"    
//              addSalesList += "<td colspan=3 class ='subTotal'>소계</td><td class='stGraph'></td></tr>";
          }
          var tcnt = 0;
          for(var a = 0; a < payArray.length; a++) {
             var tid = payArray[a];
             if(a == 0) {
            	 addSalesList += "<tr><td rowspan='3'>총 합계</td><td colspan ='2'>"+payArray[a]+"</td><td id ='"+tid+"'></td></tr>";
             }
             if(tcnt != 0) {
            	 addSalesList += "<tr><td colspan ='2'>"+payArray[a]+"</td><td id ='"+tid+"'></td></tr>";
             }
             tcnt++;
          }
                
 //          alert(addSalesList);
          $("#salesList").html(addSalesList);
//           $("#현금").html(cashPayChart);
//           $("#카드").html(cardPayChart);
//           $("#기타").html(etcPayChart);
//           $("#salesList #id").html(lCategoryPayChart);
//           $("#subTotal").html(subTotalChart);

          $("#salesList tr").each(function() {
     		 $(this).find(".payGraph").html("카드");
     		 $(this).find(".mcGraph").html("그래프");
     		 $(this).find(".st").html("소계");
     	 });
		
          
          $("#salesList tr").each(function() {
			var code = $(this).find(".payTypeGraph").attr("code");
			if(code != null) {
				var lCategory = code.split("/")[0];
				var payType = code.split("/")[1];
				var date = "2019/12/18";
				 function changeChart(){
				       google.charts.load('current', {'packages':['corechart']});
				       google.charts.setOnLoadCallback(drawVisualization);
				      		function drawVisualization() {
				            	$.ajax({
				                	type:"get",
					                url:"salesCategoryPayType.json",
					                dataType:"json",
					                data:{"date":date, "payType":payType, "lCategory":lCategory},
				                	success:function(result){
//				                     var result = [["과목","점수"],["국어",90],["영어",80]];
				                    	var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
				                    	var options = {
				                    			vAxis : {
				                    			},
				                    			hAxis : {
				                    				maxValue : 5000000,
				                    				minValue : 0,
				                    				ticks : ['0%', '100%']
				                    			},
				                    			series : {
				                    				0: {color: 'red'}
				                    				
				                    			},
				                    			bar : {
				                    				groupWidth : '20%' // 그래프 너비 설정 %
				                    			},
				                    			legend : 'none'
				                    			}; /* 옵션 셋팅 */
				                    	var chart = new google.visualization.BarChart(document.getElementById(code));
				                    		chart.draw(data, options); /* 차트 그리기 */
				                	}
				            	});
				        	}
				    }
				 $(this).find(".payTypeGraph").text(changeChart());
			}
          });
       }
    });
 }
 
 
 
</script>
</html>