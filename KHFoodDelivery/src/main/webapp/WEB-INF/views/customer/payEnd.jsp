<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
#payTable th {
	width: 30%;
	background-color: lightgray;
	text-align: center;
}

#payTable td {
	width: 70%;
}
</style>
<script>

history.pushState(null, null, location.href);

window.onpopstate = function(event) {

	history.go(1);

};

//새로고침 방지
function noRefresh()
{
    /* CTRL + N키 막음. */
    if ((event.keyCode == 78) && (event.ctrlKey == true))
    {
        event.keyCode = 0;
        return false;
    }
    /* F5 번키 막음. */
    if(event.keyCode == 116)
    {
        event.keyCode = 0;
        return false;
    }
}

document.onkeydown = noRefresh ;

</script>
<section>
	<div class="container">

		<fieldset
			style="text-align: center; height: 150px; border: rgb(206, 205, 205) 2px solid;">
			<br>
			<br>
			<h2>고객님의 <b>주문이 정상적으로 완료되었습니다!</b></h2>
			<h5 style="color: gray;">간신배를 이용해주셔서 감사합니다.</h5>
		</fieldset>
		<br>
		<table id="payTable" style="border-top: 2px solid black;"
			class="col-md-12 table">
			<tr>
				<th><b>주문번호</b></th>
				<td>${payList.get(0).PAYORDERNUM}</td>
			</tr>
			<tr>
				<th><b>주문자</b></th>
				<td>${wishList.get(0).MEMBERID }</td>
			</tr>

			<tr>
				<th><b>상호명</b></th>
				<td>${payList.get(0).STORENAME}</td>
			</tr>
			<tr>
				<th><b>음식</b></th>
				<td>
				<c:forEach var="p" items="${wishList}">
					<c:out value="${p.MENUNAME}"/>&nbsp;<c:out value="(${p.MENUCOUNT})"/>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<th><b>가격</b></th>
				<td>
				<c:set var="total" value="0"/>
				<c:forEach var="p1" items="${wishList}">
					<c:set var="total" value="${total+p1.PLUSMENUPRICE}"></c:set>
				</c:forEach>
				<c:out value="${total+deliveryPay}"/>
				</td>
			</tr>
			<tr>
				<th><b>주소</b></th>
				<td>${payList.get(0).PAYADDRESS}</td>
			</tr>
			<tr>
				<th><b>주문 시간</b></th>
				<td>${payList.get(0).PAYDATE}</td>
			</tr>
			<tr>
				<th><b>요청 사항</b></th>
				<c:if test="${payList.get(0).PAYREQUEST eq null }">
					<td>요청 사항이 없습니다.</td>
				</c:if>
				<td>${payList.get(0).PAYREQUEST}</td>
			</tr>
		</table>

	</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>