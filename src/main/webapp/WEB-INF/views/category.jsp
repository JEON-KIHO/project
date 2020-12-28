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
<title> 기초설정 </title>
<style>
    html, body {margin:0; text-align: center;}
   #divCenter {width: 1500px; height: 2000px; margin-left: 200px; margin-top:100px;}
   .tabbed {width: 70%; min-width: 300px;margin: 0 auto;margin-top:100px;border-bottom: 4px solid #000;overflow: hidden;transition: border 250ms ease;}
     #tbl {font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;width: 60%; min-width: 200px;margin: 0 auto; overflow: hidden;transition: border 250ms ease;border-collapse: collapse;}
   .tabbed ul {margin: 0px;padding: 0px;overflow: hidden;float:left;list-style-type: none; width:800px; height:37px; margin-top:100px;}
   .tabbed ul * { margin: 0px;padding: 0px;}
   .tabbed ul li {display: block;float: right;padding: 10px 24px 8px;background-color: #FFF;margin-right: 46px;z-index: 2;position: relative;
               cursor: pointer;color: #777;text-transform: uppercase;transition: all 250ms ease;font: 600 13px/20px roboto, "Open Sans", Helvetica, sans-serif;}
/*    {cursor: pointer;} */
   .tabbed ul li:before, .tabbed ul li:after {display: block;content: " ";position: absolute;top: 0;height: 100%;width: 44px;background-color: #FFF;transition: all 250ms ease;}
   .tabbed ul li:before {right: -24px;transform: skew(30deg, 0deg);box-shadow: rgba(0,0,0,.1) 3px 2px 5px, inset rgba(255,255,255,.09) -1px 0;}
   .tabbed ul li:after {left: -24px;transform: skew(-30deg, 0deg);box-shadow: rgba(0,0,0,.1) -3px 2px 5px, inset rgba(255,255,255,.09) 1px 0;}
/*    .tabbed ul li:hover, .tabbed ul li:hover:before, .tabbed ul li:hover:after {background-color: #F4F7F9;color: #444;} */
   .tabbed ul li.active {z-index: 3;}
   .tabbed ul li.active, .tabbed ul li.active:before, .tabbed ul li.active:after {background-color: #000;color: #fff;}
   /* Round Tabs */
   .tabbed.round ul li {border-radius: 8px 8px 0 0;}
   .tabbed.round ul li:before {border-radius: 0 8px 0 0;}
   .tabbed.round ul li:after {border-radius: 8px 0 0 0;}
   input{outline:none; border: none; background: transparent;}
   table th{font-size: 13px;font-weight: normal;color: #039;padding: 10px 8px;border-bottom: 2px solid #6678b1;}
   #tbl td, #tbl1 td, #tbl2 td, #tbl3 td{border-bottom:1px solid  #ccc;color: #669;padding: 6px 8px;}
   table tbody tr:hover td{color: #009;}
   #save {margin-top:10px; width:40px; padding: .8em .5em; font-family: inherit; font-size:12px; appearance: none; background:white; color:#669; border: 1px solid #ccc;border-radius: 5px; text-align:center;}
   #del {margin-top:10px; width:40px; padding: .8em .5em; font-family: inherit; font-size:12px; appearance: none; background:white; color:#669; border: 1px solid #ccc;border-radius: 5px; text-align:center;}
   #tbl2 {margin:30px 0px 30px 250px;}
    #tbl3 {margin:30px 0px 30px 250px; width:1033px;}
    .btnadd{width:100px; padding: .8em .5em; font-family: inherit; font-size:12px; appearance: none; background:white; color:#669; border: 1px solid #ccc;border-radius: 5px; text-align:center;}
    .btndel{width:100px; padding: .8em .5em; font-family: inherit; font-size:12px; appearance: none; background:white; color:#669; border: 1px solid #ccc;border-radius: 5px; text-align:center;}
   #tbl1 {margin-left:320px; width:900px;}
   </style>
   <link rel="stylesheet" href="../resources/icono.css">
</head>
   
<body>
<jsp:include page="menu.jsp"></jsp:include>
   <div class="tabbed round">
         <ul>
            <li id="menu4">대출 입력</li>
            <li id="menu3">예.적금 입력</li>
            <li id="menu2">중분류 상품 입력</li>
            <li id="menu1" class="active">대분류 상품 입력</li>
         </ul>
   </div>
   <div id="divCenter">
    <section id="first-tab-group" class="tabgroup">
   <div id="frmtbl">
<form name="frm" method="post" action="categoryinsert">
   <input type="button" class="btnadd" value="입력칸 추가">
   <input type="button" class="btndel" value="입력칸 삭제">
   <table id="tbl" summary="Employee Pay Sheet">
      <tr><input type="hidden">
         <th scope="col" width=100>대분류 상품 코드</th>
         <th scope="col" width=200>대분류 상품 이름</th>
      </tr>
      <tbody>
      <tr class="lcategory">
         <td width=100 class="lcategorycode">001</td>
         <td width=200 class="lcategoryname"><input type="text" size=30 class="largename" placeholder="ex)노트북,데스크탑,휴대폰 등.."><input type="hidden" value="상품A"></td>
      </tr>
      <tr class="lcategory">
         <td width=100 class="lcategorycode">002</td>
         <td width=200 class="lcategoryname"><input type="text" size=30 class="largename" placeholder="ex)상의,하의,아우터 등.."></td>
      </tr>
      <tr class="lcategory">
         <td width=100 class="lcategorycode">003</td>
         <td width=200 class="lcategoryname"><input type="text" size=30 class="largename" placeholder="ex)커피,차,에이드 등.."></td>
      </tr>
      </tbody>
   </table>
   <input type="submit" id="save" class="btnpage" value="저장">
   <input type="reset" id="del" value="취소"> 
</form>
</div>
<div id="frmtbl1">
<form name="frm1" method="post" action="categoryinsert">
   <table id="tbl1" summary="Employee Pay Sheet"></table>
            
   <input type="submit" id="save" class="btnpage" value="저장">
   <input type="reset" id="del" value="취소">
</form>
</div>
<div id="frmtbl2">
<form name="frm2" method="post" action="depositaccountinsert">
   <table id="tbl2" summary="Employee Pay Sheet">
   <input type="button"  class="btnadd" value="입력칸 추가">
   <input type="button"  class="btndel" value="입력칸 삭제">
      <tr>
         <th >번호</th>
         <th width=100>예금은행명</th>
         <th width=250>예금계좌번호</th>
         <th width=150>예금계좌명</th>
         <th width=50>예금이율</th>
         <th width=80>예금개설일</th>
         <th width=80>예금기초잔액</th>
      </tr>
      <tbody>
      <tr class="depositaccount">
         <td >1</td>
         <td width=100 class="bankname"><input type="text" size=10 class="depositaccountbankname" ></td>
         <td width=150 class="code"><input type="text" size=20 class="depositaccountcode"></td>
         <td width=150 class="name"><input type="text" size=10 class="depositaccountname" ></td>
         <td width=50 class="rate"><input type="text" size=5 class="depositaccountrate" ></td>
         <td width=80 class="start"><input type="text" size=15 class="depositaccountstart" placeholder="yyyy/mm/dd"></td>
         <td width=80 class="amount"><input type="text" size=15 class="depositaccrountamount"></td>
      </tr>
      <tr class="depositaccount">
         <td >2</td>
         <td width=100 class="bankname"><input type="text" size=10 class="depositaccountbankname"></td>
         <td width=250 class="code"><input type="text" size=20 class="depositaccountcode"></td>
         <td width=150 class="name"><input type="text" size=10 class="depositaccountname" ></td>
         <td width=50 class="rate"><input type="text" size=5 class="depositaccountrate" ></td>
         <td width=80 class="start"><input type="text" size=15 class="depositaccountstart"></td>
         <td width=80 class="amount"><input type="text" size=15 class="depositaccrountamount"></td>
      </tr>
      <tr class="depositaccount">
         <td >3</td>
         <td width=100 class="bankname"><input type="text" size=10 class="depositaccountbankname"></td>
         <td width=250 class="code"><input type="text" size=20 class="depositaccountcode"></td>
         <td width=150 class="name"><input type="text" size=10 class="depositaccountname" ></td>
         <td width=50 class="rate"><input type="text" size=5 class="depositaccountrate" ></td>
         <td width=80 class="start"><input type="text" size=15 class="depositaccountstart"></td>
         <td width=80 class="amount"><input type="text" size=15 class="depositaccrountamount"></td>
      </tr>
      </tbody> 
   </table>
      <input type="submit" id="save" class="btnpage" value="저장">
      <input type="reset" id="del" value="취소">
   </form>
   </div>
   <div id="frmtbl3">
   <form name="frm3" method="post" action="loansaccountinsert">
   <table id="tbl3" summary="Employee Pay Sheet">
   <input type="button" class="btnadd" value="입력칸 추가">
   <input type="button"  class="btndel" value="입력칸 삭제">
      <tr>
         <th>번호</th>
         <th width=100>대출은행명</th>
         <th width=250>대출계좌번호</th>
         <th width=150>대출계좌명</th>
         <th width=50>대출이율</th>
         <th width=80>대출원금</th>
         <th width=80>대출실행일</th>
         <th width=80>대출만기일</th>
      </tr>
      <tbody>
      <tr class="loansaccount">
         <td >1</td>
         <td width=100 class="bankname"><input type="text" size=10 class="loansbankname"></td>
         <td width=300 class="code"><input type="text" size=10 class="loanscode"></td>
         <td width=200 class="name"><input type="text" size=10 class="loansname" ></td>
         <td width=50 class="rate"><input type="text" size=3 class="loansrate" ></td>
         <td width=100 class="amount"><input type="text" size=10 class="loansamount" ></td>
         <td width=100 class="start"><input type="text" size=15 class="loansstart" placeholder="yyyy/mm/dd"></td>
         <td width=100 class="end"><input type="text" size=15 class="loansend" placeholder="yyyy/mm/dd"></td>
      </tr>
      <tr class="loansaccount">
         <td >2</td>
         <td width=100 class="bankname"><input type="text" size=10 class="loansbankname"></td>
         <td width=300 class="code"><input type="text" size=10 class="loanscode"></td>
         <td width=200 class="name"><input type="text" size=10 class="loansname" ></td>
         <td width=50 class="rate"><input type="text" size=3 class="loansrate" ></td>
         <td width=100 class="amount"><input type="text" size=10 class="loansamount" ></td>
         <td width=100 class="start"><input type="text" size=15 class="loansstart"></td>
         <td width=100 class="end"><input type="text" size=15 class="loansend"></td>
      </tr>
      <tr class="loansaccount">
         <td >3</td>
         <td width=100 class="bankname"><input type="text" size=10 class="loansbankname"></td>
         <td width=300 class="code"><input type="text" size=10 class="loanscode"></td>
         <td width=200 class="name"><input type="text" size=10 class="loansname" ></td>
         <td width=50 class="rate"><input type="text" size=3 class="loansrate" ></td>
         <td width=100 class="amount"><input type="text" size=10 class="loansamount" ></td>
         <td width=100 class="start"><input type="text" size=15 class="loansstart"></td>
         <td width=100 class="end"><input type="text" size=15 class="loansend"></td>
      </tr>
      </tbody>
   </table>
      <input type="submit" id="save" class="btnpage" value="저장">
      <input type="reset" id="del" value="취소">
   </form>
   </div>
   </section>
   </div>
   <div id="footer"><jsp:include page="footer.jsp" /></div>
</body>
<script>
$(frm1).hide();
$(frm2).hide();
$(frm3).hide();
//중분류 리스트 뽑기
getList();
function getList() {
   var addList = "";
   $.ajax({
      type:"get",
      url:"categorylist.json",
      success:function(data) {
         if($(data.CATEGORYNAME)!= null){
            addList += "<thead><th width=100>대분류</th><th width=100>중분류 상품 코드</th><th width=200>중분류 상품 이름</th></thead></tbody id=''body>";
            $(data).each(function() {
               addList += "<tr class='row"+this.CATEGORYCODE.split("/")[1]+"' code='"+this.CATEGORYCODE+"' name='"+this.CATEGORYNAME+"'><td width=100 class='lcategoryname' rowspan=3>"+this.CATEGORYNAME.split("/")[1]+"<input type='button' class='btnaddrow' value='+'></td>";
               addList += "<td  class='mcategorycode'>001</td>";
               addList += "<td 0 class='mcategoryname' ><input type='text' size=35  class='midname' placeholder='ex)아메리카노,아이스라떼,카페모카 등..'></td></tr>";
               addList += "<tr class='row"+this.CATEGORYCODE.split("/")[1]+"' code='"+this.CATEGORYCODE+"'name='"+this.CATEGORYNAME+"'><td width=100 class='mcategorycode'>002</td>";
               addList += "<td 0 class='mcategoryname'><input type='text' size=30 class='midname' ></td></tr>";
               addList += "<tr class='row"+this.CATEGORYCODE.split("/")[1]+"' code='"+this.CATEGORYCODE+"'name='"+this.CATEGORYNAME+"'><td width=100 class='mcategorycode'>003</td>";
               addList += "<td  class='mcategoryname'><input type='text' size=30  class='midname' ></td></tr>";
            });
               addList +="</tbody>";
            $("#tbl1").html(addList);
         }
      }
   });
}

$(document).ready(function(){
//항목추가 버튼 클릭시
$("#tbl1").on("click",".btnaddrow", function(){
    var clickedRow = $(this).parent().parent();
    var cls = clickedRow.attr("class");
    var cnt=$("#tbl1 ."+cls+":last td:eq(0)").html();
   cnt++;
    // tr 복사해서 마지막에 추가
    var newrow = clickedRow.clone();
    if(cnt<10) {
       newrow.find("td:eq(1)").html("00"+cnt);
    } else if(cnt<100 && cnt>=10) {
       newrow.find("td:eq(1)").html("0"+cnt);
    }
    
    newrow.find("td:eq(2)").find("input").attr("placeholder","");
    newrow.find("td:eq(2)").find("input").val("");
    newrow.find("td:eq(0)").remove();
   
    newrow.insertAfter($("#tbl1 ."+cls+":last"));
    
    // rowspan 조정
    resizeRowspan(cls);
});
 
 
function resizeRowspan(cls){
    var rowspan = $("."+cls).length;
    $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
}
});

   //행추가
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
         str+="<td width=250 class='code'><input type='text' size=20  class='depositaccountcode'></td>";
         str+="<td width=150 class='name'><input type='text' size=10 class='depositaccountname' ></td>";
         str+="<td width=50 class='rate'><input type='text' size=5 class='depositaccountrate' ></td>";
         str+="<td width=80 class='start'><input type='text' size=15 class='depositaccountstart'></td>";
         str+="<td width=80 class='amount'><input type='text' size=15 class='depositaccrountamount'></td>";
         str+="</tr>";
         $("#tbl2 > tbody:last").append(str);
      } else if(!$(frm3).is(":hidden")){
         var trCnt1=$("#tbl3 tr").length;
         var str="";
         str+="<tr class='loansaccount'>";
         str+="<td>"+trCnt1+"</td>";
         str+="<td width=100 class='bankname'><input type='text' size=10 class='loansbankname'></td>";
         str+="<td width=250 class='code'><input type='text' size=10 class='loanscode'></td>";
         str+="<td width=150 class='name'><input type='text' size=10 class='loansname' ></td>";
         str+="<td width=50 class='rate'><input type='text' size=3 class='loansrate' ></td>";
         str+="<td width=80 class='amount'><input type='text' size=10 class='loansamount' ></td>";
         str+="<td width=80 class='start'><input type='text' size=15 class='loansstart'></td>";
         str+="<td width=80 class='end'><input type='text' size=15 class='loansend'></td>";
         str+="</tr>";
         $("#tbl3 > tbody:last").append(str);
      }
   });
   
   
   //행삭제
   $(".btndel").click(function(e){
      if(!$(frm).is(":hidden")){
         $("#tbl > tbody:last > tr:last").remove();
      }else if(!$(frm1).is(":hidden")){
         $("#tbl1 > tbody:last > tr:last").remove();
      }else if(!$(frm2).is(":hidden")){
         $("#tbl2 > tbody:last > tr:last").remove();
      }else if(!$(frm3).is(":hidden")){
         $("#tbl3 > tbody:last > tr:last").remove();
      }
   });
   
   $(".btnpage").on("click",function(){
      if(!$(frm).is(":hidden")){
         var li=$(".tabbed").find("#menu1").removeClass('active');
         var lili=$(".tabbed").find("#menu2").addClass('active');   
      }else if(!$(frm1).is(":hidden")){
         var li=$(".tabbed").find("#menu2").removeClass('active');
         var lili=$(".tabbed").find("#menu3").addClass('active');
      }else if(!$(frm2).is(":hidden")){
         var li=$(".tabbed").find("#menu3").removeClass('active');
         var lili=$(".tabbed").find("#menu4").addClass('active');
      }
   });
   
   
   //대분류 저장
   $(frm).submit(function(e){
      e.preventDefault();
      if(!confirm("미입력시 기본값으로 자동적용됩니다.\n그래도 저장하시겠습니까?")) return;
      if(!$(frm).is(":hidden")){
         $("#tbl .lcategory").each(function(){
//          var companyCode=(String)session.getAttribute("companyCode");
//          alert(companyCode);
         var strlcode=$(this).find(".lcategorycode").html();
         var lcode=strlcode+"/000";
         var strlname=$(this).find(".lcategoryname").find(".largename").val();
         var lname=strlname+"/empty";
         if(strlname!=""){
            $.ajax({
            type : "post",
            url :"categoryinsert",
            data :{"categorycode": lcode, "categoryname":lname},
            success: function(){
               var addList = "";
               $.ajax({
                  type:"get",
                  url:"categorylist.json",
                  success:function(data) {
                     if($(data.CATEGORYNAME)!= null){
                        addList += "<thead><th width=100>대분류</th><th width=100>중분류 상품 코드</th><th width=200>중분류 상품 이름</th></thead></tbody id=''body>";
                        $(data).each(function() {
//                            alert("여기");
                           addList += "<tr class='row"+this.CATEGORYCODE.split("/")[1]+"' code='"+this.CATEGORYCODE+"' name='"+this.CATEGORYNAME+"'><td width=100 class='lcategoryname' rowspan=3>"+this.CATEGORYNAME.split("/")[1]+"<input type='button' class='btnaddrow' value='+'></td>";
                           addList += "<td  class='mcategorycode'>001</td>";
                           addList += "<td 0 class='mcategoryname' ><input type='text' size=30  class='midname' placeholder='ex)아메리카노,아이스라떼,카페모카 등..'></td></tr>";
                           addList += "<tr class='row"+this.CATEGORYCODE.split("/")[1]+"' code='"+this.CATEGORYCODE+"'name='"+this.CATEGORYNAME+"'><td width=100 class='mcategorycode'>002</td>";
                           addList += "<td 0 class='mcategoryname'><input type='text' size=30 class='midname' ></td></tr>";
                           addList += "<tr class='row"+this.CATEGORYCODE.split("/")[1]+"' code='"+this.CATEGORYCODE+"'name='"+this.CATEGORYNAME+"'><td width=100 class='mcategorycode'>003</td>";
                           addList += "<td  class='mcategoryname'><input type='text' size=30  class='midname' ></td></tr>";
                        });
                           addList +="</tbody>";
                        $("#tbl1").html(addList);
                     }
                  }
               });
            }
         });
         }
      });
      alert("저장완료 되었습니다.\n수정은 로그인 후 설정탭에서 완료바랍니다."); 
      $(frm).hide();
      $(frm1).show();
      
      }
   });
   

   
   //중분류 저장
      $(frm1).submit(function(e){
      e.preventDefault();
      if(!confirm("미입력시 기본값으로 자동적용됩니다.\n그래도 저장하시겠습니까?")) return;
      if(!$(frm1).is(":hidden")){
         $("#tbl1 tbody tr").each(function() {
//             var companycode=$(this).attr("code").split("/")[0];//153-60-00064
            var lcode=$(this).attr("code").split("/")[1];
             var strmcode=$(this).find(".mcategorycode").html();//001
             var mcode=lcode+"/"+strmcode;
             
//              var lcompanyname=$(this).attr("name").split("/")[0];//골드스탁
             var lname=$(this).attr("name").split("/")[1];
             var strmname=$(this).find(".mcategoryname").find(".midname").val();
             var mname=lname+"/"+strmname;
             
            if(strmname!=""){
               $.ajax({
                  type : "post", 
                  url :"categoryinsert",
                  data :{"categorycode": mcode, "categoryname":mname},
                  success: function(){
                     
                  }
               });
            }
         });
      alert("저장완료 되었습니다.\n수정은 로그인 후 설정탭에서 완료바랍니다.");
      $(frm1).hide();
      $(frm2).show();
      }
   });
   
      //예금 저장
      $(frm2).submit(function(e){
         e.preventDefault();
         if(!confirm("미입력시 기본값으로 자동적용됩니다.\n그래도 저장하시겠습니까?")) return;
         if(!$(frm2).is(":hidden")){
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
               data :{"depositAccountBankName": bankname, "depositAccountCode":code,"depositAccountName":name, "depositAccountRate":rate,"depositAccount_startday":start,"depositAccountAmount":amount},
               success: function(data){
               }
            });
         });
         alert("저장완료 되었습니다.\n수정은 로그인 후 설정탭에서 완료바랍니다.");
         $(frm2).hide();
         $(frm3).show();
         }
      });
      
      //대출저장
      $(frm3).submit(function(e){
         e.preventDefault();
         if(!confirm("미입력시 기본값으로 자동적용됩니다.\n그래도 저장하시겠습니까?")) return;
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
               data : {"loansAccountBankName": bankname, "loansAccountCode":code, "loansAccountName":name, "loansAccountRate":rate, "loansAccount_startDay":start, "loansAccount_endDay":end, "loansAccountAmount":amount},
               success: function(data){
               }
            });
         });
         alert("저장완료 되었습니다.\n수정은 로그인 후 설정탭에서 완료바랍니다.");
         }
         location.href="logout";
      });
      
</script>
</html>