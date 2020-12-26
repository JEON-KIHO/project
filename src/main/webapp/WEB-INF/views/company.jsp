<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src= "http://code.jquery.com/jquery-1.9.1.js"></script>
<meta charset="UTF-8">
<title>Triple S</title>

   <style>
form {
   
   width:1200px;
   height:800px;
   margin-left: 620px;
   margin-top: 180px;
}

td {
   padding: 15px 20px 15px 20px;
   font-size:17px;
}

.content-wrapper {
   margin: 5rem;
}

html, body {
  height: 100%;
}



*:focus { outline: none; }


#covid{width:260px;}

.button1 {
  width: 140px;
  height: 32px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: white;
  background-color: #597484;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  margin-left:15px;
  }
  
  .button1:hover {
  background-color: black;
  box-shadow: 0px 15px 20px rgba;
  color: #fff;
  transform: translateY(-7px);
}
  
</style>
</head>
   
<body>
   <jsp:include page="header1.jsp"></jsp:include>
   <div class="content-wrapper">
    <div class="form__group field">
   <div id="divCenter">
   <div class="wrap">
   
   <form name = "frm" action="insert" method="post">
   
      <table>
         <tr>
            <td>사업자 등록 번호</td><td> 
               <input type = "text" name = "companyCode" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="사업자 등록 번호 입력 ( ' - ' 제외)" id="companyCode" maxlength=10>
               <span id="span"><input type = "button" class="button1" name="button" value = "확인하기" id="click">
               <input type = "radio" class = "rd" value="개인" name = "companyType"> 개인
               <input type = "radio" class = "rd" value = "법인" name = "companyType"> 법인</span>
<!--                <input type = "hidden" name = "companyType" id = "companyType"> -->
            </td>
         </tr>
         <tr>
            <td>법인번호</td><td> 
              <input type = "text" class = "rd-cblNum" name = "companyCorporate" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="법인번호 입력 ( ' - ' 제외)" maxlength=13></td>
         </tr>
         <tr>
            <td>상호명</td><td><input type = "text" name = "companyName" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="상호명 입력" class="hide"></td>
         </tr>
         <tr>
            <td>주소</td><td> 
               <input type = "text" id = "address" placeholder = "주소를 입력하세요" name = "address" style="border:none; width:250px; height:30px; border-bottom:1px solid gray;" class="hide"></td>
               </tr>
                <tr><td></td><td><input type = "text" id = "detailaddress" placeholder = "상세주소 입력" name = "detailaddress" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" class="hide">
             &nbsp;&nbsp;
                 <input type = "hidden" class="button0" id="FindCode" value = "주소 검색">
                 <input type = "hidden" name = "companyAddress">
            </td>
         </tr>
         <tr>
            <td>대표자명</td><td> 
            <input type = "text" name = "companyCEO" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="대표자명 입력" class="hide"></td>
         </tr>
         <tr>
            <td>아이디</td><td> 
                <input type = "text" name = "adminId" style="border:none; width:200px; height:30px; border-bottom:1px solid gray;" placeholder="아이디 입력" id="adminId" class="hide">
                  <input type="hidden" name="idDuplication" value="unCheck">
             </td>
         </tr>

         <tr>
            <td>비밀번호</td><td class="pw"> 
              <input type = "password" name = "adminPassword" 
              style="border:none; width:200px; height:30px; border-bottom:1px solid gray; font-size:12px;" placeholder="4자 이상 입력해주세요" minlength="4" id="pw" class="hide"><br/></td>
         </tr>
         
          <tr>
            <td>비밀번호 확인</td><td class="pwChk"> 
              <input type = "password" 
              style="border:none; width:200px; height:30px; border-bottom:1px solid gray; font-size:12px;" placeholder="4자 이상 입력해주세요" minlength="4" id="pwChk" class="hide"><br/></td>
         </tr>
         <tr>
            <td>개업일</td><td>
               <input type = "date" name = "openDate" class="hide">
             </td>
         </tr>
         
      </table>
      
      <input type = "submit" value = "저장"  class="button1" id = "save"   style="margin:10px; margin-left:300px; padding:5px; margin-top:30px;">
      <input type = "reset" value = "취소"  class="button1" id = "reset" style="padding:5px;">
   </form>
   </div>
   </div>
   </div>
   </div>
      <div id="footer"><jsp:include page="footer.jsp" /></div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

outLightBox();

$("#span").hide();
$(".hide").prop("disabled", true);
$(".rd").prop("disabled", true);
$("#save").prop("disabled", true);
$('.rd-cblNum').attr('disabled', true);

//취소 버튼 누를때 
$("#reset").click(function(){
   if(confirm("등록을 취소 하시겠습니까?") == true) {
      location.href="login";
   }else{
      return;
   }
});

$(".rd").on("click", function() {
	$(".hide").prop("disabled", false);
	$("#save").prop("disabled", false);
	if($(".rd:checked").val() == "개인") {
		frm.companyName.focus();
	}
});

$("#companyCode").keyup(function(key) {
	var companyCode = $(this).val();
	if(companyCode.length >= 10) {
		$("#span").show();
		if(key.keyCode == 13) {
			$("#click").click();
		}
	}
	if(companyCode.length < 10) {
		$("#span").hide();
	}
	
});

$(frm.openDate).focusout(function() {
	var openDate = frm.openDate.value;
	if(openDate.length > 10) {
		alert("입력한 날짜를 확인해주세요.");
		frm.openDate.focus();
	}
});

$(frm.button).on("click",function(){
	   var number=$(frm.companyCode).val();
	   lightBox();
	   $.ajax({
	      type:"get",
	      url :"company.json",
	      dataType: "json",
	      data : {"companyCode":number},
	      success : function(data){
	    	  outLightBox();
	       var result = data.companyCode;
	       if(result.substring(0, 3) == "사업을" || result.substring(0, 3) == "폐업자" ) {
	    	   alert("사업자 번호를 다시 확인해주세요.");
	       } else {
	    	   $(".rd").prop("disabled", false);
	       }
	       $(frm.companyCode).focus();
	      }
	   });
	});

$("#address").on("focus", function() {
	$("#FindCode").click();
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
		alert("비밀번호가 일치하지 않습니다.");
		$("#pw").focus();
	}
});

$("#adminId").focusout(function() {
	var id = $(this).val();
	if(id.length > 1) {
		$(this).css("background", "#9BFF94");
	}
});

//유효성 체크 및 저장
   $(frm).submit(function(e) {
         e.preventDefault();
        var radioVal = $('input[name="companyType"]:checked').val();
      frm.companyAddress.value = frm.address.value +", "+ frm.detailaddress.value;
         
      if (!$(frm.companyName).val()) {
         alert("상호명을 입력하세요");
         //커서(포커스)를 아이디 인풋요소로 이동
         $(frm.companyName).focus();
         //아래의 submit()을 하면 안되므로...
         
      } else if (!$(frm.companyCode).val()) {
         alert("사업자 등록번호를 입력하세요");
         $(frm.companyCode).focus();
         
      } else if (!radioVal){
         alert("사업자 체크해주세요.");
         frm.companyType.focus();
         
//       }else if(radioVal){
//          if(radioVal == '법인'){
//             if(!frm.companyCorporate.value){
//                alert("법인등록번호를 입력하세요");
//                frm.companyCorporate.focus();
//             }
//        }
         
      }else if (!frm.address.value) {
         alert("주소를 입력하세요");
         frm.address.focus();
         
      } else if (!frm.detailaddress.value){
         alert("상세주소를 입력하세요.");
         frm.detailaddress.focus();
         
      } else if (!frm.companyCEO.value) {
         alert("대표자명을 입력하세요");
         frm.companyCEO.focus();
         
      } else if (!frm.adminId.value) {
         alert("아이디를 입력하세요");
         frm.adminId.focus();
         
      } else if (!frm.adminPassword.value) {
         alert("비밀번호를 입력하세요");
         frm.adminPassword.focus();
         
      } else if (!frm.openDate.value) {
         alert("개업일을 입력하세요");
         frm.openDate.focus();
         
      }else if(radioVal){
       if(radioVal == '법인'){
           if(!frm.companyCorporate.value){
               alert("법인등록번호를 입력하세요");
               frm.companyCorporate.focus();
            }else{
               if(!confirm("등록하시겠습니까?")) return;
               frm.submit();
            }
         }else{
         if(!confirm("등록하시겠습니까?")) return;
//          alert(radioVal);
         frm.submit();
         }
      }
   });
   
   //주소
   $("#FindCode").on('click', function() {
      new daum.Postcode({
         oncomplete : function(data) {
            var addr = '';

            //주소 타입일때
            if (data.userSelectedType === 'R') {
               addr = data.roadAddress;
            } else { //지번 주소일때
               addr = data.jibunAddress;
            }
            document.getElementById("address").value = addr;
            document.getElementById("detailaddress").focus();
         }
      }).open();
   });

   //라디오 버튼 활성 비활성
   $('.rd').on('click', function() {
      var valueCheck = $('.rd:checked').val();

      if (valueCheck == '법인') {
         $('.rd-cblNum').attr('disabled', false);
         $('.rd-cblNum').focus();
      } else {
         $('.rd-cblNum').val('');
         $('.rd-cblNum').attr('disabled', true);
      }
   });
   

   //팝업
   $("#btnCheck").on("click", function() {
      window.open("idCheck", "btnCheck",'left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-430)/2+',width=300px, height=250');
   });

   //팝업을 가운데 위치 시키기 위해 값구하기
   $("#adminId").on(
         "focus",
         function() {
            window.open('idCheck', 'btnCheck', 'left='
                  + (screen.availWidth - 660) / 2 + ',top='
                  + (screen.availHeight - 430) / 2
                  + ', width=300px,height=200px');
   });
</script>
</html>