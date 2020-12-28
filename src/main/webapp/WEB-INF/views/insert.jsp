<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%Calendar cal = new GregorianCalendar();
String year= cal.get(GregorianCalendar.YEAR)+"";
String month=cal.get(GregorianCalendar.MONTH)+1+"";
String day = cal.get(GregorianCalendar.DAY_OF_MONTH)+"";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[매출 및 비용 입력]</title>
<style>
   html, body {margin:0;text-align: center;}
   #divCenter {width: 1600px; height: 1000px; margin-left: 200px; margin-top:50px;}
   .tabbed {width:70%; min-width:300px;margin: 0 auto;margin-top:100px;border-bottom: 4px solid #000;overflow: hidden;transition: border 250ms ease;}
     #tbl {color: #669;font-family:"Lucida Sans Unicode", "Lucida Grande", Sans-Serif;width:200px; height:40px;overflow: hidden;transition: border 250ms ease;border-collapse: collapse;}
   .tabbed ul {margin:0px;padding: 0px;overflow: hidden; float:left;list-style-type: none; width:1200px; height:37px; margin-top:100px;}
   .tabbed ul * {margin:0px;padding: 0px;}
   .tabbed ul li {display: block;float: right;padding: 10px 24px 8px;background-color: #FFF;margin-right: 46px;z-index: 2;position: relative;
               cursor: pointer;color: #777;text-transform: uppercase;transition: all 250ms ease;font: 600 13px/20px roboto, "Open Sans", Helvetica, sans-serif;}
   .tabbed ul li:before, .tabbed ul li:after {display: block; content: "";position: absolute;top: 0;height: 100%;width: 44px;background-color: #FFF;transition: all 250ms ease;}
   .tabbed ul li:before {right: -24px;transform: skew(30deg, 0deg);box-shadow: rgba(0,0,0,.1) 3px 2px 5px, inset rgba(255,255,255,.09) -1px 0;}
   .tabbed ul li:after {left: -24px;transform: skew(-30deg, 0deg);box-shadow: rgba(0,0,0,.1) -3px 2px 5px, inset rgba(255,255,255,.09) 1px 0;}
    .tabbed ul li:hover, .tabbed ul li:hover:before, .tabbed ul li:hover:after {background-color: #F4F7F9;color: #444;} 
   .tabbed ul li.active {z-index: 3;}
   .tabbed ul li.active, .tabbed ul li.active:before, .tabbed ul li.active:after {background-color: #000;color: #fff;}
   /* Round Tabs */
  
   .tabbed.round ul li {display: block; border-radius: 8px 8px 0 0;}
   .tabbed.round ul li:before {display: block; border-radius: 0 8px 0 0;}
   .tabbed.round ul li:after {display: block; border-radius: 8px 0 0 0;}
   .tag{display: block; width:180px; text-decoration:none; font-size:15px;}
   input{font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;outline:none; border: none; background: transparent;text-align: center;}
   #saletbl th, #saletbl1 th, #refundtbl th, #refundtbl1 th,#insertInven th{font-size: 16px;font-weight: normal;color: #039;padding: 10px 8px;border-bottom: 2px solid #6678b1;}
   #saletbl td,#saletbl1 td,#refundtbl td,#refundtbl1 td,#insertInven td{width:180px;cursor: pointer; color: #669;padding: 10px 8px; font-size: 16px;font-weight: normal; border:0; border-bottom:1px solid  #ccc;}
   table tbody tr:hover td{color: #009;}
   #saletbl,#refundtbl {margin-left:150px; margin-top:50px;}
   #tabs,#tabs1 {width:110px; margin:0; padding:0; list-style:none; overflow:hidden; }
    #tabs li,#tabs1 li {padding:5px; margin-right:0; background-color:white; width:100px; height:30px; cursor: pointer; text-transform: uppercase;transition: all 250ms ease;font: 600 13px/20px roboto, "Open Sans", Helvetica, sans-serif;text-align: center;
             border-radius: 8px 0px 0px 8px;box-shadow: rgba(0,0,0,.1) -3px 2px 5px, inset rgba(255,255,255,.09) 1px 0;}
    #tabs li a,#tabs1 li a {color:#fff; text-decoration:none;}
    .wrap ul #tabs li.active, .wrap ul #tabs1 li.active {background-color: #fff; border-bottom: 1px solid #fff;font-weight: bold;color:darkkhaki;}
    #wrapper ul li:hover, #wrapper1 ul li:hover {background-color:#6678b1;}
    #tabs li.active, #tabs1 li.active {background-color:#6678b1; margin-right:0;}
    #tabs li.active a, #tabs1 li.active a {color:#000; text-decoration:none;}
     #tabs li:active, #tabs1 li:active {transform: translateY(4px);}
     
     #frmtbl4, #frmtbl5 {width:500px;}
    #modal, #modal1 {margin-right:0;text-align:center; display:none; width: 500px;padding: 20px 60px;background-color: #fefefe;border: 1px solid #888;border-radius: 3px;}
    #modal .btnclose,#modal1 .btnclose {position: absolute; top: 10px;right: 10px;}
    #modal .btnselect,#modal1 .btnselect {top: 10px;right: 10px;}
       #save {margin-top:10px; width:40px; padding: .8em .5em; font-family: inherit; font-size:12px; appearance: none; background:white; color:#669; border: 1px solid #ccc;border-radius: 5px; text-align:center;}
   #del {margin-top:10px; width:40px; padding: .8em .5em; font-family: inherit; font-size:12px; appearance: none; background:white; color:#669; border: 1px solid #ccc;border-radius: 5px; text-align:center;}
   button {width: 50px; padding: .8em .5em; font-family: inherit; font-size:11px;-webkit-appearance: none;-moz-appearance: none;appearance: none;background:white; color: #669;border: 1px solid #ccc;border-radius: 5px;text-align:center;}
    #predate, #Nextdate, #redate {width:100px; float:left;}
    #predate {margin-left:140px;}
    #sadate{width:120px; float:left;}
    #wrapper,#wrapper1{margin-left:430px; width:800px; height:200px; margin-top:100px;}
    #savedel {margin-left:720px;margin-top:10px; width:100px; padding: .8em .5em; font-family: inherit; font-size:12px; appearance: none; background:white; color:#669;border-radius: 5px; text-align:center;}
    #park {font-family:"Lucida Sans Unicode", "Lucida Grande", Sans-Serif; width:200px; height:640px;margin-top:50px; float:left; display:inline; margin-left:150px;}
    #park td{padding: 10px 8px; font-size:16px;}
    #park th {border-bottom:2px solid  #6678b1;}
    #tbl1 {float:left;  display:inline; margin-top:100px; margin-left:150px;}
     #tbl1 td.costcode {font-size:15px; padding: 10px 8px;}
     #deposittbl1 td.depositcode {color: #669; font-family:"Lucida Sans Unicode", "Lucida Grande", Sans-Serif;}
     #loanstbl1 td.loanscode {color: #669; font-family:"Lucida Sans Unicode", "Lucida Grande", Sans-Serif;}
    #park1 {float:left;}
    #deposittbl, #loanstbl { color: #669; float:left; margin-left:130px; padding: 0px 10px;}
    #deposittbl1,#loanstbl1 {margin-top:120px;}
    #deposittbl1 th, #loanstbl1 th {border-bottom:2px solid  #6678b1;}
    #deposittbl td,#loanstbl td {padding: 0px 10px; font-size:16px;}
    #deposittbl th,#loanstbl th  {border-bottom:2px solid  #6678b1;} 
    #saletbl1 {margin-right:0; text-align:center; margin-left:150px;}
      #insertInven {margin-left:200px;}
   #costcode {color: #669;}
   td {border-bottom:1px solid  #ccc;}
   #tbl1 th {color: #039;padding: 10px 8px;border-bottom: 2px solid #6678b1;}
   </style>
   <link rel="stylesheet" href="../resources/icono.css">
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
   <div class="tabbed round">
         <ul>
            <li rel="frmtbl6">재고 내역 입력</li>
            <li rel="frmtbl3">대출상환 내역 입력</li>
            <li rel="frmtbl2">예.적금 내역 입력</li>
            <li rel="frmtbl1">비용 내역 입력</li>
            <li rel="frmtbl5">환불 내역 입력</li>
            <li rel="frmtbl4" class="active">매출 내역 입력</li>
         </ul>
   </div>
   <div id="divCenter">
    <div id="first-tab-group" class="tabgroup">
    <div id="frmtbl4">
   <form name="salefrm" action="salesinsert" method="post">
 
      <div style="float:left;">
         <table id="saletbl"></table>
      </div>
      <div id="modal">
         <a class="btnclose">X</a>
         <table id="saletbl1" summary="Employee Pay Sheet"></table>
         <a class="btnselect">선택완료</a>
      </div>
      <div id="wrapper">
         <ul id="tabs" style="float: left;">
            
         </ul>
      
         <div class="content" style="float: left;">
         </div>
      </div>
      <div id="savedel">
      <input type="submit" id="save" value="저장">
      <input type="reset" id="del" value="취소">
      </div>      
   </form>
       
   </div>
   <div id="frmtbl5">
   <form name="refundfrm" action="salesinsert" method="post">

      <div  style="float:left;">
         <table id="refundtbl"></table>
      </div>
      <div id="modal1">
      <a class="btnclose1">X</a>
         <table id="refundtbl1" summary="Employee Pay Sheet"></table>
         <a class="btnselect1">선택완료</a>
      </div>
      <div id="wrapper1">
         <ul id="tabs1" style="float: left;">
            
         </ul>
      
         <div class="content1" style="float: left;">
         </div>
      </div>
      <div id="savedel">   
      <input type="submit" id="save" value="저장">
      <input type="reset" id="del" value="취소">
      </div>
   </form>   
   </div>
    <div id="frmtbl1" >
   <form name="frm" action="costinsert" method="post">
   
   
      <div id="park">
         <table id="tbl"></table>
      </div>
      <div>
         <table id="tbl1">
            <tr>
               <th>합계금액</th>
               <td><input type="text" id="sum" ></td>
            <tr>
            <tr>
               <th width=200>계정명</th>
               <th width=200>발생금액</th>
            </tr>
            <tbody id= "body"></tbody>
         </table>
      </div>
      <div id="savedel">
      <input type="submit" id="save" value="저장">
      <input type="reset" id="del" value="취소">
      </div>
   </form>
   </div>
   <div id="frmtbl2">
   <form name="frm1" action="depositinsert" method="post">
      

      <div id="park1">
         <table id="deposittbl"></table>
      </div>
      <div>
         <table id="deposittbl1" summary="Employee Pay Sheet">
            <thead>            
            <tr>
               <th width=300>계좌번호</th>
               <th width=100>전일잔액</th>
               <th width=80>구분</th>
               <th width=100>금액</th>
               <th width=100>현재잔액</th>
            </tr>
            </thead>
            <tbody id= "body"></tbody>
         </table>
      </div>
      <div id="savedel">
      <input type="submit" id="save" value="저장">
      <input type="reset" id="del" value="취소">
      </div>
   </form>
   </div>
   <div id="frmtbl3">
   <form name="frm2" action="loansinsert" method="post">

      <div style="float:left; margin-right:50px;">
         <table id="loanstbl" summary="Employee Pay Sheet"></table>
      </div>
      <div>
         <table id="loanstbl1" summary="Employee Pay Sheet">
            <thead>
            <tr>
               <th width=300>대출계좌번호</th>
               <th width=100>대출원금</th>
               <th width=100>현재잔액</th>
               <th width=100>상환금액</th>
               <th width=100>잔금</th>
            </tr>
            </thead>
            <tbody id= "body"></tbody>
         </table>
      </div>
      <div id="savedel">
      <input type="submit" id="save" value="저장">
      <input type="reset" id="del" value="취소">
      </div>
   </form>
   </div>
   <div id="frmtbl6">
       <form name="invenfrm" action="inveninsert" method="post">
          <table id="insertInven"></table>
       </form>
    </div>
   </div>
   </div>
   <div id="footer"><jsp:include page="footer.jsp" /></div>
</body>
   <script>
    
    
   date();
   //날짜 출력
   function date(){
      var year=<%=year%>
      var month=<%=month%>
      var strday=<%=day%>
      if(strday<10){
         var day="0"+strday;
         var date=year+"/"+month+"/"+day;
            $(frm).find("#date").html(date);
            $(frm1).find("#dedate").html(date);
            $(frm2).find("#lodate").html(date);
            $(salefrm).find("#sadate").html(date);
            $(refundfrm).find("#redate").html(date);
      } else {
         var date=year+"/"+month+"/"+strday;
            $("#date").html(date);
            $("#dedate").html(date);
            $("#lodate").html(date);
            $("#sadate").html(date);
            $("#redate").html(date);
      }
   }
   
   document.addEventListener("DOMContentLoaded", function() {
      $('#first-tab-group > div').hide();
      $('#first-tab-group > div:first-of-type').show();
      var tabs = document.querySelectorAll('.tabbed li');
      
      for (var i = 0, len = tabs.length; i < len; i++) {
         tabs[i].addEventListener("click", function() {
            var table=this.getAttribute('rel');
            if (this.classList.contains('active'))
               return;

            var parent = this.parentNode,
               innerTabs = parent.querySelectorAll('li');

            for (var index = 0, iLen = innerTabs.length; index < iLen; index++) {
               innerTabs[index].classList.remove('active');
            }
            this.classList.add('active');
            $('#first-tab-group > div').hide();
            $("#first-tab-group > div#"+table).show();
         });
      }
   });
   
 //중분류 환불 불러오기
   $("#refundtbl").on("click",".lcategoryname",function(){
      var categoryname=$(this).attr("name").split("/")[2];
      var categorycode=$(this).attr("code").split("/")[1];
      
      category();
      function category(){
         var str="<tr><th width=100>계정명</th></tr>";
         $.ajax({
         type : "get",
         url : "lcategorylist.json",
         dataType : "json",
         success : function(data){
            if($(data.CATEGORYCODE)!= null){
               $(data).each(function(){
                  if((this.CATEGORYCODE.split("/")[2]!="000") && (this.CATEGORYCODE.split("/")[1]==categorycode)){
                  str +="<tr class='categoryrow'>";
                  str +="<td width=100 class='categoryname' lname='"+this.CATEGORYNAME+"' lcode='"+this.CATEGORYCODE+"'>"+this.CATEGORYNAME.split("/")[2]+"</td>";
                  str +="</tr>";
                  }
            });   
               $("#refundtbl1").html(str);
            }
         }
      });
      }
   });
 
   function modal1(id){
         var zIndex=999;
         var modal1=$("#"+id);
         var bg=$("<div>").css({position: 'fixed',
               zIndex: zIndex,
               left: '0px',
               top: '0px',
               width: '100%',
               height: '100%',
               overflow: 'auto',
               // 레이어 색갈은 여기서 바꾸면 됨
               backgroundColor: 'rgba(0,0,0,0.4)'}).appendTo("body");
         
         modal1.css({position: 'fixed',
               boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
               zIndex: zIndex + 1,
               top: '50%',
               left: '50%',
               transform: 'translate(-50%, -50%)',
               msTransform: 'translate(-50%, -50%)',
               webkitTransform: 'translate(-50%, -50%)'}).show().find(".btnclose1").on("click",function(){
                  bg.remove();
                  modal1.hide();
               });
         
            $("#refundtbl1").on("click",".categoryname",function(){
            var code=$(this).attr("lcode");
            var name=$(this).attr("lname").split("/")[2];
            var tab=$(this).attr("lname").split("/")[1];
            var strtab="retbl"+tab;
                     
            var cnt=$("#"+strtab+" tr").length;
            var str="<tr class='rerow"+name+cnt+"'><td class='salecode' salecode='"+code+"' >"+name+"<input type='button' class='btnadd' value='+'></td>";
               str+="<td class='paytype' salecode='"+code+"'><input type='radio' name='rerow"+name+cnt+"' value='카드'checked/>카드";
               str+="<input type='radio' name='rerow"+name+cnt+"' value='현금'/>현금<input type='radio' name='rerow"+name+cnt+"' value='기타'/>기타</td>";
               str+="<td><input type='text' class='count'>건</td>";
               str+="<td><input type='text' class='amount'></td></tr>";
                        
               $("#"+strtab+" > tbody:last").append(str);
               $("[lcode='"+code+"']").hide();
               e.stopImmediatePropagation();   
         });
               modal1.find(".btnselect1").on("click",function(){
                  bg.remove();
                  modal1.hide();
               });
      }
   
 
   
   $("#tabs1").on("click","li",function(){
      var tabid=$(this).attr("rel");
      $("ul#tabs1 li").removeClass("active");
      $(".tabss.current").removeClass("current");
   
      $(this).addClass("active");
      $("#"+tabid).addClass("current");
      $(".content1 table").hide();
      $("#"+tabid).show();
   });

   
   categorygetlist();
   //대분류리스트 불러오기
   function categorygetlist(){
      var str="<tr><th width=100>계정명</th></tr>";
      $.ajax({
         type : "get",
         url : "lcategorylist.json",
         dataType : "json",
         success : function(data){
            if($(data.CATEGORYCODE)!= null){
               $(data).each(function(){
                  if(this.CATEGORYCODE.split("/")[2]=="000"){
                  str +="<tr class='lcategoryrow'>";
                  str +="<td width=100 class='lcategoryname' id='"+this.CATEGORYNAME+"' name='"+this.CATEGORYNAME+"' code='"+this.CATEGORYCODE+"'>"+this.CATEGORYNAME.split("/")[1]+"</td>";
                  str +="</tr>";
                  }
            });
               $("#saletbl").html(str);
               $("#refundtbl").html(str);
            }
         }
      });
   }
   
   //중분류 불러오기
      $("#saletbl").on("click",".lcategoryname",function(){
         var categoryname=$(this).attr("name").split("/")[2];
         var categorycode=$(this).attr("code").split("/")[1];
         
         category();
         function category(){
            var str="<tr><th width=100>계정명</th></tr>";
            $.ajax({
            type : "get",
            url : "lcategorylist.json",
            dataType : "json",
            success : function(data){
               if($(data.CATEGORYCODE)!= null){
                  $(data).each(function(){
                     if((this.CATEGORYCODE.split("/")[2]!="000") && (this.CATEGORYCODE.split("/")[1]==categorycode)){
                     str +="<tr class='categoryrow'>";
                     str +="<td width=100 class='categoryname' lname='"+this.CATEGORYNAME+"' lcode='"+this.CATEGORYCODE+"'>"+this.CATEGORYNAME.split("/")[2]+"</td>";
                     str +="</tr>";
                     }
               });
                  $("#saletbl1").html(str);   
               }
            }
         });
         }
      });
   
   function modal(id){
      var zIndex=10000;
      var modal=$("#"+id);
      var bg=$("<div>").css({position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'}).appendTo("body");
      
      modal.css({position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
            zIndex: zIndex + 1,
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'}).show().find(".btnclose").on("click",function(){
               bg.remove();
               modal.hide();
            });
      
      
            $("#saletbl1").on("click",".categoryname",function(){
         var code=$(this).attr("lcode");
         var name=$(this).attr("lname").split("/")[2];
         var tab=$(this).attr("lname").split("/")[1];
         var strtab="satbl"+tab;
         
         var cnt=$("#"+strtab+" tr").length;
         var str="<tr class='salerow"+name+cnt+"'><td class='salecode' salecode='"+code+"' >"+name+"<input type='button' class='btnadd' value='+'></td>";
            str+="<td class='paytype' salecode='"+code+"'><input type='radio' name='salerow"+name+cnt+"' value='카드'checked/>카드";
            str+="<input type='radio' name='salerow"+name+cnt+"' value='현금'/>현금<input type='radio' name='salerow"+name+cnt+"' value='기타'/>기타</td>";
            str+="<td><input type='text' class='count'>건</td>";
            str+="<td><input type='text' class='amount'></td></tr>";
            
            $("#"+strtab+" > tbody:last").append(str);
            $("[lcode='"+code+"']").hide();
            e.stopImmediatePropagation();
            
            });
            
            modal.find(".btnselect").on("click",function(){
               bg.remove();
               modal.hide();
            });
   }
   
   
   
      getlist();
      //비용리스트 불러오기
      function getlist(){
         var str="<tr><th width=200>계정명</th></tr>";
         $.ajax({
            type : "get",
            url : "costaccount.json",
            dataType : "json",
            success : function(data){
               if($(data.COSTACCOUNTNAME)!= null){
                  $(data).each(function(){
                     str +="<tr class='crow'>";
                     str +="<td width=150 class='costname' name='"+this.COSTACCOUNTNAME+"' code='"+this.COSTACCOUNTCODE+"'>"+this.COSTACCOUNTNAME+"</td>";
                     str +="</tr>";
                  });
                  $("#tbl").html(str);
               }
            }
         });
      }
      
   //예금리스트불러오기   
   depositgetlist();
   function depositgetlist(){
         var str="<tr><th width=80>은행명</th><th width=200>계좌번호</th></tr>";
         $.ajax({
            type : "get",
            url : "depositaccountlist.json",
            dataType : "json",
            success : function(data){
               if($(data.DEPOSITACCOUNTCODE)!= null){
                  $(data).each(function(){
                     str +="<tr class='drow' attcode='"+this.DEPOSITACCOUNTCODE+"'>";
                     str +="<input type='hidden' balance='"+this.STARTBALANCE+"'>"
                     str +="<td width=150 class='depositname' >"+this.DEPOSITACCOUNTBANKNAME+"</td>";
                     str +="<td width=150 class='depositcode' code='"+this.DEPOSITACCOUNTCODE+"'>"+this.DEPOSITACCOUNTCODE+"</td>";
                     str +="</tr>";
                  });
                  $("#deposittbl").html(str);
               }
            }
         });
      }
   
   //대출리스트불러오기
   loansgetlist();
   function loansgetlist(){
         var str="<tr><th width=80>대출은행명</th><th width=200>계좌번호</th></tr>";
         $.ajax({
            type : "get",
            url : "loansaccountlist.json",
            dataType : "json",
            success : function(data){
               if($(data.LOANSACCOUNTCODE)!= null){
                  $(data).each(function(){
                     str +="<tr class='lrow' lattcode='"+this.LOANSACCOUNTCODE+"'>";
                     str +="<input type='hidden' loansamount='"+this.LOANSACCOUNTAMOUNT+"' sumamount='"+this.SUMAMOUNT+"'>"
                     str +="<td width=150 class='loansname' >"+this.LOANSACCOUNTBANKNAME+"</td>";
                     str +="<td width=150 class='loanscode' code='"+this.LOANSACCOUNTCODE+"'>"+this.LOANSACCOUNTCODE+"</td>";
                     str +="</tr>";
                  });
                  $("#loanstbl").html(str);
               }
            }
         });
      }
      
   //매출 계정 추가시
      //매출 계정 추가시.VER2
      $(document).ready(function(){
         $("#saletbl").on("click","td",function(){
            
            var contentname = $(this).attr("id") + "_content";
            var name=$(this).attr("id").split("/")[1];
            var str="<li class='active' rel='satbl"+name+"'>"+name+"</li>";
            var header="<table class='tabss current' id='satbl"+name+"' style='width:100%;border-left: 4px solid #6678b1;' summary='Employee Pay Sheet'>";
               header+="<thead><tr><th width=130>상품명</th><th width=200>결제방법</th><th width=30>결제건수</th><th width=80>결제금액</th></tr>";
               header+="</thead><tbody></tbody></table>";
            var check=false;
               $("#tabs li").each(function(){
                  if($(this).attr("rel").substring(5) != name || $("#tabs li").length==0) {
                     return true;
                  } else {
                     check=true;
                     return false;
                  }
               });
               if(check) 
                  return false;
      
               $("#tabs li").removeClass("active");
               $("#tabs").append(str);
               $(".content").append(header);
               var tabrel="satbl"+name;
               $(".content table").hide();
               $(".content #"+tabrel).show();
               modal("modal");
         });
         
         $("#tabs").on("click","li",function(){
            var tabid=$(this).attr("rel");
            $("ul#tabs li").removeClass("active");
            $(".tabss.current").removeClass("current");
         
            $(this).addClass("active");
            $("#"+tabid).addClass("current");
            $(".content table").hide();
            $("#"+tabid).show();
         });
         
       //환불계정 추가시
         $("#refundtbl").on("click","td",function(){
            
            var contentname = $(this).attr("id") + "_content";
            var name=$(this).attr("id").split("/")[1];
            var str="<li class='active' rel='retbl"+name+"'>"+name+"</li>";
            var header="<table class='tabss current' id='retbl"+name+"' style='width:100%;border-left: 4px solid #6678b1;' summary='Employee Pay Sheet'>";
               header+="<thead><tr><th width=130>상품명</th><th width=200>결제방법</th><th width=30>환불건수</th><th width=80>환불금액</th></tr>";
               header+="</thead><tbody></tbody></table>";
            var check=false;
               $("#tabs1 li").each(function(){
                  if($(this).attr("rel").substring(5) != name || $("#tabs1 li").length==0) {
                     return true;
                  } else {
                     check=true;
                     return false;
                  }
               });
               if(check) 
                  return false;

               $("#tabs1 li").removeClass("active");
               $("#tabs1").append(str);
               $(".content1").append(header);
               var tabrel="retbl"+name;
               $(".content1 table").hide();
               $(".content1 #"+tabrel).show();
               modal1("modal1");
         });
      });
      
      
      //비용 계정 추가시
      $("#tbl").on("click",".costname",function(){
         var costname=$(this).attr("name");
         var costcode=$(this).attr("code");
         
         var str="<tr class='costrow'><td class='costcode' costcode='"+costcode+"'>"+costname+"</td>";
            str+="<td><input type='text' class='cost' >원</td></tr>";
         $("#tbl1 > tbody:last").append(str);
         $("[name="+costname+"]").hide();
      });
      
      //비용 금액 입력시
      $("#tbl1").on("keyup",".cost",function(){
         var cnt=$(this).val().length;
         console.log(cnt);
         for(var i=1; i<cnt; i++){
            if(!isNaN($(this).val())&&($(this).val().length)>1){
               var amount=0; 
               $("#tbl1").find(".costrow").each(function(){
                  amount+=parseInt($(this).find(".cost").val()||00);
                  
                })   ;
            }else if(isNaN($(this).val())&&($(this).val().length)<0) {
               $("#tbl1").find(".costrow").each(function(){
                  amount+=parseInt($(this).find(".cost").val()||00);
                })   ;
            }
         }
         $("#tbl1").find("#sum").val(amount);
      });
      
      //예금 계정 추가시
         $("#deposittbl").on("click",".drow",function(){
            var attcode=$(this).attr("attcode");
            var balance=$(this).find("input").attr("balance");
            
            var str="<tr class='depositrow"+attcode+"'><td class='depositcode' depositcode='"+attcode+"'>"+attcode;
               str+="<input type='button' class='btnadd' value='입력 추가'></td>";
               str+="<td class='balance' balance='"+balance+"'><input type='text' value='"+balance+"'></td>";
               str+="<td class='detype'><input type='radio' name='"+attcode+"' value='입금'checked/>입금<br/><input type='radio' name='"+attcode+"' value='출금'/>출금</td>";
               str+="<td><input type='text' class='amount'>원</td>";
               str+="<td><input type='text' class='sum' value='"+balance+"'></td></tr>";
            $("#deposittbl1 > tbody:last").append(str);
            $("[attcode="+attcode+"]").hide();
            
         });

         
         $(document).ready(function(){
            //항목추가 버튼 클릭시
            $("#deposittbl1").on("click",".btnadd", function(){
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
                var cnt=$("#deposittbl1 ."+cls+" td:eq(4) input").val();
               var namecnt=$("#deposittbl1 tr").length;
               
             
               // tr 복사해서 마지막에 추가
                var newrow = clickedRow.clone();
                   newrow.find("td:eq(1)").val(cnt);
                   newrow.find("td:eq(2)").find("input").attr("name",cls+namecnt);
                   newrow.find("td:eq(3)").find("input").val("");
                newrow.find("td:eq(0)").remove();
             
                newrow.insertAfter($("#deposittbl1 ."+cls+":last"));
                
                // rowspan 조정
                resizeRowspan(cls);
            });
             
            $(".content").on("click",".btnadd", function(){
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
                var table=clickedRow.parent().parent().attr("id");
               
               var tablecnt=$("#"+table+" tr").length;
               
             
               // tr 복사해서 마지막에 추가
                var newrow = clickedRow.clone();
                   newrow.find("td:eq(1)").find("input").attr("name",cls+tablecnt);
                newrow.find("td:eq(0)").remove();
             
                newrow.insertAfter($("#"+table+" ."+cls+":last"));
                
                // rowspan 조정
                resizeRowspan(cls);
            });
             
            // 삭제버튼 클릭시
            // $("#tbl1").on("click",".btndelrow", function(){
//                 var clickedRow = $(this).parent().parent();
//                 var cls = clickedRow.attr("class");
                 
//                 // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
//                 if( clickedRow.find("td:eq(0)").attr("rowspan") ){
//                     if( clickedRow.next().hasClass(cls) ){
//                         clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
//                     }
//                 }

//                 clickedRow.remove();

//                 // rowspan 조정
//                 resizeRowspan(cls);
            // });

            // cls : rowspan 을 조정할 class ex) item1, item2, ...
            function resizeRowspan(cls){
                var rowspan = $("."+cls).length;
                $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
            }
            });
            
      
      //예금 금액 입력시
      $("#deposittbl1").on("keyup",".amount",function(){
         var cnt=$(this).val().length;
         var balance=parseInt($(this).parent().parent().find(".balance").attr("balance"));
         var attcode=$(this).parent().parent().find(".detype").find("input").attr("name");
         var type=$("#deposittbl1").find("input[name='"+attcode+"']:checked").val();
         console.log(cnt);
         for(var i=1; i<cnt; i++){
            if(!isNaN($(this).val())&&($(this).val().length)!=0){
               var amount=parseInt($(this).val()||0);
               console.log(amount);
            }
         }
         var sum=parseInt(amount+balance);
         var minus=parseInt(balance-amount);
         $(this).parent().parent().find(".sum").val(sum);
         $("#deposittbl1").find("input[name='"+attcode+"']").change(function(){
            if(this.value=='입금') {
               console.log(sum);
               $(this).parent().parent().find(".sum").val(sum);
            }else if(this.value=='출금'){
               console.log(minus);
               $(this).parent().parent().find(".sum").val(minus);
            }
         });
         
      });
      
      
      //대출 계정 추가시
      $("#loanstbl").on("click",".lrow",function(){
         var lattcode=$(this).attr("lattcode");
         var loansamount=$(this).find("input").attr("loansamount");
         var sumamount=$(this).find("input").attr("sumamount");
         var balance=loansamount-sumamount;
         var str="<tr class='loansrow'><td class='loanscode' loanscode='"+lattcode+"'>"+lattcode;
            str+="<td class='loansamount' loansamount='"+loansamount+"'>"+loansamount+"</td>";
            str+="<td class='balance' balance='"+balance+"'>"+balance+"</td>";
            str+="<td><input type='text' class='amount'>원</td>";
            str+="<td><input type='text' class='sum' value='"+balance+"'></td></tr>";
         $("#loanstbl1 > tbody:last").append(str);
         $("[lattcode="+lattcode+"]").hide();
      });
      
      //대출 금액 입력시
      $("#loanstbl1").on("keyup",".amount",function(){
         var cnt=$(this).val().length;
         console.log(cnt);
         for(var i=1; i<cnt; i++){
            if(!isNaN($(this).val())&&($(this).val().length)!=0){
               var amount=parseInt($(this).val()||0);
               console.log(amount);
            }
         }
         var balance=parseInt($(this).parent().parent().find(".balance").html());
         var sum=parseInt(balance-amount);
            console.log(sum);
            $(this).parent().parent().find(".sum").val(sum);
      });
   
   
      //비용저장시
      $(frm).submit(function(e){
         e.preventDefault();
         var total=$("#tbl1").find("#sum").val();
         if(!confirm("합계금액 : "+total+"원을 저장하시겠습니까?")) return;
         var companycode = "153-60-00064";
          var day = $("#date").html().substring(2);
          $("#tbl1 #body .costrow").each(function(){
            var code = $(this).find(".costcode").attr("costcode");
            var amount= $(this).find(".cost").val();
            if(amount!=""){
            $.ajax({
               type : "post",
               url : "costinsert",
               data : {"cost_companycode" : companycode ,"cost_day": day, "cost_costaccountcode" :code, "costamount":amount},
                success : function(){
                }
            });
            }
         });
         alert("저장완료되었습니다.");
      
   });
      
      
      //예금 저장시
      $(frm1).submit(function(e){
         e.preventDefault();
         if(!confirm("해당 예.적금 내역을 저장하시겠습니까?")) return;
         var companycode = "153-60-00064";
          var day = $("#dedate").html().substring(2);
          $("#deposittbl1 #body tr").each(function(){
            var code = $(this).find(".depositcode").attr("depositcode");
            var amount= $(this).find(".amount").val();
            var balance=$(this).find(".sum").val();
            var type=$(this).find("input[name='"+code+"']:checked").val();
            
            if(amount!=""){
            $.ajax({
               type : "post",
               url : "depositinsert",
               data : {"deposit_companycode" : companycode ,"deposit_day": day, "deposit_depositaccountcode" :code, "deposittype" : type, "depositamount":amount, "depositbalance": balance},
                success : function(){
                }
            });
            }
         });
         alert("저장완료되었습니다.");
         
   });
      
      //대출 저장시
      $(frm2).submit(function(e){
         e.preventDefault();
         if(!confirm("해당 대출상환 내역을 저장하시겠습니까?")) return;
         var companycode = "153-60-00064";
          var day = $("#lodate").html().substring(2);
          $("#loanstbl1 #body .loansrow").each(function(){
            var code = $(this).find(".loanscode").attr("loanscode");
            var amount= $(this).find(".amount").val();
            var balance=$(this).find(".sum").val();
            if(amount!=""){
            $.ajax({
               type : "post",
               url : "loansinsert",
               data : {"loans_companycode" : companycode ,"loans_loansaccountcode": code, "loans_repaymentday" : day, "loansamount":amount, "loansbalance": balance},
                success : function(){
                  
                }
            });
            }
         });
         alert("저장완료되었습니다.");
         
   });
      
      //매출 저장시
      $(salefrm).submit(function(e){
         e.preventDefault();
         var companycode = "153-60-00064";
          var day = $("#sadate").html().substring(2);
          $(".content table tbody tr").each(function(){
            var code = $(this).find(".paytype").attr("salecode");
            var amount= $(this).find(".amount").val();
            var count=$(this).find(".count").val();
            var cnt=$(this).find(".paytype").find("input").attr("name");
            var type="매출";
            var salestype=$(this).find(".paytype").find("input[name='"+cnt+"']:checked").val();
            
            if(amount!=""){
            $.ajax({
               type : "post",
               url : "salesinsert",
               data : {"sales_companycode" : companycode ,"sales_day": day, "sales_categorycode" :code, "paytype" : type, "salesamount":amount, "salescount": count, "salestype": salestype},
                success : function(){
                  
                }
            });
            }
         });
         alert("저장완료되었습니다.");
   });
      endInvenList();
      function endInvenList() {
          var addList = "<tr><th width=300>품목</th><th width=80>기초재고</th><th width=80>입고</th><th width=80>출고</th><th width=80>기말재고</th></tr>";
          $.ajax({
             type:"get",
             url:"endInvenList.json",
             success:function(data) {
                $(data).each(function() {
                   var name = this.INVENACCOUNTNAME.split("/")[1];
                   var inven = this.ENDINVEN;
                   addList += "<tr class='list'>";
                   addList += "<td>"+name+"</td>";
                   addList += "<td class='inven'>"+inven+"</td>";
                   addList += "<td class='tdInvenIn'><input type='text' name='invenIn' class='ipInvenIn' size=2></td>";
                   addList += "<td class='tdInvenOut'><input type='text' name='invenOut' class='ipInvenOut' size=2></td>";
                   addList += "<td class='tdEndInven'><input type='text' name='endInven' class='ipEndInven' size=2 value='"+inven+"' readonly></td>";
                   addList += "</tr>";
                });
                $("#insertInven").html(addList);
             }
          });
       }

       $("#insertInven").on("keyup", ".list .tdInvenIn .ipInvenIn",function() {
          var list = $(this).parent().parent();
          var ipEndInven = list.find(".tdEndInven").find(".ipEndInven");
          var startInven = list.find(".inven").html();
          var invenIn = $(this).val();
          if(list.find(".tdInvenOut").find(".ipInvenOut").val() != "") {
             var invenOut = list.find(".tdInvenOut").find(".ipInvenOut").val();
             var amount = parseInt(startInven) + parseInt(invenIn) - parseInt(invenOut);
             if(!isNaN(amount)) {
                ipEndInven.val(amount);
             }
             if(isNaN(amount)) {
                ipEndInven.val(parseInt(startInven) - parseInt(invenOut));
             }
          }
          if(list.find(".tdInvenOut").find(".ipInvenOut").val() == "") {
             var amount = parseInt(startInven) + parseInt(invenIn);
             
             if(!isNaN(amount)) {
                ipEndInven.val(amount);
             }
             if(isNaN(amount)) {
                ipEndInven.val("");
             }
          }
          if(ipEndInven.val() == "") {
             ipEndInven.val(startInven);
          }
       });

       $("#insertInven").on("keyup", ".list .tdInvenOut .ipInvenOut",function() {
          var list = $(this).parent().parent();
          var ipEndInven = list.find(".tdEndInven").find(".ipEndInven");
          var startInven = list.find(".inven").html();
          var invenOut = $(this).val();
          if(!isNaN(list.find(".tdInvenIn").find(".ipInvenIn").val())) {
             var invenIn = list.find(".tdInvenIn").find(".ipInvenIn").val();
             var amount = parseInt(startInven) + parseInt(invenIn) - parseInt(invenOut);
             if(!isNaN(amount)) {
                ipEndInven.val(amount);
             }
             if(isNaN(amount)) {
                ipEndInven.val(parseInt(startInven) + parseInt(invenIn));
             }
          }
          if(list.find(".tdInvenIn").find(".ipInvenIn").val() == "") {
             var amount = parseInt(startInven) - parseInt(invenOut);
             if(!isNaN(amount)) {
                ipEndInven.val(amount);
             }
             if(isNaN(amount)) {
                ipEndInven.val("");
             }
          }
          if(ipEndInven.val() == "") {
             ipEndInven.val(startInven);
          }
       });

       getInvenList();
       function getInvenList() {
          var addInven = "<div id='invenList'>";
          addInven += "<div class='invenAccountName'>재고 품목</div>";
          addInven += "<div class='startInven'>기초 재고</div>";
          addInven += "<div class='invenIn'>입고</div>";
          addInven += "<div class='invenOut'>출고</div>";
          addInven += "<div class='endInven'>기말 재고</div>";
          var date = year +"/"+ month +"/"+ day;
          $.ajax({
             type:"get",
             url:"invenList.json",
             data:{"date":date},
             success:function(data) {
                $(data).each(function() {
                   addInven += "<div class='invenAccountName'>"+this.INVENACCOUNTNAME+"</div>";
                   addInven += "<div class='startInven'>"+this.STARTINVEN+"</div>";
                   addInven += "<div class='invenIn'>"+this.INVENIN+"</div>";
                   addInven += "<div class='invenOut'>"+this.INVENOUT+"</div>";
                   addInven += "<div class='endInven'>"+this.ENDINVEN+"</div>";
                });
                addInven += "</div>";
                $("#inven").html(addInven);
             }
          });
       }
   </script>
</html>