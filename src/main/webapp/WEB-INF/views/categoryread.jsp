<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title> 설정 </title>
<style>
   html, body {margin:0; text-align: center;}
   #divCenter {width: 1500px; height: 2400px; margin-left: 200px; margin-top:100px;}
   .tabbed {width: 70%; min-width: 300px;margin: 0 auto;margin-top:100px;border-bottom: 4px solid #000;overflow: hidden;transition: border 250ms ease;}
     #tbl {font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;width: 60%; min-width: 200px;margin: 0 auto; overflow: hidden;transition: border 250ms ease;border-collapse: collapse;}
   .tabbed ul {margin: 0px;padding: 0px;overflow: hidden;float:left;list-style-type: none; width:800px; height:37px; margin-top:100px;}
   .tabbed ul * { margin: 0px;padding: 0px;}
   .tabbed ul li {display: block;float: right;padding: 10px 24px 8px;background-color: #FFF;margin-right: 46px;z-index: 2;position: relative;
               cursor: pointer;color: #777;text-transform: uppercase;transition: all 250ms ease;font: 600 13px/20px roboto, "Open Sans", Helvetica, sans-serif;}
   .tabbed ul li:before, .tabbed ul li:after {display: block; content: "";position: absolute;top: 0;height: 100%;width: 44px;background-color: #FFF;transition: all 250ms ease;}
   .tabbed ul li:before {right: -24px;transform: skew(30deg, 0deg);box-shadow: rgba(0,0,0,.1) 3px 2px 5px, inset rgba(255,255,255,.09) -1px 0;}
   .tabbed ul li:after {left: -24px;transform: skew(-30deg, 0deg);box-shadow: rgba(0,0,0,.1) -3px 2px 5px, inset rgba(255,255,255,.09) 1px 0;}
    .tabbed ul li:hover, .tabbed ul li:hover:before, .tabbed ul li:hover:after {background-color: #F4F7F9;color: #444;} 
   .tabbed ul li.active {z-index: 3;}
   .tabbed ul li.active, .tabbed ul li.active:before, .tabbed ul li.active:after {background-color: #000;color: #fff;}
   #tbl1 {margin-left:300px; width:900px; height:400px;}
   /* Round Tabs */
   .tabbed.round ul li {border-radius: 8px 8px 0 0;}
   .tabbed.round ul li:before { border-radius: 0 8px 0 0;}
   .tabbed.round ul li:after { border-radius: 8px 0 0 0;}
   input{font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;outline:none; border: none; background: transparent;text-align: center;}
   *:focus { outline: none; }
   table th{font-size: 14px;font-weight: normal;color: #039;padding: 10px 8px;border-bottom: 2px solid #6678b1;}
   td {border-bottom:1px solid  #ccc;} 
   .lcategorycode{border:0; border-bottom:1px solid  #ccc;color: #669;padding: 6px 8px;}
   #tbl1 td{color: #669;padding: 6px 8px; border-bottom:1px solid  #ccc;}
      table tbody tr:hover td{color: #009;}
   #save {margin-top:10px; width:40px; padding: .8em .5em; font-family: inherit; font-size:12px; appearance: none; background:white; color:#669; border: 1px solid #ccc;border-radius: 5px; text-align:center;}
   #del {margin-top:10px; width:40px; padding: .8em .5em; font-family: inherit; font-size:12px; appearance: none; background:white; color:#669; border: 1px solid #ccc;border-radius: 5px; text-align:center;}
   button {  
  width: 50px;
  padding: .8em .5em;
  font-family: inherit;
  font-size:11px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background:white;
  color: #669;
  border: 1px solid #ccc;
  border-radius: 5px;
  text-align:center;}
    #tbl2 {margin:30px 0px 30px 200px;}
    #tbl3 {margin:30px 0px 30px 200px; width:1122px;}
   </style>

<link rel="stylesheet" href="../resources/icono.css">
</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>
   <div class="tabbed round">
         <ul>
            <li rel="frm3">대출 목록</li>
            <li rel="frm2">예.적금 목록</li>
            <li rel="frm1">중분류 상품 목록</li>
            <li rel="frm" class="active">대분류 상품 목록</li>
         </ul>
   </div>
   <div id="divCenter">
    <section id="first-tab-group" class="tabgroup">
   <div id="frm">
<form name="frm" method="post" action="categoryupdate" onsubmit="return false">
   <button type="button" class="btnadd">추가</button>
   <button type="button" class="btndel">삭제</button>
   <table id="tbl" summary="Employee Pay Sheet"></table>
   <input type="submit"  id="save" value="저장">
   <input type="reset" id="del" value="취소"> 
</form>
</div>
<div id="frm1">
<form name="frm1" method="post" action="mcategoryupdate" onsubmit="return false">
   <table id="tbl1" summary="Employee Pay Sheet"></table>
   <input type="submit" id="save" value="저장">
   <input type="reset" id="del" value="취소">
</form>
</div>
<div id="frm2">
<form name="frm2" method="post" action="depositaccountupdate" onsubmit="return false">
   <button type="button" class="btnadd">추가</button>
   <button type="button" class="btndel">삭제</button>
   <table id="tbl2" summary="Employee Pay Sheet"></table>
      <script id="temp" type="text/x-handlebars-template">
      <thead>
      <tr>
         <th width=50>번호</th>
         <th width=100>예금은행명</th>
         <th width=300>예금계좌번호</th>
         <th width=200>예금계좌명</th>
         <th width=50>예금이율</th>
         <th width=100>예금개설일</th>
         <th width=100>예금잔액</th>
      </tr>
      </thead>
      <tbody>
   {{#each .}}
         <tr class="depositaccount">
            <td width=50>{{rn}}</td>
            <td width=100 class="bankname"><input type="text" size=10 class="depositaccountbankname" value="{{depositAccountBankName}}"></td>
            <td width=300 class="code"><input type="text" size=20 class="depositaccountcode" value="{{depositAccountCode }}"></td>
            <td width=200 class="name"><input type="text" size=10 class="depositaccountname" value="{{depositAccountName }}"></td>
            <td width=50 class="rate"><input type="text" size=5 class="depositaccountrate" value="{{depositAccountRate }}">%</td>
            <td width=100 class="start"><input type="text" size=15 class="depositaccountstart" value="{{depositAccount_startday }}"></td>
            <td width=100 class="amount"><input type="text" size=15 class="depositaccrountamount" value="{{fmtNumber depositAccountAmount }}">원</td>
         </tr>
   {{/each}}
      </tbody>   
</script>
      <input type="submit" id="save" value="저장">
      <input type="reset"  id="del" value="취소">
</form>
</div>
<div id="frm3">
<form name="frm3" method="post" action="loansaccountupdate" onsubmit="return false">
   <button type="button" class="btnadd">추가</button>
   <button type="button" class="btndel">삭제</button>
   <table id="tbl3" summary="Employee Pay Sheet"></table>
      <script id="temp1" type="text/x-handlebars-template">
      <thead>
      <tr>
         <th width=50>번호</th>
         <th width=100>대출은행명</th>
         <th width=300>대출계좌번호</th>
         <th width=200>대출계좌명</th>
         <th width=50>대출이율</th>
         <th width=50>대출원금</th>
         <th width=100>대출실행일</th>
         <th width=100>대출만기일</th>
      </tr>
      </thead>
      <tbody>
   {{#each .}}
         <tr class="loansaccount">
            <td width=50>{{rn}}</td>
            <td width=100 class="bankname"><input type="text" size=10 class="loansbankname" value="{{loansAccountBankName}}"></td>
            <td width=300 class="code"><input type="text" size=10 class="loanscode" value="{{loansAccountCode }}"></td>
            <td width=200 class="name"><input type="text" size=10 class="loansname" value="{{loansAccountName }}"></td>
            <td width=50 class="rate"><input type="text" size=3 class="loansrate" value="{{loansAccountRate }}">%</td>
            <td width=50 class="amount"><input type="text" size=10 class="loansamount" value="{{fmtNumber loansAccountAmount }}">원</td>            
            <td width=100 class="start"><input type="text" size=15 class="loansstart" value="{{loansAccount_startDay }}"></td>
            <td width=100 class="end"><input type="text" size=15 class="loansend" value="{{loansAccount_endDay }}"></td>
         </tr>
   {{/each}}
      </tbody>   
</script>
      <input type="submit" id="save" value="저장">
      <input type="reset" id="del" value="취소">
   </form>
   </div>
   
   </section>
   <script>
   Handlebars.registerHelper("fmtNumber", function(loansAccountAmount){
      return loansAccountAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   });
   Handlebars.registerHelper("fmtNumber", function(depositAccountAmount){
     return depositAccountAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   });
</script>
</div>
<div id="footer"><jsp:include page="footer.jsp" /></div>
</body>
<script>
getList();
dgetList();
loansgetList();



   $(document).ready(function(){
         //항목추가 버튼 클릭시
         $("#tbl1").on("click",".btnaddrow", function(){
             var clickedRow = $(this).parent().parent();
             var cls = clickedRow.attr("class");
             var cnt=$("#tbl1 ."+cls+":last td:eq(0)").html();
             
             cnt=Number(cnt)+1;
             // tr 복사해서 마지막에 추가
             var newrow = clickedRow.clone();
             
             if(cnt<10) {
                newrow.find("td:eq(1)").html("00"+cnt);
             } else if(cnt<100 && cnt>=10) {
                newrow.find("td:eq(1)").html("0"+cnt);
             } else {
                newrow.find("td:eq(1)").html("002");
             }
             
             newrow.find("td:eq(0)").remove();
             newrow.find("td:eq(1)").find("input").val("");
            
             newrow.insertAfter($("#tbl1 ."+cls+":last"));
             
             // rowspan 조정
             resizeRowspan(cls);
         });
         

         // cls : rowspan 을 조정할 class ex) item1, item2, ...
         function resizeRowspan(cls){
             var rowspan = $("."+cls).length;
             $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
         }
         });


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

//대분류 리스트 읽어오기
function getList() {
   var addList = "";
   $.ajax({
      type:"get",
      url:"categorylist.json",
      success:function(data) {
         if($(data.CATEGORYNAME)!= null){
            
            addList += "<thead><th width=100>대분류 상품 코드</th><th width=200>대분류 상품 이름</th></thead></tbody id='body'>";
            $(data).each(function() {
         
               addList += "<tr class='lcategory'><td width=100 class='lcategorycode'>"+this.CATEGORYCODE.split("/")[1]+"</td>";
               addList +=   "<td width=200 class='lcategoryname'><input type='text' size=30 class='largename' value='"+this.CATEGORYNAME.split("/")[1]+"'></td></tr>";
            });
               addList +="</tbody>";
            $("#tbl").html(addList);
         }
      }
   });
}
//중분류 리스트 읽어오기
largegetList();
function largegetList() {
   var addList = "";
   $.ajax({
      type:"get",
      url:"lcategorylist.json",
      success:function(data) {
         if($(data.CATEGORYNAME)!= null){
            addList += "<thead><th width=100>대분류</th><th width=100>중분류 상품 코드</th><th width=200>중분류 상품 이름</th></thead></tbody id=''body>";

            $(data).each(function() {
               if(this.CATEGORYCODE.split("/")[2]!="000"){
               addList += "<tr class='row"+this.CATEGORYCODE.split("/")[1]+"' code='"+this.CATEGORYCODE+"' name='"+this.CATEGORYNAME.split("/")[1]+"'>";
               addList += "<td width=100 class='lcategoryname"+this.CATEGORYNAME.split("/")[1]+"'>"+this.CATEGORYNAME.split("/")[1]+"<input type='button' class='btnaddrow' value='+'</td>";
               addList += "<td width=100 class='mcategorycode'>"+this.CATEGORYCODE.split("/")[2]+"</td>";
               addList += "<td width=100 class='mcategoryname' ><input type='text' size=30  class='midname' value="+this.CATEGORYNAME.split("/")[2]+"></td></tr>";
               }
            }); 
               addList +="</tbody>";
               
               }
            $("#tbl1").html(addList);
            var item="";
            var count=0;
            var rowspan=0;

            $("#tbl1 tr").each(function(row){
               if(row>0){
                  var thisTr=$(this);
                  
                  var data=$(":first-child",thisTr).html().split("<")[0];
                  
                  if(item!=data) {
                     count=1;
                     item=data+"";
                     rowspan=Number(row);
                     
                  }else {
                     count=Number(count)+1;
                     $("#tbl1 tr:eq("+rowspan+") > td:first-child").attr("rowspan",count);
                     $("td:first-child",thisTr).remove();
                  }
               }
               });
            }
   });
}


//예금 리스트 읽어오기
function dgetList() {
   $.ajax({
      type:"get",
      url:"depositread.json",
      success:function(data) {
         var temp=Handlebars.compile($("#temp").html());
         $("#tbl2").html(temp(data));
      }
   });
}

//대출 리스트 읽어오기
function loansgetList() {
   $.ajax({
      type:"get",
      url:"loansread.json",
      success:function(data) {
         var temp=Handlebars.compile($("#temp1").html());
         $("#tbl3").html(temp(data));
      }
   });
}


   $(".btnadd").click(function(){
       if(!$(frm).is(":hidden")){
         var trCnt=$("#tbl tr").length;
         if(trCnt<10){
            var trCnt1 ="00"+trCnt;
         }else if(trCnt<100 && trCnt>=10) {
            trCnt1="0"+trCnt;
         }else if(trCnt>=100) {
            trCnt1=trCnt;
         }
         var str="";
         str+="<tr class='lcategory'>";
         str+="<td class='lcategorycode'>"+trCnt1+"</td>";
         str+="<td class='lcategoryname'><input type='text' class='largename' size=30></td>";
         str+="</tr>";
         $("#tbl > tbody:last").append(str);
         
       }else if(!$(frm2).is(":hidden")){
            var trCnt=$("#tbl2 tr").length;
            
            var str="";
            str+="<tr class='depositaccount'>";
            str+="<td>"+trCnt+"</td>";
            str+="<td width=100 class='bankname'><input type='text' size=10 class='depositaccountbankname'></td>";
            str+="<td width=300 class='code'><input type='text' size=20 class='depositaccountcode'></td>";
            str+="<td width=200 class='name'><input type='text' size=10 class='depositaccountname' ></td>";
            str+="<td width=50 class='rate'><input type='text' size=5 class='depositaccountrate' >%</td>";
            str+="<td width=100 class='start'><input type='text' size=15 class='depositaccountstart'></td>";
            str+="<td width=100 class='amount'><input type='text' size=15 class='depositaccrountamount'>원</td>";
            str+="</tr>";
            $("#tbl2 > tbody:last").append(str);
         } else if(!$(frm3).is(":hidden")){
            var trCnt1=$("#tbl3 tr").length;
            var str="";
            str+="<tr class='loansaccount'>";
            str+="<td>"+trCnt1+"</td>";
            str+="<td width=100 class='bankname'><input type='text' size=10 class='loansbankname'></td>";
            str+="<td width=300 class='code'><input type='text' size=10 class='loanscode'></td>";
            str+="<td width=200 class='name'><input type='text' size=10 class='loansname' ></td>";
            str+="<td width=50 class='rate'><input type='text' size=3 class='loansrate' >%</td>";
            str+="<td width=100 class='amount'><input type='text' size=10 class='loansamount' >원</td>";
            str+="<td width=100 class='start'><input type='text' size=15 class='loansstart'></td>";
            str+="<td width=100 class='end'><input type='text' size=15 class='loansend'></td>";
            str+="</tr>";
            $("#tbl3 > tbody:last").append(str);
      }
   });
   
   
   //입력칸 삭제
   $(".btndel").click(function(e){
         if(!$(frm).is(":hidden")){
            if($("#tbl tr:last .largename").val()==""){
               $("#tbl > tbody:last > tr:last").remove();
         }
         }else if(!$(frm2).is(":hidden")){
            if($("#tbl2 tr:last .depositaccountcode").val()==""){
            $("#tbl2 > tbody:last > tr:last").remove();
         }
         }else if(!$(frm3).is(":hidden")){
            if($("#tbl3 tr:last .loanscode").val()==""){
            $("#tbl3 > tbody:last > tr:last").remove();
         }
      }
   });
   
   
 //대분류 수정 및 추가
   $(frm).submit(function(e){
      e.stopPropagation();
      if(!$(frm).is(":hidden")){
         if(!confirm("변경 사항을 수정 하시겠습니까?")) return;
         let codearray=new Array();
         let namearray=new Array();
         
         $("#tbl .lcategory").each(function(){
         var strlcode=$(this).find(".lcategorycode").html();
         var strlname=$(this).find(".lcategoryname").find(".largename").val();
         codearray.push(strlcode);
         namearray.push(strlname);
         
         if(strlname!=""){
            
            $.ajax({
            type : "post",
            url :"categoryupdate",
            data :{"categorycode": strlcode, "categoryname":strlname},
            success: function(data){
               
               
            }
         });
         }
      });
      alert("수정완료 되었습니다");
       var code=codearray[codearray.length-1];
       var name=namearray[namearray.length-1];
       var addList = "";
         $.ajax({
            type:"post",
            url:"categoryupdate",
            data :{"categorycode": code, "categoryname":name},
            success:function(data) {
               if($(data.CATEGORYNAME)!= null){
                  addList += "<thead><th width=100>대분류</th><th width=100>중분류 상품 코드</th><th width=200>중분류 상품 이름</th></thead></tbody id=''body>";

                  $(data).each(function() {
                     if(this.CATEGORYCODE.split("/")[2]!="000"){
                     addList += "<tr class='row"+this.CATEGORYCODE.split("/")[1]+"' code='"+this.CATEGORYCODE+"' name='"+this.CATEGORYNAME.split("/")[1]+"'>";
                     addList += "<td width=100 class='lcategoryname"+this.CATEGORYNAME.split("/")[1]+"'>"+this.CATEGORYNAME.split("/")[1]+"<input type='button' class='btnaddrow' value='+'</td>";
                     addList += "<td width=100 class='mcategorycode'>"+this.CATEGORYCODE.split("/")[2]+"</td>";
                     addList += "<td width=100 class='mcategoryname' ><input type='text' size=30  class='midname' value="+this.CATEGORYNAME.split("/")[2]+"></td></tr>";
                     }
                  }); 
                     addList +="</tbody>";
                     
                     }
                  $("#tbl1").html(addList);
                  var item="";
                  var count=0;
                  var rowspan=0;

                  $("#tbl1 tr").each(function(row){
                     if(row>0){
                        var thisTr=$(this);
                        
                        var data=$(":first-child",thisTr).html().split("<")[0];
                        
                        if(item!=data) {
                           count=1;
                           item=data+"";
                           rowspan=Number(row);
                           
                        }else {
                           count=Number(count)+1;
                           $("#tbl1 tr:eq("+rowspan+") > td:first-child").attr("rowspan",count);
                           $("td:first-child",thisTr).remove();
                        }
                     }
                     });
                  }
         });
      }
   });
   
   //중분류 수정 및 추가
      $(frm1).submit(function(e){
      e.stopPropagation();
      if(!$(frm1).is(":hidden")){
         if(!confirm("변경 사항을 수정 하시겠습니까?")) return;
         $("#tbl1 tbody tr").each(function() {
            var lcode=$(this).attr("code");//153-60-00064/001
            var lname=$(this).attr("name");//골드스탁/컴퓨터
             var strmname=$(this).find(".mcategoryname").find(".midname").val();
             var mname=lname+"/"+strmname;
            if(strmname!=""){
               $.ajax({
                  type : "post", 
                  url :"categoryupdate",
                  data :{"categorycode": lcode, "categoryname":mname},
                  success: function(){
                     alert("성공");
                  }
               });
            }
         });
      alert("수정완료 되었습니다");
      
      }
   });
      
   //예금 수정 및 추가   
   $(frm2).submit(function(e){
      e.stopPropagation();
//       if(!$(frm2).is(":hidden")){
         if(!confirm("예적금 변경 사항을 수정 하시겠습니까?")) return;
      $("#tbl2 .depositaccount").each(function(){
         var bankname=$(this).find(".bankname").find(".depositaccountbankname").val();
         var code=$(this).find(".code").find(".depositaccountcode").val();
         var name=$(this).find(".name").find(".depositaccountname").val();
         var rate=$(this).find(".rate").find(".depositaccountrate").val();
         var start=$(this).find(".start").find(".depositaccountstart").val();
         var amount=$(this).find(".amount").find(".depositaccrountamount").val();
         
         $.ajax({
            type : "post",
            url :"depositaccountinsert",
            data :{"depositaccountbankname": bankname, "depositaccountcode":code,"depositaccountname":name, "depositaccountrate":rate,"depositaccount_startday":start,"depositaccountamount":amount},
            success: function(data){
               alert("성공");
            }
         });
      });
      alert("수정 완료 되었습니다");
//       }
   });
   
   
   $(frm3).submit(function(e){
      e.stopPropagation();
      if(!confirm("변경 사항을 수정 하시겠습니까?")) return;
      if(!$(frm3).is(":hidden")){
      $("#tbl3 .loansaccount").each(function(){
         var bankname=$(this).find(".bankname").find(".loansbankname").val();
         var code=$(this).find(".code").find(".loanscode").val();
         var name=$(this).find(".name").find(".loansname").val();
         var rate=$(this).find(".rate").find(".loansrate").val();
         var amount=$(this).find(".amount").find(".loansamount").val();
         var start=$(this).find(".start").find(".loansstart").val();
         var end=$(this).find(".end").find(".loansend").val();
         $.ajax({
            type : "post",
            url : "loansaccountinsert",
            data : {"loansaccountbankname": bankname, "loansaccountcode":code, "loansaccountname":name, "loansaccountrate":rate, "loansaccount_startday":start, "loansaccount_endday":end, "loansaccountamount":amount},
            success: function(data){
               alert("성공");
            }
         });
      });
      alert("수정완료 되었습니다");
      }
   });
</script>
</html>