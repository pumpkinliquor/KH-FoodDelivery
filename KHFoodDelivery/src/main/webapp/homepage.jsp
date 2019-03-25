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
</style>
<div class="container">
	<div class="row">
	    <br/>
		<div class="col-md-6">
		<p class="mainP"><b>간</b>단하고 <br><b>신</b>속한<br><b>배</b>달</p>
		</div>
		<div class="col-sm-3" id="ownerSite">
		<br><br><br>
			<a href="${path }/owner/memberMain.do"><img src="${path }/resources/images/customerIcon.png" width=230px;></a>
		</div>
		<div class="col-sm-3">
		<br><br><br>
			<a href="${path }/owner/ownerMain.do"><img src="${path }/resources/images/ownerIcon.png" width=230px;></a>
		</div>
		
	</div>
		<div class="row text-center">
	        <div class="col">
	        <div class="counter">
      <i class="fa fa-code fa-2x"></i>
      <h2 class="timer count-title count-number" id='memberCount' data-to="" data-speed="1500"></h2>
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