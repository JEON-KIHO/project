<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/TweenMax.min.js"></script>
<script src="https://codepen.io/grayghostvisuals/pen/a08e0d79c150ff5030f9b6afaa137749"></script>
<title>Insert title here</title>
<style>
#lightBox0 {
   position: absolute;
   top: 0px;
   left: 0px;
   right: 0px;
   height: 100%;
   display: none;
   background: rgba(0, 0, 0, 0.1);
   z-index: 10000;
   overflow: hidden;
}

#box0 {
   height: 50px;
   margin: 100px auto;
   background: rgba(0, 0, 0, 0);
}


.attraction {
margin:0px auto;
margin-top:400px;
margin-right:50%;
  width: 60px;
  height: 60px;
  transform: scale(0.25) rotate(-90deg) translateY(-300%);
}

.attraction svg > * {
  fill: #000000;
}

.attraction svg:nth-child(1) circle {
  opacity: 0.06;
}

.attraction svg:nth-child(2) circle {
  opacity: 0.12;
}

.attraction svg:nth-child(3) circle {
  opacity: 0.18;
}

.attraction svg:nth-child(4) circle {
  opacity: 0.24;
}

.attraction svg:nth-child(5) circle {
  opacity: 0.3;
}

.attraction svg:nth-child(6) circle {
  opacity: 0.36;
}

.attraction svg:nth-child(7) circle {
  opacity: 0.42;
}

.attraction svg:nth-child(8) circle {
  opacity: 0.48;
}

.attraction svg:nth-child(9) circle {
  opacity: 0.54;
}

.attraction svg:nth-child(10) circle {
  opacity: 0.6;
}

.attraction svg:nth-child(11) circle {
  opacity: 0.66;
}

.attraction svg:nth-child(12) circle {
  opacity: 0.72;
}

.attraction svg:nth-child(13) circle {
  opacity: 0.78;
}
</style>
</head>
<body>
<div id="lightBox0">
	<div id="box0">
	<div class="attraction">
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
  <svg xmlns=http://www.w3.org/2000/svg viewBox="0 0 100 100"><circle cx=50 cy=50 r="42"/></svg>
</div>
	
	</div>
</div>
</body>
<script>
	var tl = new TimelineMax({
	  repeat: -1
	});

	var bezier = [{ x: 0, y: 0, opacity: 0 }, { x: 0, y: 42, opacity: 0 }, { x: 42, y: 42, opacity: 1 }, { x: 42, y: 0, opacity: 1 }, { x: 0, y: 0, opacity: 0 }];

	tl.staggerTo($('.attraction > svg'), 0.8, { bezier: {
	  type: 'thru',
	  values: bezier,
	  curviness: 2
	}, ease: Ease.easeInOut }, 0.09);
	
	function lightBox() {
		$("#lightBox0").show();
	}

	function outLightBox() {
		$("#lightBox0").hide();
	}
	
	function lightBoxController() {
		lightBox();
		setTimeout(outLightBox, 2500);
	}
</script>
</html>