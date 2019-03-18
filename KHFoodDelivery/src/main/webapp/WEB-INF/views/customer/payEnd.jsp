<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
th{
	
	width:30%;
}
td{
	width:70%;
}
</style>
<section>
	<div class="container">

		<fieldset style="text-align: center; border:rgb(206, 205, 205) 2px solid;">
			<h2>
			주문이 완료되었습니다.
			</h2>
			<h5 style="color:gray;">간신배를 이용해주셔서 감사합니다.</h5>
		</fieldset>
		<br>
		<table  style=" border-top:2px solid black;" class="col-md-12 table">
			<tr>
				<th><b>주문자</b></th>
				<td >최정빈</td>
			</tr>
		
			<tr>
					<th><b>상호명</b></th>
					<td>네네치킨</td>
				</tr>
				<tr>
						<th><b>가격</b></th>
						<td>18000원</td>
					</tr>
					<tr>
							<th><b>주소</b></th>
							<td>서울시 강남구 역삼동 kh정보교육원</td>
						</tr>
						
		</table>

	</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>