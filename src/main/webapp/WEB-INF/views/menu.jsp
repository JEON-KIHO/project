<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="lightBox.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<title>Triple S</title>
<link rel="stylesheet" href="../resources/style.css">
</head>
<style>

</style>
<body>
   <jsp:include page="header.jsp"></jsp:include>

   <div class="flip">
      <div id="left_area">

         <ul>
            <li><a href="salesList">매출 & 환불</a></li>
            <li><a href="cost">비용 & 재고</a></li>
            <li><a href="assets">자산</a></li>
            <li><a href="total">통계</a></li>
            <li><a href="categoryread">설정</a></li>
            <li><a href="insert">NEW</a></li>
            
         </ul>

         <br/>
         <br/>
<!--          <button type="button" class="button" id="logout">로그아웃</button> -->
      </div>
   </div>
</body>
</html>