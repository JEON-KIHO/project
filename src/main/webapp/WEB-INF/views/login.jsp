<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Triple S</title>
<link rel="stylesheet" href="../resources/css/animations.css">
</head>
<style>
#video {
   position: absolute;
   top: 0px;
   left: 0px;
   min-width: 100%;
   min-height: 100%;
   width: auto;
   height: auto;
   z-index: -1;
   overflow: hidden;
}

body {
   background: #ececec;
   padding: 40px 0;
   font-family: 'Lato', sans-serif;
   color: #444;
   text-align: center;
}

.button-wrapper {
   display: inline-block;
   margin: 20px 5px;
   padding: 40px;
}

.dark-button, .dark-button-2 {
   background: #333;
}

.button {
   background-color: rgba(300, 300, 300, 0.0);
   border: none;
   padding: 40px;
   cursor: pointer;
   display: block;
   position: relative;
   overflow: hidden;
   transition: all .35s ease-in-out .35s;
   margin-top: 300px;
   width: 200px;
   text-align: center;
}

.dark-button .button, .dark-button .button span {
   background: #36B4C7;
   color: #fff;
}

.dark-button .button:after, .dark-button .button:before, .dark-button .button:hover span
   {
   background: #fff;
   color: #444;
}

.dark-button-2 .button, .dark-button-2 .button span {
   background: #333;
   color: #fff;
}

.dark-button-2 .button:after, .dark-button-2 .button:before,
   .dark-button-2 .button:hover span {
   background: #fff;
   color: #444;
}

h2 {
   font-family:"굴림";
   background-color: rgba(300, 300, 300, 0.0);
   display: block;
   padding: 15px 30px;
   z-index: 100;
   position: relative;
   transition: all .35s ease-in-out .35s;
}

.button:hover h2 {
   background: #36B4C7;
   color: #fff;
   transition: all .35s ease-in-out .35s;
}

.button:after {
   bottom: -100%;
   right: -100%;
   content: "";
   width: 100%;
   height: 100%;
   position: absolute;
   background: #36B4C7;
   transition: all .35s ease-in-out .5s;
}

.button:hover:after {
   right: 0;
   bottom: 0;
   transition: all ease-in-out .35s;
}

.button:before {
   top: -100%;
   left: -100%;
   content: "";
   width: 100%;
   height: 100%;
   position: absolute;
   background: #36B4C7;
   transition: all .35s ease-in-out .5s;
}

.button:hover:before {
   left: 0;
   top: 0;
   transition: all ease-in-out .35s;
}

#darken-background {
   position: absolute;
   top: 0px;
   left: 0px;
   right: 0px;
   height: 100%;
   display: none;
   background: rgba(0, 0, 0, 0.5);
   z-index: 10000;
   overflow-y: scroll;
}

#lightbox {
   width: 600px;
   height: 600px;
   margin: 20px auto;
   border: 1px solid #333333;
   border-radius: 5px;
   background: white;
   box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
   
}

.box {
   margin: 10px;
   float: left;
}
#divCenter{margin-left: 20px; margin:100px;}
 #frm{border:1px solid #F1F3F2;}
 td{padding:20px 10px 10px 15px;}
   
   #mainlogin {
  width: 500px;
  height: 80px;
  margin-top:30px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: white;
  background-color:#597484;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

 #mainlogin:hover {
  background-color: black;
  box-shadow: 0px 15px 20px rgba;
  color: #fff;
  transform: translateY(-7px);
}


*:focus { outline: none; }
</style>
<body>

   <video id="video" preload="auto" autoplay="true" loop="loop"
      muted="muted" volume="0"> <source src="../resources/ask.mp4">
   </source> </video>

   <div class="light-button button-wrapper">
      <div class="button" onclick="location.href='company'">

         <h2 style="color: white; text-align:center;">Registration</h2>
      </div>

   </div>

   <div class="light-button button-wrapper">
      <div class="button" onclick="showLogin();">

         <h2 style="color: white; text-align: center;">

            Login 
         </h2>
      </div>

   </div>
 <!--라이트 박스-->
 <div id="darken-background">
 <div id="divCenter">
 <div id="lightbox" class="light-button button-wrapper">
    <button id="btnCancell" style="border:0; background:white; font-size:40px; float:left; color:gray;">X</button>
    <h1 style="font-size:50px; margin-top:20px;">LOGIN</h1>
   <form name="frm" action="loginok" method="post" style="margin-top:100px;">
      <table>
         <tr>
            <td width=100 style="font-size:30px;">ID</td>
            <td width=200><input type="text" name="adminId" style="border:none; width:300px; height:50px;
             border-bottom:1px solid gray;font-size:20px;" placeholder="아이디 입력" id="id"></td>
         </tr>
         <tr>
            <td width=100 style="font-size:30px">PASSWORD</td>
            <td width=200><input type="password" name="adminPassword" style="border:none; height:50px;
             width:300px; border-bottom:1px solid gray; font-size:20px;" placeholder="비밀번호 입력"></td>
         </tr>
         <tr>
         <td colspan=2>
<!--              <input type="checkbox" name="chkLogin"  style="margin-left:360px; margin-bottom:50px; float:left;">Keep Login<br/> -->
            
            <input type="submit" id="mainlogin" value="Login" style="margin-left:20px; font-size:30px;"
            ></td>
            
         </tr>
      </table>
   </form>
   </div>
      </div>
 </div>
</body>
<script>

   $("#btnCancell").on("click",function(){
      location.href = "login";
      
   });
   function showLogin(){
      $("#darken-background").show();
      $("#id").focus();
   }

   $(frm).submit(function(e) {
      e.preventDefault();
      var adminId = $(frm.adminId).val();
      var adminPassword = $(frm.adminPassword).val();
      var chkLogin = $(frm.chkLogin).is(":checked") ? true : false;
      $.ajax({

         type : "post",
         url : "mainlogin",
         data : {
            "adminId" : adminId,
            "adminPassword" : adminPassword,
            "chkLogin" : chkLogin
         },
         success : function(data) {
            if (data == 0) {
               alert("아이디를 입력하세요.");
            } else if (data == 2) {
               alert("비밀번호가 올바르지 않습니다.");
            } else if (data == 1) {
//                frm.submit();
               location.href = "main";
            }
         }

      });

   });
</script>

</html>