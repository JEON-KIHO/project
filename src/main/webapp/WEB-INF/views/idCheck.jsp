<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>
   <h2>아이디 중복 체크</h2>
   <div id="checkMsg"></div>
   <table>
      <tr>
         <td> &nbsp;  
                <input type = "text" name = "adminId" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="아이디 입력" id="adminId">
             </td>
             <td><input type="hidden" value="사용" id="btnUse"></td>
<!--          <td><button type="submit" id="btnCheck">중복확인</button></td> -->
      </tr>
   </table>
      <div id="checkMs"></div>
      
      <table>
      <tr>
<!--       <td><input type="hidden" value="사용" id="btnUse"></td> -->
      </tr>
      </table>
      
<!--      <a href="javascript:window.close()" style="color:gray; margin-left:300px;">close</a>       -->
</body>
<script>

var check_num = /^[0-9]$/; // 숫자
var check_eng = /^[a-zA-Z]$/; // 문자
var check_spc = /^[~!@#$%^&*()_+|<>?:{}]$/; // 특수문자
var check_kor = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]$/; // 한글체크

   //아이디 값 불러오기
   //아이디 체크여부 확인
	$("#adminId").focus();
	
	   $("#adminId").on("keyup", function(key) {
		  var adminId = $(this).val();
		  $.ajax({
			 type:"post",
			 url:"idCheck",
			 data:{"adminId":adminId},
			 success:function(data) {
				 if(data == 0) {
					 if(adminId.length == 0) {
						 $("#adminId").css("background", "#FF7E7E"); 
					 }
					 if(adminId.length != 0) {
						 $("#adminId").css("background", "#9BFF94"); 
		                 		if(key.keyCode == 13) {
		                 			$("#btnUse").click();
		                 		}
					 }
				 }
				 if(data == 1) {
				 	$("#adminId").css("background", "#FF7E7E"); 
				 }
			 }
		  });
	   });
		  $("#adminId").on("keyup", function() {
				var adminId = $("#adminId").val();
				var lastValue = adminId.substring(adminId.length-1, adminId.length);
				var value = adminId.substring(0, adminId.length-1);
				if(adminId.length >= 1) {
					if(!check_eng.test(lastValue) && !check_num.test(lastValue)) {
						alert("영어와 숫자만 입력할 수 있습니다.");
						$("#adminId").val(value);
					}
				}
			});
		  
		  $("#btnUse").on("click",function(){
		      var id=$("#adminId").val();
		      $("#adminId", opener.document).val(id);
		      window.close();
		   });
	   
//       $('#btnCheck').on('click', function(e) {
//          e.preventDefault();
//          var adminId = $(frm.adminId).val();
//          $.ajax({
//             type : 'POST',
//             url : 'idCheck',
//             data : {
//                "adminId" : adminId
//             },
//             success : function(data) {
//                if(adminId==""){
//                   alert("아이디를 입력하세요");
//                    $(frm.adminId).focus();
//                    return;
//                }
//                if ((data) == 0) {
//                   $('#id').css("background", "#9BFF94");
//                   $('#btnUse').attr("type", "button");
//                }else if((data) == 1){
//             	   $('#id').css("background", "#FF7E7E");
//                   $('#btnUse').attr("type", "hidden");
//                }
//             }
//          });
//       });
   //사용 버튼 누른후 등록화ㅣ면
   
</script>
</html>