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
<div id="plusMenuPrice_result">
<div class="clearfix" style="clear:both;">최소주문금액 ${minPrice.minPrice }원</div>
<div class="clearfix" style="background-color:ivory; color:red; font-weight:bold;">
합계 : ${resultPrice }원
</div>
  <form id='businessCodeFrm' action='${path}/customer/pay.do' onsubmit="return check();">
                           	<input type='hidden' id='businessCode' name='businessCode' value='${businessCode}'/>
                           	<script>
                           	</script>
 							<button class="cart-btn clearfix" id="pay" type="submit" style="clear:both; width:100%">
							주문하기
							</button>
                           </form>
</div>
<script>
function check() {
	var minPrice=${minPrice.minPrice};
	var resultPrice=${resultPrice};
	if(minPrice > resultPrice ) {
		alert("최소 주문금액(${minPrice.minPrice}원)에 맞게 주문해주세요.");
		return false;
	}
	else return true;
}
</script>
