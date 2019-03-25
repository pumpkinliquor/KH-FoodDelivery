<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Mstyle.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Mstyle.css" />
<%-- <style>
.mainP{
font-size:100px;
}
body{
	background-color:gray;
}
</style>

<div class="container">
<div class="row">
<div class="col-md-6">
<p class="mainP"><b>간</b>단하고 <br><b>신</b>속한<br><b>배</b>달</p>

<div class="col-sm-6" id="ownerSite">
<a href="${path }/owner/memberMain.do"><img src="${path }/resources/images/owner/icons/memberIcon.jpg" width=560px;></a>
</div>
<div class="col-sm-6">
<a href="${path }/owner/ownerMain.do"><img src="${path }/resources/images/owner/icons/ownerIcon.jpg" width=560px;></a>
</div>
</div>
</div>
</div> --%>
<script>
$(document).ready(function(){
	$.ajax({
		type:"POST",
		url:"${path}/owner/homePage.do",
		dataType:"JSON",
		success: function(data){
			$('#memberCount').countTo({to:data.memberCount});
			$('#ownerCount').countTo({to:data.ownerCount});
			$('#todayPayCount').countTo({to:data.todayPayCount});
		}
	});
});
(function ($) {
	$.fn.countTo = function (options) {
		options = options || {};
		
		return $(this).each(function () {
			// set options for current element
			var settings = $.extend({}, $.fn.countTo.defaults, {
				from:            $(this).data('from'),
				to:              $(this).data('to'),
				speed:           $(this).data('speed'),
				refreshInterval: $(this).data('refresh-interval'),
				decimals:        $(this).data('decimals')
			}, options);
			
			// how many times to update the value, and how much to increment the value on each update
			var loops = Math.ceil(settings.speed / settings.refreshInterval),
				increment = (settings.to - settings.from) / loops;
			
			// references & variables that will change with each update
			var self = this,
				$self = $(this),
				loopCount = 0,
				value = settings.from,
				data = $self.data('countTo') || {};
			
			$self.data('countTo', data);
			
			// if an existing interval can be found, clear it first
			if (data.interval) {
				clearInterval(data.interval);
			}
			data.interval = setInterval(updateTimer, settings.refreshInterval);
			
			// initialize the element with the starting value
			render(value);
			
			function updateTimer() {
				value += increment;
				loopCount++;
				
				render(value);
				
				if (typeof(settings.onUpdate) == 'function') {
					settings.onUpdate.call(self, value);
				}
				
				if (loopCount >= loops) {
					// remove the interval
					$self.removeData('countTo');
					clearInterval(data.interval);
					value = settings.to;
					
					if (typeof(settings.onComplete) == 'function') {
						settings.onComplete.call(self, value);
					}
				}
			}
			
			function render(value) {
				var formattedValue = settings.formatter.call(self, value, settings);
				$self.html(formattedValue);
			}
		});
	};
	
	$.fn.countTo.defaults = {
		from: 0,               // the number the element should start at
		to: 0,                 // the number the element should end at
		speed: 1000,           // how long it should take to count between the target numbers
		refreshInterval: 100,  // how often the element should be updated
		decimals: 0,           // the number of decimal places to show
		formatter: formatter,  // handler for formatting the value before rendering
		onUpdate: null,        // callback method for every time the element is updated
		onComplete: null       // callback method for when the element finishes updating
	};
	
	function formatter(value, settings) {
		return value.toFixed(settings.decimals);
	}
}(jQuery));

jQuery(function ($) {
  // custom formatting example
  $('.count-number').data('countToOptions', {
	formatter: function (value, options) {
	  return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
	}
  });
  
  // start all the timers
  $('.timer').each(count);  
  
  function count(options) {
	var $this = $(this);
	options = $.extend({}, options || {}, $this.data('countToOptions') || {});
	$this.countTo(options);
  }
});
</script>
<style>
body{
background-color:gray;
}
.counter {
    background-color:#f5f5f5;
    padding: 20px 0;
    border-radius: 5px;
}

.count-title {
    font-size: 40px;
    font-weight: normal;
    margin-top: 10px;
    margin-bottom: 0;
    text-align: center;
}

.count-text {
    font-size: 13px;
    font-weight: normal;
    margin-top: 10px;
    margin-bottom: 0;
    text-align: center;
}

.fa-2x {
    margin: 0 auto;
    float: none;
    display: table;
    color: #4ad1e5;
}
.mainP{
font-size:100px;
color:white;
}
#wrapper {
  width:500px;
  height:500px;
  background:#aed6e4;
}

#frame {
  width:400px;
  height:400px;
  background:#ffffff;
  box-shadow: 0 1px 10px rgba(0,0,0,0.5);
  position:relative;
  top:50px;
  left:50px;
}

.img-wrapper {
  width:195px;
  height:195px;
  
  cursor:pointer;
  border-radius:50%;
	border : 1px ridge white;
background-color:white;

}


.img2 {
    border-radius:50%;
 margin-top:85px;
 margin-left:30px;
 background : dark;
 
}
.img3 {
    border-radius:50%;
 margin-top:70px;
 margin-left:30px;
}
a{
	color:#90afc5; 
}
/* general START */
*,
*::before,
*::after {
  box-sizing: border-box;
}

body,
html {
  width: 100%;
  height: 100%;
}

body {
  margin: 0;
}

html {
  font-size: 62.5%;
}

/* general END */


.example-container:nth-of-type(2) {
  background-color: #90afc5;
  color: #336b87;
}

.example-container__example {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  font-size: 35px;
  font-family: 'Slabo 15px', serif;
  cursor: pointer;
  letter-spacing: -5px;
}
.example-container__example--awesomeness {
  white-space: nowrap;
}
.example-container__example--awesomeness > * {
  pointer-events: none;
}
.example-container__example--awesomeness span {
  opacity: 0;
  -webkit-transition: all .3s;
  transition: all .3s;
  display: inline-block;
  -webkit-transition-delay: 0s;
          transition-delay: 0s;
  -webkit-transform: translate3d(0, -100px, 0);
          transform: translate3d(0, -100px, 0);
}
.example-container__example--awesomeness p {
  -webkit-transition: all .3s;
  transition: all .3s;
  margin: 0;
  opacity: 1;
  position: absolute;
  top: 0;
  left: 0;
}
.example-container__example--awesomeness:hover span:nth-of-type(1) {
  -webkit-transition-delay: 0.07s;
          transition-delay: 0.07s;
}
.example-container__example--awesomeness:hover span:nth-of-type(2) {
  -webkit-transition-delay: 0.14s;
          transition-delay: 0.14s;
}
.example-container__example--awesomeness:hover span:nth-of-type(3) {
  -webkit-transition-delay: 0.21s;
          transition-delay: 0.21s;
}
.example-container__example--awesomeness:hover span:nth-of-type(4) {
  -webkit-transition-delay: 0.28s;
          transition-delay: 0.28s;
}
.example-container__example--awesomeness:hover span:nth-of-type(5) {
  -webkit-transition-delay: 0.35s;
          transition-delay: 0.35s;
}
.example-container__example--awesomeness:hover span:nth-of-type(6) {
  -webkit-transition-delay: 0.42s;
          transition-delay: 0.42s;
}
.example-container__example--awesomeness:hover span:nth-of-type(7) {
  -webkit-transition-delay: 0.49s;
          transition-delay: 0.49s;
}
.example-container__example--awesomeness:hover span:nth-of-type(8) {
  -webkit-transition-delay: 0.56s;
          transition-delay: 0.56s;
}
.example-container__example--awesomeness:hover span:nth-of-type(9) {
  -webkit-transition-delay: 0.63s;
          transition-delay: 0.63s;
}
.example-container__example--awesomeness:hover span:nth-of-type(10) {
  -webkit-transition-delay: 0.7s;
          transition-delay: 0.7s;
}
.example-container__example--awesomeness:hover span:nth-of-type(11) {
  -webkit-transition-delay: 0.77s;
          transition-delay: 0.77s;
}
.example-container__example--awesomeness:hover span {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
  opacity: 1;
}
.example-container__example--awesomeness:hover p {
  top: 100px;
  opacity: 0;
}
.example-container__example--hamburger {
  white-space: nowrap;
  -webkit-perspective: 275px;
          perspective: 275px;
}
.example-container__example--hamburger span {
  -webkit-transition: all .5s;
  transition: all .5s;
  display: inline-block;
  -webkit-transform: rotateY(0deg);
          transform: rotateY(0deg);
}
.example-container__example--hamburger:hover span:nth-of-type(1) {
  -webkit-transition-delay: 0.03s;
          transition-delay: 0.03s;
}
.example-container__example--hamburger:hover span:nth-of-type(2) {
  -webkit-transition-delay: 0.06s;
          transition-delay: 0.06s;
}
.example-container__example--hamburger:hover span:nth-of-type(3) {
  -webkit-transition-delay: 0.09s;
          transition-delay: 0.09s;
}
.example-container__example--hamburger:hover span:nth-of-type(4) {
  -webkit-transition-delay: 0.12s;
          transition-delay: 0.12s;
}
.example-container__example--hamburger:hover span:nth-of-type(5) {
  -webkit-transition-delay: 0.15s;
          transition-delay: 0.15s;
}
.example-container__example--hamburger:hover span:nth-of-type(6) {
  -webkit-transition-delay: 0.18s;
          transition-delay: 0.18s;
}
.example-container__example--hamburger:hover span:nth-of-type(7) {
  -webkit-transition-delay: 0.21s;
          transition-delay: 0.21s;
}
.example-container__example--hamburger:hover span:nth-of-type(8) {
  -webkit-transition-delay: 0.24s;
          transition-delay: 0.24s;
}
.example-container__example--hamburger:hover span:nth-of-type(9) {
  -webkit-transition-delay: 0.27s;
          transition-delay: 0.27s;
}
.example-container__example--hamburger:hover span {
  -webkit-transform: rotateY(360deg);
          transform: rotateY(360deg);
}
.example-container__example--hamburger span:nth-of-type(9) {
  -webkit-transition-delay: 0.03s;
          transition-delay: 0.03s;
}
.example-container__example--hamburger span:nth-of-type(8) {
  -webkit-transition-delay: 0.06s;
          transition-delay: 0.06s;
}
.example-container__example--hamburger span:nth-of-type(7) {
  -webkit-transition-delay: 0.09s;
          transition-delay: 0.09s;
}
.example-container__example--hamburger span:nth-of-type(6) {
  -webkit-transition-delay: 0.12s;
          transition-delay: 0.12s;
}
.example-container__example--hamburger span:nth-of-type(5) {
  -webkit-transition-delay: 0.15s;
          transition-delay: 0.15s;
}
.example-container__example--hamburger span:nth-of-type(4) {
  -webkit-transition-delay: 0.18s;
          transition-delay: 0.18s;
}
.example-container__example--hamburger span:nth-of-type(3) {
  -webkit-transition-delay: 0.21s;
          transition-delay: 0.21s;
}
.example-container__example--hamburger span:nth-of-type(2) {
  -webkit-transition-delay: 0.24s;
          transition-delay: 0.24s;
}
.example-container__example--hamburger span:nth-of-type(1) {
  -webkit-transition-delay: 0.27s;
          transition-delay: 0.27s;
}
.example-container__example--bamboozle span:nth-of-type(2)::before, .example-container__example--bamboozle span:nth-of-type(1)::before {
  content: 'bamboozle';
  position: absolute;

  left: 0;
}
.example-container__example--bamboozle p {
  margin: 0;
  opacity: 0;
  -webkit-transform: scale(0.5);
          transform: scale(0.5);
  -webkit-transition: all .5s;
  transition: all .5s;
  -webkit-transition-delay: .1s;
          transition-delay: .1s;
}
.example-container__example--bamboozle span {
  position: absolute;
  
  overflow: hidden;
  -webkit-transition: all .5s;
  transition: all .5s;
  -webkit-transition-delay: .2s;
          transition-delay: .2s;
}
.example-container__example--bamboozle span:nth-of-type(2) {
  bottom: 0;
}
.example-container__example--bamboozle span:nth-of-type(2)::before {
  bottom: 0;
}
.example-container__example--bamboozle span:nth-of-type(1) {
  top: 0;
}
.example-container__example--bamboozle span:nth-of-type(1)::before {
  top: 0;
}
.example-container__example--bamboozle:hover span {
  opacity: 0;
  -webkit-transition-delay: 0s;
          transition-delay: 0s;
}
.example-container__example--bamboozle:hover span:nth-of-type(1) {
  top: -50%;
}
.example-container__example--bamboozle:hover p {
  opacity: 1;
  -webkit-transform: scale(1.3);
          transform: scale(1.3);
}
.example-container__example--bamboozle:hover span:nth-of-type(2) {
  bottom: -50%;
}
.example-container__example--shenanigans {
  white-space: nowrap;
}
.example-container__example--shenanigans span {
  display: inline-block;
  position: relative;
  opacity: 1;
}
.example-container__example--shenanigans:hover span:nth-of-type(1) {
  -webkit-animation: animate-odd 0.9s ease-in-out 0.23143s;
          animation: animate-odd 0.9s ease-in-out 0.23143s;
}
.example-container__example--shenanigans:hover span:nth-of-type(2) {
  -webkit-animation: animate-even 0.9s ease-in-out 0.74231s;
          animation: animate-even 0.9s ease-in-out 0.74231s;
}
.example-container__example--shenanigans:hover span:nth-of-type(3) {
  -webkit-animation: animate-odd 0.9s ease-in-out 0.57325s;
          animation: animate-odd 0.9s ease-in-out 0.57325s;
}
.example-container__example--shenanigans:hover span:nth-of-type(4) {
  -webkit-animation: animate-even 0.9s ease-in-out 0.14522s;
          animation: animate-even 0.9s ease-in-out 0.14522s;
}
.example-container__example--shenanigans:hover span:nth-of-type(5) {
  -webkit-animation: animate-odd 0.9s ease-in-out 0.24793s;
          animation: animate-odd 0.9s ease-in-out 0.24793s;
}
.example-container__example--shenanigans:hover span:nth-of-type(6) {
  -webkit-animation: animate-even 0.9s ease-in-out 0.87209s;
          animation: animate-even 0.9s ease-in-out 0.87209s;
}
.example-container__example--shenanigans:hover span:nth-of-type(7) {
  -webkit-animation: animate-odd 0.9s ease-in-out 0.61461s;
          animation: animate-odd 0.9s ease-in-out 0.61461s;
}
.example-container__example--shenanigans:hover span:nth-of-type(8) {
  -webkit-animation: animate-even 0.9s ease-in-out 0.03098s;
          animation: animate-even 0.9s ease-in-out 0.03098s;
}
.example-container__example--shenanigans:hover span:nth-of-type(9) {
  -webkit-animation: animate-odd 0.9s ease-in-out 0.44042s;
          animation: animate-odd 0.9s ease-in-out 0.44042s;
}
.example-container__example--shenanigans:hover span:nth-of-type(10) {
  -webkit-animation: animate-even 0.9s ease-in-out 0.36427s;
          animation: animate-even 0.9s ease-in-out 0.36427s;
}
.example-container__example--shenanigans:hover span:nth-of-type(11) {
  -webkit-animation: animate-odd 0.9s ease-in-out 0.77771s;
          animation: animate-odd 0.9s ease-in-out 0.77771s;
}
@-webkit-keyframes animate-odd {
  0%,
        100% {
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
    opacity: 1;
  }
  49.999% {
    -webkit-transform: translate3d(0, -120px, 0);
            transform: translate3d(0, -120px, 0);
    opacity: 0;
  }
  50.001% {
    -webkit-transform: translate3d(0, 120px, 0);
            transform: translate3d(0, 120px, 0);
    opacity: 0;
  }
}
@keyframes animate-odd {
  0%,
        100% {
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
    opacity: 1;
  }
  49.999% {
    -webkit-transform: translate3d(0, -120px, 0);
            transform: translate3d(0, -120px, 0);
    opacity: 0;
  }
  50.001% {
    -webkit-transform: translate3d(0, 120px, 0);
            transform: translate3d(0, 120px, 0);
    opacity: 0;
  }
}
@-webkit-keyframes animate-even {
  0%,
        100% {
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
    opacity: 1;
  }
  49.999% {
    -webkit-transform: translate3d(0, 100px, 0);
            transform: translate3d(0, 100px, 0);
    opacity: 0;
  }
  50.001% {
    -webkit-transform: translate3d(0, -100px, 0);
            transform: translate3d(0, -100px, 0);
    opacity: 0;
  }
}
@keyframes animate-even {
  0%,
        100% {
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
    opacity: 1;
  }
  49.999% {
    -webkit-transform: translate3d(0, 100px, 0);
            transform: translate3d(0, 100px, 0);
    opacity: 0;
  }
  50.001% {
    -webkit-transform: translate3d(0, -100px, 0);
            transform: translate3d(0, -100px, 0);
    opacity: 0;
  }
}
@media screen and (max-width: 950px) {
  .example-container__example {
    font-size: 12rem;
  }
}
@media screen and (max-width: 768px) {
  .example-container__example {
    font-size: 9rem;
  }
}
@media screen and (max-width: 480px) {
  .example-container__example {
    font-size: 5rem;
  }
}

/* 글씨 */
.mainP {
  animation-duration: 3s;
  animation-name: slidein;
}

@keyframes slidein {
  from {
    margin-left: 100%;
    width: 300%; 
  }
  75% {
    font-size: 300%;
    margin-left: 25%;
    width: 150%;
  }
  to {
    margin-left: 0%;
    width: 100%;
  }
}
</style>
<div class="container">
	<div class="row">
	    <br/>
		<div class="col-md-6">
		<p class="mainP"><b>간</b>단하고 <br><b>신</b>속한<br><b>배</b>달</p>
		</div>
		<div class="col-sm-3 ">
		<br><br><br>
		 	<div onclick="location.href='${path }/member/main.do'" class="img-wrapper img2">
		 		 <div class="example-container">
			      	<div class="example-container">
			      		<div class="example-container__example example-container__example--hamburger">
			      			<a href="${path }/member/main.do"><span>&nbsp;</span><span>회</span><span>원</span><br/><span>페</span><span>이</span><span>지</span></a>
				 		</div>
				 	</div>
				 </div>
			</div>
			
		</div>
		<div class="col-sm-3">
		<br><br><br><br>
			 <div onclick="location.href='${path}/owner/ownerMain.do'" class="img-wrapper img3">
			     <div class="example-container">
  					<div class="example-container__example example-container__example--hamburger">

    					<a href="${path }/owner/ownerMain.do"><span>&nbsp;</span><span>사</span><span>장</span><br/><span>페</span><span>이</span><span>지</span></a>

  					</div>
				</div>
			     
			</div>
		</div>
		
	</div>
	
	
	
		<div class="row text-center">
	        <div class="col">
	        <div class="counter">
      <i class="fa fa-code fa-2x"></i>
      <h2 class="timer count-title count-number" id="memberCount" data-to="" data-speed="1500"></h2>
       <p class="count-text ">간신배 가입된 회원 수</p>
    </div>
	        </div>
              <div class="col">
               <div class="counter">
      <i class="fa fa-coffee fa-2x"></i>
      <h2 class="timer count-title count-number" id="ownerCount" data-to="" data-speed="1500"></h2>
      <!-- data-to에 카운트들고오면 됨 -->
      <p class="count-text ">간신배 가입된 사장님 수</p>
    </div>
              </div>
              <div class="col">
                  <div class="counter">
      <i class="fa fa-lightbulb-o fa-2x"></i>
      <h2 class="timer count-title count-number" id="todayPayCount" data-to="" data-speed="1500"></h2>
      <p class="count-text ">오늘 주문 수</p>
    </div></div>
<!--     select count(*) as todayOrderCount
from(select 
row_number() over(partition by payorderNum order by payorderNum) as rnum,payordernum,paynum,businesscode,paydate,menucode,count,membernum,payordermethod,payrequest
from pay) p
JOIN MEMBER M ON(P.MEMBERNUM = M.MEMBERNUM)
JOIN MENU ME ON(ME.MENUCODE = P.MENUCODE)
where rnum = 1 and TO_CHAR(paydate, 'YY/MM/DD') = TO_CHAR(SYSDATE, 'YY/MM/DD'); -->
   
         </div>
</div>