<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#oriTbl, #tbl{padding:10px 10px 5px 10px; margin-left:120px;}
td {
   padding: 5px 5px 5px 5px;
   font-size:17px;
}
#lightBox {
   position: absolute;
   top: 0px;
   left: 0px;
   right: 0px;
   height: 100%;
   display: none;
   background: rgba(0, 0, 0, 0.3);
   z-index: 10000;
   overflow: hidden;
}

#box {
   margin: 50px auto;
   background: rgba(0, 0, 0, 0.5);
}
#text {text-size:15px; color:red; margin-left:140px;}
</style>
</head>
<body>

<table id="oriTbl">
<tr style="margin-right:10px;">
      <td><input type="password" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="현재 비밀번호 확인" id="oriPwChk"></td>
   </tr>
   <tr style="margin-right:10px;"><td><input type="button" value="확인" id="chk" style="margin-top:10px; margin-left:170px;"></td></tr>
</table>

<form name="frm" action="pwUpdate" method="post">

<table id="tbl">
   <tr class="register" style="margin-right:10px;">
      <td><input type="password" name="oriPw" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="현재 비밀번호" id="oriPw"></td>
   </tr>
   <tr class="register" style="margin-right:10px;">
      <td class="pw"><input type="password" name="newPw" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="새 비밀번호" id="pw"></td>
   </tr>
   <tr class="register" style="margin-right:10px;">
      <td class="pwChk"><input type="password" name="adminPassword" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="비밀번호 확인" id="pwChk"></td>
   </tr>
   
   <tr>
   <td><input type="submit" name="btnSave" value="저장" style="margin-top:10px; margin-left:170px;"> </td>
   </tr>
</table>
</form>

<div id="lightBox">
	<div id="box">
		<div id="text"></div>
	</div>
</div>

</body>
<script>
$("#tbl").hide();
$("#oriPwChk").focus();

$("#oriPwChk").keyup(function(key) {
	$(this).css("background", "white");
	if(key.keyCode == 13) {
		$("#chk").click();
	}
});

$("#chk").on("click", function() {
	var pwp = $(this).parent().parent().parent().find("#oriPwChk");
	var pw = $(this).parent().parent().parent().find("#oriPwChk").val();
	$.ajax({
		type:"get",
		url:"pwChk.json",
		data:{"password":pw},
		success:function(data) {
			if(data == 0) {
				$("#oriTbl").hide();
				$("#tbl").show();
				$("#oriPw").focus();
			}
			if(data == 1) {
				pwp.css("background", "red");
				pwp.focus();
			}
		}
	});
});

$("#pw").keyup(function() {
	var pwcp = $(this).parent().parent().parent().find(".pwChk").find("#pwChk");
	var pw = $(this).val();
	var pwChk = pwcp.val();
	if(pw != pwChk) {
		pwcp.css("background", "#FF7E7E");
		$("#pw").css("background", "#FF7E7E");
	}
	if(pw == pwChk) {
		pwcp.css("background", "#9BFF94");
		$("#pw").css("background", "#9BFF94");
	}
});

$("#pwChk").keyup(function() {
	var pwp = $(this).parent().parent().parent().find(".pw").find("#pw");
	var pw = pwp.val();
	var pwChk = $(this).val();
	if(pw != pwChk) {
		pwp.css("background", "#FF7E7E");
		$(this).css("background", "#FF7E7E");
	}
	if(pw == pwChk) {
		pwp.css("background", "#9BFF94");
		$(this).css("background", "#9BFF94");
	}
});

$("#pwChk").focusout(function() {
	var pwChk = $(this).val();
	var pw = $(this).parent().parent().parent().find(".pw").find("#pw").val();
	if(pwChk != pw) {
		$("#text").html("비밀번호가 일치하지 않습니다.");
		  lightBox();
		  setTimeout(outLightBox, 1000);
		  $("#pw").focus();
	}
});



//저장 눌렀을때

$(frm.btnSave).click(function(e){
   e.preventDefault();
var oriPw=$(frm.oriPw).val();
var newPw=$(frm.newPw).val();
var adminPassword=$(frm.adminPassword).val();
   if(oriPw.trim()==""){
	   	$("#text").html("현재 비밀번호를 입력하세요.");
		  lightBox();
		  setTimeout(outLightBox, 1000);
		  frm.oriPw.focus();
   }else if(newPw.trim()==""){
	   $("#text").html("새 비밀번호를 입력하세요.");
		  lightBox();
		  setTimeout(outLightBox, 1000);
      		frm.newPw.focus();
   }else if(adminPassword.trim()==""){
	   $("#text").html("확인하실 비밀번호를 입력하세요.");
		  lightBox();
		  setTimeout(outLightBox, 1000);
      		frm.adminPassword.focus();
   }else{
	   $.ajax({
		  type:"get",
		  url:"pwChk.json",
		  data:{"password":oriPw},
		  success:function(data) {
			  if(data == 1) {
				  $("#text").html("비밀번호가 일치하지 않습니다.");
				  lightBox();
				  setTimeout(outLightBox, 1000);
				  $("#oriPw").focus();
			  }
			  if(data == 0) {
				  $.ajax({
				         type:"post",
				         url:"pwUpdate",
				         data:{"adminPassword":adminPassword},
				         success:function(){
				            if(!confirm("등록하시겠습니까?"))return;
				            frm.submit();
				            alert("변경한 비밀번호로 다시 로그인해주세요.");
				            opener.document.getElementById("value").value = "logout";
				            window.close();
				         }
				      });
			  }
		  }
	   });
   }
});

function lightBox() {
	$("#lightBox").show();
}

function outLightBox() {
	$("#lightBox").hide();
}


         </script>
</html>